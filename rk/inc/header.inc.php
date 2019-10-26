<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=1, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/styles/header.inc.css">
    <link rel="stylesheet" href="/styles/footer.inc.css">
    <link rel="stylesheet" href="/styles/index.inc.css">
    <link rel="stylesheet" href="/styles/bootstrap.min.css" crossorigin="anonymous" type="text/css" />
    <link rel="preconnect" href="//lh3.googleusercontent.com">
    <link rel="preconnect" href="//lh4.googleusercontent.com">
    <link rel="preconnect" href="//lh5.googleusercontent.com">
    <link rel="preconnect" href="//lh6.googleusercontent.com">
    <title>Rent Kampala</title>
</head>

<body>
    <div class="naver">
<a <?php if(strpos($_SERVER['HTTP_HOST'], 'tms.lan') == true){ ?>href="https://rk.tms.lan:423/"<?php } else echo 'href="https://rentKampala.mipropia.com/"';?>>
            <h1 class="header">Rent Kampala</h1>
        </a>
        <div class="nav">
            <a href="#login" class="login">
                <li>
                    Login
                </li>
            </a>
            <a href="#signup" class="signup">
                <li>
                    Signup&nbsp;&nbsp;
                    <span class="sep"></span>
                </li>
            </a>
        </div>
    </div>
    <?php
    if(strpos($_SERVER['HTTP_HOST'], 'tms.lan') == true){
        $env = 'development';
    } else $env = 'production';
    ?>
    <div class="site-content">