<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Tenant Management System : Manager</title>
	<link rel="icon" href="/images/favicon.png" type="image/png" />
	<link rel="shortcut icon" href="/images/favicon.png" type="image/png" />
	<link rel="stylesheet" href="//cdn.tms-dist.lan:433/styles/css/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="//cdn.tms-dist.lan:433/styles/css/man-custom.css" type="text/css" />
	<link rel="stylesheet" href="//cdn.tms-dist.lan:433/styles/css/custom.css" type="text/css" />
</head>

<body>
	<?php session_start();
	if (isset($_SESSION['logged_in']) && $_SESSION['logged_in'] == false) {
		$url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on' ? "https" : "http")
			. "://" . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'];
		$loc = "Location: /redirectlogin.php?_rdr&cont=" . $url;
		header($loc);
	} else if (!isset($_SESSION['logged_in'])) {
		$url = (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on' ? "https" : "http")
			. "://" . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'];
		$loc = "Location: /redirectlogin.php?_rdr&cont=" . $url;
		header($loc);
	} else { ?>
		<div id="header"></div>
		<div id="dialog"></div>
		<div class="container" style="min-height: 40rem">
			<div id="verify"></div>
			<div id="LTContent"></div>
			<div id="ten_list"></div>
			<div id="processrent"></div>
			<div id="tendet"></div>
			<div id="Tenact"></div>
		</div>
	<?php }
	?>
	<div id="footer"></div>
	<script src="//cdn.tms-dist.lan:433/styles/js/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
	<script src="//cdn.tms-dist.lan:433/styles/js/jquery-2.1.3.min.js" crossorigin="anonymous"></script>
	<script src="//cdn.tms-dist.lan:433/styles/js/bootstrap.js"></script>
	<script src="//cdn.tms-dist.lan:433/styles/js/ver.js"></script>
	<script src="//cdn.tms-dist.lan:433/styles/js/main.js"></script>
	<script src="//cdn.tms-dist.lan:433/styles/js/navigation.min.js"></script>
	<script>
		loadprerequisites();
	</script>
</body>

</html>