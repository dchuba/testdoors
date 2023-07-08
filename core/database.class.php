<?
class Database{	
    private $connection = null;
    private $user = 'masterden5_dev4';
    private $password = '123dEv654';
    private $db = 'masterden5_dev4';
    private $host = 'localhost';
    private $charset = 'utf8';
    public function __construct(){
        try{
            $this->connection = new PDO("mysql:host=localhost;dbname=masterden5_dev4;charset=utf8", 'masterden5_dev4', '123dEv654');
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->connection->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        }catch(Exception $e){
            throw new Exception($e->getMessage());   
        }			
    }
    public function Disconnect(){
      $this->connection = null;
    }
    public function Select( $statement = "" , $parameters = [] ){
        try{
            $stmt = $this->executeStatement( $statement , $parameters );
            return $stmt->fetchAll();
        }catch(Exception $e){
            throw new Exception($e->getMessage());   
        }		
    }
    
    public function Insert( $statement = "" , $parameters = [] ){
        try{
            $this->executeStatement( $statement , $parameters );
            return $this->connection->lastInsertId();
        }catch(Exception $e){
            throw new Exception($e->getMessage());   
        }		
    }

    private function executeStatement( $statement = "" , $parameters = [] ){
        try{
            $stmt = $this->connection->prepare($statement);
            $stmt->execute($parameters);
            return $stmt;
        }catch(Exception $e){
            throw new Exception($e->getMessage());   
        }		
    }
}
?>