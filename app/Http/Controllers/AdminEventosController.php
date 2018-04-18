<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use Route;
	use DB;
	use CRUDBooster;
	use App\Evento;

	class AdminEventosController extends \crocodicstudio\crudbooster\controllers\CBController {

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
			$this->table = "eventos";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Responsável","name"=>"socio_id","join"=>"socios,nome"];
			$this->col[] = ["label"=>"Espaço","name"=>"espaco_id","join"=>"espacos,nome"];
			$this->col[] = ["label"=>"Inicio","name"=>"start_date"];
			$this->col[] = ["label"=>"Termino","name"=>"end_date"];			
			$this->col[] = ["label"=>"Total","name"=>"total","callback_php"=>'"R$ ".number_format([total],2,",",".")'];
			$this->col[] = ["label"=>"Descrição do Evento","name"=>"titulo"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Responsável','name'=>'socio_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'socios,nome'];
			$this->form[] = ['label'=>'Espaço','name'=>'espaco_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'espacos,nome','datatable_where'=>'`finalidade` in ("Eventos","Atividades & Eventos")'];
			$this->form[] = ['label'=>'Inicio','name'=>'start_date','type'=>'datetime','validation'=>'required|after:today','width'=>'col-sm-9','readonly'=>'1'];
			
			
			$this->form[] = ['label'=>'Termino','name'=>'end_date','type'=>'datetime','validation'=>'required|after:start_date','width'=>'col-sm-9'];
			$this->form[] = ['label'=>'Descrição do Evento','name'=>'titulo','type'=>'text','validation'=>'required','width'=>'col-sm-9'];
			$this->form[] = ['label'=>'Valor do Espaço','name'=>'espaco_valor','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Desconto','name'=>'espaco_desconto','type'=>'money','validation'=>'integer|min:0','width'=>'col-sm-10'];
			# END FORM DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$columns = [];
			$columns[] = ['label'=>'Produto','name'=>'produto_id','type'=>'datamodal','datamodal_table'=>'produtos','datamodal_columns'=>'nome,valor','datamodal_select_to'=>'valor:produto_valor','datamodal_where'=>'','datamodal_size'=>'large'];
			$columns[] = ['label'=>'Valor','name'=>'produto_valor','type'=>'number','readonly'=>true];
			$columns[] = ['label'=>'Quantidade','name'=>'quantidade','type'=>'number','required'=>true];
			$columns[] = ['label'=>'Desconto','name'=>'desconto','type'=>'number','required'=>false, 'default'=>0.0];
			$columns[] = ['label'=>'Sub Total','name'=>'sub_total','type'=>'number','formula'=>"[quantidade] * [produto_valor] - [desconto]",'readonly'=>true,'required'=>true];
			$this->form[] = ['label'=>'Consumo','name'=>'evento__detalhes','type'=>'child','columns'=>$columns,'table'=>'evento__detalhes','foreign_key'=>'evento_id'];
			$this->form[] = ['label'=>'Total','name'=>'total','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10','readonly'=>true];
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
	        $this->alert        = array(['Ocupado','danger']);
	                

	        
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
	        	$(function() {
	        	
	        			        		
		        	$('#id input').priceFormat({
						prefix: 'R$',
						centsSeparator: ',',
						thousandsSeparator: '.',
						centsLimit: 2
					});	   
		  
	        		setInterval(function() {
		        		
		        		var total_consumo = 0;
		        		$('#table-consumo tbody .sub_total').each(function() {
		        			var amount = parseInt($(this).text());	
		        			total_consumo += amount;
		        		})
		        		
		        		var total_espaco = 0;
		        		total_espaco = (parseInt($('#espaco_valor').val()) || 0) - (parseInt($('#espaco_desconto').val()) || 0);
		        		
		        		$('#total').val(total_consumo+total_espaco);
      		
	        		},500);
	        		
	        	})
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
	        $eventoAgendado = $this->checkDisponibilidade($postdata);

    	    if (isset($eventoAgendado)) {
    	    	
    	    	$inicio = \Carbon\Carbon::parse($eventoAgendado->start_date)->format('d/m/Y H:i');
    	    	$fim	= \Carbon\Carbon::parse($eventoAgendado->end_date)->format('d/m/Y H:i');


				if(Request::ajax()) {
					$res = response()->json(['message'=>trans('crudbooster.alert_add_event_data_failed')."<b>".$eventoAgendado->titulo." (".$inicio." a ".$fim.")"."</b>",'message_type'=>'danger'])->send();
					exit;
				}
				else{
					$res = redirect()->back()->with(['message'=>trans('crudbooster.alert_add_event_data_failed')."<b>".$eventoAgendado->titulo." (".$inicio." a ".$fim.")"."</b>",'message_type'=>'danger'])->withInput();
					\Session::driver()->save();
					$res->send();
		        	exit;
				}	        
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
	        //Your code here

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
		/**
		 * Verifica disponibilidade de data antes de criar o evento.
		 *
		 * @param  array  $request
		 * @return bool
		 * 
		 * 
		  // Debug de Query 
		  DB::enableQueryLog(); 
		  DB::table('eventos')->where(function ($query) use ($inicio, $espaco) {
						  $query->where('data_inicial'	, '<='	, $inicio);
						  $query->where('data_final'	, '>='	, $inicio);
						  $query->where('espaco_id'		, '='	, $espaco);
						  $query->whereNull('deleted_at');
				})
				->orWhere(function ($query) use ($fim, $espaco) {
						  $query->where('data_inicial'	, '<='	, $fim);
						  $query->where('data_final'	, '>='	, $fim);
						  $query->where('espaco_id'		, '='	, $espaco); 
						  $query->whereNull('deleted_at');
				})->first();
		  dd(DB::getQueryLog());
		*/
		
		public function checkDisponibilidade(array $request) {

			$inicio 	= date("Y-m-d G:i A",strtotime(str_replace('/', '-', $request['start_date'])));
			$fim 		= date("Y-m-d G:i A",strtotime(str_replace('/', '-', $request['end_date'])));
			$espaco 	= $request['espaco_id'];
			
			$evento = Evento::where(function ($query) use ($inicio, $espaco) {
									  $query->where('start_date'	, '<='	, $inicio);
									  $query->where('end_date'		, '>='	, $inicio);
									  $query->where('espaco_id'		, '='	, $espaco);
									  $query->whereNull('deleted_at');
							})
							->orWhere(function ($query) use ($fim, $espaco) {
									  $query->where('start_date'	,  '<='	, $fim);
									  $query->where('end_date'		,  '>='	, $fim);
									  $query->where('espaco_id'		,  '='	, $espaco);
									  $query->whereNull('deleted_at');   					
					  })->first();

	        if(isset($evento)) {
	        	
	        	return $evento; // Período já OCUPADO para o espaço escolhido!
	        }
	       
	        return null; // Período DISPONÍVEL para o espaço escolhido!
		}	

	}