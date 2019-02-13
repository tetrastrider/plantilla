<?php
class vistas extends plantilla{

private $locked = array('administrador','publicaciones','registro','portada','editar');//control acceso
private $metodo;
private $vista;
private $salida;
private $argumentos;
private $plantillas;
protected $contenido;
public function __construct(Request $peticion) {
    		$this->vista = $peticion->vista();
    		$this->metodo = $peticion->metodo();
    // $this->pone('csscontrol',$this->_controlador);
  }


public function ver(){

	if(in_array($this->vista,$this->locked)){

	if(!isset($_SESSION['user'])){ header("location:/"); }

	$this->salida = new plantilla('maqueta/head');
	$this->salida->set('titulo',$this->vista);
	}elseif(!in_array($this->vista,$this->locked)){

	
	$this->salida = new plantilla("maqueta/cabeza");
	$this->salida->set('titulo',$this->vista);
	
	
	}elseif(!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){

	}
/******/echo $this->salida->output();


print('<script type="text/javascript" language="javascript" src="dom/'.$this->vista.'/index.js"></script></head>');
/******/

	if(file_exists('vistas/'.$this->vista.'/'.$this->metodo.''.EXT)){


	$this->contenido = new plantilla('vistas/'.$this->vista.'/'.$this->metodo.'');/***/

		}else{
	 if(file_exists('vistas/'.$this->vista.'/index'.EXT)){

	$this->contenido = new plantilla('vistas/'.$this->vista.'/index');
	
	 }else{
	 	if(PAGINA_ERROR==true){

$this->contenido = new plantilla('vistas/error/index');


 	}else{
 		header("location:/");
 	}
 	
 	
 }
}
echo $this->contenido->output();
/******/

if(in_array($this->vista,$this->locked)){

$pie = new plantilla('maqueta/foot');
echo $pie->output();

}elseif(!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){ 

$pie = new plantilla('maqueta/pie');
echo $pie->output();

}



}

}

?>
