<?php
session_start();
require_once('../../includes/db.inc.php');
    $response = array();
    $email = mysqli_real_escape_string($con, $_POST['user']);
    $password = mysqli_real_escape_string($con, $_POST['passwd']);
    $sql = 'select pass, level from accounts where username = "'.$email.'"';
    $sql = mysqli_query($con,$sql);
    $result = mysqli_fetch_assoc($sql);
    if(mysqli_num_rows($sql) == 0){
	$response['status'] = 1;
	$response['msg-en'] = "User doesn't exist on the platform";
	$response['msg-ug'] = "Akawunta eyo tetujirina ku sisitimu.";
    } else {
        if(md5($password) == $result['pass']){
            $response['status'] = 0;
            $response['rights'] = $result['level'];
            $sqls = 'select NIN from accounts where username = "'.$email.'"';
            $sqls = mysqli_query($con,$sqls);
            $results = mysqli_fetch_assoc($sqls);
	        $response['id'] = $results['NIN'];
            $sql = 'select fName, lName from NINS where NIN = "'.$results['NIN'].'"';
            $sql = mysqli_query($con,$sql);
            $id = 'select ten_img_id from tenant_details where ten_nin = "'.$results['NIN'].'"';
            $id = mysqli_query($con,$id);
            $results = mysqli_fetch_assoc($sql);
            $ten_img = mysqli_fetch_assoc($id);
            $img = 'select ten_img_location, ten_img_name from tenant_images where ten_img_id = "'.$ten_img['ten_img_id'].'"';
            $imgs = mysqli_query($con,$img);
            if(mysqli_num_rows($imgs) != 0){
                $data = mysqli_fetch_assoc($imgs);
                $response['photoUrl'] = "http://".$_SERVER['SERVER_ADDR']."/".$data['ten_img_location'].$data['ten_img_name'];
            } else $response['photoUrl'] = "http://".$_SERVER['SERVER_ADDR']."/images/img_avatar2.png";
            $response['user'] = $results['fName'].' '.$results['lName'];
            sleep(5);
        }else if($result['pass'] == NULL) {
            $response['status'] = 3;
            $response['msg-en'] = "You need to change your password";
            $response['msg-ug'] = "Wetaaga okukyuusa paasiwaadi yo.";
        }
        else {
            $response['status'] = 2;
            $response['msg-en'] = "Your password is wrong. Try Again!";
            $response['msg-ug'] = "Paasiwaadi yo nfu. Gezaako eddako!";
        }
    }
    echo json_encode($response);
