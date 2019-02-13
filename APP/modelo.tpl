<?php

class control extends Modelo

 {
 private $contenido, $usuario, $total_pages;

  public function __construct()
  {
    parent::__construct();
  $this->contenido = array();

  $this->simpleb = array();
  
  return $this->conexion;
  }
public function noticias(){}
  public function lg(){
    if(isset($_POST['usuario'])&&isset($_POST['password']))
{
  $usuario=strip_tags(filter_var(trim($_POST['usuario']),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH));
  $password=strip_tags(filter_var(trim(md5($_POST['password'])),FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_LOW | FILTER_FLAG_STRIP_HIGH));

$this->logear($usuario,$password);

}else{
  header('location:/log');
}

  }

 function cos($query)
  {
  $query = $this->conexion->query($query);
  return $query;
  }
 public function comentario()

  {
  $query = $this->cos("SELECT id,SUBSTRING(comentario,1,250) as comentario,autor,foto,publicado,correo,categoria,id_contenido FROM comentario limit 5");
  return $query;
  }
public function comxid($id){
  $query = $this->cos("SELECT * FROM comentario WHERE id_contenido=$id");
  return $query;
}

public function icoment($comentario,$autor,$foto,$correo,$id,$categoria){
   $query = $this->cos("INSERT INTO comentario (comentario,autor,foto,correo,categoria,id_contenido) VALUES ('$comentario','$autor','$foto','$correo',$categoria,'$id')")or die('error');
    return $query;
  }

 public function categorias()

  {
  $query = $this->cos("SELECT * FROM categoria");
  return $query;
  }

  public function categoriasid($id)

  {
  $query = $this->cos("SELECT * FROM noticias WHERE id=$id");
  return $query;
  }

  public function todo()

  {
  $query = $this->cos("SELECT * FROM noticias LIMIT 5");
  return $query;
  }
/*******************************/
public function no($limit,$pages,$orden,$buscar="",$categoria="",$id="")
    {

    if($orden==2){ $ordenar="id DESC"; }else{ $ordenar="id ASC"; }
    
    $sql="SELECT id,titulo,foto,";
    if($id=="")
    {
      $sql.="SUBSTRING(contenido,1,99999) as contenido";  
    }else{
      $sql.="contenido";
    }
    
    $sql.=",user,categoria,visitas,publicado,comentarios FROM noticias ";
    if(!empty($buscar)){$sql.="WHERE titulo LIKE '%".$buscar."%'";}
    if(!empty($categoria)){$sql.="WHERE categoria='$categoria'";}
    if(!empty($id)){$sql.="WHERE id='$id'";}

    if(isset($_SESSION['user'])&&$_SESSION['role']!='administrador')
    {


    if(isset($_SESSION['user'])){ $user = $_SESSION['user']; }


    if(!empty($user)){$sql.="WHERE user='$user'";}


}

    $sql.="ORDER BY $ordenar LIMIT $pages,$limit";
    $query=$this->cos($sql);
    return $query;
    }

public function pag($limit,$buscar="",$categoria=""){

    $sql="SELECT COUNT(*) as num FROM noticias ";
    if(!empty($buscar)){$sql.="WHERE titulo LIKE '%".$buscar."%'";}
    if(!empty($categoria)){$sql.="WHERE categoria='$categoria'";}
    $sql.="ORDER BY id DESC";

    $query=$this->cos($sql);
    $total_results=$query->fetch();
    $total_pages=ceil($total_results['num'] / $limit);
    return $total_pages;
    }
/**************************/
public function inoticia($titulo,$foto,$contenido,$user,$categoria){
        $query=$this->cos("INSERT INTO noticias (titulo,foto,contenido,user,categoria) VALUES ('$titulo','$foto','$contenido','$user','$categoria')")or die('error');
        return $query;
    }

public function anoticia($titulo,$foto,$contenido,$user,$categoria,$id){
        $query=$this->cos("UPDATE noticias SET titulo='$titulo',foto='$foto',contenido='$contenido',user='$user',categoria='$categoria' WHERE id=$id")or die('error');
        return $query;
    }
public function borracontenido($id){
        $this->cos("DELETE FROM noticias WHERE id=$id");
        }
/***************************/
 public function contactame()
    {
      if($_POST)
  {
    $to_Email     = CORREOLOCAL;
    $subject        = SUBJECT;
    
    
    //check if its an ajax request, exit if not
      if(!isset($_SERVER['HTTP_X_REQUESTED_WITH']) AND strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) != 'xmlhttprequest') {
    
      //exit script outputting json data
      $output = json_encode(
      array(
        'type'=>'error', 
        'text' => 'Request must come from Ajax'
      ));
      
      die($output);
      } 
    
    //check $_POST vars are set, exit if any missing
    if(!isset($_POST["userName"]) || !isset($_POST["userEmail"]) || !isset($_POST["userPhone"]) || !isset($_POST["userMessage"]))
    {
      $output = json_encode(array('type'=>'error', 'text' => 'Input fields are empty!'));
      die($output);
    }

    //Sanitize input data using PHP filter_var().
    $user_Name        = filter_var($_POST["userName"], FILTER_SANITIZE_STRING);
    $user_Email       = filter_var($_POST["userEmail"], FILTER_SANITIZE_EMAIL);
    $user_Phone       = filter_var($_POST["userPhone"], FILTER_SANITIZE_STRING);
    $user_Message     = filter_var($_POST["userMessage"], FILTER_SANITIZE_STRING);
    
    //additional php validation
    if(strlen($user_Name)<4) // If length is less than 4 it will throw an HTTP error.
    {
      $output = json_encode(array('type'=>'error', 'text' => 'Nombre corto o vacio!'));
      die($output);
    }
    if(!filter_var($user_Email, FILTER_VALIDATE_EMAIL)) //email validation
    {
      $output = json_encode(array('type'=>'error', 'text' => 'Entre una direccion de correo valida!'));
      die($output);
    }
    if(!is_numeric($user_Phone)) //check entered data is numbers
    {
      $output = json_encode(array('type'=>'error', 'text' => 'Solo numeros en el campo de telefono'));
      die($output);
    }
    if(strlen($user_Message)<5) //check emtpy message
    {
      $output = json_encode(array('type'=>'error', 'text' => 'Mensaje corto o vacio.'));
      die($output);
    }
    
    $headers = "From: " .$user_Email. "\r\n";
    $headers .= "Reply-To: ".$user_Email. "\r\n";
    $headers .= "CC: susan@example.com\r\n";
    $headers .= 'MIME-Version: 1.0' . "\r\n";
    $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
    $message="
    Nombre:".$user_Name."<br>
    Correo:".$user_Email."<br>
    Telefono:".$user_Phone."<br>
    Mensaje:".$user_Message."";
    $sentMail =mail($to_Email,$subject,$message,$headers);
    
    if(!$sentMail)
    {
      $output = json_encode(array('type'=>'error', 'text' => 'No se pudo enviar el correo.'));
      die($output);
    }else{
      $output = json_encode(array('type'=>'message', 'text' => 'Hola '.$user_Name .' Gracias por el correo te responderemos en breve'));
      die($output);
    }
  }
    }
/***************************/
public function logear($usuario,$pass)
    {
        $query=$this->cos("SELECT * FROM usuarios WHERE usuario ='$usuario' AND password = '$pass' AND activo='activo'")or die('fallo log');
        if($datau=$query->fetch()){
        foreach($datau as $i){
            if($i>0){
                
                $_SESSION['user']=$datau['usuario'];
                $_SESSION['id']=$datau['id_usuario'];
                $_SESSION['role']=$datau['role'];
                $_SESSION['correo']=$datau['correo'];
                $_SESSION['nombre']=$datau['nombre'];
                
                header('location:/administrador');
    
            }//else{header('location:/log');}
             }//endfoeach


            }else{ header('location:/log'); }//si no hay datos devuelve falso echo 'false';
    }
/***********************/
 function verusuario()
  {
  $query = $this->cos("SELECT * FROM usuarios");
  return $query;
  }
 function usuario($id)
  {
  $query = $this->cos("SELECT * FROM usuarios WHERE id_usuario=$id");
  while ($data = $query->fetch())
   {
   $this->usuario = $data;
   }
  return $this->usuario;
  }

 function insertarUsuario($nombre, $apellido, $usuario, $password, $correo, $role, $estado)
  {
  $query = $this->cos("INSERT INTO usuarios (nombre,apellido,usuario,password,correo,role,estado) VALUES ('$nombre','$apellido','$usuario','$password','$correo','$role','$estado')") or die('error');
  return $query;
  }
 function borrarusuario($id)
  {
  $query = $this->cos("DELETE FROM usuarios WHERE id_usuario=$id");
  return $query;
  }
 
/*********************************/
 function carrusel()
  {
  $query = $this->cos("SELECT * FROM baner ORDER BY RAND()");
  return $query;
  }
 function carruselporid($id)
  {
  $query = $this->cos("SELECT baner FROM baner WHERE id_baner=$id");
  if ($data = $query->fetch(PDO::FETCH_ASSOC))
   {
   $this->simpleb = $data;
   }
  return $this->simpleb;
  }
 function borrarcarrusel($id)
  {
  $query = $this->cos("DELETE FROM baner WHERE id_baner=$id");
  if ($data = $this->carruselporid($id))
   {
   $baner = $data['baner'];
   unlink($baner);
   }
  //header("location:adminbanner");
   echo "<script>window.location.assign('adminbanner')</script>";
  return $query;
  }
 public function inserarcarrusel($baner){
  $query=$this->cos("INSERT INTO baner (baner) VALUES ('$baner')")or die('error');
  if($data=$query->fetch()){$this->foto=$data;
  }return $this->foto;
  }

 }





