<?php

require 'fuction.php';
require 'link.php';
$lots_data = [
    'categories_list' => $categories_list
];

$layout_content = compile_tamplate('layout.png',
[
    'page_layout' => 'Главная страница',
    'is_auth' => $is_auth,
    'user_avatar' => $user_avatar,
    'user_name' => $user_name,
    'page_content' => $page_content,
    'categories_list' => $categories_list
]
);

print($layout_content);
?>
