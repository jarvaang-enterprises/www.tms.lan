var fileContents = '/inc/rKData.json'
data = jQuery.getJSON(fileContents)
console.log(data)
let obj = JSON.parse(data)

function printValues(obj) {
    for(var k in obj) {
        if(obj[k] instanceof Object) {
            printValues(obj[k])
        } else {
            document.write(obj[k] + "<br>")
        }
    }
}

printValues(obj)

document.write("<hr>")

document.write(obj["book"]["author"] + "<br>")