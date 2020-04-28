<?php
require_once('../includes/db.inc.php');
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $response = array();
    $response['success'] = false;
    $response['error'] = 'Just for testing issues';
    $receiptNo = $_POST['rNo'];
    $datePd = strval($_POST['date']);
    $ten_nin = $_POST['tNIN'];
    $admin = $_POST['admin'];
    $amtPd = intval($_POST['amtPd']);
    $rpm = intval($_POST['rpm']);
    $cm = (mysqli_fetch_assoc(mysqli_query($con, 'select MONTH(NOW()) limit 1')))['MONTH(NOW())'];
    $cy = mysqli_fetch_assoc(mysqli_query($con, 'select YEAR(NOW()) limit 1'))['YEAR(NOW())'];
} else {
    echo 'Direct Script access denied!';
}

function datetime($date, $ts)
{
    if ($ts == "ts")
        return (new DateTime($date))->format('Y-m-d H:i:s.u');
    else if ($ts == "m") {
        echo intval(explode('-', explode('/', $date)[0])[2]);
        return intval(explode('-', explode('/', $date)[0])[2]);
    } else if ($ts == 'y') {
        return explode('-', explode('/', $date)[0])[0];
    } else return null;
}
