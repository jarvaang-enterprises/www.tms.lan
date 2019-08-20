$('.back').on('click', ()=>{
    $('.content').css({
        display:'none'
    })
    $('.back').css({
        display: 'none'
    });
    $('.navs.hotels').css({
        'background-color': 'grey',
        color: 'black'
    });
    $('.navs.hostels').css({
        color: 'black',
        'background-color': 'grey'
    });
    $('.navs.accs').css({
        color: 'black',
        'background-color': 'grey'
    });
    $('.linear-nav').css({
        transition: 'all 1s',
        'margin-left': '40%'
    });
    $('#hostels').css({
        display:'none'
    });
})
$('.navs.hotels').on('click', ()=>{
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
});
$('.navs.hostels').on('click', ()=>{
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
        position: 'fixed',
    });
    $('.linear-nav li').css({
        padding: '0px 10px 0px 10px',
    });
    $('.content').css({
        display: 'block',
        'margin-left': '36%'
    });
    $('#hostels').css({
        display:'block'
    });
});
$('.navs.accs').on('click', ()=>{
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
$('.login').on('click', ()=>{
    window.location = '/login.php';
});
$('.signup').on('click', ()=>{
    window.location = '/signup.php';
});