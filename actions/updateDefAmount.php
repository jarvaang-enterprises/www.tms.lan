<?php
require_once('../includes/db.inc.php');
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nin = mysqli_real_escape_string($con, $_POST['tNIN']);
    if ($_POST['type'] == 'def') {
        $ad = mysqli_real_escape_string($con, $_POST['ad']);
        $did = mysqli_real_escape_string($con, $_POST['did']);
        $init = 'update defaulters_rent set amt_defaulted = ' . $ad . ' where defaulters_id = ' . $did . ' and ten_nin = "' . $nin . '"';
        $init = mysqli_query($con, $init);
    } else if($_POST['type'] == 'credit'){
        $init = 'delete from rent_credit where ten_nin = "'.$nin.'"';
        $init = mysqli_query($con, $init);
    }
    if (!$init) die('Error: ' . mysqli_error($con));
}
