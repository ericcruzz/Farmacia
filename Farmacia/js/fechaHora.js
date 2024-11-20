
function fechaConHora() {

	var timeControl = document.getElementById("contact_time");
	var fechaControl = document.getElementById("contact_fecha");
    var fechaHora = new Date(Date.now());
	var horas = fechaHora.getHours();
	var minutos = fechaHora.getMinutes();

	if (horas < 10) {
		horas = "0" + horas
	}

	if (minutos < 10) {
		minutos = "0" + minutos
	}
	var tiempo = horas + ":" + minutos

	timeControl.value = tiempo;

	var dia = fechaHora.getDate();
	var mes = fechaHora.getMonth() + 1;
	var anio = fechaHora.getFullYear();

	if (dia < 10) { dia = "0" + dia }
	if (mes < 10) { mes = "0" + mes }

	var fecha = anio + "-" + mes + "-" + dia

	fechaControl.value = fecha;
}