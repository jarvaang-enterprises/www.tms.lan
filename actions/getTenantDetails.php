<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.tms-dist.lan:433/styles/css/bootstrap.min.css">
<link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:500,300,700,400italic,400">
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

    #legend {
        color: floralwhite;
    }

    #sr #no-search #no-search-text.sm {
        display: none;
    }

    .container-img {
        border: 1px solid #dddddd;
        border-radius: 5px;
        height: 100px;
        width: 100%;
        font-family: Roboto, sans-serif;
        display: flex;
        flex-direction: row;
        align-items: center;
        /* justify-content: space-around; */
    }

    .data {
        display: flex;
        flex-direction: column;
        justify-content: end;
        flex-wrap: nowrap;
        width: calc(100% - 5rem);
        align-items: baseline;
        height: 100%;
        margin-left: 1rem;
    }

    .pic {
        border-radius: 10px;
        background-color: #cccccc;
        width: 2em;
        height: 2em;
        display: flex;
        /* padding-right: 20px; */
        margin: 1rem .5rem 1rem .5rem;
        align-items: center;
        justify-content: center;
        font-size: 48px;
        color: #ffffff;
        box-shadow: 0px 0px 6px rgba(20, 20, 20, 0.6);
    }

    .name {
        color: #222222;
    }

    @media (min-width: 320px) {
        #sr {
            width: 100% !important;
            margin-top: 3rem;
        }

        #sr #no-search {
            left: 15% !important;
            width: 80% !important;
            top: 22% !important;
        }
    }

    @media (min-width: 480px) {
        #sr #no-search {
            left: 27% !important;
            width: 80% !important;
            top: 22% !important;
        }

        #tendet>#search {
            margin-right: 22% !important;
        }
    }

    @media (max-width: 500px) {
        #sr #no-search #no-search-text {
            display: none !important;
        }

        #sr #no-search #no-search-text.sm {
            display: inline-block !important;
        }
    }

    @media (min-width: 500px) {
        body {
            margin: 7px !important;
        }

        #sr {
            width: 75% !important;
            margin-top: 0 !important;
        }

        #sr #no-search {
            left: 37% !important;
            width: max-content !important;
        }

        #sr #no-search #no-search-text {
            display: block !important;
        }

        #sr #no-search #no-search-text.sm {
            display: none !important;
        }

        #tendet>#search {
            margin-right: 0% !important;
        }
    }

    .nm {
        display: flex;
        flex-direction: column;
        margin-bottom: 5px;
        width: calc(100% - 2em);
    }

    .nm .name {
        padding: .2rem;
        border-radius: 5px;
        color: aquamarine;
    }

    .other {
        flex-direction: column !important;
        justify-content: space-evenly !important;
        height: max-content !important;
    }

    .data.other .nm {
        width: 100% !important;
    }

    #sr {
        max-height: max-content !important;
        min-height: 271px !important;
    }

    #search-ret {
        max-height: 100% !important;
        min-height: min-content !important;
    }

    .lbl {
        color: #dddddd;
        width: max-content;
    }

    .container-img {
        margin-bottom: .8em;
    }

    #search-ret#row:last-child {
        margin-bottom: .6rem !important;
    }
</style>
<script>
    // const btob = 'fortheloveoftms(c)pleasedonotusestylingselsewhere'
    function check(e) {
        e.firstChild.checked = true
        // document.getElementById('search-ret').style.display = 'none'
        $('#search-ret').hide()
    }
    $('#search').on('click', _ => {
        $('#error_sms').removeClass('alert alert-danger').hide()
        $('#no-search').show()
        $('#search-ret').hide()
    })
    $('#search').on('submit', (e) => {
        e.preventDefault()
        for (let index = 2; index < 6; index++) {
            type = e.target[index].checked == true ? e.target[index] : null
            type != null ? index = 6 : index = index
        }
        var msg = (type == null ? 'Type not specified please click one' : 'Continue')
        if (msg != 'Continue') {
            $('#error_sms').addClass('alert alert-danger').show()
            document.getElementById('error_sms').innerText = msg
            return
        } else {
            searchparams = $('#search-field').val()
            if (searchparams.trim() == '') {
                $('#error_sms').addClass('alert alert-danger').show()
                document.getElementById('error_sms').innerText = 'Please specify a search parameter!'
                return
            }
            $.ajax({
                url: '/actions/gtd.php',
                data: {
                    'sp': btoa(searchparams),
                    't': btoa(type.attributes['id'].nodeValue),
                    'ver': $('#ver').val()
                },
                dataType: 'json',
                method: 'POST',
                success: e => {
                    // log(e)
                    if (e.err != undefined) {
                        $('#no-search-text').removeClass('alert-info').addClass('alert-danger')
                        $('#no-search-text').html('<span class="glyphicon glyphicon-help"></span>' + e.err)
                        document.getElementsByClassName('sm')[1].style = "display: none !important;"
                        $('#no-search-text.sm').removeClass('alert-info').addClass('alert-danger')
                        $('#no-search-text.sm').html('<span class="glyphicon glyphicon-help"></span>' + e.err)
                    } else {
                        if (e._teninfo != null) {
                            $('#no-search').hide()
                            $('#search-ret').show()
                            $('.pic').attr('src', e._teninfo.img)
                            $('#fn.name').text(e._teninfo.fn)
                            $('#ln.name').text(e._teninfo.fl)
                            $('#nin.name').text(e._teninfo.nin)
                            $('#mno.name').text(e._teninfo.cont_mobile)
                            $('#email.name').text(e._teninfo.email == null ? 'No Email' : e._teninfo.email)
                            $('#hn.name').text(e._teninfo.h_no)
                            $('#hl.name').text(e._teninfo.h_loc)
                            $('#apm.name').text(e._teninfo.apm)
                            $('#wmn.name').text(e._teninfo.water_m)
                            $('#wcm.name').text(e._teninfo.water_c)
                            $('#umeme.name').text(e._teninfo.yaka)
                            if (e._info.includes('Water Customer Number')) {
                                $('#wcm.name').css({
                                    'color': 'red'
                                })
                            } else if (e._info.includes('Tenant Name')) {
                                $('#fn.name').css({
                                    'color': 'red'
                                })
                                $('#ln.name').css({
                                    'color': 'red'
                                })
                            } else if (e._info.includes('National ID')) {
                                $('#nin.name').css({
                                    'color': 'red'
                                })
                            } else if (e._info.includes('YAKA')) {
                                $('#umeme.name').css({
                                    'color': 'red'
                                })
                            }
                        }
                    }
                },
                error: e => {
                    log(e.responseText)
                },
            })
        }
    })
</script>

<body id="body">
    <div id="search" class="align-self-center" style="float: right; width: 25%;border: 0px grey solid; padding: 0px 10px; border-radius: 7px; transition: all 0.5s ease 0.5s;">
        <div style="background-color: #8a2be2; top: -12px; left: 10px; padding: 2px 5px; width: max-content; position: relative; cursor: default">
            <span id="legend" style="background-color: grey; padding: 3px; border-radius: 10px; color:floralwhite">Tenant Search</span>
        </div>
        <form action="" method="get" id="search" enctype="multipart/form-data" style="float: right; display:none">
            <span id="error_sms" style="display:none"></span>
            <div class="field-wrapper">
                <input type="search" name="search" id="search-field" class="form-control input-lg">
                <div class="field-placeholder">
                    <span>Enter Search Criteria: </span>
                </div>
            </div>
            <div class="field-wrapper" style="display:none">
                <input type="text" name="ver" id="ver" class="form-control input-lg" value="Zm9ydGhlbG92ZW9mdG1zKGMpcGxlYXNlZG9ub3R1c2VzdHlsaW5nc2Vsc2V3aGVyZQ==" aria-hidden="hidden">
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
    <div id="sr" style="float:left; width: 75%;border: 1px grey solid; padding: 0px 10px; border-radius: 7px; transition: all 0.5s ease 0.5s; height:max-content">
        <div style="background-color: #8a2be2; top: -12px; left: 10px; padding: 2px 5px; width: max-content; position: relative; cursor: default">
            <span id="legend" style="background-color: grey; padding: 3px; border-radius: 10px; color:floralwhite">Tenant Search Results</span>
        </div>
        <div id="no-search" class="align-self-center border-1" style="width: max-content; display: inline-block; top: 50%; left: 37%; position: relative">
            <span id="no-search-text" class="alert alert-info">Please carry out a search in the right panel.</span>
            <span id="no-search-text" class="alert alert-info sm">Please carry out a search</span>
            <span id="no-search-text" class="one alert alert-info sm align-self-center" style="margin-left: 2.5rem">in the top panel.</span>
        </div>
        <div id="search-ret" class="align-self-center border-1" style="width: 100%; height:fit-content; overflow-wrap:break-word; display: none; position: relative">
            <div class="container-img">
                <img class="pic" src="/images/img_avatar2.png" />
                <div class="data">
                    <div class="nm">
                        <span class="lbl">First Name: </span>
                        <div class="name" id="fn" style="background-color: grey">Dummy Name</div>
                    </div>
                    <div class="nm">
                        <span class="lbl">Last Name: </span>
                        <div class="name" id="ln" style="background-color: grey">Dummy Name</div>
                    </div>
                </div>
            </div>
            <div class="container-img other">
                <div style="background-color: #8a2be2; top: -12px; left: -65px; padding: 2px 5px; width: max-content; position: relative; cursor: default">
                    <span id="legend" style="background-color: grey; padding: 3px; border-radius: 10px; color:floralwhite">Contact Details</span>
                </div>
                <div class="data other col-sm-12 col-md-12 col-lg-6" style="top: -10px; margin-left: -20px;">
                    <div class="nm">
                        <span class="lbl">National ID Number: </span>
                        <div class="name" id="nin" style="background-color: grey">Dummy Name</div>
                    </div>
                    <div class="nm">
                        <span class="lbl">Mobile Number: </span>
                        <div class="name" id="mno" style="background-color: grey">Dummy Name</div>
                    </div>
                </div>
                <div class="data other col-sm-12 col-md-12 col-lg-6" style="top: -10px; margin-left: -20px;">
                    <div class="nm">
                        <span class="lbl">Email: </span>
                        <div class="name" id="email" style="background-color: grey">Dummy Name</div>
                    </div>
                </div>
            </div>
            <div class="container-img other">
                <div style="background-color: #8a2be2; top: -12px; left: -70px; padding: 2px 5px; width: max-content; position: relative; cursor: default">
                    <span id="legend" style="background-color: grey; padding: 3px; border-radius: 10px; color:floralwhite">House Details</span>
                </div>
                <div class="data other col-sm-12 col-md-12 col-lg-6" style="top: -10px; margin-left: -20px;">
                    <div class="nm">
                        <span class="lbl">House Number: </span>
                        <div class="name" id="hn" style="background-color: grey">Dummy Name</div>
                    </div>
                    <div class="nm">
                        <span class="lbl">House Location: </span>
                        <div class="name" id="hl" style="background-color: grey">Dummy Name</div>
                    </div>
                </div>
                <div class="data other col-sm-12 col-md-12 col-lg-6" style="top: -10px; margin-left: -20px;">
                    <div class="nm">
                        <span class="lbl">Amount Per Month: </span>
                        <div class="name" id="apm" style="background-color: grey">Dummy Name</div>
                    </div>
                </div>
            </div>
            <div class="container-img other">
                <div style="background-color: #8a2be2; top: -12px; left: -30px; padding: 2px 5px; width: max-content; position: relative; cursor: default">
                    <span id="legend" style="background-color: grey; padding: 3px; border-radius: 10px; color:floralwhite">National Service Details</span>
                </div>
                <div class="data other col-sm-12 col-md-12 col-lg-6" style="top: -10px; margin-left: -20px;">
                    <div class="nm">
                        <span class="lbl">Water Meter Number: </span>
                        <div class="name" id="wmn" style="background-color: grey">Dummy Name</div>
                    </div>
                    <div class="nm">
                        <span class="lbl">Water Customer Number:</span>
                        <div class="name" id="wcm" style="background-color: grey">Dummy Name</div>
                    </div>
                </div>
                <div class="data other col-sm-12 col-md-12 col-lg-6" style="top: -10px; margin-left: -20px;">
                    <div class="nm">
                        <span class="lbl">Yaka: </span>
                        <div class="name" id="umeme" style="background-color: grey">Dummy Name</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('span#legend').on('click', _ => {
            $('div#search').css({
                'width': 'max-content',
                'border': '1px grey solid',
            })
            $('form#search').css({
                'display': 'block'
            })
            $('span#legend').removeAttr('style')
        })
        $('span#legend').click()
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
    <script src="https://cdn.tms-dist.lan:433/styles/js/jquery-3.4.1.min.js"></script>
</body>