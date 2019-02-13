<?php
class vistas{

private $locked = PRIVADO;//control acceso
private $metodo;
private $vista;
private $salida;
private $valor = array();
public function __construct(Request $peticion) {
    		$this->vista = $peticion->vista();
    		$this->metodo = $peticion->metodo();
  }
public function get_content($URL){
      $ch = curl_init();
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
      curl_setopt($ch, CURLOPT_URL, $URL);
      $data = curl_exec($ch);
      curl_close($ch);
      return $data;
}
/***************SET MULTIARREGLO SIMPLE**************************************/  
public function setup($salida,$eti,$arreglo=''){
	if ($arreglo!='') {
		

	$salida = trim(file_get_contents($salida.EXT));

            foreach ($arreglo as $arg) {

        
                foreach ($arg as $key => $value) {
                     
               $salida = str_replace("</$key/>",$value, $salida);
                }
      

            }
            $this->valor[$eti] = $salida;

	}else{

		$salida = trim(file_get_contents($salida.EXT));
		$this->valor[$eti] = $salida;

	}
}
/***************ARREGLOS SIMPLES**************************************/
public function simple($plantilla,$eti,$arreglo=''){

 $unidos = "";
         
          foreach($arreglo as $key => $value){
                $row = trim(file_get_contents($plantilla.EXT));
               
               $row = str_replace("</key/>",$value, $row);

                $unidos .= $row;

                $this->valor[$eti] = $unidos;
        
            }


}
/***************SET SIMPLE**************************************/
public function set($key, $value) { $this->valor[$key] = $value; }
/***************SET MULTIARREGLO Y UNION**************************************/        
public function mset($arreglo){ foreach ($arreglo as $arg) { foreach ($arg as $key => $value) { $this->valor[$key] = $value; } } }
/***************UNIR TODO Y SALIDA**************************************/
public function output() {
           
            $output = $this->salida;
            


           foreach ($this->valor as $key => $value) { 
           
              
               $this->salida = str_replace("</$key/>",$value, $this->salida);
            }
                   
             return $this->salida;
        }

/***************FOREACH**************************************/
        public function each($plantilla,$eti,$datos=''){
          $unidos = "";
        	if ($datos!='') {
        	
        	foreach($datos as $data){
                $row = trim(file_get_contents($plantilla.EXT));
                
                foreach ($data as $key => $value) {

               $row = str_replace("</$key/>",$value, $row);


                }
                $unidos .= $row;

                $this->valor[$eti] = $unidos;
        
            }

        	}else{

        		foreach ($plantillas as $plantilla) { 
        			$row = trim(file_get_contents($plantilla.EXT));

               $unidos .= $row;
               $this->valor[$eti] = $unidos;
            }

        	}
        }

/***************RENDERIZAR**************************************/  
public function ver(){

	if(in_array($this->vista,$this->locked)){

	if(!isset($_SESSION['user'])){ header("location:/"); }

	$this->salida = trim(file_get_contents("maqueta/head".EXT));

	}elseif(!in_array($this->vista,$this->locked)){
            
 $this->salida = trim(file_get_contents("maqueta/cabeza".EXT));
            
	}elseif(!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){}

/******/

	if(file_exists('vistas/'.$this->vista.'/'.$this->metodo.''.EXT)){

	 if(!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){
			$this->salida .= trim(file_get_contents('vistas/'.$this->vista.'/'.$this->metodo.''.EXT));
		}else{
			$this->salida = trim(file_get_contents('vistas/'.$this->vista.'/'.$this->metodo.''.EXT));
		}

		}else{

	 if(file_exists('vistas/'.$this->vista.'/index'.EXT)){
		if(!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){
			$this->salida .= trim(file_get_contents('vistas/'.$this->vista.'/index'.EXT));
		}else{
			$this->salida = trim(file_get_contents('vistas/'.$this->vista.'/index'.EXT));
		}

	 }else{
	 	if(PAGINA_ERROR==true){

		$this->salida .= trim(file_get_contents('vistas/error/index'.EXT));

 	}else{
 		header("location:/");
 	}
 	
 	
 }
}

/******/

if(in_array($this->vista,$this->locked)){
	$this->salida .=trim(file_get_contents('maqueta/foot'.EXT));

}elseif(!isset($_SERVER['HTTP_X_REQUESTED_WITH'])){ 
	$this->salida .=trim(file_get_contents('maqueta/pie'.EXT));
}
/*************************************************************/
$this->set('TEMA',TEMA);
$this->set('csscontrol','/css/'.TEMA.'/'.$this->vista.'/index.css');
$this->set('titulo',$this->vista);
$this->set('DOMJS','<script type="text/javascript" language="javascript" src="dom/'.$this->vista.'/index.js"></script>');
$out=preg_replace('~</(\w+)/>~','',$this->output());


echo trim($out);

/********************************/


}

}

?>
