<?php namespace App\Http\Controllers;

	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use Route;
	use DateTime;
	use DateInterval;
	use DatePeriod;
	use App\Evento;


	class AdminAtividadesController extends \crocodicstudio\crudbooster\controllers\CBController {

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
			$this->table = "atividades";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Espaço","name"=>"espaco_id","join"=>"espacos,nome"];
			$this->col[] = ["label"=>"Professor","name"=>"professor_id","join"=>"professores,nome"];
			$this->col[] = ["label"=>"Tipo de atividade","name"=>"tipoatividade_id","join"=>"tipo_atividades,descricao"];
			$this->col[] = ["label"=>"Descrição da Atividade","name"=>"titulo"];
			$this->col[] = ["label"=>"Início","name"=>"data_inicio","callback_php"=>'date("d/m/Y",strtotime($row->data_inicio))'];
			$this->col[] = ["label"=>"Término","name"=>"data_fim","callback_php"=>'date("d/m/Y",strtotime($row->data_fim))'];
			$this->col[] = ["label"=>"Duração","name"=>"duracao","callback_php"=>'date("H:i",strtotime($row->duracao))'];
			$this->col[] = ["label"=>"Horários","name"=>"horarios"];
			$this->col[] = ["label"=>"Agendado","name"=>"agendado","callback_php"=>'($row->agendado == 1 ? "Sim" : "Não")'];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Professor','name'=>'professor_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'professores,nome','datatable_where'=>'`deleted_at` is null'];
			$this->form[] = ['label'=>'Espaço','name'=>'espaco_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'espacos,nome','datatable_where'=>'`finalidade` in ("Atividades","Atividades & Eventos") and `deleted_at` is null'];
			$this->form[] = ['label'=>'Tipo de Atividade','name'=>'tipoatividade_id','type'=>'select2','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'tipo_atividades,descricao','datatable_where'=>'`deleted_at` is null'];
			$this->form[] = ['label'=>'Descrição da Atividade','name'=>'titulo','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Sigla','name'=>'sigla','type'=>'text','validation'=>'min:1|max:255','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Início','name'=>'data_inicio','type'=>'date','validation'=>'required|date|after:yesterday','width'=>'col-sm-10','readonly'=>'1'];
			$this->form[] = ['label'=>'Término','name'=>'data_fim','type'=>'date','validation'=>'required|date|after:data_inicio','width'=>'col-sm-10','readonly'=>'1'];
			$this->form[] = ['label'=>'Duração','name'=>'duracao','type'=>'time','validation'=>'required|date_format:H:i','width'=>'col-sm-10','readonly'=>'1'];
			$this->form[] = ['label'=>'DOM','name'=>'hora_inicio_dom','type'=>'time','validation'=>'required|date_format:H:i','width'=>'col-sm-10','readonly'=>'1'];
			$this->form[] = ['label'=>'SEG','name'=>'hora_inicio_seg','type'=>'time','validation'=>'required|date_format:H:i','width'=>'col-sm-10','readonly'=>'1'];
			$this->form[] = ['label'=>'TER','name'=>'hora_inicio_ter','type'=>'time','validation'=>'required|date_format:H:i','width'=>'col-sm-10','readonly'=>'1'];
			$this->form[] = ['label'=>'QUA','name'=>'hora_inicio_qua','type'=>'time','validation'=>'required|date_format:H:i','width'=>'col-sm-10','readonly'=>'1'];
			$this->form[] = ['label'=>'QUI','name'=>'hora_inicio_qui','type'=>'time','validation'=>'required|date_format:H:i','width'=>'col-sm-10','readonly'=>'1'];
			$this->form[] = ['label'=>'SEX','name'=>'hora_inicio_sex','type'=>'time','validation'=>'required|date_format:H:i','width'=>'col-sm-10','readonly'=>'1'];
			$this->form[] = ['label'=>'SAB','name'=>'hora_inicio_sab','type'=>'time','validation'=>'required|date_format:H:i','width'=>'col-sm-10','readonly'=>'1'];
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
			$this->addaction[] = ['label'=>'Agendar','icon'=>'fa fa-clock-o','color'=>'success','url'=>CRUDBooster::mainpath('agendar').'/[id]','showIf'=>"[agendado] == '0'",'confirmation' => true];
			$this->addaction[] = ['label'=>'Suspender','icon'=>'fa fa-calendar-times-o','color'=>'danger','url'=>CRUDBooster::mainpath('suspender').'/[id]','showIf'=>"[agendado] == '1'",'confirmation' => true];


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
			$hoje = date('Y-m-d H:i:s');					
			DB::table('eventos')
	        ->whereNull('deleted_at')
            ->where('atividade_id',$id)
            ->where('start_date','>=',$hoje)
	        ->update(array('deleted_at'=>$hoje)); 
				  
			DB::table($this->table)
	        ->whereNull('deleted_at')
	        ->where($this->primary_key,$id)
	        ->where('agendado','1')
	        ->update(array('agendado'=>'0'));
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
		public function agendar($id) {
			
			$this->cbLoader();
			$row = DB::table($this->table)->where($this->primary_key,$id)->first();
			
			$agendaSemanal = [];
			$agendaSemanal['dom'] = ($row->hora_inicio_dom == '00:00:00' ? null : $row->hora_inicio_dom);
			$agendaSemanal['seg'] = ($row->hora_inicio_seg == '00:00:00' ? null : $row->hora_inicio_seg);
			$agendaSemanal['ter'] = ($row->hora_inicio_ter == '00:00:00' ? null : $row->hora_inicio_ter);
			$agendaSemanal['qua'] = ($row->hora_inicio_qua == '00:00:00' ? null : $row->hora_inicio_qua);
			$agendaSemanal['qui'] = ($row->hora_inicio_qui == '00:00:00' ? null : $row->hora_inicio_qui);
			$agendaSemanal['sex'] = ($row->hora_inicio_sex == '00:00:00' ? null : $row->hora_inicio_sex);
			$agendaSemanal['sab'] = ($row->hora_inicio_sab == '00:00:00' ? null : $row->hora_inicio_sab);	

			if (!isset($agendaSemanal['dom']) && !isset($agendaSemanal['seg']) && !isset($agendaSemanal['ter']) && 
				!isset($agendaSemanal['qua']) && !isset($agendaSemanal['qui']) && !isset($agendaSemanal['sex']) && 
				!isset($agendaSemanal['sab'])) {
				
				CRUDBooster::redirect(CRUDBooster::mainpath(),trans("crudbooster.alert_agendamento_failed"),'danger');
			}
			
			 $agenda = [];
		 	 $row->hora_inicio_dom == '00:00:00' ? null : $agenda[0]=' Dom: '.\Carbon\Carbon::parse($row->hora_inicio_dom)->format('H:i').' ';
			 $row->hora_inicio_seg == '00:00:00' ? null : $agenda[1]=' Seg: '.\Carbon\Carbon::parse($row->hora_inicio_seg)->format('H:i').' ';
			 $row->hora_inicio_ter == '00:00:00' ? null : $agenda[2]=' Ter: '.\Carbon\Carbon::parse($row->hora_inicio_ter)->format('H:i').' ';
			 $row->hora_inicio_qua == '00:00:00' ? null : $agenda[3]=' Qua: '.\Carbon\Carbon::parse($row->hora_inicio_qua)->format('H:i').' ';
			 $row->hora_inicio_qui == '00:00:00' ? null : $agenda[4]=' Qui: '.\Carbon\Carbon::parse($row->hora_inicio_qui)->format('H:i').' ';
			 $row->hora_inicio_sex == '00:00:00' ? null : $agenda[5]=' Sex: '.\Carbon\Carbon::parse($row->hora_inicio_sex)->format('H:i').' ';
			 $row->hora_inicio_sab == '00:00:00' ? null : $agenda[6]=' Sab: '.\Carbon\Carbon::parse($row->hora_inicio_sab)->format('H:i').' ';
			 
			 $horarios = null;
			 
			 foreach($agenda as $dia) { 
			     $horarios .= $dia.'|';
			 }
			 $horarios = rtrim($horarios,'|');


			$atividade = [];
			$atividade['espaco_id'] 		= $row->espaco_id;
			$atividade['titulo']			= $row->titulo;	
			$atividade['professor_id'] 		= $row->professor_id;
			$atividade['atividade_id']		= $id;
			$atividade['total']				= 0.0;			
			$atividade['all_day']			= 0;
			$atividade['espaco_valor']		= 0.0;			
			$atividade['espaco_desconto']	= 0.0;
			$atividade['horarios']			= $horarios; 

			$begin = new DateTime($row->data_inicio);
			$end = new DateTime($row->data_fim);
			$end->setTime(0,0,1);
			$interval = DateInterval::createFromDateString('1 day');
			$period = new DatePeriod($begin, $interval, $end);			
			
			foreach ($period as $dt) {

				$data = $dt->format("w");
				
				$semana = array('0' => 'dom', 
			        			'1' => 'seg',
						        '2' => 'ter',
						        '3' => 'qua',
						        '4' => 'qui',
						        '5' => 'sex',
						        '6' => 'sab'
			    );
			    
			    $dia = $semana[$data];
			    
				if (isset($agendaSemanal[$dia])) {
				    		
							$atividade['hora_inicio'] = new DateTime($agendaSemanal[$dia]);			
							$atividade['duracao'] = new DateTime($row->duracao);
							$atividade['hora_fim'] = new DateTime($agendaSemanal[$dia]);	
							$atividade['hora_fim']->add(new DateInterval('PT'.$atividade['duracao']->format('H').'H'.$atividade['duracao']->format('i').'M'));

							$atividade['start'] = date($dt->format("Y-m-d") . ' ' . $atividade['hora_inicio']->format("H:i:s"));
							$atividade['end']   = date($dt->format("Y-m-d") . ' ' . $atividade['hora_fim']->format("H:i:s"));

							$eventoAgendado = $this->checkDisponibilidade($atividade);
				
							if (isset($eventoAgendado)) {
								printf("Atividade NÃO agendada: ");
							    printf("dia ".$dt->format("d/m/Y")." das ".$atividade['hora_inicio']->format("H:i:s")." às ".$atividade['hora_fim']->format("H:i:s"));
							    printf ("\n");
							}
							else {
								printf("Atividade agendada: ");
							    printf("dia ".$dt->format("d/m/Y")." das ".$atividade['hora_inicio']->format("H:i:s")." às ".$atividade['hora_fim']->format("H:i:s"));
							    printf ("\n");
							    
								$eventoNovo = array('espaco_id' 		=> $atividade['espaco_id'],
													'start_date'		=> $atividade['start'],
													'end_date'			=> $atividade['end'],
													'titulo'			=> $atividade['titulo'],
													'atividade_id'		=> $atividade['atividade_id'],
													'professor_id'		=> $atividade['professor_id'],
													'total'				=> $atividade['total'],			
													'all_day'			=> $atividade['all_day'],
													'espaco_valor'		=> $atividade['espaco_valor'],			
													'espaco_desconto'	=> $atividade['espaco_desconto']);
								Evento::create($eventoNovo);	
							}
				}
			}			    
		
			DB::table($this->table)
	        ->where($this->primary_key,$atividade['atividade_id'])
	        ->where('agendado', 0)
	        ->whereNull('deleted_at')
	        ->update(array('agendado'=>'1','data_suspensao'=>null,'horarios'=>$horarios));
	        
			CRUDBooster::insertLog(trans("crudbooster.log_agendar",['name'=>$atividade['atividade_id'],'module'=>CRUDBooster::getCurrentModule()->name]));
			
			return redirect()->back()->with(['message_type'=>'success','message'=>trans("crudbooster.alert_agendamento_ok")]);
		}		
		
		public function checkDisponibilidade(array $request) {
			
			$inicio 	= $request['start'];
			$fim 		= $request['end'];
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
							})
							->orWhere(function ($query) use ($inicio, $fim, $espaco) {
									  $query->where('start_date'	,  '<='	, $fim);
									  $query->where('end_date'		,  '>='	, $inicio);
									  $query->where('espaco_id'		,  '='	, $espaco);
									  $query->whereNull('deleted_at');   
					  })->first();

	        if(isset($evento)) {
	        	return $evento; // Período já OCUPADO para o espaço escolhido!
	        }
	       
	        return null; // Período DISPONÍVEL para o espaço escolhido!
		}	

		public function suspender($id) {
			
			$this->cbLoader();
			$hoje = date('Y-m-d H:i:s');					

			DB::table('eventos')
	        ->whereNull('deleted_at')
            ->where('atividade_id',$id)
            ->where('start_date','>=',$hoje)
	        ->update(array('deleted_at'=>$hoje)); 
				  
			DB::table($this->table)
	        ->whereNull('deleted_at')
	        ->where($this->primary_key,$id)
	        ->where('agendado','1')
	        ->update(array('agendado'=>'0','data_suspensao'=>$hoje,'horarios'=>null));
	        
			CRUDBooster::insertLog(trans("crudbooster.log_suspender",['name'=>$id,'module'=>CRUDBooster::getCurrentModule()->name]));
			
			return redirect()->back()->with(['message_type'=>'warning','message'=>trans("crudbooster.alert_agendamento_susp")]);
		}
		
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
			$data['eventos'] = DB::table('eventos')->leftJoin('professores', 'eventos.professor_id', '=', 'professores.id')
											       ->select('eventos.*','professores.nome as professor')
											       ->where('eventos.atividade_id',$id)
											       ->whereNull('eventos.deleted_at')
											       ->orderBy('eventos.start_date', 'asc')
											       ->get();
			$data['matriculados'] = DB::table('matriculas')->leftJoin('usuarios', 'matriculas.usuario_id', '=', 'usuarios.id')
												        ->select('matriculas.*','usuarios.nome as usuario')
												        ->where('matriculas.atividade_id',$id)
												        ->whereNull('matriculas.deleted_at')
												        ->orderBy('usuarios.nome', 'asc')
												        ->get();
			$data['command'] = 'detail';
		    //Please use cbView method instead view method from laravel
			Session::put('current_row_id',$id);
			$this->cbView('atividade_detail',$data);
		}		
	}