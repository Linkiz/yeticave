<?php
$link = mysqli_connect('127.0.0.1', 'root', '', 'DataBd');
mysqli_set_charset($link, 'utf8');

$query = 'select * from categories';
$res = mysqli_query($link, $query);
$query2 = 'select * from lots';
$res2 = mysqli_query($link, $query2);
if($res){
    echo mysqli_error($link);
}
if($res2) {

echo mysqli_error($link);
}

$categories_list = mysqli_fetch_all($res,MYSQLI_ASSOC);

$data_list = mysqli_fetch_all($res2,MYSQLI_ASSOC);


?>
