$(window).on("load", 
    $(".hotelList1").css({
        display: 'block',
    })
);
prev = (target) => {
    p = target - 1
    $('.hotelList'+target).css({
        display: 'none',
    });
    topFunction()
    $('.hotelList'+p).css({
        display: 'block',
    });
}
next = (target) => {
    n = target + 1
    $('.hotelList'+target).css({
        display: 'none',
    });
    topFunction()
    $('.hotelList'+n).css({
        display: 'block',
    });
}
$('#top').on('click touchstart',function () {
    document.body.scrollTop = 0; // For Safari
    document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
});