<script>
	$(function() {
		$('.inputMoney').priceFormat({
			prefix: '',
			thousandsSeparator: '{!! $form['dec_point']?: '' !!}',
			centsLimit: {!! $form['decimals']?: 2 !!},
			clearOnEmpty:true,
		});
	});
</script>
