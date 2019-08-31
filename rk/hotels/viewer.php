<?php
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
        echo '<br>File Exists';
        $extra_images = file_get_contents($file);
        $e_i = json_decode($extra_images);
    } else echo '<br>File non existent';
} else {
    $res['status'] = 'Failed';
    $res['message'] = 'Request not understood';
    $ponse = json_encode($res);
    echo $ponse;
}
?>