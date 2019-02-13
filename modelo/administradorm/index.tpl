<?php

class administradorm extends Modelo
{
    public function __construct() {
        parent::__construct();
    }

    public function pxu($user){
    	$query=$this->conexion->query("SELECT COUNT(*) as cuantos FROM noticias WHERE user='$user'");
    	foreach($query as $query){
    		$query=$query['cuantos'];
    	}
    	return $query;
    }


    public function tpub(){
    	$query=$this->conexion->query("SELECT COUNT(*) as cuantos FROM noticias");
    	foreach($query as $query){
    		$query=$query['cuantos'];
    	}
    	return $query;
    }


    public function mvisitas($user){
    	$query=$this->conexion->query("SELECT SUM(visitas) as total FROM noticias WHERE user='$user'");
    	
    	foreach($query as $query){
    		$total=$query['total'];
    	}
    	return $total;
    }

    public function tvisitas(){
    	$query=$this->conexion->query("SELECT SUM(visitas) as total FROM noticias");
    	
    	foreach($query as $query){
    		$total=$query['total'];
    	}
    	return $total;
    }


    public function tcoment(){
    	$query=$this->conexion->query("SELECT SUM(comentarios) as total FROM noticias");
    	
    	foreach($query as $query){
    		$total=$query['total'];
    	}
    	return $total;
    }


    public function mcoment($user){
    	$query=$this->conexion->query("SELECT SUM(comentarios) as total FROM noticias WHERE user ='$user'");
    	
    	foreach($query as $query){
    		$total=$query['total'];
    	}
    	return $total;
    }


    public function categoria()
    {   $query=$this->conexion->query("SELECT * FROM categoria ORDER BY id ASC");
        return $query;
    }

    public function inoticia($titulo,$foto,$contenido,$user,$categoria){
        $query=$this->conexion->query("INSERT INTO noticias (titulo,foto,contenido,user,categoria) VALUES ('$titulo','$foto','$contenido','$user','$categoria')")or die('error');
        return $query;
    }


    public function icat($categoria){
        $query=$this->conexion->query("INSERT INTO categoria (categoria) VALUES ('$categoria')")or die('error');
        return $query;
    }

}

?>
