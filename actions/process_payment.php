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
    $tenDet = json_decode($_POST['tenDetails']);
    $cm = (mysqli_fetch_assoc(mysqli_query($con, 'select MONTH(NOW()) limit 1')))['MONTH(NOW())'];
    $cy = mysqli_fetch_assoc(mysqli_query($con, 'select YEAR(NOW()) limit 1'))['YEAR(NOW())'];
    if($tenDet->rent_info->rent_credit > 0) {
        $amtPd += $tenDet->rent_info->rent_credit;
        curlpost('https://www.tms.lan/actions/updateDefAmount.php', 'POST', ['tNIN'=> $ten_nin, 'type'=>'credit']);
    }
    if($tenDet->rent_info->defaulted_amt > $amtPd) {
        $tenDet->rent_info->defaulted_amt -= $amtPd;
        curlpost('https://www.tms.lan/actions/updateDefAmount.php', 'POST', ['tNIN'=> $ten_nin, 'did'=>$tenDet->rent_info->d_id, 'ad'=>$tenDet->rent_info->defaulted_amt, 'type'=>'def']);
        $response['success'] = true;
        unset($response['error']);
        $response['msg'] = 'The paid rent is used to clear part of the defaulted Amount. <hr>Your Current Defaulted amount is: '.$tenDet->rent_info->defaulted_amt;
    } else if($tenDet->rent_info->defaulted_amt < $amtPd){
        $amtPd -= $tenDet->rent_info->defaulted_amt;
        curlpost('https://www.tms.lan/actions/updateDefAmount.php', 'POST', ['tNIN'=> $ten_nin, 'did'=>$tenDet->rent_info->d_id, 'ad'=>$tenDet->rent_info->defaulted_amt, 'type'=>'def']);
        $response['success'] = true;
        $response['info'] = 'The paid rent was used to clear the defaulted Amount. <hr>Your Current Defaulted amount is: '.$tenDet->rent_info->defaulted_amt;
    }
    echo json_encode($response);
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

function curlpost($url = '', $type = 'POST', $data = NULL){
    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    if(!empty($data)) {
        curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $type);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($data));
    }
    $response = curl_exec($ch);
    if(curl_error($ch)){
        trigger_error('Curl Error: '.curl_error($ch));
    }

    curl_close($ch);
    return $response;
}