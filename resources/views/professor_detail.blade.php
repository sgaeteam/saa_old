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
		<li class=""><a role="tab" data-toggle="tab" href="#tab-atividades" data-target="#tab-atividades"><i class="fa fa-calendar-check-o"></i> Atividades Associadas</a></li>
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
		
		<div role="tabpanel" class="tab-pane fade in p20 bg-white" id="tab-atividades">
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
													<th>Descrição</th>
													<th>Tipo</th>												
													<th>Espaço</th>
													<th>Agendado</th>
													<th>Início</th>
													<th>Fim</th>
													<th>Duração</th>
													<th>Horários</th>
											</thead>
											<tbody>
												@foreach($atividades as $atividade)
													<tr>
														<td>{{$atividade->titulo}}</td>
														<td>{{$atividade->tipo}}</td>														
														<td>{{$atividade->espaco}}</td>
														<td>
															@php
															    echo ($atividade->agendado ? "Sim" : "Não");
															@endphp
														</td>
														<td>{{Carbon\Carbon::parse($atividade->data_inicio)->format('d/m/Y')}}</td>
														<td>{{Carbon\Carbon::parse($atividade->data_fim)->format('d/m/Y')}}</td>
														<td>{{Carbon\Carbon::parse($atividade->duracao)->format('H:i')}}</td>
														<td>{{$atividade->horarios}}</td>
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