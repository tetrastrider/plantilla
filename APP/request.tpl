<?php
class Request

 {

 private $_controlador;
 private $_metodo;
 private $_argumentos;
 public function __construct()

  {
  if (isset($_GET['url']))
   {
   $url = filter_input(INPUT_GET, 'url', FILTER_SANITIZE_URL);
   $url = explode('/', $url);
   $url = array_filter($url);
   $this->_controlador = strtolower(array_shift($url));
   $this->_metodo = strtolower(array_shift($url));
   $this->_argumentos = $url;

   }
  if (!$this->_controlador)
   {
   $this->_controlador = HOME;
   }
  if (!$this->_metodo)
   {
   $this->_metodo = METODOHOME;
   }
  if (!isset($this->_argumentos))
   {
   $this->_argumentos = array();
   }
  }
 public function vista()

  {
  return $this->_controlador;
  }
 public function metodo()

  {
  return $this->_metodo;
  }
 public function args()

  {
  return $this->_argumentos;
  }
 }
 
?>