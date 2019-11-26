<script src="https://cdn.tms-dist.lan:433/styles/js/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.tms-dist.lan:433/styles/js/tenants.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.tms-dist.lan:433/styles/js/main.js" crossorigin="anonymous"></script>
<script src="https://cdn.tms-dist.lan:433/styles/js/ver.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.tms-dist.lan:433/styles/css/bootstrap.min.css" crossorigin="anonymous" type="text/css" />
<link rel="stylesheet" href="https://cdn.tms-dist.lan:433/styles/css/custom.css" crossorigin="anonymous" type="text/css" />
<link rel="stylesheet" href="https://cdn.tms-dist.lan:433/styles/css/style.css" crossorigin="anonymous" />
<div class="container">
    <nav class="navbar navbar-inverse navbar-sticky bg-light" style="min-height:10px !important;border-radius:5px 5px 0 0">
        <div class="container-fluid" style="height:30px !important">
            <div id="navbar" style="height:30px !important">
                <ul class="nav navbar-nav" style="height:30px !important;margin:0px 10px 0px 10px!important">
                    <li class="nav-item" style="display:inline-block; margin-right:10px">
                        <a href="#tenants" class="nav-link" style="padding-top: 3px;padding-bottom: 5px">
                            Dashboard
                        </a>
                    </li>
                    <li class="nav-item" style="display:inline-block; margin-right:10px">
                        <a href="#tenants" class="nav-link" style="padding-top: 3px;padding-bottom: 5px">
                            Payment Details
                        </a>
                    </li>
                    <li class="nav-item" style="display:inline-block; margin-right:10px">
                        <a href="#tenants" class="nav-link" style="padding-top: 3px;padding-bottom: 5px">
                            Rent Arrears
                        </a>
                    </li>
                    <li class="nav-item" style="display:inline-block; margin-right:10px">
                        <a href="#tenants" class="nav-link" style="padding-top: 3px;padding-bottom: 5px">
                            Pay Rent
                        </a>
                    </li>
                    <li class="nav-item" style="display:inline-block;">
                        <a href="#tenants" class="nav-link" style="padding-top: 3px;padding-bottom: 5px">
                            Complaints
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</div>

<script src="https://cdn.tms-dist.lan:433/styles/js/bootstrap.js" crossorigin="anonymous"></script>
<script src="https://cdn.tms-dist.lan:433/styles/js/jquery-2.1.3.min.js" crossorigin="anonymous"></script>
<script>
    LD();
    $(".tractor.retract").click(function() {
        $(".tractor.retract").css({
            display: "none"
        });
        $(".tractor.expand").css({
            display: "block"
        });
        collapse();
    });
    $(".tractor.expand").click(function() {
        $(".tractor.retract").css({
            display: "block"
        });
        $(".tractor.expand").css({
            display: "none"
        });
        expand();
    });
    var dash = document.getElementById("dash"),
        pay_det = document.getElementById("pay"),
        arrears = document.getElementById("arrears"),
        pay_rent = document.getElementById("pay_rent"),
        complaints = document.getElementById("complaints");
    dash.addEventListener("click", _ => {
        $(".dash").addClass("lactive");
        $(".pay").removeClass("lactive");
        $(".arr").removeClass("lactive");
        $('.pay_rent').removeClass("lactive");
        $('.complaints').removeClass('lactive');
        $(".dashboard").css({
            "display": "block"
        });
        $(".paydet").css({
            "display": "none"
        });
        $(".rentarrears").css({
            "display": "none"
        });
        $(".pay_rnt").css({
            "display": "none"
        });
        $('.complnts').css({
            "display": "none"
        });
        LD();
    });
    pay_det.addEventListener("click", _ => {
        $(".pay").addClass("lactive");
        $(".arr").removeClass("lactive");
        $('.sidebar-header').removeClass('lactive');
        $('.pay_rent').removeClass("lactive");
        $('.complaints').removeClass('lactive');
        $(".paydet").css({
            "display": "block"
        });
        $(".dashboard").css({
            "display": "none"
        });
        $(".rentarrears").css({
            "display": "none"
        });
        $(".pay_rnt").css({
            "display": "none"
        });
        $('.complnts').css({
            "display": "none"
        });
        PD();
    });
    arrears.addEventListener("click", _ => {
        $(".pay").removeClass("lactive");
        $(".arr").addClass("lactive");
        $('.sidebar-header').removeClass('lactive');
        $('.pay_rent').removeClass("lactive");
        $('.complaints').removeClass('lactive');
        $(".rentarrears").css({
            "display": "block"
        });
        $(".dashboard").css({
            "display": "none"
        });
        $(".paydet").css({
            "display": "none"
        });
        $(".pay_rnt").css({
            "display": "none"
        });
        $('.complnts').css({
            "display": "none"
        });
    });
    pay_rent.addEventListener("click", _ => {
        $(".pay").removeClass("lactive");
        $(".arr").removeClass("lactive");
        $('.sidebar-header').removeClass('lactive');
        $('.pay_rent').addClass("lactive");
        $('.complaints').removeClass('lactive');
        $(".rentarrears").css({
            "display": "none"
        });
        $(".dashboard").css({
            "display": "none"
        });
        $(".paydet").css({
            "display": "none"
        });
        $(".pay_rnt").css({
            "display": "block"
        });
        $('.complnts').css({
            "display": "none"
        });
        PR();
    });
    complaints.addEventListener("click", _ => {
        $(".pay").removeClass("lactive");
        $(".arr").removeClass("lactive");
        $('.sidebar-header').removeClass('lactive');
        $('.pay_rent').removeClass("lactive");
        $('.complaints').addClass('lactive');
        $(".rentarrears").css({
            "display": "none"
        });
        $(".dashboard").css({
            "display": "none"
        });
        $(".paydet").css({
            "display": "none"
        });
        $(".pay_rnt").css({
            "display": "none"
        });
        $('.complnts').css({
            "display": "block"
        });
    });

    function Dashboard() {

    }
</script>