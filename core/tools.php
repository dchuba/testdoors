<?
require_once 'database.class.php';
function selectConfig(){
  $db = new Database();
  $result = $db->Select('SELECT id,name,title,type FROM param');
  $param=[];
    foreach ($result as $row) {
      $param[$row['id']] = [
            'id'=>$row['id'],
            'name'=>$row['name'],
            'title'=>$row['title'],
            'type'=>$row['type'],
            'config'=>[]
          ];
    }
  $config = $db->Select('SELECT id,param_id,label,value,price FROM config');
  foreach ($config as $row) {
    $param[$row['param_id']]['config'][] = [
          'id'=>$row['id'],
          'label' => $row['label'],
          'value'=>$row['value'],
          'price'=>$row['price']
        ];
  }
  $db->Disconnect();
  return $param;
}
?>