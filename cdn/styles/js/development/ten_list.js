jQuery('document').ready(()=> {
    $('#ten_list').css({
        display: 'block'
    })
    $('#ten_list').load('/includes/get_ten_list.php');
});