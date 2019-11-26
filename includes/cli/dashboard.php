<?php
function monthname($val)
{
    $months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    return $months[$val - 1];
}
function monthdays($val)
{
    $days = ['31', '28', '31', '30', '31', '30', '31', '31', '30', '31', '30', '31'];
    return $days[$val - 1];
}
session_start();
include_once('../db.inc.php');
$def_amt = 0;
$det = 'select * from tenant_details where ten_nin = "' . $_SESSION['id'] . '"';
$det = mysqli_query($con, $det);
$details = mysqli_fetch_assoc($det);
$rentinfo = 'select * from house_info where house_id = (select house_id from rentals_info where rentedBy = "' . $_SESSION['id'] . '")';
$rentinfo = mysqli_query($con, $rentinfo);
$housenum = mysqli_fetch_assoc($rentinfo);
$house_num = $housenum['house_number'];
$house_loc = $housenum['house_location'];
$rpm = $housenum['amt_per_mth'];
$p_info = 'select * from pay_info where ten_nin = "' . $_SESSION['id'] . '"';
$p_info = mysqli_query($con, $p_info);
$pay_info = mysqli_fetch_assoc($p_info); 
if(mysqli_num_rows($p_info) != 0){
    $mpl = $pay_info['month_last_paid'];
    $cur_mth = mysqli_fetch_assoc(mysqli_query($con, 'select MONTH(NOW()) limit 1'))['MONTH(NOW())'];
    if (intval($mpl) < intval($cur_mth)) {
        $d =  intval($cur_mth) - intval($mpl);
        $df = mysqli_query($con, 'select * from defaulters_rent where ten_nin = "' . $_SESSION['id'] . '"');
        if (mysqli_num_rows($df) != 0) {
            $de = mysqli_fetch_assoc($df);
            if (intval($de['for_mth']) != intval($cur_mth)) {
                $amt_def = $de['amt_defaulted'] + intval($rpm * $d);
                mysqli_query($con, 'update defaulters_rent set amt_defaulted ="' . intval($amt_def) . '" where ten_nin = "' . $_SESSION['id'] . '"');
                mysqli_query($con, 'update defaulters_rent set for_mth ="' . intval($cur_mth) . '" where ten_nin = "' . $_SESSION['id'] . '"');
            }
        } else {
            $def = mysqli_query($con, 'insert into defaulters_rent (ten_nin, amt_defaulted, for_mth) values("' . $_SESSION['id'] . '","' . $d * $rpm . '", "' . $cur_mth . '")');
            echo mysqli_error($con);
        }
        $mths_pd = 'You have rent arrears!';
        $days_left = 'You have rent arrears!';
        $def_amt = mysqli_fetch_assoc(mysqli_query($con, 'select * from defaulters_rent where ten_nin = "' . $_SESSION['id'] . '"'))['amt_defaulted'];
    } else {
        $num_days = monthdays($cur_mth);
        $mthspd = array();
        $cur_day = (mysqli_fetch_assoc(mysqli_query($con, 'select DAY(NOW()) limit 1')))['DAY(NOW())'];
        $days_left = $num_days - intval($cur_day);
        $mths_pd_left = $pay_info["mths_paid_left"] + 1;
        $count = 1;
        $mth = $cur_mth;
        while ($mths_pd_left > 0) {
            if ($mth > 12) {
                $mth = 1;
                $mthspd[$count] = monthname($mth);
                if ($mth != $cur_mth) $days_left += monthdays($mth);
                $mth += 1;
            } else {
                $mthspd[$count] = monthname($mth);
                if ($mth != $cur_mth) $days_left += monthdays($mth);
                $mth += 1;
            }
            $count++;
            $mths_pd_left--;
        }
        $mths_pd = implode(", ", $mthspd);
        mysqli_query($con, 'update pay_info set mths_paid_left = "' . intval($cur_mth) - intval($mpl) . '" where ten_nin = "' . $_SESSION['id'] . '"');
        mysqli_query($con, 'update pay_info set days_left = ' . $days_left . ' where ten_nin = "' . $_SESSION['id'] . '"');
    }
    mysqli_query($con, 'update pay_info set current_month = "' . $cur_mth . '"');
} else {
    $mths_pd = "No data";
    $days_left = "No data";
    $def_amt = "No data";
}
?>
<style>
    .upload_btn:hover,
    .empty:hover {
        background-color: grey;
        opacity: 0.5;
        transition: ease 1s;
        color: white;
        cursor: pointer;
    }

    .upload_btn span.text_btn {
        border: 2px double beige;
        padding: 5px;
        border-radius: 30px;
        cursor: pointer;
    }

    .upload_btn span.text_btn:hover {
        background-color: #FAFAFA;
        color: #0F0F0F;
        cursor: pointer;
        opacity: 0.8 !important;
        transition: all 1s;
    }
</style>
<script>
    $('.empty').on('click', _ => {
        $('.tms-modal#id03').css({
            display: 'block'
        })
    })
</script>
<div class="dashb-content">
    <?php
    $img = 'select * from tenant_images where ten_img_id = "' . $details['ten_img_id'] . '"';
    $img = mysqli_query($con, $img);
    $image = mysqli_fetch_assoc($img);
    $image_view = $image['ten_img_location'] . $image['ten_img_name'];
    ?>
    <div class="dashb-ten-img <?php echo mysqli_num_rows($img) == 0 ? "empty" : null; ?>">
        <?php
        $img = 'select * from tenant_images where ten_img_id = "' . $details['ten_img_id'] . '"';
        $img = mysqli_query($con, $img);
        $image = mysqli_fetch_assoc($img);
        $image_view = $image['ten_img_location'] . $image['ten_img_name'];
        if (mysqli_num_rows($img) == 0) {
            ?>
            <img src="/images/img_avatar2.png" alt="Tests image" height="120px" width="130px" <?php if (mysqli_num_rows($img) > 0) echo 'style="display:none;"'; ?>>
            <div class="upload_btn" style="z-index:9999;height:120px;width:130px;margin-top: -110px;margin-left: -16px;border-radius: 40%;padding: 50px 0px;">
                <span class="text_btn">Upload Image</span>
            </div>
        <?php
        } else if (mysqli_num_rows($img) > 0) {
            echo '<img src="' . $image_view . '" alt="' . $_SESSION['fName'] . '`s image" height="120px" width="130px">';
        }
        ?>
    </div>
    <div class="left">
        <div class="mths-pd">
            <label for="mths-pd" style="color:green">Months Paid for currently:</label><br>
            <textarea type="text" word-break="" name="mths-pd" id="mths-pd" style="text-align:center;border:1px solid green;padding:5px;border-radius:5px;background-color:transparent;" readonly="yes" cols="19" rows="2"><?php echo $mths_pd; ?></textarea>
        </div>
        <div class="outstanding-bal">
            <label for="outstanding-bal">Outstanding total balance:</label><br>
            <input type="text" name="outstanding-bal" id="outstanding-bal" style="text-align:center;border:1px solid crimson;padding:5px;border-radius:5px;background-color:transparent" readonly value="<?php echo $def_amt.is_nan($def_amt) ? $def_amt : $def_amt.'/=';?>">
        </div>
        <div class="days_left">
            <label for="days_left">Days left to end of paid period:</label><br>
            <input type="text" name="days_left" id="days_left" style="text-align:center;border:1px solid orange;padding:5px;border-radius:5px;background-color:transparent" readonly="yes" value="<?php echo $days_left; ?>">
        </div>
    </div>
    <div class="right">
        <table class="house_details">
            <tr class="location">
                <td class="location labelt">House Location: </td>
                <td class="location value"><?php echo $house_loc; ?></td>
            </tr>
            <tr style="padding:70px"></tr>
            <tr class="number">
                <td class="number labelt">House Number: </td>
                <td class="number value"><?php echo $house_num; ?></td>
            </tr>
            <tr class="rnt-per-month">
                <td class="rnt-per-month labelt">Rent per month: </td>
                <td class="rnt-per-month value"><?php echo $rpm; ?></td>
            </tr>
        </table>
        <div class="house_details_small_scr">
            <div class="location l">
                <div class="location labelt">House Location</div>
            </div>
            <div class="location v">
                <div class="location value"><?php echo $house_loc; ?></div>
            </div>
            <div class="sep">&nbsp;</div>
            <div class="number l">
                <div class="number labelt">House Number</div>
            </div>
            <div class="number v">
                <div class="number value"><?php echo $house_num; ?></div>
            </div>
            <div class="sep">&nbsp;</div>
            <div class="rnt-per-month l">
                <div class="rnt-per-month labelt">Rent per month</div>
            </div>
            <div class="rnt-per-month v">
                <div class="rnt-per-month value"><?php echo $rpm; ?></div>
            </div>
        </div>
    </div>
</div>
<style>
    #mths-pd {
        resize: none;
    }
</style>