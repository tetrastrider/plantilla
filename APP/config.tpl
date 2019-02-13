<?php
//***    Universal prevent xss  ***
//   place this in top of script to prevent xss on your site
$_GET=array_map("strip_tags",$_GET);
$_POST=array_map("strip_tags",$_POST);
/*************control**********************************/
define('ERROR',false);//if true pagina de error if false redireccionar
define('PRROR','error');//pagina de error
define('METODOHOME','index');//metodo por defecto
define('DEV',true);//desarrollo php
define('DEVJS',false);//desarrollo js
define('HOME','noticias');//pagina de inicio
define('TEMA','default');//desarrollo
const PRIVADO = array('administrador','publicaciones','registro','portada','editar');//control acceso
/***************BASE DE DATOS***************************************/
define('DRIVER','mysql');
define('BD_SERVIDOR','127.0.0.1');
define('BD_NOMBRE','standart');
define('BD_USUARIO','root');
define('BD_PASSWORD','');
/**************CORREO*********************************/
define('CORREOLOCAL','alexanderbrache@gmail.com');//correo
define('SUBJECT','correo de overclocktech');//asunto
/***********DEFAULT ESTILOS**********************************/
define('ADMINESTILO','admin.css');
define('NORMALESTILO','estilos.css');
define('EXT','.tpl');//extencion
/**********************************************************/
define('MODELO',RAIZ.'modelo'.DS);//ruta carpeta modelo
define('VISTAS',RAIZ.'vistas'.DS);//ruta carpeta vistas
define('CONTROL',RAIZ.'control'.DS);//ruta carpeta controles
define('MAQUETAS',RAIZ.'maqueta'.DS);//ruta carpeta maqueta
define('DOM',true);//cargar js desde carpeta dom segun control y metodo
define('DOMDIR','dom');//directorio dom con js
define('CZ','cabeza');//cabezera
define('PE','pie');//pie
define('CZA','acabeza');//cabezera admin
define('PEA','apie');//pie admin
?>
