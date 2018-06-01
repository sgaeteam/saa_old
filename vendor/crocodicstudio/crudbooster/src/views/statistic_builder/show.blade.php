@extends('crudbooster::admin_template')
@section('content') 
<!doctype html>
<html lang="en">
<head>
    <!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script> -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.2.7/fullcalendar.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/2.2.7/fullcalendar.min.css"/>
    <style>
        /* ... */
    </style>
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