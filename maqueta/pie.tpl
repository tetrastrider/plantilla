<footer>
	<ul class="social">
 
<li class="face"></li>
<li class="twi"></li>
<li class="gog"></li>
<li class="cor"></li>
</ul>

<div class='copy'>
<h3 title='OVERCLOCKTECH 2016 Dise&ntilde;o y Programac&iacute;on Todos los derechos reservados &copy; Alexander Brache inf 829-384-0994'>&nbsp;&copy; OVERCLOCKTECH&nbsp; 2016</h3>

</div>
</footer>
</div><!----------FIN TODOS---------->


<div id='IrArriba'>
<a href='#Arriba'><span/></a>
</div>
<script type="text/javascript" src="/js/jq.js"></script>
<script>
jQuery.noConflict();
jQuery(document).ready(function() {
jQuery("#IrArriba").hide();
jQuery(function () {
jQuery(window).scroll(function () {
if (jQuery(this).scrollTop() > 200) {
jQuery('#IrArriba').fadeIn();
} else {
jQuery('#IrArriba').fadeOut();
}
});
jQuery('#IrArriba a').click(function () {
jQuery('body,html').animate({
scrollTop: 0
}, 1000);
return false;
});
});

});
</script>
</body>
</html>
