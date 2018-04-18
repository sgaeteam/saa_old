<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use Illuminate\Support\Facades\Route;


	class AdminAtividadesController extends \crocodicstudio\crudbooster\controllers\CBController {

	    public function cbInit() {

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "id";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = true;
			$this->button_bulk_action = false;
			$this->button_action_style = "button_icon";
			$this->button_add = true;
			$this->button_edit = true;
			$this->button_delete = true;
			$this->button_detail = true;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "atividades";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Professor","name"=>"professor_id","join"=>"professores,nome"];
			$this->col[] = ["label"=>"Espaço","name"=>"espaco_id","join"=>"espacos,nome"];
			$this->col[] = ["label"=>"Tipo de atividade","name"=>"tipoatividade_id","join"=>"tipo_atividades,descricao"];
			$this->col[] = ["label"=>"Descrição da Atividade","name"=>"titulo"];
			$this->col[] = ["label"=>"Data Início","name"=>"data_inicio"];
			$this->col[] = ["label"=>"Data Fim","name"=>"data_fim"];
			$this->col[] = ["label"=>"Duração","name"=>"duracao"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Professor','name'=>'professor_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'professores,nome'];
			$this->form[] = ['label'=>'Espaço','name'=>'espaco_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'espacos,nome','datatable_where'=>'`finalidade` in ("Atividades","Atividades & Eventos")'];
			$this->form[] = ['label'=>'Tipo de Atividade','name'=>'tipoatividade_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'tipo_atividades,descricao'];
			$this->form[] = ['label'=>'Descrição da Atividade','name'=>'titulo','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Sigla','name'=>'sigla','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Data Início','name'=>'data_inicio','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Data Fim','name'=>'data_fim','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Duração','name'=>'duracao','type'=>'time','validation'=>'required|date_format:H:i','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'DOM','name'=>'hora_inicio_dom','type'=>'time','validation'=>'date_format:H:i','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'SEG','name'=>'hora_inicio_seg','type'=>'time','validation'=>'date_format:H:i','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'TER','name'=>'hora_inicio_ter','type'=>'time','validation'=>'date_format:H:i','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'QUA','name'=>'hora_inicio_qua','type'=>'time','validation'=>'date_format:H:i','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'QUI','name'=>'hora_inicio_qui','type'=>'time','validation'=>'date_format:H:i','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'SEX','name'=>'hora_inicio_sex','type'=>'time','validation'=>'date_format:H:i','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'SAB','name'=>'hora_inicio_sab','type'=>'time','validation'=>'date_format:H:i','width'=>'col-sm-10'];
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
	        $this->addaction = array(['label'=>'Agendar','icon'=>'fa fa-clock-o','color'=>'danger','url'=>CRUDBooster::mainpath('set-paid').'/[id]']);
	    //  $this->addaction[] = ['label'=>'Set Active','url'=>CRUDBooster::mainpath('set-status/active/[id]'),'icon'=>'fa fa-check','color'=>'success','showIf'=>"[status] == 'pending'"];
		//	$this->addaction[] = ['label'=>'Set Pending','url'=>CRUDBooster::mainpath('set-status/pending/[id]'),'icon'=>'fa fa-ban','color'=>'warning','showIf'=>"[status] == 'active'", 'confirmation' => true];
		//  $this->addaction[] = ['label'=>'Set Paid','icon'=>'fa fa-money','color'=>'warning','url'=>CRUDBooster::mainpath('set-paid').'/[id]','showIf'=>'[status] == "belum lunas"'];

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
	        //Your code here
	        dd($postdata);

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
		public function getAdd() {
			
			$this->cbLoader();
			
			//Create an Auth
			if(!CRUDBooster::isCreate() && $this->global_privilege==FALSE || $this->button_add==FALSE) {
				CRUDBooster::insertLog(trans('crudbooster.log_try_add',['module'=>CRUDBooster::getCurrentModule()->name ]));
				CRUDBooster::redirect(CRUDBooster::adminPath(),trans("crudbooster.denied_access"));
			}
	
/*
			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Professor','name'=>'professor_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'professores,nome'];
			$this->form[] = ['label'=>'Espaço','name'=>'espaco_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'espacos,nome','datatable_where'=>'`finalidade` in ("Atividades","Atividades & Eventos")'];
			$this->form[] = ['label'=>'Tipo de Atividade','name'=>'tipoatividade_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'tipo_atividades,descricao'];
			$this->form[] = ['label'=>'Descrição da Atividade','name'=>'titulo','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Sigla','name'=>'sigla','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Data Início','name'=>'data_inicio','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Data Fim','name'=>'data_fim','type'=>'date','validation'=>'required|date','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Duração','name'=>'duracao','type'=>'time','validation'=>'required|date_format:H:i:s','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'DOM','name'=>'hora_inicio_dom','type'=>'time','validation'=>'date_format:H:i:s','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'SEG','name'=>'hora_inicio_seg','type'=>'time','validation'=>'date_format:H:i:s','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'TER','name'=>'hora_inicio_ter','type'=>'time','validation'=>'date_format:H:i:s','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'QUA','name'=>'hora_inicio_qua','type'=>'time','validation'=>'date_format:H:i:s','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'QUI','name'=>'hora_inicio_qui','type'=>'time','validation'=>'date_format:H:i:s','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'SEX','name'=>'hora_inicio_sex','type'=>'time','validation'=>'date_format:H:i:s','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'SAB','name'=>'hora_inicio_sab','type'=>'time','validation'=>'date_format:H:i:s','width'=>'col-sm-10'];
		    # END FORM DO NOT REMOVE THIS LINE
*/		  
			$data = [];
			$data['page_title'] = trans("crudbooster.add_data_page_title",['module'=>CRUDBooster::getCurrentModule()->name]);
			$data['page_menu']  = Route::getCurrentRoute()->getActionName();
			$data['command']    = 'add';
			$data['forms']		= $this->form;
			//Please use cbView method instead view method from laravel
			$this->cbView('atividade_add',$data);
		}
		
	}