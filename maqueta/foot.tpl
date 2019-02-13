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
