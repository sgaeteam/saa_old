<?php echo e((is_string($value) === true ? $value :'R$ '.number_format($value,2,",","."))); ?>