<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.tms-dist.lan:433/styles/css/bootstrap.min.css">
<script src="https://cdn.tms-dist.lan:433/styles/js/jquery-3.4.1.min.js"></script>
<style>
    body {
        margin: 15px;
    }

    tr th {
        padding: 0px 5px !important;
        text-align: center;
    }

    tr td {
        width: auto;
        text-align: center;
        padding: 0px 5px;
    }

    .options:hover {
        cursor: pointer;
        
    }
</style>
<script>
    function check(e) {
        e.firstChild.checked = true
    }
    $('#search').on('submit', (e) => {
        e.preventDefault()
        log($('#search-field').serializeArray())
        log(e.target)
    })
</script>

<body id="body">
    <div id="search" style="float: right; width: 135px;border: 0px grey solid; padding: 0px 10px; border-radius: 7px; transition: all 0.5s ease 0.5s;">
        <div style="background-color: #8a2be2; top: -12px; left: 10px; padding: 2px 5px; width: max-content; position: relative; cursor: default">
            <span id="legend" style="background-color: grey; padding: 3px; border-radius: 10px">Tenant Search</span>
        </div>
        <form action="" method="get" id="search" enctype="multipart/form-data" style="float: right; display:none">
            <div class="field-wrapper">
                <input type="search" name="search" id="search-field" class="form-control input-lg">
                <div class="field-placeholder">
                    <span>Enter Search Criteria: </span>
                </div>
            </div>
            <span onclick="check(this)" class="options"><input type="radio" name="type" id="ten_name">&nbsp;Tenant Name </span></br>
            <span onclick="check(this)" class="options"><input type="radio" name="type" id="cust_no">&nbsp;Water Customer Number </span><br>
            <span onclick="check(this)" class="options"><input type="radio" name="type" id="ten_nin">&nbsp;Tenant NIN </span><br>
            <span onclick="check(this)" class="options"><input type="radio" name="type" id="yaka_no">&nbsp;YAKA Number </span><br>
            <button type="submit" class="tms-button tms-search tms-section tms-block">Search Tenant</button>
        </form>
    </div>
    <script>
        $('span#legend').on('click', _=>{
            $('div#search').css({ 
                'width': 'max-content',
                'border': '1px grey solid',
            })
            $('form#search').css({ 'display': 'block'})
            $('span#legend').removeAttr('style')
        })
    </script>
    <?php
    require_once '../includes/db.inc.php';
    $h_i = 'SELECT * FROM house_info ORDER BY house_location DESC';
    $h_i = mysqli_query($con, $h_i);
    ?>
    <!-- January 2019 Tenants Contacts<br><br> -->
    <table border=1 style="width:auto; display: block">
        <tr>
            <th style="padding: 5px">Location</th>
            <th style="padding: 5px">House #</th>
            <th style="padding: 5px">Name of tenant</th>
            <th style="padding: 5px">Ten Contact</th>
            <th style="padding: 5px" colspan=2>NWSC #</th>
            <th style="padding: 5px">UMEME #</th>
        </tr>
        <tr>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th>Customer #</th>
            <th>Meter #</th>
            <th></th>
        </tr>
        <?php
        while (($row = mysqli_fetch_assoc($h_i)) != null) {
            ?>
            <tr>
                <?php
                    $pl = $row['house_location'];
                    if ($pl == 'Kyengera') echo '<th>' . $row['Description'] . '</th>';
                    else echo '<th>' . $row['house_location'] . '</th>';
                    echo '<td>';
                    if ($pl == 'Luweero') echo 'L' . $row['house_number'];
                    else echo 'H' . $row['house_number'];
                    echo '</td>';
                    $td = 'SELECT * FROM nins where NIN = (SELECT ten_nin FROM tenant_details where house_id = (select house_id from house_info where house_number = "' . $row['house_number'] . '" AND house_location = "' . $row['house_location'] . '") limit 1)';
                    $dt = mysqli_query($con, $td);
                    if (!$dt) die(mysqli_error(mysqli_query($con, 'SELECT * FROM nins where NIN = (SELECT ten_nin FROM tenant_details where house_id = (select house_id from house_info where house_number = ' . $row['house_number'] . ' AND house_location = ' . $row['house_location'] . '))')));
                    $td = mysqli_fetch_assoc($dt);
                    echo '<td>' . $td['fName'] . ' ' . $td['lName'] . '</td>';
                    $tc = mysqli_query($con, 'SELECT ten_contact FROM tenant_details where house_id = (select house_id from house_info where house_number = "' . $row['house_number'] . '" AND house_location = "' . $row['house_location'] . '") limit 1');
                    $ct = mysqli_fetch_assoc($tc);
                    echo '<td>' . $ct['ten_contact'] . '</td>';
                    $sv = mysqli_query($con, 'SELECT * FROM services where service_id = (select house_id from house_info where house_number = "' . $row['house_number'] . '" AND house_location = "' . $row['house_location'] . '")');
                    $vs = mysqli_fetch_assoc($sv);
                    echo '<td>' . $vs['water_cust_no'] . '</td>';
                    echo '<td>' . $vs['water_meter_no'] . '</td>';
                    $sv = mysqli_query($con, 'SELECT * FROM services where service_id = (select house_id from house_info where house_number = "' . $row['house_number'] . '" AND house_location = "' . $row['house_location'] . '")');
                    $vs = mysqli_fetch_assoc($sv);
                    echo '<td>' . $vs['Umeme_no'] . '</td>';
                    ?>
            </tr>
        <?php
        }
        ?>
    </table>

    <script>
        $(function() {
            $(".field-wrapper .field-placeholder").on("click", function() {
                $(this).closest(".field-wrapper").find("input").focus();
            });
            $(".field-wrapper input").on("keyup", function() {
                var value = $.trim($(this).val());
                if (value) {
                    $(this).closest(".field-wrapper").addClass("hasValue");
                } else {
                    $(this).closest(".field-wrapper").removeClass("hasValue");
                }
            });
        });
    </script>
</body>