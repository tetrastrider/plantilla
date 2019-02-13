<?php
class registroc  extends controlador
{

public function __construct(){
	parent::__construct();
	
}

public function index(){

	
    $this->vista->set('espaciol',$this->espaciol());
    $this->vista->set('espaciot',$this->espaciot());
    $this->vista->set('fecha',$this->fecha());
    $this->vista->set('user',$_SESSION['user']);

$this->vista->ver();
 }

 public function verbasededatos()
    {
        
    foreach($this->modelo->verbasededatos() as $row){
                echo '<option>'.$row['Database'].'</option>';
            }
           
    }



    public function comandosql()
        {
            $comando=$_GET['sql'];
            $this->modelo->comandosql($comando);
            echo "COMANDO EJECUTADO CON EXITO.\n";
        }

    public function tablas()
    { 
      $bd=filter_var(trim($_GET["bd"]),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH);

      $total=$this->modelo->tablas($bd);
      while($result=$total->fetch()){
          
        $rest= $result[0];  
        echo "<span  title='$rest'><h6 title='$rest'>$rest</h6><a href=\"javascript:void(0);\" onclick=\"javascript:jt('registro/borrartabla?tabla=$rest','BORRAR TABLA $rest')\"><i class='fa fa-trash'></i></a></span>";
      }
    }

    public function musicaborrar()
 {
  $id=strip_tags($_GET['id']);
  $this->archibos->bam($id);
  $this->archibos->borrarmusica($id);
  header('location:/archibos');
 }

 public function pmusica()
 {
  $titulo=strip_tags($_POST['nmusica']);
  $musica=strip_tags($_POST['musica']);
  if(!empty($_FILES["musica"]['name']))
      {
        opendir("musica");
          $file_name = $_FILES['musica']['name'];
          $file_tmp = $_FILES['musica']['tmp_name'];
          copy($file_tmp,"musica/".$file_name);
          $musica="musica/".$file_name;

          $this->archibos->pmusica($titulo,$musica);   
          }else{$musica ='';}
  header('location:/archibos'); 
 }

   public function fotos()
   {

      $folder_path = 'imagenes/'; //folder con las fotos

      $folder = opendir($folder_path); 

       while (false !== ($entry = readdir($folder))) {
          if ($entry != "." && $entry != ".." && $entry != "Thumb.db") {
              
              $file_path = $folder_path.$entry;
              $ext = strtolower(pathinfo($file_path, PATHINFO_EXTENSION));
              if($ext=='jpg' || $ext =='png' || $ext == 'gif')
              {
                  echo '<figure class="fotografias"><img src="'.$file_path.'" title="'.$file_path.'" /></figure>';
              }
          }
      }

      closedir($folder );
  
   }

   public function fotos2()
   {
    // display source code
    $folder_path = 'imagenes/';

    $files = glob($folder_path . "*.{JPG,jpg,gif,png,bmp}", GLOB_BRACE);

    foreach($files as $file){
       echo '<img src="'.$file.'" class="fotografias" title="'.$file.'"/>';
    }

   }

   public function vercategorias(){

      $categorias = $this->modelo->categorias();
    
    foreach($categorias as $data){
      echo '<span title="Borrar a '.$data['categoria'].'">
        <h6 title="'.$data['categoria'].'">'.$data['categoria'].' </h6>
        <a href=\'javascript:void(0);\' onclick=\'javascript:jt("registro/catborrar?id='.$data['id'].'","Borrar categoria '.$data['categoria'].'")\'><i class="fa fa-trash"></i></a></span>';

   }
 }


 public function catborrar()
  {
    $id= strip_tags($_GET['id']);
    $this->modelo->borracat($id);
    header('location:/registro');
  }


  public function estado(){
    $id=filter_var(trim((int)$_GET['i']),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH);
    $this->modelo->estado($id);
   header('location:/registro');

      
  }

  public function espaciol(){
        $bytes = disk_free_space("."); 
    $si_prefix = array( 'B', 'KB', 'MB', 'GB', 'TB', 'EB', 'ZB', 'YB' );
    $base = 1024;
    $class = min((int)log($bytes , $base) , count($si_prefix) - 1);
    return sprintf('%1.2f' , $bytes / pow($base,$class)) . ' ' . $si_prefix[$class];
    }

    public function espaciot(){
        $bytes = disk_total_space("/"); 
    $si_prefix = array( 'B', 'KB', 'MB', 'GB', 'TB', 'EB', 'ZB', 'YB' );
    $base = 1024;
    $class = min((int)log($bytes , $base) , count($si_prefix) - 1);
    return sprintf('%1.2f' , $bytes / pow($base,$class)) . ' ' . $si_prefix[$class];
    }

    public function fecha()
    {
     date_default_timezone_set('America/La_Paz');

    $dias = array("Domingo","Lunes","Martes","Miercoles","Jueves","Viernes","Sábado");
    $meses = array("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");

    return $dias[date('w')]." ".date('d')." de ".$meses[date('n')-1]. " del ".date('Y') ;
    }

     public function serverup(){
        $stats = shell_exec('net statistics workstation');
 
   $beginPos = strpos($stats, 'Statistics since ') + 17;
 
   $endPos = strpos($stats, 'Bytes');
 
   $stats = substr($stats, $beginPos, $endPos - $beginPos);
 
   $timestamp = time() - strtotime($stats);
 
   $seconds = ($timestamp % 60);
 
   $minutes = round(($timestamp % 3600) / 60);
 
   $hours = round(($timestamp % 86400) / 3600);
 
   $days = round(($timestamp % 2629743.83) / 86400);
 
   $months = round(($timestamp % 31556926) / 2629743.83);
 
   echo $months.' M '. $days.' D '.$hours.' H '. $minutes.' M '. $seconds.' S';
 
    }

    public function carga()
    {
        if (stristr(PHP_OS, 'win')) {
        
            $wmi = new COM("Winmgmts://");
            $server = $wmi->execquery("SELECT LoadPercentage FROM Win32_Processor");
            
            $cpu_num = 0;
            $load_total = 0;
            
            foreach($server as $cpu){
                $cpu_num++;
                $load_total += $cpu->loadpercentage;
            }
            
            $load = round($load_total/$cpu_num);
            
        } else {
        
            $sys_load = sys_getloadavg();
            $load = $sys_load[0];
        
        }
        
        $carga= (int) $load;
         echo $carga;
    }

    public function vistasc()
    {
      $DirPath="vistas";
      if($dir = opendir($DirPath)){
           while(($file = readdir($dir))!== false){
                  if(!is_dir($DirPath.$file))
                  {
                      
                    $vistas[]= $file;
                  }
           }
      }


		foreach ($vistas as $key => $value){

   echo "<span title='$value'><h6 title='$value'>$value</h6><a href=\"javascript:void(0);\" onclick=\"javascript:jt('registro/paginaborrar?pagd=$value','Borrar pagina $value')\"><i class='fa fa-trash'></i></a></span>";
  
	}



    }

    public function paginaborrar(){
      $pagina= $_GET['pagd'];
      $control = 'control/'.$pagina.'c';
      $modelo = 'modelo/'.$pagina.'m';
      $dom = 'dom/'.$pagina;
      $vista = 'vistas/'.$pagina;
      if (is_dir($control) ){

        unlink($control.'/index.tpl');
        rmdir($control);
      }

      if (is_dir($modelo) ){

        unlink($modelo.'/index.tpl');
        rmdir($modelo);
      }

      if (is_dir($dom)){
          unlink($dom.'/index.js');
          rmdir($dom);
          }

      
      if($dir = opendir($vista)){
           while(($file = readdir($dir))!== false){
                  if(!is_dir($vista.$file))
                  {
                      
                    unlink($vista.DS.$file);
                  }
           }
         }

          rmdir($vista);
          header('location:/registro');

    }

    public function usuarios(){
    	$usuariost=$this->modelo->usuarios();





	foreach($usuariost as $data){

echo('<div class="envase floatl"><p><small><i class="fa fa-calendar"></i>&nbsp;'.$data["registrado"].'</small></p><p><small><i class="fa fa-user"></i>&nbsp;'.$data["usuario"].'</small></p><p><small><i class="fa fa-envelope-o"></i>&nbsp;'.$data["correo"].'</small></p><p><small><i class="fa fa-users"></i>&nbsp;'.$data["role"].'</small></p><p><small><i class="fa fa-power-off"></i>&nbsp;'.$data["activo"].'</small></p><a href="/registro/estado?i='.$data['id_usuario'].'" title="Estado"class="boton">Estado</a><a href="javascript:void(0);" title="Borrar"class="boton" onclick="javascript:jt(\'/publicaciones/eliminar?i='.$data['id_usuario'].'\',\'Borrar usuario '.$data['usuario'].'\')">Borrar</a>
</div>');

	}





    }


} 

?>


