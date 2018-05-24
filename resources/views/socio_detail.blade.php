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
		<li class=""><a role="tab" data-toggle="tab" href="#tab-pagamentos" data-target="#tab-pagamentos"><i class="fa fa-money"></i> Pagamentos</a></li>
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
				<!-- timeline time label -->
				<li class="time-label">
					<span class="bg-red">
						10 Feb. 2014
					</span>
				</li>
				<!-- /.timeline-label -->
				<!-- timeline item -->
				<li>
				<i class="fa fa-envelope bg-blue"></i>

				<div class="timeline-item">
					<span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

					<h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>

					<div class="timeline-body">
					Etsy doostang zoodles disqus groupon greplin oooj voxy zoodles,
					weebly ning heekya handango imeem plugg dopplr jibjab, movity
					jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle
					quora plaxo ideeli hulu weebly balihoo...
					</div>
					<div class="timeline-footer">
					<a class="btn btn-primary btn-xs">Read more</a>
					<a class="btn btn-danger btn-xs">Delete</a>
					</div>
				</div>
				</li>
				<!-- END timeline item -->
				<!-- timeline item -->
				<li>
				<i class="fa fa-user bg-aqua"></i>

				<div class="timeline-item">
					<span class="time"><i class="fa fa-clock-o"></i> 5 mins ago</span>

					<h3 class="timeline-header no-border"><a href="#">Sarah Young</a> accepted your friend request
					</h3>
				</div>
				</li>
				<!-- END timeline item -->
				<!-- timeline item -->
				<li>
				<i class="fa fa-comments bg-yellow"></i>

				<div class="timeline-item">
					<span class="time"><i class="fa fa-clock-o"></i> 27 mins ago</span>

					<h3 class="timeline-header"><a href="#">Jay White</a> commented on your post</h3>

					<div class="timeline-body">
					Take me to your leader!
					Switzerland is small and neutral!
					We are more like Germany, ambitious and misunderstood!
					</div>
					<div class="timeline-footer">
					<a class="btn btn-warning btn-flat btn-xs">View comment</a>
					</div>
				</div>
				</li>
				<!-- END timeline item -->
				<!-- timeline time label -->
				<li class="time-label">
					<span class="bg-green">
						3 Jan. 2014
					</span>
				</li>
				<!-- /.timeline-label -->
				<!-- timeline item -->
				<li>
				<i class="fa fa-camera bg-purple"></i>

				<div class="timeline-item">
					<span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>

					<h3 class="timeline-header"><a href="#">Mina Lee</a> uploaded new photos</h3>

					<div class="timeline-body">
					<img src="http://placehold.it/150x100" alt="..." class="margin">
					<img src="http://placehold.it/150x100" alt="..." class="margin">
					<img src="http://placehold.it/150x100" alt="..." class="margin">
					<img src="http://placehold.it/150x100" alt="..." class="margin">
					</div>
				</div>
				</li>
				<!-- END timeline item -->
				<li>
				<i class="fa fa-clock-o bg-gray"></i>
				</li>
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
											font-weight: bold;
											width: 25%;
										}
									</style>
									<div class='table-responsive'>
										<table id='table-detail' class="table table-striped table-bordered">
											<thead>
													<th>Nome</th>
													<th>Grau de parentesco</th>
													<th>Sexo</th>
													<th>Data de Nascimento</th>
											</thead>
											<tbody>
												@foreach($dependentes as $dependente)
													<tr>
														<td>{{$dependente->nome}}</td>
														<td>{{$dependente->grau}}</td>
														<td>{{$dependente->sexo}}</td>
														<td>
															{{Carbon\Carbon::parse($dependente->data_nascimento)->format('d/m/Y')}} 
															@php
															   echo("(".Carbon\Carbon::parse($dependente->data_nascimento)->diff(Carbon\Carbon::now())->format('%y anos, %m meses e %d dias').")");
															@endphp
														</td>
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