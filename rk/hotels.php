<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=1, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="/styles/js/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
    <!-- <script src="/styles/js/gethotels.js"></script> -->
    <link rel="stylesheet" href="/styles/bootstrap.min.css" crossorigin="anonymous" type="text/css" />
    <link rel="preconnect" href="//lh3.googleusercontent.com">
    <link rel="preconnect" href="//lh4.googleusercontent.com">
    <link rel="preconnect" href="//lh5.googleusercontent.com">
    <link rel="preconnect" href="//lh6.googleusercontent.com">
    <title>Rent Kampala</title>
</head>

<body>
    <?php
    $loaded = array();
    $data = file_get_contents('./inc/rKData.json');
    $jData = json_decode($data, true);
    $hot = 1;
    echo count($jData).'<br>'.$jData[0].' => '.$jData[1].'<br>';
    for ($i = 0; $i < count($jData); $i++) {
        if (strpos($jData[$i], ' hotels') != false || strpos($jData[$i], ' places') != false) {
            
        } else {
            $loaded[$i] = $jData[$i]['hotelName'];
            echo '
            <div id="hotel'.$hot.'" class="card">
                Test
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