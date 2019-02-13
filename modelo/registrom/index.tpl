<?php

class registrom extends Modelo
{
    public function __construct() {
        parent::__construct();
    }


    public function usuarios(){
	 	$query = $this->conexion->query("SELECT * FROM usuarios ORDER BY usuario ASC");
	 	return $query;
	 }


	 public function verbasededatos()
	 {
	 	$sql ="SHOW DATABASES";
		$query=$this->conexion->query($sql);
		return $query;
	 }

	 public function tablas($bd)
    {
        $query= $this->conexion->query("SHOW TABLES FROM $bd",PDO::FETCH_NUM)or die('error');
        return $query;
    }

    public function creatabla($tabla,$comando)
    {
         $sql ="CREATE table $tabla($comando);" ;
     $this->conexion->exec($sql);
     echo "TABLA $tabla SE CREO CON EXITO.\n";
    }
    public function borrartabla($tabla)
    {
        $sql ="DROP TABLE $tabla;" ;
     $this->conexion->exec($sql);
     echo "TABLA $tabla SE BORRO CON EXITO.\n";
    }

     public function comandosql($comando)
	    {
	     $this->conexion->exec($comando);
	    }

	public function categorias(){
		$query = $this->conexion->query('SELECT * FROM categoria');
		return $query;
	}

	public function borracat($id){
        $this->conexion->query("DELETE FROM categoria WHERE id=$id");
        }


    public function estado($est){
    	$estado = $this->conexion->query("SELECT * FROM usuarios WHERE id_usuario=$est");
    	if($es=$estado->fetch()){
   		$activado = $es['activo'];
   		}

   		if ($activado=='activo') {
   			$shiftactivo='inactivo';
   		}else{
   			$shiftactivo='activo';
   		}

   		$this->conexion->query("UPDATE usuarios SET activo='$shiftactivo' WHERE id_usuario=$est")->execute();
    }

}

?>
