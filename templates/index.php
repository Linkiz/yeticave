<main class="container">
    <section class="promo">
        <h2 class="promo__title">Нужен стафф для катки?</h2>
        <p class="promo__text">На нашем интернет-аукционе ты найдёшь самое эксклюзивное сноубордическое и горнолыжное снаряжение.</p>
        <ul class="promo__list">
            <?php foreach ($categories_list as $category) :?>


                <li class="promo__item promo__item--<?= $category['categ_id']?>">
                    <a class="promo__link" href="pages/all-lots.html"><?= $category['categ_name']?></a>
                </li>
            <?php endforeach; ?>
        </ul>
    </section>
    <section class="lots">
        <div class="lots__header">
            <h2>Открытые лоты</h2>
        </div>
        <ul class="lots__list">
            <!--заполните этот список из массива с товарами-->
            <?php foreach ($data_list as $data) :?>
                <li class="lots__item lot">
                    <div class="lot__image">
                        <img src="<?= $data['lot_img']?>" width="350" height="260" alt="<?= $data['lot_name']?>">
                    </div>
                    <div class="lot__info">
                        <span class="lot__category"><?= $categories_list[$category['categ_name']]?></span>
                        <h3 class="lot__title"><a class="text-link" href="lots.php?id=<?=$data['lot_id'] ?>"><?= $data['lot_name'];?></a></h3>
                        <div class="lot__state">
                            <div class="lot__rate">
                                <span class="lot__amount"><?= $data['lot_first_price'];?></span>
                                <span class="lot__cost"><?= sum_price($data['lot_first_price'], true)?><b class="rub">р</b></span>
                            </div>
                            <div class="lot__timer timer">
                                <?php echo Timer();?>
                            </div>
                        </div>
                    </div>
                </li>
            <?php endforeach;?>
        </ul>
    </section>
</main>
</div>
