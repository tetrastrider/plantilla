<?php 
class logc  extends controlador
{

public function __construct(){
	
	parent::__construct();
}

public function index(){

$this->vista->ver();
 }
public function login(){
		if(isset($_POST['usuario'])&&isset($_POST['password']))
	{
	  $usuario=strip_tags(filter_var(trim($_POST['usuario']),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH));
	  $password=strip_tags(filter_var(trim(md5($_POST['password'])),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH));

	$this->modelo->login($usuario,$password);

	}else{
		header('location:/log');
	}

}

} 

?>
