<body><div class="todo">
    <header>
<nav>
  <a href="inicio"><div class="col">Sitio Web</div></a>
  <a href="/Administrador"><div class="col"  id="activo">Publicar</div></a>
  <a href="/publicaciones"><div class="col">Publicaciones</div></a>
  <a href="/registro"><div class="col">Control</div></a>
  <a href="/administrador/salir"><div class="col">Salir</div></a>
  <div class="buscar">

<form name="buscador" action="noticias"><input type="text" name="b" placeholder="Buscar:"/><button type="submit" class="buscardor"title="buscar"/></button></form>
</div>
</nav>
    </header>

<div class="cuerpo">
<div class="limite">

</div>
<div class="servicios">
<div class='noticias'>
<div id="noticia">
<!--noticia-->
 <span class="status html">Vista HTML</span>
 <div class='envase'>
<form action="/administrador/publicar" method="post" class="public" enctype="multipart/form-data">
<div class='envase cien'>
     <input type="text" name="titulo" placeholder="Titulo:"/>

     <label class="c custom-select">
     <select name="categoria"><option selected>Selecione una Categoria</option>
</categorias/>
</select></label>

    <input type="hidden" name="user" value="</user/>"/>

     <span class="fileUpload"><span>Portada</span><input type="file" name="foto" class="upload"/></span>
</div>
 <link type="text/css" rel="stylesheet" href="js/jQuery-TE/jquery-te-1.4.0.css">
 <script type="text/javascript" src="js/jQuery-TE/jquery-te-1.4.0.min.js" charset="utf-8"></script>   


    <textarea name="contenido" id="contenido" class="jqte-test"></textarea>
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

   <hr><center><input type="submit" class="btn btn-naranja" value="Publicar"></center><hr>

 </form>
 </div>
<br>
<!--noticia-->
</div>
<aside>
  <!---adminbaner---->
  <div class='envase admin'>
   <center><h3></user/></h3></center>
  </div>
  <!---adminbaner---->
  <!--categoria-->

<div class="cat">
  <h6>Crear pagina</h6>
<form action='/administrador/cpagina'method="post">
<input type='text' name='npagina'placeholder="Titulo:"/>
<noscript>
<label class="custom-select">
<select name="dispo">
<option value="index" selected>Plantilla</option>
</paginas/>
</select></label>
</noscript>

<div id="dd" class="wrapper-dropdown-3" tabindex="1">
    <span> Plantillas</span>
      <ul class="dropdown">
      </paginasdd/>
      </ul>
        <input type='hidden' name='dispo' id='result' value=''/>
</div>


<noscript>
<label class="custom-select">
     <select name="script">
      <option value='' selected>Javascript</option>
      </njst/>
</select></label>
</noscript>


<div id="d2" class="wrapper-dropdown-3" tabindex="2">
    <span> Javascript</span>
      <ul class="dropdown">
      </jst/>
       
      </ul>
        <input type='hidden' name='script' id='result2' value=''/>
</div>


 <input type="submit" value="Publicar"/>
</form>
 <hr><!------------>
 <h6>Crear categoria</h6>
 <form action='/administrador/creacat' method="post">
  <input type='text' name='cnombre'placeholder="Nombre:"/>
  <input type="submit" value="Crear"/>
</form>
 <hr><!------------>
 
</div>
<!--chatbox-->

<!---pxu---->
  <div class='envase mod'>
   <center><p><i class="fa fa-flag" aria-hidden="true"></i>&nbsp; Mis publicaciones  </pxu]</p></center>
  </div>
  <!---pxu---->

  <!---tpub---->
  <div class='envase mod'>
   <center><p><i class="fa fa-flag-o" aria-hidden="true"></i>&nbsp; Total publicaciones  </tpub/></p></center>
  </div>
  <!---tpub---->
  
  <!---tv---->
  <div class='envase mod'>
   <center><p><i class="fa fa-eye-slash" aria-hidden="true"></i>&nbsp; Mis visitas  </mvisitas/></p></center>
  </div>
  <!---tv---->

  <!---tv---->
  <div class='envase mod'>
   <center><p><i class="fa fa-eye" aria-hidden="true"></i>&nbsp; Total visitas  </tvisitas/></p></center>
  </div>
  <!---tv---->

  <!---mcom---->
  <div class='envase mod'>
   <center><p><i class="fa fa-comment-o" aria-hidden="true"></i>&nbsp; Mis comentarios  </mcoment/></p></center>
  </div>
  <!---mcom---->

  <!---tcom---->
  <div class='envase mod'>
   <center><p><i class="fa fa-comments-o" aria-hidden="true"></i>&nbsp; Total comentarios  </tcoment/></p></center>
  </div>
  <!---tcom---->


</aside>
</div>
</div>



