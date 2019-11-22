<?php
require_once('../db.inc.php');
$files = null;
$user_id = null;
$response = array();
define('MB', 1048576);
$dates = DateTime::createFromFormat('U.u', microtime(true));
$datename = $dates->format('Y-m-d H:i:s.u');
$date = new DateTime();
$date = implode('', explode('-', $date->format('Y-m-d-H-i-s')));
// echo 'Date for timestamp:'.$datename.'<br>Date for name:'.$date.'<br>';
// $date = microtime();
// $datef = explode(' ', $date);
// $date = date('Y-m-d H:i:s', $datef[1]);
// $micro = sprintf('%06d');
// echo $date.':'.$datef[0].'<br>';
// echo sprintf('%d:%.5f',explode(' ', $date)[1],explode(' ', $date)[0]*100);
if (!empty($_FILES['files']) && !empty($_POST['user_id'])) {
    echo 'Files';
    $files = $_FILES['files'];
    $user_id = mysqli_real_escape_string($con, $_POST['user_id']);
    $target_dir = "images/";
    $img_dir = "/includes/cli/images/";
    $target_file_name = $date.'_'.basename($files['name']);
    $target_file = $target_dir . $target_file_name;
    $upOk = 1;
    $file_size = $files['size'];
    if ($file_size > 5 * MB) {
        $response['success'] = false;
        $response['error'] = "The image size is too big to upload as profile image!";
    } else {
        if (move_uploaded_file($files['tmp_name'], $target_file)) {
            $check = 'select ten_img_id, ten_img_location, ten_img_name from tenant_images where ten_img_id = (select ten_img_id from tenant_details where ten_nin = "' . $user_id . '")';
            $check = mysqli_query($con, $check);
            if (mysqli_num_rows($check) == 0) {
                $upload = 'insert into tenant_images values("' . $datename . '","' . $img_dir . '","' . $target_file_name . '")';
                $upload = mysqli_query($con, $upload);
                if ($upload) {
                    $update = 'update tenant_details set ten_img_id = "' . $datename . '" where ten_nin = "' . $user_id . '"';
                    $update = mysqli_query($con, $update);
                    if ($update) {
                        $response['success'] = true;
                        $response['error'] = "";
                    }
                } else {
                    $response['success'] = false;
                    $response['error'] = mysqli_error($con);
                }
            } else {
                $i = mysqli_fetch_assoc($check)['ten_img_id'];
                $upload = 'update tenant_images set ten_img_location = "' . $img_dir . '" where ten_img_id = "' . $i . '"';
                $upload = mysqli_query($con, $upload);
                if ($upload) {
                    $upload = 'update tenant_images set ten_img_name = "' . $target_file_name . '" where ten_img_id = "' . $i . '"';
                    $upload = mysqli_query($con, $upload);
                    if ($upload) {
                        $update = "update tenant_details set ten_img_id = '" . $datename . '"';
                        $update = mysqli_query($con, $update);
                        if ($update) {
                            $response['success'] = true;
                            $response['error'] = "";
                        } else {
                            $response['success'] = false;
                            $response['error'] = mysqli_error($con);
                        }
                    } else {
                        $response['success'] = false;
                        $response['error'] = mysqli_error($con);
                    }
                } else {
                    $response['success'] = false;
                    $response['error'] = mysqli_error($con);
                }
            }
        } else {
            $response['success'] = false;
            $response['error'] = "Check your internet connection! Then try again!";
        }
    }
} else {
    $response['success'] = false;
    $response['error'] = "Please select an Image and try again!";
}
sleep(2);
echo json_encode($response);
?>