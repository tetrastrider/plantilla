<?php
class publicacionesc  extends controlador
{

public function __construct(){
	
	parent::__construct();
}

public function index(){

/***************************************************/
if(isset($_SESSION['user'])){$this->vista->set('user',$_SESSION['user']);}
/***************************************************/
if(empty($_GET["b"])){$buscar="";}else{$buscar=$_GET["b"];}
if(empty($_GET['c'])){$categoria="";}else{$categoria=$_GET['c'];}
if(isset($_GET["i"])){if(!empty($_GET["i"])){(int)$id=$_GET["i"];}}else{$id="";}
/******************************************************/
if(isset($_GET['p'])&&is_numeric($_GET['p'])){ $pagina=(int)$_GET['p']; $this->vista->set("pagina", $pagina);
        }else{ $pagina=1; $this->vista->set("pagina", $pagina); }
/****************************************************/
if(!isset($_GET['lt'])||!is_numeric($_GET['lt'])){ $limit=10; $this->vista->set("limite", $limit); }else{ $limit=$_GET['lt']; $this->vista->set("limite",$limit); }
/****************************************************/
 $from=(($pagina * $limit)- $limit);
/***************************************************/
 $total=$this->control->pag($limit,$buscar,$categoria);
$this->vista->set('total',$total);
/***************************************************/
if(!isset($_GET["co"])){

  $orden=2; $check2='selected';//Publicaciones Nuevas
  $this->vista->set('orden',$orden);
  $check2='selected';$check1='';

}elseif($_GET["co"]==1){

  $orden=$_GET["co"]; $check1='selected';$check2='';

}else{
  $orden=2; $check2='selected';$check1='';//Publicaciones Nuevas
}
  /***/
$god =array(array('pagina'=>$pagina,'orden'=>$orden),
	array('check2'=>$check2,'check1'=>$check1));
$this->vista->setup("vistas/publicaciones/cambio",'cambio',$god);

/****************************************************/
if($limit==5){
$this->vista->set("hasta5",'selected');
}elseif($limit==10){
$this->vista->set("hasta10",'selected');
}elseif($limit==15){
$this->vista->set("hasta15",'selected');
}elseif($limit==20){
$this->vista->set("hasta20",'selected');
}elseif($limit==25){
$this->vista->set("hasta25",'selected');
}elseif($limit==30){
$this->vista->set("hasta30",'selected');
}else{
$this->vista->set("hasta5",'selected');
}
/***************************************************/
$no=$this->control->no($limit,$from,$orden,$buscar,$categoria,$id);
if (isset($_GET["i"])) {
$noticias = $this->vista->each("vistas/publicaciones/contenido2",'contenido',$no);
}else{
$publicaciones = $this->vista->each("vistas/publicaciones/contenido",'contenido',$no);	
}
/*************************************************/
$categoria=$this->control->categorias();
$categorias = $this->vista->each("vistas/publicaciones/categorias",'categorias',$categoria);
// /**************************************************/
$this->vista->set("siguiente",$pagina+1);
$this->vista->set("anterior",$pagina-1);
// /**************************************************/
if($total>=1){$this->vista->set("noresult",'');}else{
$this->vista->set("noresult",'<center><h2>no se encontraron resultados</h2></center>');
}
// /***************************************************/
if (!isset($_GET["i"])) {
$paginareglo = array(array('siguiente' =>$pagina+1,'anterior'=>$pagina-1,'pagina'=>$pagina,'limite'=>$limit,'orden'=>$orden,'total'=>$total));	
$this->vista->setup("vistas/publicaciones/paginacion",'paginacion',$paginareglo);

}else{
$this->vista->set("paginacion",'');	
}
if($total>=1){
if($pagina==1){ $this->vista->set("inicio1",'style="display:none"'); }
if($pagina<=2){ $this->vista->set("inicio2",'style="display:none"'); }
if($pagina==$total){ $this->vista->set("inicio3",'style="display:none"'); }
if($pagina==$total){ $this->vista->set("inicio4",'style="display:none"'); }
} 
$this->vista->ver();
}//FIN INDEX


} 

?>