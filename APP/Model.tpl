<?php

class Modelo
{
    protected $conexion;
    
    public function __construct() {
        $this->conexion = new basededatos();
    }

    public function cos($query)
  {
  $query = $this->conexion->query($query);
  return $query;
  }
}

?>
