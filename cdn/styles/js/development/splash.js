function splash_screen(){
    window.addEventListener("load", function(){
        var load_screen = document.getElementById("#load_screen");
        load_screen.style.display = 'none';
        document.body.removeChild(load_screen);
    });
}