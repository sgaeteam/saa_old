<?php namespace App\Http\Controllers;

	use Illuminate\Support\Facades\Route;
	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use App\Matricula;


	class AdminMatriculasController extends \crocodicstudio\crudbooster\controllers\CBController {

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
			$this->button_delete = true;
			$this->button_detail = true;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "matriculas";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Tipo de Atividade","name"=>"tipoatividade_id","join"=>"tipo_atividades,descricao"];
			$this->col[] = ["label"=>"Atividade","name"=>"atividade_id","join"=>"atividades,titulo"];
			$this->col[] = ["label"=>"Usuário","name"=>"usuario_id","join"=>"usuarios,nome"];
			$this->col[] = ["label"=>"Data Matrícula","name"=>"data_matricula","callback_php"=>'date("d/m/Y",strtotime($row->data_matricula))'];
			$this->col[] = ["label"=>"Mensalidade","name"=>"mensalidade","callback_php"=>'"R$ ".number_format($row->mensalidade,2,",",".")'];
			$this->col[] = ["label"=>"Desconto","name"=>"desconto","callback_php"=>'"R$ ".number_format($row->desconto,2,",",".")'];
			$this->col[] = ["label"=>"Total","name"=>"(select mensalidade-desconto from matriculas where matriculas.tipoatividade_id = tipo_atividades.id and matriculas.atividade_id = atividades.id and matriculas.usuario_id = usuarios.id and matriculas.deleted_at is null) as total","callback_php"=>'"R$ ".number_format(($row->mensalidade-$row->desconto),2,",",".")'];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Tipo de Atividade','type'=>'select','name'=>'tipoatividade_id','datatable'=>'tipo_atividades,descricao','datatable_where'=>'`deleted_at` is null','datatable_format'=>"descricao,' (R$ ',mensalidade,')'"];			
			$this->form[] = ['label'=>'Atividade','name'=>'atividade_id','type'=>'select','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'atividades,titulo','parent_select'=>'tipoatividade_id'];
			$this->form[] = ['label'=>'Usuário','name'=>'usuario_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'usuarios,nome','datatable_where'=>'`deleted_at` is null'];
			$this->form[] = ['label'=>'Data Matrícula','name'=>'data_matricula','type'=>'date','validation'=>'required|date','width'=>'col-sm-10', 'value' => date("m/d/Y")];
			$this->form[] = ['label'=>'Mensalidade','name'=>'mensalidade','type'=>'money','validation'=>'min:0','width'=>'col-sm-10','readonly'=>'true'];
			$this->form[] = ['label'=>'Desconto','name'=>'desconto','type'=>'money','validation'=>'min:0','width'=>'col-sm-10','value' => 0.0];
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
	        $this->addaction = array();


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
			$this->script_js = "
				$(document).ready(function() {
				
				    $('#tipoatividade_id').change(function(){
				    
				        // Pega o valor do select selecionado
				        var valor_select = $(this).val();
						
						if (valor_select == '') {
							$('#mensalidade').val('');	
						}
						
						else {
					        var url_destino = 'mensalidade_atividade/'+valor_select;

							$.ajax({
								type: 'get',
								dataType: 'json',
								processData: false,
								data: '',
								url: url_destino,
								success: function(response) {
					        		$('#mensalidade').val(response.mensalidade.toFixed(2));
								},
								error: function(jqXHR, textStatus, errorThrown) {}
							});
						}
				    });	
				});
			";				
			
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
	    	
	        // Verifica se o espaço já está reservado para o período escolhido
	        $matriculaExistente = $this->checkMatricula($postdata);

    	    if (isset($matriculaExistente)) {

				if(Request::ajax()) {
					$res = response()->json(['message'=>trans('crudbooster.alert_matricula_failed'),'message_type'=>'danger'])->send();
					exit;
				}
				else{
					$res = redirect()->back()->with(['message'=>trans('crudbooster.alert_matricula_failed'),'message_type'=>'danger'])->withInput();
					\Session::driver()->save();
					$res->send();
		        	exit;
				}
      	    }
      	    
      	    $postdata['mensalidade'] = DB::table('tipo_atividades')->where('id',$postdata['tipoatividade_id'])->value('mensalidade');

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
	        
	        // Verifica se ja existe matricula para a atividade escolhida
	        $matriculaExistente = $this->checkMatricula($postdata);

    	    if (isset($matriculaExistente)) {

				if(Request::ajax()) {
					$res = response()->json(['message'=>trans('crudbooster.alert_matricula_failed'),'message_type'=>'danger'])->send();
					exit;
				}
				else{
					$res = redirect()->back()->with(['message'=>trans('crudbooster.alert_matricula_failed'),'message_type'=>'danger'])->withInput();
					\Session::driver()->save();
					$res->send();
		        	exit;
				}
      	    }
      	    
      	    $postdata['mensalidade'] = DB::table('tipo_atividades')->where('id',$postdata['tipoatividade_id'])->value('mensalidade');

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


		public function getDetail($id) {
			
			//Create an Auth

			if(!CRUDBooster::isRead() && $this->global_privilege==FALSE || $this->button_detail==FALSE) {
				CRUDBooster::insertLog(trans("crudbooster.log_try_view",['name'=>$row->{$this->title_field},'module'=>CRUDBooster::getCurrentModule()->name]));
				CRUDBooster::redirect(CRUDBooster::adminPath(),trans('crudbooster.denied_access'));
			}
			
	  		$this->cbLoader();	
	  		$row = DB::table($this->table)->where($this->primary_key,$id)->first();
			$module = CRUDBooster::getCurrentModule();
			$data = [];
			$data['$page_menu'] = Route::getCurrentRoute()->getActionName();
			$data['page_title'] = trans("crudbooster.detail_data_page_title",['module'=>$module->name,'name'=>$row->{$this->title_field}]);
			$data['row'] = $row;
			$data['id'] = $id;
			$data['command'] = 'detail';

		    //Please use cbView method instead view method from laravel
			Session::put('current_row_id',$id);
			$this->cbView('matricula_add',$data);
		}	
		
		public function checkMatricula(array $request) {

			$usuario 		= $request['usuario_id'];
			$tipoatividade 	= $request['tipoatividade_id'];
			$atividade 		= $request['atividade_id'];

			$matricula = Matricula::where(function ($query) use ($usuario, $tipoatividade, $atividade) {
								   $query->where('usuario_id'	   , '=', $usuario);
								   $query->where('tipoatividade_id', '=', $tipoatividade);
								   $query->where('atividade_id'	   , '=', $atividade);
								   $query->whereNull('deleted_at');
					     })->first();

	        if(isset($matricula)) {
	        	
	        	return $matricula; // Usuário já matriculado para a atividade escolhida!
	        }
	       
	        return null; // Nova matricula!
		}	

		// Resgata a Mensalidade devida pelo Tipo de Atividade escolhida	
		public function getMensalidadeTipoAtividade($id){
			
			$mensalidade = DB::table('tipo_atividades')->where('id',$id)->value('mensalidade');

			if(Request::ajax()) {

				return response()->json(['mensalidade' => $mensalidade]);

			}
			else{
								
				return $mensalidade;
				
			}
		}

		
	}