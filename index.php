<!DOCTYPE html>
<html>
    <head>
        <title>Главная</title>
        <meta charset="UTF-8">
        <meta name="Keywords" content="">
        <meta name="Description" content="">
        <base href=""/>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,400;0,600;0,700;0,800;1,400&display=swap" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/main.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    </head>
    <body>
        <header>
          <div class=""></div>
        </header>
        <main>
          <section>
            <div class="wrapper">
              <div class="container">
                <div class="title-wr pb-3">
                  <h1 class="bold" >Конфигуратор двери</h1>
                </div>
                <div class="doors-page row-flex">
                  <div class="doors-images col-7 row">
                    <div class="col-6 doors-front">
                      <div class="doors-front_cant relative cant-paiting">
                        <div class="doors-front_panel panel-paiting"></div>
                        <div class="doors-front_handle doors-handle"></div>
                      </div>
                    </div>
                    <div class="col-6 doors-back">
                      <div class="doors-back_cant relative cant-paiting">
                        <div class="doors-back_panel panel-film"></div>
                        <div class="doors-back_handle doors-handle"></div>
                      </div>
                    </div>
                  </div>
                  <div class="doors-config col-5">
                    <form method="post" class="doors-config_form">
                    <input type="hidden" name="config-price" value="0">
                    <?
                      require_once  'core/tools.php';
                      $config_doors = selectConfig();
                      foreach ($config_doors as $param){
                    ?>
                      <div class="form-group relative">
                        <?
                            switch ($param['type']){
                              case 'color':
                        ?>
                            <div class="d-flex justify-content-between">
                              <span><? echo $param['title']; ?></span>
                              <button type="button" class="btn-link js-select" data-src="#config-<? echo $param['name']; ?>">Выбрать</button>
                            </div>
                            <div id="config-<? echo $param['name']; ?>" class="config-container" style="display:none;">
                              <div class="config-container-close d-flex justify-content-end">
                                <button type="button" class="btn-link js-close">&#10006;</button>
                              </div>
                              <div class="row-flex">
                                <?
                                  foreach ($param['config'] as $key=>$config) {
                                ?>
                                    <div class="config-wr">
                                      <input 
                                        type="radio" 
                                        id="config-<? echo ($param['name']."-".$key); ?>" 
                                        class="config-tile config-<? echo $param['type']; ?>" 
                                        name="config-<? echo $param['name']; ?>" 
                                        data-color="#<? echo $config['value']; ?>" 
                                        data-price="<? echo $config['price']; ?>" 
                                        data-title="<? echo $config['label']; ?>" 
                                        value="<? echo $config['id']; ?>">
                                      <label class="config-label" for="config-<? echo ($param['name']."-".$key); ?>" style="background-color:#<? echo $config['value']; ?>;"><? echo $config['label']; ?></label>
                                    </div>
                                <?
                                  };
                                ?>
                              </div>
                            </div>
                        <?
                          break;
                          case 'select':
                        ?>
                        <div class="d-flex justify-content-between">
                          <span><? echo $param['title']; ?></span>
                            <select 
                              class="form-control" 
                              id="config-<? echo $param['name']; ?>" 
                              name="config-<? echo $param['name']; ?>">
                              <option value="">Выбрать</option>
                              <?
                                foreach ($param['config'] as $key=>$config) {
                              ?>
                              <option value="<? echo $config['id']; ?>" data-price="<? echo $config['price']; ?>"><? echo $config['label']; ?></option>
                              <?
                                };
                              ?>
                            </select>
                        </div>
                        <?
                          break;
                          case 'check':
                        ?>
                            <div class="d-flex justify-content-between">
                              <span><? echo $param['title']; ?></span>
                                <button type="button" class="btn-link js-select" data-src="#config-<? echo $param['name']; ?>">Выбрать</button>
                            </div>
                            <div id="config-<? echo $param['name']; ?>" class="config-container" style="display:none;">
                              <div class="config-container-close d-flex justify-content-end">
                                <button type="button" class="btn-link js-close">&#10006;</button>
                              </div>
                              <div class="row-flex">
                                <?
                                  foreach ($param['config'] as $key=>$config) {
                                ?>
                                    <div class="config-wr">
                                      <input 
                                        type="checkbox" 
                                        id="config-<? echo ($param['name']."-".$key); ?>" 
                                        class="config-tile config-<? echo $param['type']; ?>" 
                                        data-price="<? echo $config['price']; ?>"
                                        data-title="<? echo $config['label']; ?>"
                                        name="config-<? echo $param['name']; ?>[]" 
                                        value="<? echo $config['id']; ?>">
                                      <label class="config-label" for="config-<? echo ($param['name']."-".$key); ?>">
                                        <img src="<? echo $config['value']; ?>" class="config-img mw-100">
                                        <span class="d-block text-center c-color"><? echo $config['label']; ?></span>
                                      </label>
                                    </div>
                                <?
                                  };
                                ?>
                              </div>
                            </div>
                        <?
                            break;
                          };
                        ?>
                      </div>
                     <?
                      };
                     ?>
                     <div class="price-confirm pt-3 text-right">
                      <p class="bold" id="price" style="display:none;">Итого: <span id="price-rezult" class="pl-3" >0</span> руб</p>
                     </div>
                     <div class="btn-confirm pt-3 text-right">
                      <button type="submit" class="btn btn-default" id="btn-submit" style="display:none;">Отправить комплектацию</button>
                     </div>
                     <div class="link-pdf pt-3 text-right">
                        <a href="" id="link-pdf" target="_blank" style="display:none;">Комплектация</a>
                     </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </main>
        <footer>

        </footer>
        <script type="text/javascript" src="assets/js/general.js"></script>

    </body>
</html>