<?php

require_once ('fuction.php');
require 'link.php';



$currentLot = null;

if(isset($_GET['id'])){
    $lotID = intval($_GET['id']);
    foreach ($data_list as $lot){
        if(intval($lot['lot_id']) == $lotID){
            $currentLot = $lot;
            break;
        }
    }
}



if(!$data_list[$lotID]) {
    http_response_code(404);
    exit;
}
$page_content = compile_tamplate('lot.php',['categories_list'=> $categories_list,
    'lot' => $currentLot,
    'lotID' => $lotID,
    'data_list'=> $data_list,
    'Timer' => $time_left]);


$layout_content = compile_tamplate('layout.php',['page_layout'=>'Главная страница',
    'is_auth'=>$is_auth,
    'user_avatar'=>$user_avatar,'user_name'=>$user_name,
    'page_content'=>$page_content,
    'categories_list'=>$categories_list]);

print($layout_content);
?>
