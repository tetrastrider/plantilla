<?php 
if(isset($_SESSION['user'])){
session_unset();
header("location:/inicio");
}else{header("location:/inicio");}