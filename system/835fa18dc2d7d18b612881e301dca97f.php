<?php
    
    define('PATH', realpath('.'));
    define('SUBFOLDER', false);
    define('URL', 'https://fenomensen.net');
    define('DINAMICLISANCE', 'GLYCON-MRXBS-RKCSI-ZXUSP');
    
    ini_set('display_errors', 0);
    date_default_timezone_set('Europe/Istanbul');
    
    return [
      'db' => [
        'name'    =>  'fen2bdnsennet_',
        'host'    =>  'localhost',
        'user'    =>  'dbfenomensen',
        'pass'    =>  'w545*I5ri',
        'charset' =>  'utf8mb4' 
      ]
    ];
    