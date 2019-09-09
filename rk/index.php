<?php
// Header file template
require('inc/header.inc.php');
$acc = 'Accomodation';
$browser = browser_name();
$o = $browser[1];
if(strpos(strtolower($o), 'iphone') == false){
} else if(strpos(strtolower($o), 'android') == false){
} else if(strpos(strtolower($o), 'windows phone') == false) {
} else {
    echo '<script>console.log("'.strtolower($browser[1]).'");</script>';
?>
<div class="loader"></div>
<?php
}
?>
<div class="bdy">
    <div class="wel-text">
        <div class="wel" id="wel">Welcome to Rent Kampala</div>

        <hr style="margin-top: 5px;margin-bottom:0px">
        <div class="linear-nav" style="display:block;margin-top:15px">
            <li class="navs hotels">
                <span class="txt">Hotel</span>
                <span class="sm-scr">Hot</span>
            </li>
            <hr style="margin:0px 0px;background-color:black">
            <li class="navs hostels">
                <span class="txt">Hostels</span>
                <span class="sm-scr">Host</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs accs">
                <span class="txt">Aparthotel</span>
                <span class="sm-scr">Ah</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Bed and breakfast</span>
                <span class="sm-scr">Bb</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Boat</span>
                <span class="sm-scr">Bt</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Campsite</span>
                <span class="sm-scr">Cs</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Chalet</span>
                <span class="sm-scr">Chal</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Country house</span>
                <span class="sm-scr">Ch</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Farm stay</span>
                <span class="sm-scr">Fs</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Guest house</span>
                <span class="sm-scr">Gh</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Vacation Rental</span>
                <span class="sm-scr">VR</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Holiday home</span>
                <span class="sm-scr">Hh</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Holiday park</span>
                <span class="sm-scr">Hp</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Inns</span>
                <span class="sm-scr">I</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Lodge</span>
                <span class="sm-scr">Ldg</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Motel</span>
                <span class="sm-scr">Mtl</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Resort</span>
                <span class="sm-scr">Rsrt</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Riad</span>
                <span class="sm-scr">Rd</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Ryokan</span>
                <span class="sm-scr">Rykn</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Luxury tent</span>
                <span class="sm-scr">Lt</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Villa</span>
                <span class="sm-scr">Vla</span>
            </li>
            <hr style="margin:0px 0px;">
            <li class="navs tc">
                <span class="txt">Other</span>
                <span class="sm-scr">Ot</span>
            </li>
            <hr style="margin:0px 0px;">
        </div>

        <div class="content" style="display: none">
            <div id="hostels" style="display:none">
                This is a list of all hostels in Kampala:
                <ul style="list-style:georgian" class="hostel-list">
                    <li>Olympia Hostel</li>
                    <hr style="margin-top:0px;margin-bottom:0px;margin-left:-40px">
                    <li>Kare Hostel</li>
                    <li>Nana Hostel</li>
                </ul>
                This is a list of all hostels in Kampala:
                <ul style="list-style:georgian" class="hostel-list">
                    <li>Olympia Hostel</li>
                    <hr style="margin-top:0px;margin-bottom:0px;margin-left:-40px">
                    <li>Kare Hostel</li>
                    <li>Nana Hostel</li>
                </ul>This is a list of all hostels in Kampala:
                <ul style="list-style:georgian" class="hostel-list">
                    <li>Olympia Hostel</li>
                    <hr style="margin-top:0px;margin-bottom:0px;margin-left:-40px">
                    <li>Kare Hostel</li>
                    <li>Nana Hostel</li>
                </ul>This is a list of all hostels in Kampala:
                <ul style="list-style:georgian" class="hostel-list">
                    <li>Olympia Hostel</li>
                    <hr style="margin-top:0px;margin-bottom:0px;margin-left:-40px">
                    <li>Kare Hostel</li>
                    <li>Nana Hostel</li>
                </ul>This is a list of all hostels in Kampala:
                <ul style="list-style:georgian" class="hostel-list">
                    <li>Olympia Hostel</li>
                    <hr style="margin-top:0px;margin-bottom:0px;margin-left:-40px">
                    <li>Kare Hostel</li>
                    <li>Nana Hostel</li>
                </ul>
                This is a list of all hostels in Kampala:
                <ul style="list-style:georgian" class="hostel-list">
                    <li>Olympia Hostel</li>
                    <hr style="margin-top:0px;margin-bottom:0px;margin-left:-40px">
                    <li>Kare Hostel</li>
                    <li>Nana Hostel</li>
                </ul>
                This is a list of all hostels in Kampala:
                <ul style="list-style:georgian" class="hostel-list">
                    <li>Olympia Hostel</li>
                    <hr style="margin-top:0px;margin-bottom:0px;margin-left:-40px">
                    <li>Kare Hostel</li>
                    <li>Nana Hostel</li>
                </ul>This is a list of all hostels in Kampala:
                <ul style="list-style:georgian" class="hostel-list">
                    <li>Olympia Hostel</li>
                    <hr style="margin-top:0px;margin-bottom:0px;margin-left:-40px">
                    <li>Kare Hostel</li>
                    <li>Nana Hostel</li>
                </ul>This is a list of all hostels in Kampala:
                <ul style="list-style:georgian" class="hostel-list">
                    <li>Olympia Hostel</li>
                    <hr style="margin-top:0px;margin-bottom:0px;margin-left:-40px">
                    <li>Kare Hostel</li>
                    <li>Nana Hostel</li>
                </ul>This is a list of all hostels in Kampala:
                <ul style="list-style:georgian" class="hostel-list">
                    <li>Olympia Hostel</li>
                    <hr style="margin-top:0px;margin-bottom:0px;margin-left:-40px">
                    <li>Kare Hostel</li>
                    <li>Nana Hostel</li>
                </ul>
            </div>
            <div id="hotels" style="display: none">
                <div class="hotelloader" style="display:none;background-color:black"></div>
            </div>
        </div>
    </div>
    <?php
    // Footer file template
    require('inc/footer.inc.php');
    function browser_name()
    {

        $ua = $_SERVER['HTTP_USER_AGENT'];

        if (
            strpos(strtolower($ua), 'safari/') &&
            strpos(strtolower($ua), 'opr/')
        ) {
            // Opera
            $res = 'Opera';
        } elseif (
            strpos(strtolower($ua), 'safari/') &&
            strpos(strtolower($ua), 'chrome/')
        ) {
            // Chrome
            $res = 'Chrome';
        } elseif (
            strpos(strtolower($ua), 'msie') ||
            strpos(strtolower($ua), 'trident/')
        ) {
            // Internet Explorer
            $res = 'Internet Explorer';
        } elseif (strpos(strtolower($ua), 'firefox/')) {
            // Firefox
            $res = 'Firefox';
        } elseif (
            strpos(strtolower($ua), 'safari/') && (strpos(strtolower($ua), 'opr/') === false) && (strpos(strtolower($ua), 'chrome/') === false)
        ) {
            // Safari
            $res = 'Safari';
        } else {
            // Out of data
            $res = false;
        }
        if(strpos(strtolower($ua), 'linux') && (strpos(strtolower($ua), 'android')) === false) {
            $os = 'Device: Linux';
        } else if (strpos(strtolower($ua), 'iphone')) {
            $os = 'Device: iPhone';
        } else if (strpos(strtolower($ua), 'mac os x') && (strpos(strtolower($ua), 'iphone')) === false) {
            $os = 'Device: Mac';
        } else if(strpos(strtolower($ua), 'linux') && strpos(strtolower($ua), 'android')) {
            $os = 'Device: Android';
        } else if(strpos(strtolower($ua), 'windows phone') && strpos(strtolower($ua), 'android')){
            $os = 'Device: Windows Phone';
        } 
        else $os = 'Device: Windows';
        // echo '<script>console.log("'.$ua.'");</script>';
        return [$res, $os];
    }
    ?>