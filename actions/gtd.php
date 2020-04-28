<?php
include_once('../includes/db.inc.php');
$rest = array();
if ($_SERVER['REQUEST_METHOD'] != 'POST') {
    $rest['err'] = 'Direct script access is denied';
} else {
    if ($_POST['ver'] != 'Zm9ydGhlbG92ZW9mdG1zKGMpcGxlYXNlZG9ub3R1c2VzdHlsaW5nc2Vsc2V3aGVyZQ==') {
        $rest['err'] = 'Script is missing required verification parameters';
    } else {
        if (base64_decode($_POST['t']) == 'ten_name') {
            $rest['_info'] = 'Provided Tenant Name!';
            $init = 'select * from NINS where fName = "' . base64_decode($_POST['sp']) . '"';
            $init = mysqli_query($con, $init);
            if (!$init) {
                $rest['err'] = mysqli_error($con);
            } else {
                if (mysqli_num_rows($init) == 0) {
                    $init = 'select * from NINS where lName = "' . base64_decode($_POST['sp']) . '"';
                    $init = mysqli_query($con, $init);
                    if (!$init) {
                        $rest['err'] = mysqli_error($con);
                    } else {
                        if (mysqli_num_rows($init) == 0) {
                            $rest['err'] = "Confirm Tenant Name entered in Search box";
                        } else {
                            $data = mysqli_fetch_assoc($init);
                            $_names = $data['fName'] . ' ' . $data['lName'];
                            $rest['_teninfo']['n'] = $_names;
                            $rest['_teninfo']['nin'] = $data['NIN'];
                        }
                    }
                } else {
                    $data = mysqli_fetch_assoc($init);
                    $_names = $data['fName'] . ' ' . $data['lName'];
                    $rest['_teninfo']['n'] = $_names;
                    $rest['_teninfo']['nin'] = $data['NIN'];
                }
            }
        } else if (base64_decode($_POST['t']) == 'cust_no') {
            $rest['_info'] = 'Provided Water Customer Number!';
            $init = 'select * from services where water_cust_no = "' . base64_decode($_POST['sp']) . '"';
            $init = mysqli_query($con, $init);
            if (!$init) die(mysqli_error($con));
            if (mysqli_num_rows($init) == 0) {
                $rest['err'] = "The provided number doesn't belong to our premises!";
            } else {
                $init_data = mysqli_fetch_assoc($init);
                $nin_s = 'select * from tenant_details where house_id = "' . $init_data['service_id'] . '"';
                $nin_s = mysqli_query($con, $nin_s);
                if (!$nin_s) die(mysqli_error($con));
                if (mysqli_num_rows($nin_s) == 0) {
                    $rest['err'] = "Currently no tenant resides in the premise holding the provided number!";
                } else {
                    $nin_s_data = mysqli_fetch_assoc($nin_s);
                    $n = 'select * from NINS where NIN = "' . $nin_s_data['ten_nin'] . '"';
                    $n = mysqli_query($con, $n);
                    if (!$n) die(mysqli_error($con));
                    if (mysqli_num_rows($n) == 0)
                        $rest['err'] = "The tenant data has discrepancies that need to be corrected!";
                    else {
                        $img = mysqli_fetch_assoc(mysqli_query($con, 'select ten_img_location, ten_img_name from tenant_images where ten_img_location = "' . $nin_s_data['ten_img_id']));
                        $house = mysqli_fetch_assoc(mysqli_query($con, 'select * from house_info where house_id = "' . $init_data['service_id'] . '"'));
                        $data = mysqli_fetch_assoc($n);
                        $rest['_teninfo']['fn'] = $data['fName'];
                        $rest['_teninfo']['fl'] = $data['lName'];
                        $rest['_teninfo']['nin'] = $data['NIN'];
                        $rest['_teninfo']['cont_mobile'] = $nin_s_data['ten_contact'];
                        $rest['_teninfo']['email'] = $nin_s_data['ten_email'];
                        if ($img != null)
                            $rest['_teninfo']['img'] = $img['ten_img_location'] . $img['ten_img_name'];
                        else
                            $rest['_teninfo']['img'] = '/images/img_avatar2.png';
                        $rest['_teninfo']['h_no'] = $house['house_number'];
                        $rest['_teninfo']['h_loc'] = $house['house_location'];
                        $rest['_teninfo']['apm'] = $house['amt_per_mth'];
                        $rest['_teninfo']['water_m'] = $init_data['water_meter_no'];
                        $rest['_teninfo']['water_c'] = $init_data['water_cust_no'];
                        $rest['_teninfo']['yaka'] = $init_data['Umeme_no'];
                    }
                } 
            } 
        } else if (base64_decode($_POST['t']) == 'ten_nin') {
            $rest['_info'] = 'Provided National ID Number!';
        } else if (base64_decode($_POST['t']) == 'yaka_no') {
            $rest['_info'] = 'Provided YAKA Meter Number!';
        }
    }
}
echo json_encode($rest);
