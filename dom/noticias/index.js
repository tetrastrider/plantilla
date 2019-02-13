    load_data = {'fetch':1};
   // window.setInterval(function(){
     $.post('plugin/shout.php', load_data,  function(data) {
        $('.message_box').html(data);
         
     });
    //}, 2000);// load messages every 1000 milliseconds from server.
    
  window.addEventListener("load", function() 
{ 
 
    //method to trigger when user hits enter key
    $("#shout_message").keypress(function(evt) {
        if(evt.which == 13) {
                var iusername = $('#shout_username').val();
                var imessage = $('#shout_message').val();
                post_data = {'username':iusername, 'message':imessage,'no':''};
                
                //send data to "shout.php" using jQuery $.post()
                $.post('plugin/shout.php', post_data, function(data) {
                    
                    //append data into messagebox with jQuery fade effect!
                    $(data).hide().appendTo('.message_box').fadeIn();
    
                    //reset value of message box
                    $('#shout_message').val('');
                    //sonido("sonido/codec.mp3")
                       var scrolltoh = $('.message_box')[0].scrollHeight;
                        $(".message_box").animate({ scrollTop: scrolltoh },2000);
                    
                }).fail(function(err) { 
                
                //alert HTTP server error
                alert(err.statusText); 
                });
            }
    });

    var scrolltoh = $('.message_box')[0].scrollHeight;
$(".message_box").animate({ scrollTop: scrolltoh },2000);

   });
 /********************************/
  