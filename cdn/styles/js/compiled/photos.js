var slideIndex=0;showSlides();function showSlides(){var a,b=document.getElementsByClassName("mySlides"),c=document.getElementsByClassName("dot");for(a=0;a<b.length;a++)b[a].style.display="none";slideIndex++;slideIndex>b.length&&(slideIndex=1);for(a=0;a<c.length;a++)c[a].className=c[a].className.replace("dot active","dot");b[slideIndex-1].style.display="block";c[slideIndex-1].className="dot active";setTimeout(showSlides,2E3)};