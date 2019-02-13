<?php

class noticiasm extends Modelo
{
    public function __construct() {
        parent::__construct();
    }

    public function categorias(){return $this->cos("SELECT * FROM categoria"); }

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

    public function comentario()

  {
  $query = $this->cos("SELECT id,SUBSTRING(comentario,1,250) as comentario,autor,foto,publicado,correo,categoria,id_contenido FROM comentario limit 5");
  return $query;
  }

  public function categoriasid($id)

  {
  $query = $this->cos("SELECT * FROM noticias WHERE id=$id");
  return $query;
  }

  public function comxid($id){
  $query = $this->cos("SELECT * FROM comentario WHERE id_contenido=$id");
  return $query;
}

}

?>
