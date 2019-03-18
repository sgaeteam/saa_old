@extends('crudbooster::admin_template')
@section('content')
<div >

    @if(CRUDBooster::getCurrentMethod() != 'getProfile' && $button_cancel)
      @if(g('return_url'))
      <p><a title='Return' href='{{g("return_url")}}'><i class='fa fa-chevron-circle-left '></i> &nbsp; {{trans("crudbooster.form_back_to_list",['module'=>CRUDBooster::getCurrentModule()->name])}}</a></p>       
      @else
      <p><a title='Main Module' href='{{CRUDBooster::mainpath()}}'><i class='fa fa-chevron-circle-left '></i> &nbsp; {{trans("crudbooster.form_back_to_list",['module'=>CRUDBooster::getCurrentModule()->name])}}</a></p>       
      @endif
    @endif
    
	<ul data-toggle="ajax-tab" class="nav nav-tabs profile" role="tablist">
		<li class="active"><a role="tab" data-toggle="tab" class="active" href="#tab-general-info" data-target="#tab-info"><i class="fa fa-bars"></i> Informa&ccedil;&otilde;es Gerais</a></li>
		<li class=""><a role="tab" data-toggle="tab" href="#tab-pagamentos" data-target="#tab-pagamentos"><i class="fa fa-money"></i> Pagamentos em @php echo date('Y') @endphp</a></li>
		<li class=""><a role="tab" data-toggle="tab" href="#tab-dependentes" data-target="#tab-dependentes"><i class="fa fa-smile-o"></i> Dependentes</a></li>
	</ul>

	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active fade in" id="tab-info">
			<div class="tab-content">
				<div class="panel infolist">
					<div class="panel-body">
				        <div class="panel panel-default" id="tab-info">
				           <div class="panel-heading">
				             <strong><i class='{{CRUDBooster::getCurrentModule()->icon}}'></i> {!! $page_title or "Page Title" !!}</strong>
				           </div> 
				
				           <div class="panel-body" style="padding:20px 0px 0px 0px">
				                <?php                               
				                  $action = (@$row)?CRUDBooster::mainpath("edit-save/$row->id"):CRUDBooster::mainpath("add-save");
				                  $return_url = ($return_url)?:g('return_url');          
				                ?>
				                <form class='form-horizontal' method='post' id="form" enctype="multipart/form-data" action='{{$action}}'>
				                <input type="hidden" name="_token" value="{{ csrf_token() }}">    
				                <input type='hidden' name='return_url' value='{{ @$return_url }}'/>                      
				                <input type='hidden' name='ref_mainpath' value='{{ CRUDBooster::mainpath() }}'/>      
				                <input type='hidden' name='ref_parameter' value='{{urldecode(http_build_query(@$_GET))}}'/>
				                @if($hide_form)
				                  <input type="hidden" name="hide_form" value='{!! serialize($hide_form) !!}'>
				                @endif
				                        <div class="box-body" id="parent-form-area">
				
				                          @if($command == 'detail')
				                             @include("crudbooster::default.form_detail")  
				                          @else
				                             @include("crudbooster::default.form_body")         
				                          @endif
				                          
				                        </div><!-- /.box-body -->
				                
				                        <div class="box-footer" style="background: #F5F5F5">  
				                          
				                          <div class="form-group">
				                            <label class="control-label col-sm-2"></label>
				                            <div class="col-sm-10">
				                              @if($button_cancel && CRUDBooster::getCurrentMethod() != 'getDetail')                       
				                                @if(g('return_url'))
				                                <a href='{{g("return_url")}}' class='btn btn-default'><i class='fa fa-chevron-circle-left'></i> {{trans("crudbooster.button_back")}}</a>
				                                @else 
				                                <a href='{{CRUDBooster::mainpath("?".http_build_query(@$_GET)) }}' class='btn btn-default'><i class='fa fa-chevron-circle-left'></i> {{trans("crudbooster.button_back")}}</a>
				                                @endif
				                              @endif
				                              @if(CRUDBooster::isCreate() || CRUDBooster::isUpdate())
				
				                                 @if(CRUDBooster::isCreate() && $button_addmore==TRUE && $command == 'add')                                                                                                     
				                                    <input type="submit" name="submit" value='{{trans("crudbooster.button_save_more")}}' class='btn btn-success'>
				                                 @endif
				
				                                 @if($button_save && $command != 'detail')
				                                    <input type="submit" name="submit" value='{{trans("crudbooster.button_save")}}' class='btn btn-success'>
				                                 @endif
				                                 
				                              @endif
				                            </div>
				                          </div>    
				                          
				                        </div><!-- /.box-footer-->
				                </form>
				           </div>
				        </div>
					</div>
				</div>
			</div>
		</div>
		
		<div role="tabpanel" class="tab-pane fade in p20 bg-white" id="tab-pagamentos">
			
			<ul class="timeline timeline-inverse">
				@php 
					$results = [];
			        $meses = array('1' => 'Janeiro', 
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
				@endphp
				
				@foreach($pagamentos_socios as $pagamento)
					@php
						$ano = \Carbon\Carbon::parse($pagamento->data_referencia)->format(Y);
						$mes = \Carbon\Carbon::parse($pagamento->data_referencia)->format(n);
						$periodo = $meses[$mes].' / '.$ano;
						$valores = ["id" => $pagamento->id, "periodo" => $periodo, "data_pagamento" => $pagamento->data_pagamento, "tipo_pagamento" => $pagamento->tipo_pagamento,  "valor_pago" => $pagamento->valor_pago];
						array_push($results,$valores);
					@endphp
				@endforeach
				
				@for ($i = 12; $i >= 1; $i--)
					<li class="time-label">
						@php
							$existePagamento = array_search($meses[$i].' / '.date('Y'), array_column($results, 'periodo'));
							$dataPagamento = \Carbon\Carbon::parse($results[$existePagamento]['data_pagamento'])->format('d/m/Y');
							$tipoPagamento = $results[$existePagamento]['tipo_pagamento'];
							$valorPago = str_replace('.',',',$results[$existePagamento]['valor_pago']);
							$pagamentoId = $results[$existePagamento]['id'];
							
						    if ($existePagamento === false) 
						    {
								 echo '<span class="bg-red">';
						    	 echo $meses[$i].' / '.date('Y');
						    	 echo '</span>';
							}
							else
							{
								 $return_url = "javascript:history.back()#tab-pagamentos";
								 $link = CRUDBooster::adminPath('pagamentos_socios/detail/'.$pagamentoId).'?return_url='.$return_url;

							  	 echo '<span class="bg-green">';
						    	 echo   $meses[$i].' / '.date('Y');
						    	 echo '</span>';
						    	 echo '<li><i class="fa fa-clock-o bg-gray"></i>';
						    	 echo '<div class="timeline-item">';
								 echo ' <span class="time"><i class="fa fa-clock-o"></i> '.$dataPagamento.'</span>';
								 echo '	<h1 class="timeline-header">Pagamento realizado no valor de R$ '.number_format($valorPago,2,",",".").' ('.$tipoPagamento.'). Ver <a href='.$link.'>detalhes</a>.</h1>';
								 echo '</div></li>';
							}	 
						@endphp
					</li>	
				@endfor
			</ul>
			<!--<div class="text-center p30"><i class="fa fa-list-alt" style="font-size: 100px;"></i> <br> No posts to show</div>-->
		</div>
		
		<div role="tabpanel" class="tab-pane fade in p20 bg-white" id="tab-dependentes">
			<div class="tab-content">
				<div class="panel infolist">
					<div class="panel-body">
				        <div class="panel panel-default" id="tab-info">
				           <div class="panel-heading">
				             <strong><i class='{{CRUDBooster::getCurrentModule()->icon}}'></i> {!! $page_title or "Page Title" !!}</strong>
				           </div> 
				
				           <div class="panel-body" style="padding:20px 0px 0px 0px">
				           	
								<div class="box-body" id="parent-form-area">
									<style type="text/css">
										#table-detail tr td:first-child {
											font-weight: normal;
											width: 25%;
										}
									</style>
									<div class='table-responsive'>
										<table id='table-detail' class="table table-striped table-bordered">
											<thead>
													<th>Nome</th>
													<th>Data de Nascimento</th>
													<th>Sexo</th>
													<th>Grau de parentesco</th>
											</thead>
											<tbody>
												@foreach($dependentes as $dependente)
													<tr>
														<td>{{$dependente->dependente_nome}}</td>
														<td>
															{{ str_replace('30/11/-0001',null,Carbon\Carbon::parse($dependente->dependente_dtnasc)->format('d/m/Y'))}} 
															@php
															   $dtnascimentoNulo =	Carbon\Carbon::parse($dependente->dependente_dtnasc)->format('d/m/Y');
															   if ($dtnascimentoNulo <> '30/11/-0001') {
															   		echo("(".Carbon\Carbon::parse($dependente->dependente_dtnasc)->diff(Carbon\Carbon::now())->format('%y anos, %m meses e %d dias').")");
															   }
															@endphp
														</td>
														<td>{{$dependente->dependente_sexo}}</td>														
														<td>{{$dependente->dependente_grau}}</td>
													</tr>	
												@endforeach
											</tbody>	
										</table>
									</div>
								</div>
								<div class="box-footer" style="background: #F5F5F5">  
								</div>	
							</div>	
						</div>		
					</div>			
				</div>
			</div>
		</div>
		
	</div>
        
</div><!--END AUTO MARGIN-->
@endsection