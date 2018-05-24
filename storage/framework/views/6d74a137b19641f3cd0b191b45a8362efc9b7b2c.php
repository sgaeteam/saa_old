<script>
	$(function() {
		$('.inputMoney').priceFormat({
			prefix: '',
			thousandsSeparator: '<?php echo $form['dec_point']?: ''; ?>',
			centsLimit: <?php echo $form['decimals']?: 2; ?>,
			clearOnEmpty:true,
		});
	});
</script>
