<link rel="stylesheet" href="https://cdn.tms-dist.lan:433/styles/css/custom.css" type="text/css" />
<?php
    require_once('db.inc.php');
    $t_list = 'select ten_nin, ten_img_id from tenant_details';
    $t_list = mysqli_query($con, $t_list);
    if(mysqli_num_rows($t_list) <= 0){?>
        <div class='ten_list_table empty'>There currently no tenants inhabiting your houses</div>
        <?php
    } else {?>
        <div class='ten_list_table contains col-md-12 col-xs-12' style="background-color:chocolate;padding: 15px;border-radius:15px;margin-bottom: 30px;">
            <table border=1 class="col-xs-12 col-md-12 col-lg-12">
                <tr class='tenant_header' style="font-size:20px; color:antiquewhite;text-align:center">
                    <td class="ten_num">Num.</td>
                    <td class="ten_f_name">First Name</td>
                    <td class="ten_l_name">Last Name</td>
                    <td class="ten_image">Tenant Image</td>
                    <td class="pd_mths">Paid Months</td>
                </tr>
                <?php
                $count = 0;
        while($q = mysqli_fetch_assoc($t_list)){
            $names = 'select fName, lName from NINS where NIN ="'.$q['ten_nin'].'"';
            $names = mysqli_query($con, $names);
            $names_data = mysqli_fetch_assoc($names);
            $img = 'select ten_img_location, ten_img_name from tenant_images where ten_img_id = "'.$q['ten_img_id'].'"';
            $img = mysqli_query($con, $img);
            if(mysqli_num_rows($img) != 0){
                $img_data = mysqli_fetch_assoc($img);
                $image = '<img style="border-radius:50px" src="'.$img_data['ten_img_location'].$img_data['ten_img_name'].'" width="100px" height="100px" />';
            } else {
                $image = "<img style='border-radius:50px' src='/images/img_avatar2.png' width='100px' height='100px' />";
            }
            ?>
        
            <tr class='tenant-record tms-center' style="border-radius:12px">
                <td class="ten_num tms-center" style="color:darkslategrey;width:auto"><?php echo $count; ?></td>
                <td class="ten_f_name tms-center" style="color:darkslategrey;width:auto"><?php echo $names_data['fName'];?></td>
                <td class="ten_l_name tms-center" style="color:darkslategrey;width:auto"><?php echo $names_data['lName'];?></td>
                <td class="tenant_image tms-center" style="color:darkslategrey;width:auto"><?php echo $image?></td>
                <td class="tenant_pd_mths tms_center" style="color:darkslategrey;width:auto"></td>
            </tr>
        <?php
        $count += 1;
        }?>
        </table></div><?php
    }
    ?>