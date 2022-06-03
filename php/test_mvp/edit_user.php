<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: access");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Methods: GET");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
$respone = [];
if(isset($_POST)){
    try{
        $id = $_POST['id'];
        $username = $_POST['username'];
        $password = $_POST['password'];
        if($id != ""){
            if($id == "1"){
                $respone["isfound"] = "1";
                $respone["username"] = $username;
                $respone["password"] = $password;
            }else{
                $respone["isfound"] = "0";
                $respone["text"] = "Not found for id=".$id;
            }
        }else{
            $respone["isfound"] = "0";
            $respone["text"] = "id is empty";
        }
    }catch(Exception $e){
        $respone["isfound"] = "0";
        $respone["text"] = $e;
    }
}else{
    $respone["isfound"] = "0";
    $respone["text"] = "error isset post";
}
echo json_encode($respone);