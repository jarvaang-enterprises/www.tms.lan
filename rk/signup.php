<?php
require('inc/header.inc.php');
?>
<link rel="stylesheet" href="/styles/dialogs.inc.css">
<div class="signup-form">
    <h2>Sign Up Form</h2>
    <form method="post" action="">
        <label for="email">Email:</label>
        <input type="text" name="email" placeholder="Email Address">
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <div class="g-recaptcha" data-sitekey="6LfMnrQUAAAAAEiQySgWIclq5wqmS58K9w5XXKTx"></div>
        <br />

        <input id="sub" type="submit" value="Signup">
    </form>
</div>
<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data = [];
    $data['secret'] = '6LfMnrQUAAAAAEZpPV1WNw6BRTu6B7N4YAozM1dv';
    $data['response'] = $_POST['g-recaptcha-response'];
    $json = CallAPI('POST', 'https://www.google.com/recaptcha/api/siteverify',$data);
    $dataret = json_decode($json);
    if($dataret->{'success'} == 'true'){
        echo $dataret->{'hostname'};
    } else {
        echo "<script>alert('Recaptcha failed')</script>";
    }
}
?>
<?php
function CallAPI($method, $url, $data = false)
{
    $curl = curl_init();

    switch ($method)
    {
        case "POST":
            curl_setopt($curl, CURLOPT_POST, 1);

            if ($data)
                curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
            break;
        case "PUT":
            curl_setopt($curl, CURLOPT_PUT, 1);
            break;
        default:
            if ($data)
                $url = sprintf("%s?%s", $url, http_build_query($data));
    }

    // Optional Authentication:
    // curl_setopt($curl, CURLOPT_HTTPAUTH, CURLAUTH_BASIC);
    // curl_setopt($curl, CURLOPT_USERPWD, "username:password");

    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

    $result = curl_exec($curl);

    curl_close($curl);

    return $result;
}
require('inc/footer.inc.php');
?>