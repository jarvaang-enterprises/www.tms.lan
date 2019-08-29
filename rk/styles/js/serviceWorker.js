$('#hotels').load('/hotels.php');
$('.login').on('click touchstart', () => {
    window.location = '/login.php';
});
$('.signup').on('click touchstart', () => {
    window.location = '/signup.php';
});