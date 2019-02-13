<?php
class serviciosc  extends controlador
{

 protected $vista;
 protected $pedir;
 protected $control;

public function __construct(){
	parent::__construct();
	
}

public function index(){

$this->vista->ver();
 }


} 

?>