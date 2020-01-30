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
    $c = 'select credit from rent_credit where ten_nin = "' . $ten_nin . '"';
    $c = mysqli_query($con, $c);
    if (mysqli_num_rows($c) != 0) {
        $amtPd += intval(mysqli_fetch_assoc($c)['credit']);
        mysqli_query($con, 'delete from rent_credit where ten_nin = "' . $ten_nin . '"');
    }
    $tn = 'select * from pay_info where ten_nin = "' . $ten_nin . '"';
    $tn = mysqli_query($con, $tn);
    if (mysqli_num_rows($tn) != 0) {
        $mlp = mysqli_fetch_assoc($tn)['month_last_paid'];
        $df = 'select * from defaulters_rent where ten_nin = "' . $ten_nin . '"';
        $df = mysqli_query($con, $df);
        if (mysqli_num_rows($df) != 0) {
            $da = mysqli_fetch_assoc($df);
            $ad = $da['amt_defaulted'];
            $fm = $da['for_mth'];
            if ($ad <= $amtPd) {
                $amtPd -= $da['amt_defaulted'];
                mysqli_query($con, 'delete from defaulters_rent where ten_nin = "' . $ten_nin . '"');
                $response['msg'] = 'All rent arrears have been cleared';
            } else if ($ad > $amtPd) {
                $amtPd -= $da['amt_defaulted'];
                mysqli_query($con, 'update defaulters_rent set amt_defaulted = "' . -($amtPd) . '" where ten_nin = "' . $ten_nin . '"');
                $response['msg'] = 'Client still has unpaid arrears totaling to ' . -($amtPd) . '/=';
                $amtPd = 0;
            }
            if ($amtPd > 0) {
                if ($amtPd >= $rpm) {
                    $p = 'insert into payment_details(ten_nin, receiptNo, amt_pd, date_pd, processedBy) values ("' . $ten_nin . '", "' . $receiptNo . '", "' . $amtPd . '", "' . datetime($datePd, "ts") . '", "' . $admin . '")';
                    $p = mysqli_query($con, $p);
                    if ($p) {
                        $tn = 'select * from pay_info where ten_nin = "' . $ten_nin . '"';
                        $tn = mysqli_query($con, $tn);
                        if (mysqli_num_rows($tn) != 0) {
                            $response['payload'] = 'Previous payments found';
                        } else {
                            $num_mths = $amtPd / $rpm;
                            $pi = 'insert into pay_info(ten_nin, days_left, current_month, month_last_paid, mths_paid_left, mths_pd_for) values("' . $ten_nin . '",0,0,"' . datetime($datePd, "m") . '","' . $num_mths . '","' . $num_mths . '")';
                            $pi = mysqli_query($con, $pi);
                            if ($pi) {
                                $df = 'select * from defaulters_rent where ten_nin = "' . $ten_nin . '"';
                                $df = mysqli_query($con, $df);
                                if (mysqli_num_rows($df) != 0) {
                                    $da = mysqli_fetch_assoc($df);
                                    $ad = $da['amt_defaulted'];
                                    $response['payload'] = $da;
                                } else {
                                    $response['error'] = mysqli_error($con);
                                }
                            } else {
                                $response['error'] = mysqli_error($con);
                            }
                        }
                        if ($amtPd - ($rpm * $num_mths) > 0) {
                            $credit = 'insert into rent_credit(ten_nin, credit) values("' . $ten_nin . '", "' . $amtPd . '")';
                            mysqli_query($con, $credit);
                            $response['success'] = true;
                            $response['error'] = '';
                        }
                    } else {
                        $reponse['error'] = mysqli_error($con);
                    }
                } else {
                    $credit = 'insert into rent_credit(ten_nin, credit) values("' . $ten_nin . '", "' . $amtPd . '")';
                    mysqli_query($con, $credit);
                    $response['success'] = true;
                    $response['error'] = '';
                }
            } else {
                mysqli_query($con, 'update pay_info set month_last_paid = "'.datetime($datePd, 'm').'" where ten_nin = "'.$ten_nin.'"');
            }
        } else {
            $response['error'] = mysqli_error($con);
        }
    } else {
        $p = 'insert into payment_details(ten_nin, receiptNo, amt_pd, date_pd, processedBy) values ("' . $ten_nin . '", "' . $receiptNo . '", "' . $amtPd . '", "' . datetime($datePd, "ts") . '", "' . $admin . '")';
        $p = mysqli_query($con, $p);
        if ($p) {
            $tn = 'select * from pay_info where ten_nin = "' . $ten_nin . '"';
            $tn = mysqli_query($con, $tn);
            if (mysqli_num_rows($tn) != 0) {
                $response['payload'] = 'Previous payments found';
            } else {
                $num_mths = $amtPd / $rpm;
                $pi = 'insert into pay_info(ten_nin, days_left, current_month, year_last_paid, month_last_paid, mths_paid_left) values("' . $ten_nin . '",0,0,"' . datetime($datePd, "y") . '", "' . datetime($datePd, "m") . '","' . $num_mths . '")';
                $pi = mysqli_query($con, $pi);
                if ($pi) {
                    $df = 'select * from defaulters_rent where ten_nin = "' . $ten_nin . '"';
                    $df = mysqli_query($con, $df);
                    if (mysqli_num_rows($df) != 0) {
                        $da = mysqli_fetch_assoc($df);
                        $ad = $da['amt_defaulted'];
                        $response['payload'] = $da;
                    } else {
                        $response['error'] = mysqli_error($con);
                    }
                } else {
                    $response['error'] = mysqli_error($con);
                }
            }
        } else {
            $reponse['error'] = mysqli_error($con);
        }
    }
    echo json_encode($response);
} else {
    echo 'Direct Script access denied!';
}

function datetime($date, $ts)
{
    if ($ts == "ts")
        return (new DateTime($date))->format('Y-m-d H:i:s.u');
    else if ($ts == "m")
        return explode('/', $date)[1];
    elseif ($ts == 'y') {
        return explode('/', $date)[0];
    } else return null;
}
