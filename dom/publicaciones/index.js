function jt(path,confirmMessage) {
        var answer = confirm(confirmMessage);
        if (answer == 1)    {
            location.href = path;
        }
      }
/******/
$(document).ready(function(){
	/**/
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
      /**/
  });