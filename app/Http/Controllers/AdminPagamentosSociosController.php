<?php namespace App\Http\Controllers;

	use Illuminate\Support\Facades\Route;
	use Session;
	use Request;
	use DB;
	use CRUDBooster;
	use App\Socio;
	use App\Categoria;
	
	class AdminPagamentosSociosController extends \crocodicstudio\crudbooster\controllers\CBController {
		
		protected $qt_parcela, $pagamento = [];
		
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
			$this->button_edit = false;
			$this->button_delete = true;
			$this->button_detail = false;
			$this->button_show = true;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "pagamentos_socios";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
			$this->col = [];
			$this->col[] = ["label"=>"Sócio","name"=>"socio_id","join"=>"socios,nome"];
			$this->col[] = ["label"=>"Mensalidade","name"=>"mensalidade","callback_php"=>'"R$ ".number_format([mensalidade],2,",",".")'];
			$this->col[] = ["label"=>"Acréscimo","name"=>"acrescimo","callback_php"=>'"R$ ".number_format([acrescimo],2,",",".")'];			
			$this->col[] = ["label"=>"Desconto","name"=>"desconto","callback_php"=>'"R$ ".number_format([desconto],2,",",".")'];
			$this->col[] = ["label"=>"Valor Pago","name"=>"valor_pago","callback_php"=>'"R$ ".number_format([valor_pago],2,",",".")'];
			$this->col[] = ["label"=>"Data de Referência","name"=>"data_referencia","callback_php"=>'$this->getMesPorExtenso($row->data_referencia)'];			
			$this->col[] = ["label"=>"Data de Pagamento","name"=>"data_pagamento","callback_php"=>'str_replace("30/11/-0001",null,date("d/m/Y",strtotime($row->data_pagamento)))'];				
			$this->col[] = ["label"=>"Forma de Pagamento","name"=>"tipo_pagamento"];
			$this->col[] = ["label"=>"Recibo","name"=>"recibo"];
			# END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Sócio','name'=>'socio_id','type'=>'select','validation'=>'required|integer|min:0','width'=>'col-sm-10','datatable'=>'socios,nome','datatable_where'=>'`deleted_at` is null'];
			$this->form[] = ['label'=>'Último pagamento','name'=>'data_referencia','type'=>'text','width'=>'col-sm-10','readonly'=>'readonly','disabled'=>'disabled'];
			$this->form[] = ['label'=>'Forma de Pagamento','name'=>'tipo_pagamento','type'=>'select','validation'=>'required|min:1|max:255','width'=>'col-sm-10','dataenum'=>'Espécie;Cartão de Crédito;Cartão de Débito'];
			$this->form[] = ['label'=>'Mensalidade','name'=>'mensalidade','type'=>'money','width'=>'col-sm-10','readonly'=>'readonly','disabled'=>'disabled'];
			$this->form[] = ['label'=>'Qtd. Meses','name'=>'qt_meses','type'=>'number','validation'=>'required|integer|min:1','width'=>'col-sm-10','value'=>1];			
			$this->form[] = ['label'=>'Acréscimo','name'=>'acrescimo','type'=>'money','validation'=>'min:0','width'=>'col-sm-10','value'=>0];
			$this->form[] = ['label'=>'Desconto','name'=>'desconto','type'=>'money','validation'=>'min:0','width'=>'col-sm-10','value'=>0];
			$this->form[] = ['label'=>'Valor Mensal','name'=>'valor_pago','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10','readonly'=>'readonly','disabled'=>'disabled'];
			$this->form[] = ['label'=>'Valor Total','name'=>'valor_total','type'=>'money','validation'=>'required|integer|min:0','width'=>'col-sm-10','readonly'=>'readonly','disabled'=>'disabled'];
			//$this->form[] = ['label'=>'Recibo','name'=>'recibo','type'=>'text','validation'=>'required|min:1|max:255','width'=>'col-sm-10','readonly'=>'readonly','disabled'=>'disabled'];
			$this->form[] = ['label'=>'Recibo','name'=>'recibo','type'=>'text','validation'=>'required|min:1|max:10','width'=>'col-sm-10'];
			$this->form[] = ['label'=>'Data de Pagamento','name'=>'data_pagamento','type'=>'text','validation'=>'required|date','width'=>'col-sm-10','value'=>date("d/m/Y"),'readonly'=>'readonly','disabled'=>'disabled'];;
			$this->form[] = ['label'=>'Recebedor','name'=>'user_id','type'=>'text','validation'=>'required','width'=>'col-sm-10','readonly'=>'readonly','disabled'=>'disabled','value'=>CRUDBooster::myName()];
			$this->form[] = ['label'=>'Obs','name'=>'obs','type'=>'textarea','validation'=>'min:5|max:5000','width'=>'col-sm-10'];
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
				
				    $('#socio_id').change(function(){
				    
				        // Pega o valor do select selecionado
				        var valor_select = $(this).val();
						
						if (valor_select == '') {
							$('#mensalidade').val('');	
						}
						
						else {
					        var url_destino = 'mensalidade/'+valor_select;

							$.ajax({
								type: 'get',
								dataType: 'json',
								processData: false,
								data: '',
								url: url_destino,
								success: function(response) {
					        		$('#mensalidade').val(response.mensalidade);
					        		var valor_total = parseFloat(response.mensalidade);
									var acrescimo = parseFloat($('#acrescimo').val()) ||0;
					    			var desconto = parseFloat($('#desconto').val()) ||0;					        		
					        		var qt_parcela = parseInt($('#qt_meses').val()) ||0;
					        		var total = 0;
									if( !isNaN(valor_total) ) total = (valor_total*qt_parcela)+acrescimo-desconto;
					        		$('#valor_total').val(total);
									if( qt_parcela == 0 ) qt_parcela = 1;
					        		$('#valor_pago').val(total/qt_parcela);	

								},
								error: function(jqXHR, textStatus, errorThrown) {}
							});

					        var url_destino = 'ultimopagamento/'+valor_select;
							
							$.ajax({
								type: 'get',
								dataType: 'json',
								processData: false,
								data: '',
								url: url_destino,
								success: function(response) {
					        		$('#data_referencia').val(response.data_referencia_texto);
					        		console.log(response.data_referencia_texto);
								},
								error: function(jqXHR, textStatus, errorThrown) {}
							});							
						}
						
					}); 

					$('#acrescimo').on('change', function(response) {
					    
					    var valor_total = 0;
					    var acrescimo = 0;
					    var desconto = 0;
					    var total = 0;
					    
					    if ($('#mensalidade').val() != '') {
					    						     
					    	valor_total = parseFloat($('#mensalidade').val()) || 0;
					    	var acrescimo = parseFloat($('#acrescimo').val()) || 0;
					    	var desconto = parseFloat($('#desconto').val()) || 0;
					    	var qt_parcela = parseInt($('#qt_meses').val()) || 0;
					    	
					    	if(!isNaN(valor_total)) {
					    		total = (valor_total*qt_parcela)+acrescimo-desconto;
					    		if( qt_parcela == 0 ) qt_parcela = 1;
					    	}
					    }
					    
		        		$('#valor_total').val(total);
		        		$('#valor_pago').val(total/qt_parcela);
					});	

					$('#desconto').on('change', function(response) {
					    
					    var valor_total = 0;
					    var acrescimo = 0;
					    var desconto = 0;
					    var total = 0;
					    
					    if ($('#mensalidade').val() != '') {
					    						     
					    	valor_total = parseFloat($('#mensalidade').val()) || 0;
					    	var acrescimo = parseFloat($('#acrescimo').val()) || 0;
					    	var desconto = parseFloat($('#desconto').val()) || 0;
					    	var qt_parcela = parseInt($('#qt_meses').val()) || 0;
					    	
					    	if(!isNaN(valor_total)) {
					    		total = (valor_total*qt_parcela)+acrescimo-desconto;
					    		if( qt_parcela == 0 ) qt_parcela = 1;
					    	}
					    }
					    
		        		$('#valor_total').val(total);
		        		$('#valor_pago').val(total/qt_parcela);
					});						
					
					$('#qt_meses').on('change', function(response) {
					    
					    var valor_total = 0;
					    var acrescimo = 0;
					    var desconto = 0;
					    var total = 0;
					    
					    if ($('#mensalidade').val() != '') {
					    						     
					    	valor_total = parseFloat($('#mensalidade').val()) || 0;
					    	var acrescimo = parseFloat($('#acrescimo').val()) || 0;
					    	var desconto = parseFloat($('#desconto').val()) || 0;
					    	var qt_parcela = parseInt($('#qt_meses').val()) || 0;
					    	
					    	if(!isNaN(valor_total)) {
					    		total = (valor_total*qt_parcela)+acrescimo-desconto;
					    		if( qt_parcela == 0 ) qt_parcela = 1;
					    	}
					    }
					    
		        		$('#valor_total').val(total);
		        		$('#valor_pago').val(total/qt_parcela);
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

        	$this->qt_parcela = ($postdata['qt_meses'] == 0 ? 1 : $postdata['qt_meses']);
        	
        	unset($postdata['qt_meses']);
        	unset($postdata['valor_total']);
        	
        	$postdata['cobranca_id'] = Socio::find($postdata['socio_id'])->cobranca_id;
	        $postdata['user_id'] = CRUDBooster::myId();  
	        $postdata['mensalidade'] = $this->getMensalidadeSocio($postdata['socio_id']);
        	$postdata['acrescimo'] = round($postdata['acrescimo']/$this->qt_parcela, 2);
			$postdata['desconto'] = round($postdata['desconto']/$this->qt_parcela, 2);
	        $postdata['valor_pago'] = round($postdata['mensalidade']+$postdata['acrescimo']-$postdata['desconto'],2); 
			$postdata['data_pagamento'] = \Carbon\Carbon::now()->format('Y-m-d');	        	        
			$ultimo_pagamento = $this->getUltimoPagamentoSocio($postdata['socio_id']);
		
			if (isset($ultimo_pagamento)) 
			{
				$postdata['data_referencia'] = \Carbon\Carbon::parse($ultimo_pagamento)->addMonth()->startOfMonth()->format('Y-m-d');				
	    	}
	    	else 
	    	{
	    		$postdata['data_referencia'] =  \Carbon\Carbon::now()->startOfMonth()->format('Y-m-d');
	    	}
	    	
	    	if ($this->qt_parcela > 1)
	    	{
	    		$this->pagamento = $postdata;	
	    	}
	    	else 
	    	{
				$this->qt_parcela = null; 
	        	$this->pagamento = null;	    		
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

	        if ($this->qt_parcela > 1) 
	        {
	        	for ($i = 1; $i <= $this->qt_parcela-1; $i++)
	        	{
					$this->pagamento['data_referencia'] = \Carbon\Carbon::parse($this->pagamento['data_referencia'])->addMonth()->startOfMonth()->format('Y-m-d');				
				    DB::table('pagamentos_socios')->insert($this->pagamento);
	        	}
	        }
	        
	        $this->qt_parcela = null; 
	        $this->pagamento = null;
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
			
			//Create an Auth

			if(!CRUDBooster::isRead() && $this->global_privilege==FALSE || $this->button_detail==FALSE) {
				CRUDBooster::insertLog(trans("crudbooster.log_try_view",['name'=>$row->{$this->title_field},'module'=>CRUDBooster::getCurrentModule()->name]));
				CRUDBooster::redirect(CRUDBooster::adminPath(),trans('crudbooster.denied_access'));
			}
			
	  		$this->cbLoader();	
	  		$row = DB::table($this->table)->where($this->primary_key,$id)->first();
			$module = CRUDBooster::getCurrentModule();
			$data = [];
			$data['page_menu'] = Route::getCurrentRoute()->getActionName();
			$data['page_title'] = trans("crudbooster.detail_data_page_title",['module'=>$module->name,'name'=>$row->{$this->title_field}]);
			$data['row'] = $row;
			$data['id'] = $id;
			$data['command'] = 'add';
			

		    //Please use cbView method instead view method from laravel
			Session::put('current_row_id',$id);
			$this->cbView('pagsocios_add',$data);
		}
		
		// Resgata a Mensalidade devida pelo Socio escolhido	
		public function getMensalidadeSocio($id){
			
			$categoria = Socio::find($id)->categoria_id;
			$mensalidade = Categoria::find($categoria)->mensalidade;
			
			if(Request::ajax()) {

				return response()->json(['mensalidade' => $mensalidade]);

			}
			else{
								
				return $mensalidade;
				
			}
		}
		
		// Verifica a data de referência do último pagamento realizado pelo Socio escolhido	
		public function getUltimoPagamentoSocio($id){

			$ultimoPagamentoData = DB::table('pagamentos_socios')->select('data_referencia')->where('socio_id',$id)->whereNull('deleted_at')->orderBy('data_referencia', 'desc')->first();

			if(isset($ultimoPagamentoData))
			{
				$ultimoPagamentoData = \Carbon\Carbon::parse($ultimoPagamentoData->data_referencia)->format('Y-m-d');	
				$ultimoPagamentoTexto = $this->getMesPorExtenso($ultimoPagamentoData);
			} 
			else
			{
				$ultimoPagamentoData = null;
				$ultimoPagamentoTexto = 'Sem registro';				
			}

			
			if(Request::ajax()) 
			{
				return response()->json(['data_referencia_texto' => $ultimoPagamentoTexto, 'data_referencia' => $ultimoPagamentoData]);
			}
			else
			{
				return $ultimoPagamentoData;
			}			
			
		}
		
		
		// Verifica a data de referência do último pagamento realizado pelo Socio escolhido	
		public function getMesPorExtenso($data){

			if(isset($data))
			{
				$digitoMes = (int) (date('m',strtotime($data)));

				$mes = array( '1' => 'Janeiro', 
		        			  '2' => 'Fevereiro',
					          '3' => 'Março',
					          '4' => 'Abril',
					          '5' => 'Maio',
					          '6' => 'Junho',
					          '7' => 'Julho',
							  '8' => 'Agosto',						        
							  '9' => 'Setembro',
							 '10' => 'Outubro',
							 '11' => 'Novembro',
							 '12' => 'Dezembro');
 
			    $ano = date('Y',strtotime($data));
			    $dataFormatada = $mes[$digitoMes].' / '.$ano;
			   
			return $dataFormatada;
			}			
			
		}		
	}