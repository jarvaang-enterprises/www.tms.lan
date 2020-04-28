function verdata(){
    log('Loading verification data');
    $('#nuv').load('/includes/nuv.php');
}
function verify($id){
    log('Verifying user');
    $('#status').css({
        display: 'block'
    })
    $('#status').load('/actions/verify.php',"id="+$id);
}