<?php
    require_once('db.inc.php');
    $t_list = 'select ten_f_name, ten_l_name, ten_img_id from tenant_details';
    $t_list = mysqli_query($con, $t_list);
    
    $html = '';
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
        while($q = mysqli_fetch_assoc($t_list)){?>
            <tr class='tenant-record'>
                <td class="ten_num"><?php echo $count; ?></td>
                <td class="ten_f_name"><?php echo $q['ten_f_name'];?></td>
                <td class="ten_l_name"><?php echo $q['ten_l_name'];?></td>
                <td class="tenant_image"><?php echo $q['ten_img_id'];?></td>
            </tr>
        <?php
        $count += 1;
        }?>
        </table></div><?php
    }
    ?>