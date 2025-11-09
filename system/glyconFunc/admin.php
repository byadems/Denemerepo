<?php

function admin_controller($controllerName){
  $controllerName = strtolower($controllerName);
  return PATH.'/controller/admin/'.$controllerName.'.php';
}

function admin_view($viewName){
  $viewName = strtolower($viewName);
  return PATH.'/themes/admin/'.$viewName.'.php';
}

function servicePackageType($type){
  switch ($type) {
    case '1':
      return "Varsayılan";
      break;
    case '2':
      return "Paket";
      break;
    case '3':
      return "Özel yorum";
      break;
    case '4':
      return "Paket yorum";
      break;
    default:
      return "Abonelik";
      break;
  }
}