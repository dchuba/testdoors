<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
  <style type="text/css">
	*{font-family: montserrat;}
  .bold{font-weidth:bold;}
  .py-3, .pb-3{padding-bottom:30px;}
  .py-3, .pt-3{padding-top: 30px;}
  .pl-2, .px-2{padding-left: 15px;}
  .pr-2, .px-2{padding-right: 15px;}
  .col-6{width: 40%;padding: 0 15px;box-sizing: border-box; float:left;}
  .relative{position: relative;}
  .doors-front_cant, .doors-back_cant{
    border:15px solid --colorpaiting;
  }
  .doors-front_panel, .doors-back_panel{
    height:450px;
    background: --colorpaiting;
    border:1px solid #000;
  }
  .doors-back_panel{
    background: --colorfilm;
  }
  .doors-handle{
    position:absolute;
    top:220px;
    height:7px;
    width:30px;
    background: --colorhandle;
    z-index:10;
  }
  .right .doors-front_handle{
    left:15px;
  }
  .right .doors-back_handle{
    right:15px;
  }
  .left .doors-front_handle{
    right:15px;
  }
  .left .doors-back_handle{
    left:15px;
  }
  .clear{clear:both;}
  </style>
</head>
<body>
	<h1 class="bold pb-3" >Конфигуратор двери</h1>
  <div class="doors-images">
    <div class="col-6 doors-front --classopening">
      <div class="doors-front_cant relative">
        <div class="doors-front_panel"></div>
        <div class="doors-front_handle doors-handle"></div>
      </div>
    </div>
    <div class="col-6 doors-back --classopening">
      <div class="doors-back_cant relative">
        <div class="doors-back_panel"></div>
        <div class="doors-back_handle doors-handle"></div>
      </div>
    </div>
  </div>
  <div class="clear"></div>
  <div class="pt-3 px-2">
    <table style="width:80%;">
      <tr>
        <td>Цвет покраски</td>
        <td>--configpaiting</td>
      </tr>
      <tr>
        <td>Цвет пленки</td>
        <td>--configfilm</td>
      </tr>
      <tr>
        <td>Цвет ручки</td>
        <td>--confighandle</td>
      </tr>
      <tr>
        <td>Ширина</td>
        <td>--configwidth</td>
      </tr>
      <tr>
        <td>Высота</td>
        <td>--configheight</td>
      </tr>
      <tr>
        <td>Открывание</td>
        <td>--configopening</td>
      </tr>
      <tr>
        <td>Аксессуары</td>
        <td>--configaccessories</td>
      </tr>
      <tr>
        <td>Цена</td>
        <td>--configprice руб.</td>
      </tr>
      <tr>
        <td>Цена дилера</td>
        <td>--configdiler руб.</td>
      </tr>
    </table>
  </div>
 </body>
</html>