<?php
require_once('../includes/db.inc.php');
if($_SERVER['REQUEST_METHOD'] === 'POST'){
    $nin = mysqli_real_escape_string($con, $_POST['tNIN']);
    $ad = mysqli_real_escape_string($con, $_POST['ad']);
    $init = 'update '
}