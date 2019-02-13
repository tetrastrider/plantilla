<?php

abstract class controlador  extends vistas
{
    protected $vista;
    protected $pedir;
    protected $control;
    protected $modelo;
    public function __construct() {
        $this->vista = new vistas(new Request);
        $this->pedir = new Request();
        $this->modelo=$this->modelo($this->pedir->vista());
    }

    abstract public function index();

    protected function modelo($modelo)
    {
        $modelo = $modelo.'m';
        $rutaModelo = MODELO.$modelo.DS.'index'.EXT;
        
        if(is_readable($rutaModelo)){
            require_once $rutaModelo;
            $modelo = new $modelo;
            return $modelo;
        }
        else {
            throw new Exception('<h1>no se encontro el modelo '.$rutaModelo.'<h1>');
        }
    }
  
}

?>
