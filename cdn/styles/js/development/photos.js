var slideIndex = 0;
showSlides();
function showSlides(){
	var i;
    var slides = document.getElementsByClassName("mySlides");
	var dots = document.getElementsByClassName("dot");
	for (i = 0;i<slides.length;i++){
		slides[i].style.display = "none";
		dots[i].className = dots[i].className.replace("dot active", "dot");
	}
	slideIndex++;
	if(slideIndex > slides.length){
		slideIndex = 1;
	}
    slides[slideIndex - 1].style.display = "block";
	dots[slideIndex - 1].className = "dot active";
	setTimeout(showSlides, 2000);
}