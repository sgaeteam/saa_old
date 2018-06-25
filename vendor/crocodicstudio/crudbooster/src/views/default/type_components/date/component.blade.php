<div class='form-group form-datepicker {{$header_group_class}} {{ ($errors->first($name))?"has-error":"" }}' id='form-group-{{$name}}' style="{{@$form['style']}}">
							<label class='control-label col-sm-2'>{{$form['label']}} {!!($required)?"<span class='text-danger' title='Este campo é obrigatório'>*</span>":"" !!}</label>

							<div class="{{$col_width?:'col-sm-10'}}">
							<div class="input-group">  								
								<span class="input-group-addon open-datetimepicker"><a><i class='fa fa-calendar '></i></a></span>
								<input type='text' title="{{$form['label']}}" {{$required}} {{$readonly}} {!!$placeholder!!} {{$disabled}} class='form-control notfocus input_date' name="{{$name}}" id="{{$name}}" $readonly value='{{ strtotime($value) === false ? $value : date("d/m/Y",strtotime($value))}}'/>						
							</div>
							<div class="text-danger">{!! $errors->first($name)?"<i class='fa fa-info-circle'></i> ".$errors->first($name):"" !!}</div>
							<p class='help-block'>{{ @$form['help'] }}</p>
							</div>
						</div>
