$(document).ready(function(){
   function acordeon(){
                /*************ocultar div*********************/

         $(".hidden").click(function (ex) {
            var esto = this;
            ex.preventDefault();
                $(esto).closest( "div" ).next().slideToggle('fast');

                if($(esto).find('i').hasClass('fa fa-chevron-up')){
                    $(esto).find('i').removeClass('fa fa-chevron-up');
                    $(esto).find('i').addClass('fa fa-chevron-down');
                
                }else{
                    $(esto).find('i').removeClass('fa fa-chevron-down');
                    $(esto).find('i').addClass('fa fa-chevron-up');
                }
                 return false;
                 });
         /**********div display none*****************/
         $(".serrar").click(function (en) {
              var esta = this
            en.preventDefault();
                $(esta).closest( "div" ).next().hide('fast');

                 return false;
                 });
         /*****************************/ 
      }
      acordeon();

      /****************basedatosselect**************************/
$(".verbasededatos").load('registro/verbasededatos');
/****************BASEDEDATOS**************************/
$(".basedatos").load('registro/tablas?bd=standart');
/****/
$(".vercat").load('registro/vercategorias');
/**********************************************/
$(".tpaginas").load('registro/vistasc');
/*********************************************/
$(".usuarios").load('registro/usuarios');
/*********************/
(function poll(){
    $.ajax({ url: "registro/serverup", success: function(da){
        $('.serverup').html(da);
    }, dataType: "html", complete: poll, timeout: 50000 });

})();
/************************/
 (function poll(){
    $.ajax({ url: "registro/carga", success: function(data){
        $('.carga').html(data);
    }, dataType: "json", complete: poll, timeout: 50000 });

})();
/************************/
(function tooltip(){
        // Tooltip only Text
        $('[title]').hover(function(){
                // Hover over code
                var title = $(this).attr('title');
                $(this).data('tipText', title).removeAttr('title');
                $('<p class="toolstip"></p>')
                .text(title)
                .appendTo('body')
                .slideDown('fast');
        }, function() {
                // Hover out code
                $(this).attr('title', $(this).data('tipText'));
                $('.toolstip').remove();
        }).mousemove(function(e) {
                var mousex = e.pageX + 0; //Get X coordinates
                var mousey = e.pageY + -50; //Get Y coordinates
                $('.toolstip')
                .css({ top: mousey, left: mousex })
        });
      })();
/*********************/
/*end document ready*/
});
/***/
function jt(path,confirmMessage) {
        var answer = confirm(confirmMessage);
        if (answer == 1)    {
            location.href = path;
        }
      }