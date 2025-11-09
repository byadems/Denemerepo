<?php

if( $_POST ){

  $pass     = $_POST["current_password"];
  $new_pass = $_POST["password"];
  $new_again= $_POST["confirm_password"];
if(empty($pass) || empty($new_pass) || empty($new_again)){
         $error    = 1;
    $errorText= "Boş alan bırakmayınız.";
  }elseif( !userdata_check('password',md5(sha1(md5($pass)))) ){
    $error    = 1;
    $errorText= "Eski parolanız hatalı.";
  }elseif( strlen($new_pass) < 8 ){
    $error    = 1;
    $errorText= "Parolanız çok kısa.";
  }elseif( $new_pass != $new_again ){
    $error    = 1;
    $errorText= "Yeni parolalar eşleşmedi.";
  }else{
      $update = $conn->prepare("UPDATE clients SET password=:pass WHERE client_id=:id ");
      $update = $update->execute(array("id"=>$user["client_id"],"pass"=>md5(sha1(md5($new_pass))) ));
	  header("Location:".site_url("admin"));
  }
}

require admin_view('account');