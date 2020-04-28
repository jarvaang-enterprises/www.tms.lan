var form = $('#payment-form')
$('#payment-form').on('submit', submitPayment)

function submitPayment(e) {
    e.preventDefault()
    var payload = new FormData()
    $('#payment-form').find('.payment-errors').closest('.row').hide();
    $rNo = $('#payment-form').find('input[name=rNo]').val()
    $date = $('#payment-form').find('input[type=datetime-local]').val()
    $tNIN = $('#payment-form').find('input[name=tID]').val()
    $amtPd = $('#payment-form').find('input[name=amtPd]').val()
    $admin = $('#payment-form').find('input[name=admin]').val()
    $rpm = $('#payment-form').find('[name="rpm"]').val()
    payload.append('rNo', $rNo)
    payload.append('date', $date)
    payload.append('tNIN', $tNIN)
    payload.append('amtPd', $amtPd)
    payload.append('admin', $admin)
    payload.append('rpm', $rpm)
    log($date)
    $('#payment-form').find('[type=submit]').html('Adding Payment&nbsp;<i class="fa fa-spinner fa-pulse"></i>');
    $.ajax({
        url: '/actions/process_payment.php',
        method: 'post',
        data: payload,
        dataType: 'json',
        contentType: false,
        cache: false,
        processData: false,
        success: (e) => {
            if (e.success) {
                log(e)
                $('#payment-form').find('[type=submit]').html('Payment update successful <i class="fa fa-check"></i>').prop('disabled', true);
                $('.button').append('<p><div class="col-xs-11" style="margin-left:21px"><button class="btn btn-success btn-lg btn-block" type="process()">Process other</button></div></p>')
            } else {
                log(e.error)
                $('#payment-form').find('[type=submit]').html(parse_str(e.error)).removeClass('success').addClass('testing');
            }
        },
        error: (e) => {
            log(e)
            $('#payment-form').find('[type=submit]').html('There was a problem').removeClass('success').addClass('error');
            /* Show Stripe errors on the form */
            $('#payment-form').find('.payment-errors').text('Try refreshing the page and trying again.');
            $('#payment-form').find('.payment-errors').closest('.row').show();
        }
    })
}
$('.fa-check').hide()
$('.fa-times').hide()
$('.fa-spinner').hide()
$('.alert-error').hide()
CheckName = (e) => {
    var LastName = e.firstElementChild.lastElementChild.lastElementChild.lastElementChild.firstElementChild.firstElementChild.value
    var FirstName = e.firstElementChild.lastElementChild.lastElementChild.firstElementChild.firstElementChild.firstElementChild.value
    $('.fa-spinner').show()
    if (LastName == '' && FirstName != '') {
        $('.fa-times.lName').show()
        $('.fa-check.lName').hide()
        $('.fa-check.fName').show()
        $('.fa-spinner').hide()
        $('#payment-form').find('[placeholder="House Number"]').val('')
        $('#payment-form').find('[placeholder="House Location"]').val('')
        $('#payment-form').find('[name="rpm"]').val('')
        $('#payment-form').find('[placeholder="Enter Tenant Names Below:"]').val('')
        $('.alert-error').show().text('Provide the last name!')
        return
    } else if (LastName != '' && FirstName == '') {
        $('.fa-times.fName').show()
        $('.fa-check.fName').hide()
        $('.fa-check.lName').show()
        $('.fa-spinner').hide()
        $('#payment-form').find('[placeholder="House Number"]').val('')
        $('#payment-form').find('[placeholder="House Location"]').val('')
        $('#payment-form').find('[name="rpm"]').val('')
        $('#payment-form').find('[placeholder="Enter Tenant Names Below:"]').val('')
        $('.alert-error').show().text('Provide the first name!')
        return
    } else if (LastName == '' & FirstName == '') {
        $('.fa-times').show()
        $('.fa-spinner').hide()
        $('.alert-error').show().text('Tenant Name is not provided!')
        return
    }
    $('.fa-spinner').show()
    $('.fa-check').hide()
    $('.fa-times').hide()
    $('.alert-error').hide()
    $.ajax({
        url: '/actions/getHouseNum.php',
        data: {
            fName: FirstName,
            lName: LastName
        },
        dataType: 'json',
        method: 'post',
        success: (data) => {
            if (data.success) {
                $('.fa-spinner').hide()
                $('.fa-check').show()
                $('#payment-form').find('[placeholder="House Number"]').val(data.HNo)
                $('#payment-form').find('[placeholder="House Location"]').val(data.loc)
                $('#payment-form').find('[name="rpm"]').val(data.rpm)
                $('#payment-form').find('[placeholder="Enter Tenant Names Below:"]').val(data.NIN)
                $('#payment-form').find('[name=fName]').prop('disabled', true)
                $('#payment-form').find('[name=lName]').prop('disabled', true)
                $('#payment-form').find('[type=submit]').prop('disabled', false)
            } else {
                log(data)
                $('.fa-spinner').hide()
                $('.fa-times').show()
                $('#payment-form').find('[placeholder="House Number"]').val('')
                $('#payment-form').find('[placeholder="House Location"]').val('')
                $('#payment-form').find('[name="rpm"]').val('')
                $('#payment-form').find('[placeholder="Enter Tenant Names Below:"]').val('')
                $('#payment-form').find('[name=fName]').prop('disabled', false)
                $('#payment-form').find('[name=lName]').prop('disabled', false)
                $('#payment-form').find('[type=submit]').prop('disabled', true)
                $('.alert-error').show().text(data.error)
            }
        }
    })
}