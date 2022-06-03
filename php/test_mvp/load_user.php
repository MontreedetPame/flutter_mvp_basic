<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
$id = $_GET['id'];
$respone = [];
try{
    if($id != ""){
        if($id == "1"){
            $respone["isfound"] = "1";
            $respone["username"] = "Montreedet";
            $respone["password"] = "123456";
        }else{
            $respone["isfound"] = "0";
            $respone["text"] = "ไม่พบผู้ใช้";
        }
    }else{
        $respone["isfound"] = "0";
        $respone["text"] = "id เท่ากับว่าง";
    }
}catch(Exception $e){
    $respone["isfound"] = "0";
    $respone["text"] = $e;
}
echo json_encode($respone);