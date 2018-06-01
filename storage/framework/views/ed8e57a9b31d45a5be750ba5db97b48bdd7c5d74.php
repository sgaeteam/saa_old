<?php $__env->startSection('content'); ?>
<?php echo $__env->make('crudbooster::statistic_builder.index', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>
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
    <?php echo $calendar->calendar(); ?>

    <?php echo $calendar->script(); ?> 
</body>
</html>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('crudbooster::admin_template', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>