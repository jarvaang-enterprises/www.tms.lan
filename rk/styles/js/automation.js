$(window).on('load', function(){
    $('.loader').fadeOut();
});
loader = () => {
    $('.hotel-loader').fadeIn();
    setInterval(_ => {
        $('.hotel-loader').fadeOut()
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
