$('#hotels').load('/hotels.php');
$('.navs.hotels').on('click', () => {
    $('.back').css({
        display: 'block'
    });
    $('.navs.hotels').css({
        'background-color': 'black',
        color: 'white'
    });
    $('.navs.hostels').css({
        color: 'black',
        'background-color': 'grey'
    });
    $('.navs.accs').css({
        color: 'black',
        'background-color': 'grey'
    })
    $('.linear-nav').css({
        transition: 'all 2s',
        'margin-left': '0%',
        width: '35%',
        position: 'absolute',
        overflow: 'none'
    });
    $('.linear-nav li').css({
        padding: '0px 10px 0px 10px',
    });
    $('.content').css({
        display: 'block',
        'margin-left': '36%'
    });
    $('#hotels').css({
        display: 'block'
    });
    $('#hostels').css({
        display: 'none'
    });
});
$('.navs.hostels').on('click', () => {
    $('.back').css({
        display: 'block'
    });
    $('.navs.hotels').css({
        'background-color': 'grey',
        color: 'black'
    });
    $('.navs.hostels').css({
        color: 'white',
        'background-color': 'black'
    });
    $('.navs.accs').css({
        color: 'black',
        'background-color': 'grey'
    });
    $('.linear-nav').css({
        transition: 'all 2s',
        'margin-left': '0%',
        width: '35%',
        position: 'absolute',
        overflow: 'none'
    });
    $('.linear-nav li').css({
        padding: '0px 10px 0px 10px',
    });
    $('.content').css({
        display: 'block',
        'margin-left': '36%'
    });
    $('#hotels').load('/hotels.php');
    $('#hostels').css({
        display: 'block'
    });
    $('#hotels').css({
        display: 'none'
    });
});
$('.navs.accs').on('click', () => {
    $('.back').css({
        display: 'block'
    });
    $('.navs.accs').css({
        color: 'white',
        'background-color': 'black'
    });
    $('.navs.hotels').css({
        'background-color': 'grey',
        color: 'black'
    });
    $('.navs.hostels').css({
        color: 'black',
        'background-color': 'grey'
    });
})
$('.login').on('click', () => {
    window.location = '/login.php';
});
$('.signup').on('click', () => {
    window.location = '/signup.php';
});