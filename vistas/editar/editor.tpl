<span class="status html">Vista HTML</span>

 <div class='envase'>
<form action="/editar/actualizar" method="post" class="public" enctype="multipart/form-data">

  <img src="[@foto]"/>
<div class='envase cien'>
  
     <input type="text" name="titulo" placeholder="Titulo:" value='[@titulo]'/>

     <label class="c custom-select">
     <select name="categoria"><option value="[@categoria]"selected>[@categoria]</option>
</categorias/>
</select></label>
    <input type="hidden" name="user" value="[@user]"/>
    <input type="hidden" name="id" value="[@id]"/>

     <span class="fileUpload"><span>Portada</span><input type="file" name="foto" class="upload"/></span>
</div>
<input type="hidden" name="ofoto" value="[@foto]"/>


 <link type="text/css" rel="stylesheet" href="js/jQuery-TE/jquery-te-1.4.0.css">
 <script type="text/javascript" src="js/jQuery-TE/jquery-te-1.4.0.min.js" charset="utf-8"></script> 
<textarea name="contenido" id="contenido" class="jqte-test">[@contenido]</textarea>
<script>
    $('.jqte-test').jqte();
    
    // settings of status
    var jqteStatus = true;
    $(".status").click(function()
    {
        jqteStatus = jqteStatus ? false : true;
        $('.jqte-test').jqte({"status" : jqteStatus})

    });

     
</script>

   <hr><center><input type="submit"value="Actualizar"></center><hr>

 </form>
 </div>
<br>