<?php
class administradorc  extends controlador
{

public function __construct(){
	parent::__construct();
	
}

public function index(){


       	$this->vista->set('tpub',$this->modelo->tpub());
        $this->vista->set('pxu',$this->modelo->pxu($_SESSION['user']));
        $this->vista->set('tvisitas',$this->modelo->tvisitas());
        $this->vista->set('tcoment',$this->modelo->tcoment());
        $this->vista->set('mcoment',$this->modelo->mcoment($_SESSION['user']));
        $this->vista->set('mvisitas',$this->modelo->mvisitas($_SESSION['user']));
        $this->vista->each('vistas/administrador/categoria','categorias',$this->modelo->categoria());
        $this->vista->simple('vistas/administrador/nscript','njst',$this->jsfiles());
 		$this->vista->simple('vistas/administrador/script','jst',$this->jsfiles());
       $this->vista->simple('vistas/administrador/paginasdd','paginasdd',$this->vistastpl());
       $this->vista->simple('vistas/administrador/paginas','paginas',$this->vistastpl());

$this->vista->set('user',$_SESSION['user']);
$this->vista->ver();
 }

 public function cpagina()
    {
        $npagina= filter_var(trim($_POST['npagina']),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH);

        if(!empty($_POST['dispo'])){

        $dispo=filter_var(trim($_POST['dispo']),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH);

    }else{ $dispo='index'; }

        if(!empty($_POST['script'])){

        $script=filter_var(trim($_POST['script']),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH);

		}else{ $script='index'; }
        /****************************************/
        if (!file_exists('vistas/'.$npagina)) {
        mkdir('vistas/'.$npagina,0777,true);
        }
        if(!is_readable("vistas/".$npagina."/index".EXT)){
        $pag = fopen("vistas/".$npagina."/index".EXT, "w") or die("no se pudo abrir el archibo!");
        $txt = file_get_contents('plantillas/vistas/'.$dispo.EXT);
        fwrite($pag,$txt);
        fclose($pag);
      }

      /********************************/
     if(!is_readable("control/".$npagina."c/index".EXT)){
      mkdir("control/".$npagina."c", 0700);
        $fichero=(string)"control/".$npagina."c/index".EXT;
        /**********************************/
        $control = '<?php 
         class '.$npagina.'c extends controlador{
         
	          public function __construct() { 
	             parent::__construct();
	              } 
              public function index(){ 
                
                 $this->vista->ver();';
        $control.=' }
                 }
                 ?>';

        file_put_contents($fichero,$control, FILE_APPEND | LOCK_EX);
    }
    /*****************************/
       if(!is_readable("modelo/".$npagina."m/index".EXT)){
        mkdir("modelo/".$npagina."m", 0700);
        $fi="modelo/".$npagina."m/index".EXT;
        $contr = "<?php \n class ".$npagina."m extends Modelo \n { \n public function __construct() { \n parent::__construct(); \n } \n } \n ?>";


        file_put_contents($fi,$contr, FILE_APPEND | LOCK_EX);
    }
    /*******************************************************/
    if(!is_readable("dom/".$npagina."/index.js")){
      mkdir('dom/'.$npagina,0777,true);
        $fij="dom/".$npagina."/index.js";
        $contrj = file_get_contents('plantillas/js/'.$script.'.js');

        file_put_contents($fij,$contrj, FILE_APPEND | LOCK_EX);
    }
  
      header('location:/'.$npagina);
    
	}

  public function creacat()
  {
    $categoria= filter_var(trim($_POST['cnombre']),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH);
    $this->modelo->icat($categoria);
    header('location:/administrador');
  }


   public function publicar()
    {

      if(isset($_POST["titulo"])&&!empty($_POST["titulo"])&&isset($_POST["categoria"])&&!empty($_POST["categoria"])){

          $titulo=filter_var(trim($_POST["titulo"]),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH);
      $categoria=filter_var(trim($_POST["categoria"]),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH);
      $user=filter_var(trim($_POST["user"]),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH);
      $contenido=filter_var(trim($_POST["contenido"]),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH);
      if(!empty($_FILES["foto"]['name']))
          {
            opendir("imagenes");
              $file_name = $_FILES['foto']['name'];
              $file_tmp = $_FILES['foto']['tmp_name'];
              copy($file_tmp,"imagenes/".$file_name);
              $foto="imagenes/".$file_name;   
              }else{ $foto =''; }

  $this->modelo->inoticia($titulo,$foto,$contenido,$user,$categoria);
    }
    header("location:/modelo");
  }

   public function jsfiles()
    {
      $DirPath="plantillas/js";
      if($dir = opendir($DirPath)){
           while(($file = readdir($dir))!== false){
                  if(!is_dir($DirPath.$file))
                  {
                      $js[]= pathinfo($file, PATHINFO_FILENAME );
                  }
           }
      }
      return $js;
    }


    public function vistastpl()
    {
    	$keys=array("paginas");
      $DirPath="plantillas/vistas";
      if($dir = opendir($DirPath)){
           while(($file = readdir($dir))!== false){
                  if(!is_dir($DirPath.$file))
                  {                  		
                  	$arr[] = pathinfo($file, PATHINFO_FILENAME );	                    
                  }

           }
         
      }
      return $arr;
    }

    public function salir(){
      if(isset($_SESSION['user'])){
          session_unset();
          header("location:/inicio");
      }else{header("location:/inicio");}
    }

} 

?>