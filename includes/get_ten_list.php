<?php
    require_once('db.inc.php');
    $t_list = 'select ten_nin, ten_img_id from tenant_details';
    $t_list = mysqli_query($con, $t_list);
    if(mysqli_num_rows($t_list) <= 0){?>
        <div class='ten_list_table empty'>There currently no tenants inhabiting your houses</div>
        <?php
    } else {?>
        <div class='ten_list_table contains'>
            <table border=1>
                <tr class='tenant_header'>
                    <td class="ten_num">Num.</td>
                    <td class="ten_f_name">First Name</td>
                    <td class="ten_l_name">Last Name</td>
                    <td class="ten_image">Tenant Image</td>
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
                $image = '<img src="'.$img_data['ten_img_location'].$img_data['ten_img_name'].'" width="100px" height="100px" />';
            } else {
                $image = "<img src='/images/img_avatar2.png' width='100px' height='100px' />";
            }
            ?>
        
            <tr class='tenant-record'>
                <td class="ten_num"><?php echo $count; ?></td>
                <td class="ten_f_name"><?php echo $names_data['fName'];?></td>
                <td class="ten_l_name"><?php echo $names_data['lName'];?></td>
                <td class="tenant_image"><?php echo $image?></td>
            </tr>
        <?php
        $count += 1;
        }?>
        </table></div><?php
    }
    ?>