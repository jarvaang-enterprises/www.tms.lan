<?php
$DB_HOST = 'localhost';
$DB_USER = 'admin.olympia.lan';
$DB_PASSWD = 'Computer!@#4';
$DB_BASE = 'tenant_management_sys';
$ROOT = '/var/www/www.tms.lan/';
$edit_pwd = 'pr0ce553d17';
define('MB', 1048576);

$con = mysqli_connect($DB_HOST,$DB_USER,$DB_PASSWD);
if(!$con){
    echo 'Error: c'.mysqli_error($con);
} else {
    $db = mysqli_select_db($con, $DB_BASE);
    if(!$db){
        echo 'Failed to connect to the Database with Error: '.mysqli_error($con);
    }
}
?>
