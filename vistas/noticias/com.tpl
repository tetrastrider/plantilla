<?php
if(isset($_POST["autor"])&&!empty($_POST["autor"])&&isset($_POST["correo"])&&!empty($_POST["correo"])&&isset($_POST["foto"])&&!empty($_POST["foto"])&&isset($_POST["comentario"])&&!empty($_POST["comentario"])&&isset($_POST["id"])&&!empty($_POST["id"])){
$id=$_POST["id"];$autor=strip_tags($_POST["autor"]);$comentario=strip_tags($_POST["comentario"]);$correo=strip_tags($_POST["correo"]);$foto=$_POST["foto"];
$control->icoment($comentario,$autor,$foto,$correo,$id);
}
header("Location: /simple?id=".$id);



