<?php
class inicioc extends controlador
{

public function __construct(){
	
	parent::__construct();
}

public function index(){

$god =array(array('baner'=>'bootstrapping.png','titulo'=>'Cougar'),
			array('baner2'=>'Google-Plus ban.jpg','titulo2'=>'Lions'),
			array('baner3'=>'modulo.png','titulo3'=>'Snowalker'),
			array('baner4'=>'RestLiClientServerFlow.png','titulo4'=>'Howling'),
			array('baner5'=>'ternario.jpg','titulo5'=>'Sunbathing'));
$this->vista->setup("vistas/inicio/slider",'slider',$god);
/******************/
$g2 =array(array('baner'=>'css3-attr-selector-cover.jpg','titulo'=>'Cougar'),
			array('baner2'=>'css-beforeafter-0.jpg','titulo2'=>'Lions'),
			array('baner3'=>'default.jpg','titulo3'=>'Snowalker'),
			array('baner4'=>'nodejs.png','titulo4'=>'Howling'),
			array('baner5'=>'nth-child-t2.jpg','titulo5'=>'Sunbathing'));
$this->vista->setup("vistas/inicio/s2",'s2',$g2);
/******************/
$g3 =array(array('baner'=>'noticia.jpg','titulo'=>'Cougar'),
			array('baner2'=>'ps4white.jpg','titulo2'=>'Lions'),
			array('baner3'=>'default.jpg','titulo3'=>'Snowalker'),
			array('baner4'=>'nodejs.png','titulo4'=>'Howling'),
			array('baner5'=>'nth-child-t2.jpg','titulo5'=>'Sunbathing'));
$this->vista->setup("vistas/inicio/s3",'s3',$g3);
/******************/
$g4 =array(array('baner'=>'css3-attr-selector-cover.jpg','titulo'=>'Cougar'),
			array('baner2'=>'css-beforeafter-0.jpg','titulo2'=>'Lions'),
			array('baner3'=>'default.jpg','titulo3'=>'Snowalker'),
			array('baner4'=>'nodejs.png','titulo4'=>'Howling'),
			array('baner5'=>'nth-child-t2.jpg','titulo5'=>'Sunbathing'));
$this->vista->setup("vistas/inicio/s4",'s4',$g4);
$this->vista->ver();
 }


} 

?>

