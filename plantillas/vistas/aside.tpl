<!--fin cabeza-return false-->
<body oncontextmenu="">
  <div class="todo">
    <header>
      <a href="inicio"><div class="imglogo"></div></a>
<nav>
  <!-- <a href="/inicio"><div class="col">Inicio</div></a> -->
   <a href="/"><div class="col"  id="activo">Noticias</div></a>
  <a href="/acerca"><div class="col">Qu&iacute;enes Somos</div></a>
  <a href="/servicios"><div class="col">Servicios</div></a>
 
  <a href="/contacto"><div class="col">Contacto</div></a>
  <div class="buscar">

<form name="buscador" action="noticias"><input type="text" name="b" placeholder="Buscar:"/><button type="submit" class="buscardor"title="buscar"/></button></form>
</div>

</nav>
    </header>

<div class="cuerpo">
<div class="limite">
[@cambio]
</div>
<div class="servicios">
<div class='noticias'>


<div id="noticia">
[@contenido]
[@noresult]
[@comentar]
[@paginacion]
</div>
<div class="categoria">
<h3>Categorias</h3>
<div class="cat">
 [@categorias]
<a href="/"><p><i class="fa fa-tags"></i> todas </p></a>
</div>
<h3>Ultimos Comentarios</h3>
<div class="combello">
[@ultimos]
</div>
<h3>Chat</h3>
<!--chatbox-->
<div class="shout_caja">
  <div class="toggle_chat">
  <div class="message_box">
    </div>
    <div class="user_info">
     
      <input type='hidden' id='shout_username' name='shout_username' value='[@user]'/>
    
   <input name="shout_message" id="shout_message" type="text" placeholder="Escribe un mensaje y Pulsa Enter" maxlength="100" />
    
    </div>
    </div>
</div>
<!--chatbox-->

</div>

</div></div>

</div>
