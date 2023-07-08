<?
require_once 'database.class.php';
//require_once 'tc-lib-pdf-main/resources/autoload.php';
require_once 'dompdf/autoload.inc.php';

$test = [
          'config-paiting' => '2', 
          'config-film' => '7',
          'config-handle' => '12',
          'config-width' => '14', 
          'config-height' => '17',
          'config-opening' => '20',
          'config-accessories' => ['21','22'],
          'config-price' => '111111'
          ];
//print_r($_POST);
//print_r($test);
$result = $_POST;
$ids = $result;
unset($ids['config-price']);
$ids['config-accessories'] = implode(',',$result['config-accessories']);
$ids = implode(',',$ids);
$db = new Database();
$config = $db->Select('SELECT id,param_id,label,value,price FROM config WHERE id in ('.$ids.')');

$param =[];
foreach ($config as $row) {
  $param[$row['id']] = $row;
}
$accessories = [];
foreach ($result['config-accessories'] as $as) {
  $accessories[] = $param[$as]['label'];
}
$coef = $db->Select('SELECT value FROM `system` WHERE name = "koeff"');

$result_id = $db->Insert(
    "INSERT INTO result (paiting, film, handle, width,height, opening, accessories, price) VALUES (:paiting,:film,:handle,:width,:height,:opening,:accessories,:price)",
    [
      'paiting' => $param[$result['config-paiting']]['label'],
      'film' => $param[$result['config-film']]['label'],
      'handle' => $param[$result['config-handle']]['label'],
      'width' => $param[$result['config-width']]['label'],
      'height' => $param[$result['config-height']]['label'],
      'opening' => $param[$result['config-opening']]['label'],
      'accessories' => implode(', ', $accessories),
      'price' => $result['config-price']
    ]
);
$db->Disconnect();
$fileout = '';
if ($result_id > 0){
  $filename = dirname(__FILE__ ,2).'/assets/tpl/pdf.tpl';

  $html = file_get_contents($filename);
  $var = [
    '--classopening'=>$param[$result['config-opening']]['value'],
    '--colorpaiting'=>'#'.$param[$result['config-paiting']]['value'],
    '--colorfilm'=>'#'.$param[$result['config-film']]['value'],
    '--colorhandle'=>'#'.$param[$result['config-handle']]['value'],
    '--configpaiting'=>$param[$result['config-paiting']]['label'],
    '--configfilm'=>$param[$result['config-film']]['label'],
    '--confighandle'=>$param[$result['config-handle']]['label'],
    '--configwidth'=>$param[$result['config-width']]['label'],
    '--configheight'=>$param[$result['config-height']]['label'],
    '--configopening'=>$param[$result['config-opening']]['label'],
    '--configaccessories'=>implode(", ", $accessories),
    '--configprice'=>$result['config-price'],
    '--configdiler'=>round(($result['config-price'] * $coef['0']['value']))
  ];

  $html = strtr($html, $var);

  $dompdf = new Dompdf\Dompdf();
  $dompdf->set_option('isRemoteEnabled', TRUE);
  $dompdf->setPaper('A4', 'portrait');
  $dompdf->loadHtml($html, 'UTF-8');
  $dompdf->render();
   
  // Вывод файла в браузер:
  //$dompdf->stream('raschet');

  // Или сохранение на сервере:
  $pdf = $dompdf->output();
  $fileout = '/assets/files/'.time().'.pdf'; 
  file_put_contents(dirname(__FILE__ ,2).$fileout, $pdf);
}
print_r('//'.$_SERVER['HTTP_HOST'] . $fileout);

?>