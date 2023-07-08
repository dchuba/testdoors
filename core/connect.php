<?

function openConnect(){
  $user = 'masterden5_dev4';
  $password = '123dEv654';
  $db = 'masterden5_dev4';
  $host = 'localhost';
  $charset = 'utf8';

  try {
    $conn  = new PDO("mysql:host=localhost;dbname=masterden5_dev4;charset=utf8", $user, $password);
    $conn ->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //echo "Connected to $dbname at $host successfully.";
    return $conn ;
  } catch (PDOException $e) {
    echo "Connection failed: ". $e->getMessage();
    die();
  }
}
function closeConnect($conn){
  $conn = null;
}
?>