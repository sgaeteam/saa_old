<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use App\Convite;
	use Dompdf\Dompdf;

	class AdminConvitesController extends \crocodicstudio\crudbooster\controllers\CBController {

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "id";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = true;
			$this->button_bulk_action = true;
			$this->button_action_style = "button_icon";
			$this->button_add = true;
			$this->button_edit = true;
			$this->button_delete = false;
			$this->button_detail = true;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "convites";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Sócio","name"=>"socio_id","join"=>"socios,nome"];
			$this->col[] = ["label"=>"Número do Convite","name"=>"num_convite"];
			$this->col[] = ["label"=>"Data de Emissão","name"=>"created_at","callback_php"=>'date("d/m/Y",strtotime($row->created_at))'];
			$this->col[] = ["label"=>"Data de Expiração","name"=>"data_expiracao","callback_php"=>'date("d/m/Y",strtotime($row->data_expiracao))'];
			$this->col[] = ["label"=>"Emissor","name"=>"user_id","join"=>"cms_users,name"];
			$this->col[] = ["label"=>"Código de Validação","name"=>"codigo_validacao"];
			$this->col[] = ["label"=>"Data de Impressão","name"=>"data_impressao","callback_php"=>'str_replace("31/12/1969",null,date("d/m/Y",strtotime($row->data_impressao)))'];
			$this->col[] = ["label"=>"Data de Utilização","name"=>"data_utilizada","callback_php"=>'str_replace("31/12/1969",null,date("d/m/Y",strtotime($row->data_utilizada)))'];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Sócio','name'=>'socio_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'socios,nome','datatable_where'=>'`deleted_at` is null'];
			$this->form[] = ['label'=>'Convidado','name'=>'nome','type'=>'text','validation'=>'string','width'=>'col-sm-9'];
			$this->form[] = ['label'=>'Sexo','name'=>'sexo','type'=>'select','validation'=>'string','width'=>'col-sm-9','dataenum'=>'Masculino;Feminino'];
			$this->form[] = ['label'=>'CPF','name'=>'cpf','type'=>'text','validation'=>'string','width'=>'col-sm-9'];
			$this->form[] = ['label'=>'Data Agendada','name'=>'data_prevista','type'=>'date','validation'=>'date|after:yesterday','width'=>'col-sm-9'];
			# END FORM DO NOT REMOVE THIS LINE

			/* 
	        | ---------------------------------------------------------------------- 
	        | Sub Module
	        | ----------------------------------------------------------------------     
			| @label          = Label of action 
			| @path           = Path of sub module
			| @foreign_key 	  = foreign key of sub table/module
			| @button_color   = Bootstrap Class (primary,success,warning,danger)
			| @button_icon    = Font Awesome Class  
			| @parent_columns = Sparate with comma, e.g : name,created_at
	        | 
	        */
	        $this->sub_module = array();


	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add More Action Button / Menu
	        | ----------------------------------------------------------------------     
	        | @label       = Label of action 
	        | @url         = Target URL, you can use field alias. e.g : [id], [name], [title], etc
	        | @icon        = Font awesome class icon. e.g : fa fa-bars
	        | @color 	   = Default is primary. (primary, warning, succecss, info)     
	        | @showIf 	   = If condition when action show. Use field alias. e.g : [id] == 1
	        | 
	        */ 
			$this->addaction[] = ['label'=>'Utilizou?','icon'=>'fa fa-thumbs-up ','color'=>'info','url'=>CRUDBooster::mainpath('utilizar').'/[id]','showIf'=>"([created_at] >= \Carbon\Carbon::now()->startOfMonth() && [created_at] <= \Carbon\Carbon::now()->endOfMonth()) && [data_impressao] <> null && [data_utilizada] == null",'confirmation' => true];
			$this->addaction[] = ['label'=>'Convite utilizado','color'=>'danger', 'showIf'=>"[data_utilizada] != ''"];
	        $this->addaction[] = ['label'=>'Imprimir','icon'=>'fa fa-print','color'=>'warning','url'=>CRUDBooster::mainpath('imprimir').'/[id]','showIf'=>"([created_at] >= \Carbon\Carbon::now()->startOfMonth() && [created_at] <= \Carbon\Carbon::now()->endOfMonth()) && [data_utilizada] == null && [data_impressao] == null",'confirmation' => true];
	        $this->addaction[] = ['label'=>'Reimprimir','icon'=>'fa fa-print','color'=>'warning','url'=>CRUDBooster::mainpath('imprimir').'/[id]','showIf'=>"([created_at] >= \Carbon\Carbon::now()->startOfMonth() && [created_at] <= \Carbon\Carbon::now()->endOfMonth()) && [data_utilizada] == null && [data_impressao] != null",'confirmation' => true];



	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add More Button Selected
	        | ----------------------------------------------------------------------     
	        | @label       = Label of action 
	        | @icon 	   = Icon from fontawesome
	        | @name 	   = Name of button 
	        | Then about the action, you should code at actionButtonSelected method 
	        | 
	        */
	        $this->button_selected = array();

	                
	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add alert message to this module at overheader
	        | ----------------------------------------------------------------------     
	        | @message = Text of message 
	        | @type    = warning,success,danger,info        
	        | 
	        */
	        $this->alert        = array();
	                

	        
	        /* 
	        | ---------------------------------------------------------------------- 
	        | Add more button to header button 
	        | ----------------------------------------------------------------------     
	        | @label = Name of button 
	        | @url   = URL Target
	        | @icon  = Icon from Awesome.
	        | 
	        */
	        $this->index_button = array();



	        /* 
	        | ---------------------------------------------------------------------- 
	        | Customize Table Row Color
	        | ----------------------------------------------------------------------     
	        | @condition = If condition. You may use field alias. E.g : [id] == 1
	        | @color = Default is none. You can use bootstrap success,info,warning,danger,primary.        
	        | 
	        */
	        $this->table_row_color = array();     	          

	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | You may use this bellow array to add statistic at dashboard 
	        | ---------------------------------------------------------------------- 
	        | @label, @count, @icon, @color 
	        |
	        */
	        $this->index_statistic = array();



	        /*
	        | ---------------------------------------------------------------------- 
	        | Add javascript at body 
	        | ---------------------------------------------------------------------- 
	        | javascript code in the variable 
	        | $this->script_js = "function() { ... }";
	        |
	        */
		 	$this->script_js = null;
					    


            /*
	        | ---------------------------------------------------------------------- 
	        | Include HTML Code before index table 
	        | ---------------------------------------------------------------------- 
	        | html code to display it before index table
	        | $this->pre_index_html = "<p>test</p>";
	        |
	        */
	        $this->pre_index_html = null;
	        
	        
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Include HTML Code after index table 
	        | ---------------------------------------------------------------------- 
	        | html code to display it after index table
	        | $this->post_index_html = "<p>test</p>";
	        |
	        */
	        $this->post_index_html = null;
	        
	        
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Include Javascript File 
	        | ---------------------------------------------------------------------- 
	        | URL of your javascript each array 
	        | $this->load_js[] = asset("myfile.js");
	        |
	        */
	        $this->load_js = array();
	        
	        
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Add css style at body 
	        | ---------------------------------------------------------------------- 
	        | css code in the variable 
	        | $this->style_css = ".style{....}";
	        |
	        */
	        $this->style_css = NULL;
	        
	        
	        
	        /*
	        | ---------------------------------------------------------------------- 
	        | Include css File 
	        | ---------------------------------------------------------------------- 
	        | URL of your css each array 
	        | $this->load_css[] = asset("myfile.css");
	        |
	        */
	        $this->load_css = array();
	        
	        
	    }


	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for button selected
	    | ---------------------------------------------------------------------- 
	    | @id_selected = the id selected
	    | @button_name = the name of button
	    |
	    */
	    public function actionButtonSelected($id_selected,$button_name) {
	        //Your code here
	            
	    }
	    

	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate query of index result 
	    | ---------------------------------------------------------------------- 
	    | @query = current sql query 
	    |
	    */
	    public function hook_query_index(&$query) {
			//Your code here
	    }

	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate row of index table html 
	    | ---------------------------------------------------------------------- 
	    |
	    */    
	    public function hook_row_index($column_index,&$column_value) {	        
	    	//Your code here
	    }

	    /*
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before add data is execute
	    | ---------------------------------------------------------------------- 
	    | @arr
	    |
	    */
	    public function hook_before_add(&$postdata) {        
	        
	        // Verifica se o Sócio já alcançou o limite mensal de convites emitidos
	        
	        $inicio = \Carbon\Carbon::now()->startOfMonth();
	        $fim	= \Carbon\Carbon::now()->endOfMonth();

	        $convitesEmitidosMes = Convite::where('socio_id',$postdata['socio_id'])
	        						 	  ->where('created_at'		, '>='	, $inicio)
	        							  ->where('created_at'		, '<='	, $fim)
	        							  ->get()->count();
	        
	        $totalConvitesSocio = DB::table('categorias')->join('socios','categorias.id','=','socios.categoria_id')
										    			 ->select('categorias.convites')
										        		 ->where('socios.id',$postdata['socio_id'])
										    			 ->first();
			
			if($convitesEmitidosMes < $totalConvitesSocio->convites) {							 
	    		$postdata['data_expiracao'] = $fim;
				$postdata['user_id'] = CRUDBooster::myId();
				$postdata['codigo_validacao'] = uniqid($postdata['id'], false);
				$postdata['num_convite'] =($convitesEmitidosMes+1)."/".$totalConvitesSocio->convites; 
	        }
	        
	        else {
				$res = redirect()->back()->with(['message'=>trans('crudbooster.alert_emissao_convites_failed')."<b>"." (Total permitido: ".$totalConvitesSocio->convites.")"."</b>",'message_type'=>'danger'])->withInput();
				\Session::driver()->save();
				$res->send();
	        	exit;
	        }
	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after add public static function called 
	    | ---------------------------------------------------------------------- 
	    | @id = last insert id
	    | 
	    */
	    public function hook_after_add($id) {        
	        //Your code here

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for manipulate data input before update data is execute
	    | ---------------------------------------------------------------------- 
	    | @postdata = input post data 
	    | @id       = current id 
	    | 
	    */
	    public function hook_before_edit(&$postdata,$id) {        
	    
	    	$conviteEditavel = Convite::whereNull('data_impressao')
	        				  	      ->whereNull('deleted_at')
	        						  ->where('data_expiracao','>=', \Carbon\Carbon::now())
	        						  ->where('id',$id)
	        						  ->first();
	    	
	    	if ($conviteEditavel === null) {
				$res = redirect()->back()->with(['message'=>trans('crudbooster.alert_edit_convite_failed'),'message_type'=>'danger'])->withInput();
				\Session::driver()->save();
				$res->send();
	        	exit;
	    	}	        

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after edit public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_after_edit($id) {
	        //Your code here 

	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command before delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_before_delete($id) {
	        //Your code here
	
	    }

	    /* 
	    | ---------------------------------------------------------------------- 
	    | Hook for execute command after delete public static function called
	    | ----------------------------------------------------------------------     
	    | @id       = current id 
	    | 
	    */
	    public function hook_after_delete($id) {
	        //Your code here

	    }


	    //By the way, you can still create your own method in here... :)
		//Referências: https://github.com/barryvdh/laravel-dompdf e https://blog.especializati.com.br/gerar-pdf-no-laravel-com-dompdf/
		public function imprimir($id) {
			
			$this->cbLoader();

			$row = DB::table($this->table)->join('socios','convites.socio_id','=','socios.id')
						    			  ->select('socios.nome as socio', 'convites.*')
						        		  ->whereNull('convites.deleted_at')
						    			  ->where('convites.id',$id)->first();
			$convite = [];
			$convite['id']               = $row->id;
			$convite['codigo_validacao'] = $row->codigo_validacao;
			$convite['socio']			 = $row->socio;	
			$convite['user_id'] 		 = $row->user_id;
			$convite['created_at']       = \Carbon\Carbon::parse($row->created_at)->format('d/m/Y');
			$convite['data_expiracao']   = \Carbon\Carbon::parse($row->data_expiracao)->format('d/m/Y');
			$convite['num_convite'] 	 = $row->num_convite;
			$convite['nome'] 			 = $row->nome;
			$convite['cpf'] 			 = $row->cpf;
			$convite['data_prevista'] 	 = $row->data_prevista == "0000-00-00" ? null :  \Carbon\Carbon::parse($row->data_prevista)->format('d/m/Y');
			
			DB::table($this->table)
	        ->where($this->primary_key,$id)
	        ->whereNull('data_impressao')
	        ->whereNull('deleted_at')
	        ->update(array('data_impressao'=>\Carbon\Carbon::now()));
	        
			CRUDBooster::insertLog(trans("crudbooster.log_imprimir",['name'=>$id,'module'=>CRUDBooster::getCurrentModule()->name]));

			if (($convite['nome'] !== "")) {
				if (is_null($convite['data_prevista'])) {
					$convite['data_prevista'] = " a ser definido até ".$convite['data_expiracao'].", ";	
				}
	    		return \PDF::loadView('reports.convite_nominal', $convite)->setPaper('a4', 'portrait')->download('convite_numero_'.$row->id.'.pdf');
			}	
	    	else {
	    	    return \PDF::loadView('reports.convite', $convite)->setPaper('a4', 'portrait')->download('convite_numero_'.$row->id.'.pdf');
			}
			
			return redirect()->back()->with(['message_type'=>'success','message'=>trans("crudbooster.alert_impressao_ok")]);			
		}
		
		public function utilizar($id) {
			
			$this->cbLoader();

			DB::table($this->table)
	        ->where($this->primary_key,$id)
	        ->whereNull('data_utilizada')
	        ->whereNull('deleted_at')
	        ->update(array('data_utilizada'=>\Carbon\Carbon::now()));
	        
			CRUDBooster::insertLog(trans("crudbooster.log_utilizar_convite",['name'=>$id,'module'=>CRUDBooster::getCurrentModule()->name]));
			
			return redirect()->back()->with(['message_type'=>'success','message'=>trans("crudbooster.alert_utilizar_convite_ok")]);
		}		
		

	}