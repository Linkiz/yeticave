<?php
$is_auth = rand(0, 1);

$user_name = 'linkiz'; // укажите здесь ваше имя

$categories_list =
    [
        'boards' => "Доски и лыжи",
        'shoes' => "Ботинки",
        'clothes' => "Одежда",
        'fastenings' => "Крепления",
        'tools' => "Инструменты",
        'different' => "Разное"
    ];

$data_list = [
    [
        'name' => "2014 Rossignol District Snowboard",
        'category' => 'boards',
        'count' => '10999',
        'img' => 'img/lot-1.jpg',
    ],
    [
        'name' => "DC Ply Mens 2016/2017 Snowboard",
        'category' => 'boards',
        'count' => '15999',
        'img' => 'img/lot-2.jpg',

    ],
    [
        'name' => "Крепления Union Contact Pro 2015 года размер L/XL",
        'category' => 'fastenings',
        'count' => '7999',
        'img' => 'img/lot-3.jpg',
    ],
    [
        'name' => "Ботинки для сноуборда DC Mutiny Charocal",
        'category' => 'shoes',
        'count' => '9999',
        'img' => 'img/lot-4.jpg',
    ],
    [
        'name' => "Куртка для сноуборда DC Mutiny Charocal",
        'category' => 'clothes',
        'count' => '17500',
        'img' => 'img/lot-5.jpg',
    ],
    [
        'name' => "Маска Oakley Canopy",
        'category' => 'different',
        'count' => '3500',
        'img' => 'img/lot-6.jpg',
    ]
];

function compile_tamplate($template, $template_data){
    if(file_exists('templates/' . $template)){
        ob_start();
        extract($template_data);
        require_once ('templates/'. $template);
        return ob_get_clean();
    }
    else{
        return '404';
    }
    }
    ?>

<?php function sum_price ($sun, $withRubleElem ) {
    ceil($sun);
    if($sun < 1000) {
        return $sun;
    }
    else {
        $sun = number_format ($sun , 0 , '.',' ');
        return $sun;
    }

}
?>
<?php
function Timer(){
    $now = strtotime('now');
    $now2 = strtotime('tomorrow');
    $second = $now2 - $now;
    $hours = floor($second/3600);
    $minute = (($second/3600) - $hours)*60;
    $timer = sprintf('%02d:%02d',$hours,$minute);
    return $timer;
}
?>
