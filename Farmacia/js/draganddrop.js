var contador = 0; //poner un id unico a cada elemento clonado
var elemArrastrableId = "";

var contadorRojo = 0;
var contadorMorado = 3;

//trabaja con el evento ondragstart
function start(e) {////////////////////////////////////////////Funciones de los objetos Cuadritos
    console.log("start")
    e.dataTransfer.effectAllowed = "move"; //define el efecto mover //Se contiene el objeto que se va a manipular, en este caso los Cuadritos y son permitidos arrastrarles
    e.dataTransfer.setData("Data", e.target.id);
    $("#" + e.target.id).css("opacity", "0.4");
    elemArrastrableId = e.target.id;
}

function enter(e) {
    console.log("enter")
    e.target.style.border = "0px dotted #555";
}

function leave(e) {
    console.log("leave")
    e.target.style.border = "0px dotted #555";
    //$("#" + e.target.id).css("border", "");
}

function over(e) {
    console.log("over")
    var id = e.target.id; //cuadro3
    if ((id == "cuadro1") || (id == "cuadro2") || (id == "papelera")) {
        return false; //falso significa que te deje soltar las cosas
        
    }
    else {
         
        e.preventDefault();
    }
   
}

function end(e) {
    console.log("end")
    e.target.style.opacity = '';
    e.dataTransfer.clearData("Data");
    elemArrastrableId = "";
}

function drop(e) {
    console.log("drop")
    var elementoArrastrado = e.dataTransfer.getData("Data");
    e.target.appendChild(document.getElementById(elementoArrastrado));
    e.target.style.border = "";
}

function eliminar(e) {
    console.log("eliminar")
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));
    elementoArrastrado.parentNode.removeChild(elementoArrastrado);
    e.target.style.border = "";
}

function clonar(e) {
    console.log("clonar")
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));
    elementoArrastrado.style.opacity = "";
    if (contadorRojo < 9) {
        var elementoClonado = elementoArrastrado.cloneNode(true);
        elementoClonado.id = "ElementoClonado" + contador;
        contador++;
        elementoClonado.style.position = "static";
        e.target.appendChild(elementoClonado);
    }
    e.target.style.border = "";
}