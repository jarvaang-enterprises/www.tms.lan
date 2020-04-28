jQuery('document').ready(()=> {
    jQuery.ajax({
        url: "/includes/get_img.php",
        type: "POST",
        dataType: "HTML",
        success: function ( data ) {
            jQuery('body').append(data);
        },
        error: (jqXHR, data) => {
            alert('Ajax request failed.');
        }
    });
});
function currentSlide(g) {
    showSlides(slideIndex = g)
}
function showSlides(g) { var e = document.getElementsByClassName("mySlides"), c = document.getElementsByClassName("dot"); g > e.length && (slideIndex = 1); 1 > g && (slideIndex = e.length); for (g = 0; g < e.length; g++)e[g].style.display = "none"; for (g = 0; g < c.length; g++)c[g].className = c[g].className.replace("active", ""); e[slideIndex - 1].style.display = "block"; c[slideIndex - 1].className += " active" }
