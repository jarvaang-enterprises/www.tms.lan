<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=1, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="/styles/js/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
</head>

<body>
    <?php
    $loaded = array();
    $data = file_get_contents('./inc/rKData.json');
    $jData = json_decode($data, true);
    $hot = 1;
    for ($i = 0; $i < count($jData); $i++) {
        if (strpos($jData[$i], ' hotels') != false || strpos($jData[$i], ' places') != false) {
            
        } else {
            $loaded[$i] = $jData[$i]['hotelName'];
            echo '
            <div id="hotel'.$hot.'" class="thumbnail hotels">
                <div class="hotelimg">
                    <div class="img"></div>
                    <img class="thumbnail image" src="'.$jData[$i]['thumbnail'].'" alt="'.$jData[$i]['hotelName'].' thumbnail"/>
                </div>
                <div class="hotel_choreography">
                    <div class="hotelName">
                        '.$jData[$i]['hotelName'].'
                    </div>
                    <div class="info">
                        <div class="rating">
                            Rating: '.$jData[$i]['rating'].'
                        </div>
                        <div class="price">
                            Price: '.$jData[$i]['price'].' per room
                        </div>
                        <div class="deal" ';$style = 'crimson';if(strpos($jData[$i]['offer'], "o offer ") != false){echo 'style="color:'.$style.'"';};echo '>
                            <span class="deal">Deal:</span> '.$jData[$i]['offer'].'
                        </div>
                    </div>
                </div>
                <div class="h_info">
                    '.$jData[$i]['info'].'
                </div>
            </div>
            ';
            // echo '<tr id="hotel'.$hot.'">';
            // echo '<td style="background-color:grey">
            //         <img src="'.$jData[$i]["thumbnail"].'" alt="Hotel image">
            //       </td>
            //     <td>'.$jData[$i]["hotelName"].'</td>
            //     <td>'.$jData[$i]["info"].'</td>
            //     <td>'.$jData[$i]["price"].'</td>
            //     <td>'.$jData[$i]["offer"].'</td>
            //     <td>'.$jData[$i]["rating"].'</td></tr>';
            $hot++;
        }
    }
    ?>
</body>

</html>