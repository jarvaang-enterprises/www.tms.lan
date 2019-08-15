$('.navs.hotels').on('click', ()=>{
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
});
$('.navs.hostels').on('click', ()=>{
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
    $('#hostels').css({
        display:'block'
    });
    $('.linear-nav').css({
        display: 'none'
    })
});
$('.navs.accs').on('click', ()=>{
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

$('.login').on('click', ()=>{
    window.location = '/login.php';
});
$('.signup').on('click', ()=>{
    window.location = '/signup.php';
})