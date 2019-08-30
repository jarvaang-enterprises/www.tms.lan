$(window).on('load', function(){
    $('.loader').fadeOut();
});
loader = () => {
    $('.hotel_loader').fadeIn();
    setInterval(()=>{
        $('.hotel_loader').fadeOut();
    }, 2000);
}
window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 500 || document.documentElement.scrollTop > 500) {
    document.getElementById("top").style.display = "block";
  } else {
    document.getElementById("top").style.display = "none";
  }
}


function topFunction() {
  document.body.scrollTop = 0; // For Safari
  document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
} 