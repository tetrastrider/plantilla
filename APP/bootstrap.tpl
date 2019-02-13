<?php
class Bootstrap
{
    public static function run(Request $peticion)
    {
        $controller = $peticion->vista().'c';
        $metodo = $peticion->metodo();
        $args = $peticion->args();
        $rutaControlador = CONTROL.$controller.DS.'index'.EXT;
        if(is_readable($rutaControlador)){
            require_once $rutaControlador;
            $controller = new $controller;
            
            if(is_callable(array($controller, $metodo))){
                $metodo = $peticion->metodo();
            }
            else{
                $metodo = 'index';
            }
            
            if(isset($args)){
                call_user_func_array(array($controller, $metodo), $args);
            }
            else{
                call_user_func(array($controller, $metodo));
            }
            
        } else {
           if(ERROR==true){
            header('location:'.PRROR);
        }else{ header('location:/');
    }
        }
    }
}
