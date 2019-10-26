<?php
    $res['status'] = 'Failed';
    $res['message'] = 'Request not understood or Provided data is corrupt;';
    $ponse = json_encode($res);
if($_SERVER['REQUEST_METHOD'] == 'GET' &&
 isset($_GET['h']) && !empty($_GET['h']) &&
 isset($_GET['in']) && !empty($_GET['in'])&&
 isset($_GET['th']) && !empty($_GET['th'])&&
 isset($_GET['p']) && !empty($_GET['p'])&&
 isset($_GET['r']) && !empty($_GET['r'])&&
 isset($_GET['o']) && !empty($_GET['o'])){
    $hn = base64_decode(urldecode($_GET['h']));
    $file = '../inc/img/'.$hn.'.json';
    if(file_exists($file)){
        $extra_images = file_get_contents($file);
        $e_i = json_decode($extra_images);
        echo '<title>'.$hn.' &lt;&gt; Rent Kampala</title>
<link rel="stylesheet" href="/styles/viewer.inc.css">
';
        require_once('../inc/header.inc.php');
        echo '<div data-view="hotel-view">';
        echo '<div class="view_img">
        <button data-button="pull-left" onclick="pullleft()">&lt;</button>
        <button data-button="pull-right" onclick="pullright()">&gt;</button>';
        for($img = 0; $img < count($e_i); $img++){
            echo '<div data-img="img-thumbnail" jslog="index: '.$img.'">';
            echo '<img class="thumbnail gallery" jsdata="img-index: '.($img + 1).'" src="'.$e_i[$img].'" alt="Photo">';
            echo '</div>';
        }
        echo '</div>';
        echo '<div data-info="hotel-info">
        <div data-info="hotel-name">
            '.$hn.'
        </div>
        </div>';
        echo '<div data-info="hotel-data">
        ["Kampala hotels", "718 places", {"thumbnail": "https://lh5.googleusercontent.com/p/AF1QipMUsz3n5Uj<br>aHZeruoOYmvhVeVoQhqpxWSZ8DnUW=w296-h202-n-k-no-v1", "hotelName": "Kampala Serena Hotel", "info": "High-end hotel offering outdoor<br> pools, 2 restaurants & a bakery, plus a bistro, a cafe & a spa.", "price": "USh\u00a01,041,383", "offer": "No offer found", "rating": "5-star hotel"}, {"thumbnail": "https://l<br>h5.googleusercontent.com/p/AF1QipNZjcXcnLCc--qunIpAnCW90JoOZvUrZG-iVeSH=w296-h202-n-k-no-v1", "hotelName": "serena hotel", "info": "No info found", "price": "Price unknown", "offer": "No offer found", "rating": "No rating found"}, {"thumbnail": "https://lh5.googleusercontent.com/proxy/l26NRdE9_8wxTT6lcbVt7son5eZWLU-ZE7hDlvkfNXOTm50blqKklG9LSV7D6VLCr4he86ioVUQu9hpNOARm5niWQ9gORn9_zgzLU5Ryvng2WW0c1vxqxQhi6iZorqfJsp76ycxwoMOlIL1k5ZUzxDpcSffeiRM=w296-h202-n-k-no-v1", "hotelName": "Munyonyo Commonwealth Resort", "info": "Bright rooms & suites, some with Lake Victoria views, in an upscale hotel with an equestrian centre.", "price": "USh\u00a0786,749", "offer": "No offer found", "rating": "3-star hotel"}, {"thumbnail": "https://lh5.googleusercontent.com/proxy/mIBGiDnUBRDii97m271yibxlkGTN4o7eiiUQd5zuweBTf80CYdsHNQNxQZqXwFyT8n08Lbac0XjsitJTcfUX3nUuqk1SBokC3QyQIW3bhDPaynVVaxMSFZl5eCeJoDw2LyVh0YX46urYw5AdMbeXZGJjGKdSvA=w296-h202-n-k-no-v1", "hotelName": "Munyonyo Commonwealth Resort Hotel", "info": "Colourful rooms, suites & cottages in a lakefront resort offering dining, plus a bar & spa.", "price": "USh\u00a0703,689", "offer": "No offer found", "rating": "5-star hotel"}, {"thumbnail": "https://lh5.googleusercontent.com/p/AF1QipNIadmvVxPmry_5xlEZGbytWBNDzPMyJaldxDJj=w296-h202-n-k-no-v1", "hotelName": "Protea Hotel By Marriott Kampala Skyz", "info": "Refined rooms in an upscale hotel offering a restaurant & an outdoor pool, plus meeting facilities.", "price": "USh\u00a0578,546", "offer": "No offer found", "rating": "3-star hotel"}, {"thumbnail": "https://lh5.googleusercontent.com/p/AF1QipN1v5LQD-i3EFO016lB5_QYFKToyuzIOkOdggmA=w296-h202-n-k-no-v1", "hotelName": "M\u00e9stil Hotel & Residences", "info": "Warmly decorated rooms & suites in a relaxed hotel offering an outdoor pool, a restaurant & a gym.", "price": "USh\u00a0524,892", "offer": "No offer found", "rating": "4-star hotel"}, {"thumbnail": "https://lh5.googleusercontent.com/p/AF1QipNr5tNZTvWEvxgSBB7ZRrYQ3XtCzGMdBD7dWLPW=w296-h202-n-k-no-v1", "hotelName": "Le Petit Village Hotel", "info": "Warm suites in a stylish hotel featuring a brasserie & a cafe, plus an outdoor pool & gardens.", "price": "USh\u00a0629,909", "offer": "No offer found", "rating": "4-star hotel"}, {"thumbnail": "https://lh5.googleusercontent.com/p/AF1QipPkRR4ugJQV8PuqAlR7Z-NzEdNqkk8Tzf-tOBEk=w296-h202-n-k-no-v1", "hotelName": "Hilton Garden Inn Kampala", "info": "No info found", "price": "USh\u00a0608,763", "offer": "No offer found", "rating": "4-star hotel"}, {"thumbnail": "https://lh5.googleusercontent.com/p/AF1QipOEfPImKcU4-TUZ8-f05bJJmukmVu4eA9D-v6xk=w296-h202-n-k-no-v1", "hotelName": "The Athena Hotel", "info": "No info found", "price": "USh\u00a0571,176", "offer": "No offer found", "rating": "No rating found"}, {"thumbnail": "https://lh5.googleusercontent.com/p/';
        echo '</div>';
        if($env == 'production'){
        echo '</div>
        <script>window.location.href = "/hotels/";';
        }
        echo '</script><script type="text/javascript" src="/styles/js/viewer.min.js"></script>';
        require_once('../inc/footer.inc.php');
        echo '
        <script>$(".site-content").addClass("view");
        width = $("'; echo "[data-button*='pull']"; echo'").height()';
        for($i = 0; $i < 9; $i++){
            if($i != 0){
                echo '
                $("[jslog=';
                echo "'index: $i'";
                echo ']").css({
                    display: "none",
                });';
            }
        }
        echo 'setTot('.count($e_i).');btnstate();</script>';
    } else echo $ponse;
} else {
    echo $ponse;
}
if($env == 'production'){
    echo '</div>
    <script>window.location.href = "/hotels/";';
}
