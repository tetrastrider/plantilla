<?php

class logm extends Modelo
{
    public function __construct() {
        parent::__construct();
    }

    public function login($usuario,$password){

    	$query=$this->conexion->query("SELECT * FROM usuarios WHERE usuario ='$usuario' AND password = '$password' AND activo='activo'")or die('fallo log');
        if($datau=$query->fetch()){
        foreach($datau as $i){
            if($i>0){
                
                $_SESSION['user']=$datau['usuario'];
                $_SESSION['id']=$datau['id_usuario'];
                $_SESSION['role']=$datau['role'];
                $_SESSION['correo']=$datau['correo'];
                $_SESSION['nombre']=$datau['nombre'];
                
                header('location:/administrador');
    
            }else{header('location:/log');}
             }//endfoeach


            }//else{ header('location:/log'); }//
            
    }

}

?>
