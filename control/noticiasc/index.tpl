<?php
class noticiasc  extends controlador
{

public function __construct(){ parent::__construct(); }

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
if(!isset($_GET['lt'])||!is_numeric($_GET['lt'])){ $limit=5; $this->vista->set("limite", $limit); }else{ $limit=$_GET['lt']; $this->vista->set("limite",$limit); }
/****************************************************/
 $from=(($pagina * $limit)- $limit);
/***************************************************/
 $total=$this->modelo->pag($limit,$buscar,$categoria);
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
$this->vista->setup("vistas/noticias/cambio",'cambio',$god);

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
$no=$this->modelo->no($limit,$from,$orden,$buscar,$categoria,$id);
if (isset($_GET["i"])) {
$noticias = $this->vista->each("vistas/noticias/contenido2",'contenido',$no);
}else{
$noticias = $this->vista->each("vistas/noticias/contenido",'contenido',$no);	
}
/*************************************************/
$categoria=$this->modelo->categorias();
$categorias = $this->vista->each("vistas/noticias/categorias",'categorias',$categoria);
// /***************************************************/
$ultimos=$this->modelo->comentario();
$comentarios =  $this->vista->each("vistas/noticias/comentarios",'ultimos',$ultimos);
// /**************************************************/
$this->vista->set("siguiente",$pagina+1);
$this->vista->set("anterior",$pagina-1);
// /**************************************************/
if($total>=1){$this->vista->set("noresult",'');}else{
$this->vista->set("noresult",'<center><h2>no se encontraron resultados</h2></center>');
}
// /***************************************************/

if (isset($_GET['i'])) {
$catxid=$this->modelo->categoriasid($id);
foreach($catxid as $catid){
$catidc = $catid['categoria'];
$idcom=$catid['id'];
}/***/
$this->vista->setup('vistas/noticias/comentar','comentar');
	$this->vista->set('catid',$catidc);
	$this->vista->set('idcom',$idcom);

if (isset($_SESSION['user'])) {
	$this->vista->set('readonly','readonly');
	$this->vista->set('comfoto',$_SESSION['user'].'.gif');
	$this->vista->set('comnombre',$_SESSION['user']);
	$this->vista->set('comcorreo',$_SESSION['correo']);
}else{
	$this->vista->set('readonly','required');
	$this->vista->set('comfoto','anonimo.png');
	$this->vista->set('comnombre','');
	$this->vista->set('comcorreo','');
}
/**/
$comexid=$this->modelo->comxid($id);
	$this->vista->set('comid','');//arreglo facil
	$this->vista->each("vistas/noticias/comid",'comid',$comexid);
}else{
	$this->vista->set('comentar','');
}
// /**************************************************/
if (!isset($_GET["i"])) {
$paginareglo = array(array('siguiente' =>$pagina+1,'anterior'=>$pagina-1,'pagina'=>$pagina,'limite'=>$limit,'orden'=>$orden,'total'=>$total));	
$this->vista->setup("vistas/noticias/paginacion",'paginacion',$paginareglo);

}else{
$this->vista->set("paginacion",'');	
}
if($total>=1){
if($pagina==1){ $this->vista->set("inicio",'style="display:none"'); }
if($pagina<=2){ $this->vista->set("ant",'style="display:none"'); }
if($pagina==$total){ $this->vista->set("sigu",'style="display:none"'); }
if($pagina==$total){ $this->vista->set("fin",'style="display:none"'); }
} 
$this->vista->ver();
}//FIN INDEX


} 

?>