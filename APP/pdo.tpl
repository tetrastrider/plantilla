<?php

class basededatos 
{  

    static private $db;
    private $driver=DRIVER.':';
     private $host='host='.BD_SERVIDOR.';'; 
     private $database='dbname='.BD_NOMBRE.';';
     private $attr=ARRAY(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION,PDO::ATTR_PERSISTENT=>true,PDO::MYSQL_ATTR_INIT_COMMAND=>"SET NAMES 'utf8'");
     private $usuario=BD_USUARIO;
     private $pass =BD_PASSWORD;    
    public function __construct() 
    {
        if(!self::$db) { 
            try {
               self::$db = new PDO($this->driver.$this->host.$this->database, $this->usuario, $this->pass, $this->attr);
            } catch (PDOException $e) { 
               die("PDO CONNECTION ERROR: ".$e->getMessage()."<br/>");
            }
        }
        return self::$db;              
    }

protected function __clone()
   {
 
   }
    public function beginTransaction() {
        return self::$db->beginTransaction();
    }
    
    public function commit() {
        return self::$db->commit();
    }
    
    public function errorCode() {
        return self::$db->errorCode();
    }
    
    public function errorInfo() {
        return self::$db->errorInfo();
    }
    
    public function exec($statement) {
        return self::$db->exec($statement);
    }
   
    public function getAttribute($attribute) {
        return self::$db->getAttribute($attribute);
    }

    public function getAvailableDrivers(){
        return Self::$db->getAvailableDrivers();
    }
    
    public function lastInsertId($name) {
        return self::$db->lastInsertId($name);
    }
    
    public function prepare ($statement, $driver_options=false) {
        if(!$driver_options) $driver_options=array();
        return self::$db->prepare($statement, $driver_options);
    }
   
    public function query($statement) {
        return self::$db->query($statement);
    }
   
    public function fetchAll($statement) {
        return self::$db->query($statement)->fetchAll(PDO::FETCH_ASSOC);
    }
    
    public function fetch($statement) {
        return self::$db->query($statement)->fetch(PDO::FETCH_ASSOC);      
    }
 
    public function fetchColumn($statement) {
        return self::$db->query($statement)->fetchColumn();        
    }
    

    public function quote ($input, $parameter_type=0) {
        return self::$db->quote($input, $parameter_type);
    }

    public function rollBack() {
        return self::$db->rollBack();
    }      
  
    public function setAttribute($attribute, $value  ) {
        return self::$db->setAttribute($attribute, $value);
    }
}
?>