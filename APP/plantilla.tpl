<?php 
      class plantilla {
       
        protected $file;
        protected $values = array();
        public function __construct($file) {
            $this->file = $file.EXT;
        }
        
        
        public function set($key, $value) {


            $this->values[$key] = $value;
        }
        
        public function mset($arreglo){

            foreach ($arreglo as $arg) {

        
                foreach ($arg as $key => $value) {
                     $this->values[$key] = $value;
                }
      

            }

        }
      
        public function output() {
           
            if (!file_exists($this->file)) {
                return "Error cargando plantilla ($this->file).<br />";
            }
            

            $output = file_get_contents($this->file);
            


           foreach ($this->values as $key => $value) { 
           
               $tagToReplace = "[@$key]";
                $output = str_replace($tagToReplace,$value, $output);
            }
                   
             return $output;
        }


        static public function unir($plantillas) {
           
            $output = "";
            $plantillas = $plantillas.EXT;
            
            foreach ($plantillas as $plantilla) { 

               $output .= $plantilla->output();
            }
            
            return $output;
        }

        static public function each($plantilla,$datos=''){

         if (isset($datos)&&!empty($datos)){
               
            
                 foreach($datos as $data){
                $row = new plantilla($plantilla);
                
                foreach ($data as $key => $value) {
                    $row->set($key, $value);
                }
                $noti[] = $row;
                                    }

                $output = "";

                foreach ($noti as $plantilla) { 

                       $output .= $plantilla->output();
                    }

         }else{

                $output = "";
                $plantillas = $plantillas.EXT;
                
                foreach ($plantillas as $plantilla) { 

                   $output .= $plantilla->output();
                }

         }  
  
                return $output;
        }
              
}

     ?>
    