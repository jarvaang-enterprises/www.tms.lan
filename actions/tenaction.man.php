<?php
/** TODO
 * Ten details remove house_id in tenant_details
 * Set isRented to false in rentals_info
 * Update tenant_info [date_entered, date_left, house_id]
 */
require_once('./../includes/db.inc.php');
$data = file_get_contents('php://input');
$resp = array();
if ($_SERVER['REQUEST_METHOD'] == 'DELETE') {
    parse_str($data, $_DELETE);
    $tn = $_DELETE['tNIN'];
    $hno = $_DELETE['hId'];
    $hno = mysqli_fetch_assoc(mysqli_query($con, "select house_id from house_info where house_number = $hno"))['house_id'];
    $init = "update tenant_details set house_id = NULL where ten_nin = '{$tn}'";
    $init2 = "update rentals_info set isRented = 0 where house_id = {$hno}";
    $dl = datetime(str_replace('T', ' ', date('d-m-Y\TH:i:s')), 'ts');
    $de = datetime('09-05-2018 14:24:00', 'ts');
    $c3 = "select * from tenant_info where ten_id = '$tn'";
    if (mysqli_num_rows(mysqli_query($con, $c3)) != 0)
        $init3 = "update tenant_info set date_left = '$dl' where ten_id = '$tn'";
    else {
        $init3 = "insert into tenant_info (ten_id, date_entered, date_left, house_id) values('$tn', '$de', '$dl', $hno)";
    }
    $init = mysqli_query($con, $init);
    if (!$init) {
        $resp['err1'] = mysqli_error($con);
        die(json_encode($resp));
    }
    $init = mysqli_query($con, $init2);
    if (!$init) {
        $resp['init2'] = $init2;
        $resp['err2'] = mysqli_error($con);
        die(json_encode($resp));
    }
    $init = mysqli_query($con, $init3);
    if (!$init) {
        $resp['init3'] = $init3;
        $resp['err3'] = mysqli_error($con);
        die(json_encode($resp));
    }
    $resp['status'] = 'OK';
    $resp['msg'] = 'Tenant Successfully removed';
    echo json_encode($resp);
} else if ($_SERVER['REQUEST_METHOD'] == 'PUT') {
    parse_str($data, $_PUT);
    var_dump($_PUT);
} else {
    echo json_encode(
        array(
            'status' => 403,
            'advice' => 'Illegal access method!'
        )
    );
}
function datetime($date, $ts)
{
    if ($ts == "ts")
        return (new DateTime($date))->format('Y-m-d H:i:s');
    else if ($ts == "m") {
        return intval(explode('/', explode(' ', $date)[0])[0]);
    } else if ($ts == 'y') {
        return intval(explode('/', explode(' ', $date)[0])[2]);
    } else return null;
}
