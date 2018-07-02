@extends('crudbooster::admin_template')
@section('content') 
<!doctype html>
<html>
<head>
    <script src="{{ asset ('vendor/crudbooster/assets/adminlte/plugins/fullcalendar/fullcalendar.min.js') }}"></script>
    <link rel="stylesheet" href="{{ asset ('vendor/crudbooster/assets/adminlte/plugins/fullcalendar/fullcalendar.min.css') }}">
    <script src="{{ asset ('vendor/crudbooster/assets/adminlte/plugins/fullcalendar/locale/pt-br.js') }}"></script>
</head>
<body>
    <div class="container-fluid">
    	<div class="row">
    	    @include('crudbooster::statistic_builder.index')
    	</div>
    	<div class="row">
    		<div class="col-md-12">
    		     {!! $calendar->calendar() !!}
                 {!! $calendar->script() !!} 
    		</div>
    		<div class="col-md-4">
    		</div>
    	</div>
    </div>
</body>
</html>
@endsection