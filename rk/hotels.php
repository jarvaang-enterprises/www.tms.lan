<script src="/styles/js/gethotels.js"></script>
<script src="/styles/js/automation.js"></script>
<?php
$loaded = array();
$rk = 'rKData';
$data = file_get_contents('./inc/'.$rk.'.json');
$jData = json_decode($data, true);
$hot = 1;
$pages = 1;
$num = 1;
$st = NULL;
for ($i = 1; $i < count($jData); $i++) {
    if (strpos($jData[$i], ' hotels') != false || strpos($jData[$i], ' places') != false) {
        continue;
    } else {
        $loaded[$i] = $jData[$i]['hotelName'];
        if ($hot == 1) {
            $st = $i - 2;
            echo '<div class="hotelList' . $pages . '" style="display: none">';
        }
        echo '
            <a class="no-style" href="/hotels/viewer.php?h=' . urlencode(base64_encode($jData[$i]['hotelName'])) . '&p=' . urlencode(base64_encode($jData[$i]['price'])) . '&th=' . urlencode(base64_encode($jData[$i]['thumbnail'])) . '&in=' . urlencode(base64_encode($jData[$i]['info'])) . '&r=' . urlencode(base64_encode($jData[$i]['rating'])) . '&o=' . urlencode(base64_encode($jData[$i]['offer'])) . '&_rdr=1" target=_blank>
            <div id="hotel' . $num . '" class="thumbnail hotels">
                <div class="hotelimg">
                    <div class="img"></div>
                    <img class="thumbnail image" src="' . $jData[$i]['thumbnail'] . '" alt="' . $jData[$i]['hotelName'] . ' thumbnail"/>
                </div>
                <div class="hotel_choreography">
                    <div class="hotelName">
                        ' . $jData[$i]['hotelName'] . '
                    </div>
                    <div class="info">
                        <div class="rating">
                            Rating: ' . $jData[$i]['rating'] . '
                        </div>
                        <div class="price">
                            Price: ' . $jData[$i]['price'] . ' per room
                        </div>
                        <div class="deal" ';
        $style = 'crimson';
        if (strpos($jData[$i]['offer'], "o offer ") != false) {
            echo 'style="color:' . $style . '"';
        };
        echo '>
                            <span class="deal">Deal:</span> ' . $jData[$i]['offer'] . '
                        </div>
                    </div>
                </div>
                <div class="h_info">
                    ' . $jData[$i]['info'] . '
                </div>
            </div>
            </a>
            ';
        if ($hot == 12) {
            if ($i - 12 == 1) {
                echo '<div class="list1-button hl' . $pages . '">
                        <button class="next hl' . $pages . '" onclick=next(' . $pages . ')>Next&nbsp;&gt;</button>
                    </div>';
            } else if ($i - 12 != 1 && $i != count($jData) - 1) {
                echo '
                        <div class="int-list-button hl' . $pages . '">
                            <div class="prev-button">
                                <button class="prev hl' . $pages . '" onclick=prev(' . $pages . ')>&lt;&nbsp;Prev</button>
                            </div>
                            <div class="next-button">
                                <button class="next hl' . $pages . '" onclick=next(' . $pages . ')>Next&nbsp;&gt;</button>
                            </div>
                        </div>
                    ';
            } else if ($i == count($jData) - 1) {
                echo '
                    <div class="end-list-button hl' . $pages . '">
                        <button class="prev hl' . $pages . '" onclick=prev(' . $pages . ')>&lt;&nbsp;Prev</button>
                    </div>
                    ';
            }
            echo '</div>';
            $hot = 0;
            echo '<div class="code numbering hotelList' . $pages . '" style="display: none">Showing ' . $st . ' - ' . ($i), ' of ' . (count($jData) - 1) . '</div>';
            $pages++;
        }
        $num++;
        $hot++;
    }
}
?>
<button id="top" title="Go to top">Top&nbsp;&tcy;</button>