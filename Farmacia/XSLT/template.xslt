<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
	<xsl:output method="html" indent="yes"/>

	<xsl:param name="TipoFarmacia" select="TipoFarmacia">
	</xsl:param>

	<xsl:template match="Inventario">
		<html lang="en">

			<head>
				<title>Farmacia FarmaGil</title>
				<meta charset="utf-8"/>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<meta name="viewport" content="width=device-width, initial-scale=1"/>

				<link rel="apple-touch-icon" href="img/apple-icon.png"/>
				<link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico"/>

				<link rel="stylesheet" href="css/bootstrap.min.css"/>
				<link rel="stylesheet" href="css/templatemo.css"/>
				<link rel="stylesheet" href="css/custom.css"/>

				<!-- Load fonts style after rendering the layout styles -->
				<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900"/>
				<link rel="stylesheet" href="css/fontawesome.min.css"/>
				<!--TemplateMo 559 Zay Shop https://templatemo.com/tm-559-zay-shop -->

				<!-- Start Script -->
				<script  type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
				<script  type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
				<script  type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
				<script  type="text/javascript" src="js/templatemo.js"></script>
				<script  type="text/javascript" src="js/custom.js"></script>

				<!-- End Script -->

			</head>
			<body>
				<!-- Start Top Nav -->
				<nav class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block" id="templatemo_nav_top">
					<div class="container text-light">
						<div class="w-100 d-flex justify-content-between">
							<div>
								<i class="fa fa-envelope mx-2"></i>
								<a class="navbar-sm-brand text-light text-decoration-none" >
									<xsl:value-of select="Datos/CorreoElectronico"/>
								</a>
								<i class="fa fa-phone mx-2"></i>
								<a class="navbar-sm-brand text-light text-decoration-none" >
									<xsl:value-of select="Datos/Telefono"/>
								</a>
							</div>
							<div>
								<a class="text-light" href="https://fb.com/" target="_blank" rel="sponsored">
									<i class="fab fa-facebook-f fa-sm fa-fw me-2"></i>
								</a>
								<a class="text-light" href="https://www.instagram.com/" target="_blank">
									<i class="fab fa-instagram fa-sm fa-fw me-2"></i>
								</a>
								<a class="text-light" href="https://twitter.com/" target="_blank">
									<i class="fab fa-twitter fa-sm fa-fw me-2"></i>
								</a>
								<a class="text-light" href="https://www.linkedin.com/" target="_blank">
									<i class="fab fa-linkedin fa-sm fa-fw"></i>
								</a>
							</div>
						</div>
					</div>
				</nav>
				<!-- Close Top Nav -->

				<!-- Header -->
				<nav class="navbar navbar-expand-lg navbar-light shadow">
					<div class="container d-flex justify-content-between align-items-center">

						<a class="navbar-brand text-success logo h1 align-self-center">
							<xsl:value-of select="Datos/NombreFarmacia"/>
						</a>

						<button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>

						<div class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between" id="templatemo_main_nav">
							<div class="flex-fill">
								<ul class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
									<xsl:for-each select="Opciones/Opcion">
										<li class="nav-item">
											<xsl:choose>
												<xsl:when test="$TipoFarmacia=@Id">
													<a href="{@Url}" class="nav-link">
														<xsl:value-of select="@Texto"/>
													</a>
												</xsl:when>
												<xsl:otherwise>
													<a href="{@Url}" class="nav-link">
														<xsl:value-of select="@Texto"/>
													</a>
												</xsl:otherwise>
											</xsl:choose>
										</li>
									</xsl:for-each>
								</ul>
							</div>
						</div>

					</div>
				</nav>
				<!-- Close Header -->

				<!-- Modal -->
				<div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="w-100 pt-1 mb-5 text-right">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<form action="" method="get" class="modal-content modal-body border-0 p-0">
							<div class="input-group mb-2">
								<input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ..."/>
								<button type="submit" class="input-group-text bg-success text-light">
									<i class="fa fa-fw fa-search text-white"></i>
								</button>
							</div>
						</form>
					</div>
				</div>

				<!-- Menu -->
				<xsl:choose>
					<xsl:when test ="$TipoFarmacia = 1">
						<xsl:call-template name="Productos"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoFarmacia = 2 ">
						<xsl:call-template name="Contacto"></xsl:call-template>
					</xsl:when>
					<xsl:when test="$TipoFarmacia = 3">
						<xsl:call-template name="Tips-ayuda"></xsl:call-template>
					</xsl:when>

					<xsl:otherwise>
						<xsl:call-template name="Home"></xsl:call-template>
					</xsl:otherwise>

				</xsl:choose>
				<!-- Fin Menu -->

				<!--Footer -->
				<footer class="bg-dark" id="tempaltemo_footer">
					<div class="container">
						<div class="row">

							<div class="col-md-4 pt-5">
								<h2 class="h2 text-success border-bottom pb-3 border-light logo">
									<xsl:value-of select="Datos/NombreFarmacia"/>
								</h2>
								<ul class="list-unstyled text-light footer-link-list">
									<li>
										<i class="fas fa-map-marker-alt fa-fw"></i>
										<xsl:value-of select="Datos/Direccion"/>
									</li>
									<li>
										<i class="fa fa-phone fa-fw"></i>
										<a class="text-decoration-none">
											<xsl:value-of select="Datos/Telefono"/>
										</a>
									</li>
									<li>
										<i class="fa fa-envelope fa-fw"></i>
										<a class="text-decoration-none">
											<xsl:value-of select="Datos/CorreoElectronico"/>
										</a>
									</li>
								</ul>
							</div>

							<!--<div class="col-md-4 pt-5">
								<h2 class="h2 text-light border-bottom pb-3 border-light">Products</h2>
								<ul class="list-unstyled text-light footer-link-list">
									<li>
										<a class="text-decoration-none" href="#">Luxury</a>
									</li>
									<li>
										<a class="text-decoration-none" href="#">Sport Wear</a>
									</li>
									<li>
										<a class="text-decoration-none" href="#">Men's Shoes</a>
									</li>
									<li>
										<a class="text-decoration-none" href="#">Women's Shoes</a>
									</li>
									<li>
										<a class="text-decoration-none" href="#">Popular Dress</a>
									</li>
									<li>
										<a class="text-decoration-none" href="#">Gym Accessories</a>
									</li>
									<li>
										<a class="text-decoration-none" href="#">Sport Shoes</a>
									</li>
								</ul>
							</div>-->

							<!--<div class="col-md-4 pt-5">
								<h2 class="h2 text-light border-bottom pb-3 border-light">Further Info</h2>
								<ul class="list-unstyled text-light footer-link-list">
									<li>
										<a class="text-decoration-none" href="#">Home</a>
									</li>
									<li>
										<a class="text-decoration-none" href="#">About Us</a>
									</li>
									<li>
										<a class="text-decoration-none" href="#">Shop Locations</a>
									</li>
									<li>
										<a class="text-decoration-none" href="#">FAQs</a>
									</li>
									<li>
										<a class="text-decoration-none" href="#">Contact</a>
									</li>
								</ul>
							</div>-->

						</div>

						<div class="row text-light mb-4">
							<div class="col-12 mb-3">
								<div class="w-100 my-3 border-top border-light"></div>
							</div>
							<div class="col-auto me-auto">
								<ul class="list-inline text-left footer-icons">
									<li class="list-inline-item border border-light rounded-circle text-center">
										<a class="text-light text-decoration-none" target="_blank" href="http://facebook.com/">
											<i class="fab fa-facebook-f fa-lg fa-fw"></i>
										</a>
									</li>
									<li class="list-inline-item border border-light rounded-circle text-center">
										<a class="text-light text-decoration-none" target="_blank" href="https://www.instagram.com/">
											<i class="fab fa-instagram fa-lg fa-fw"></i>
										</a>
									</li>
									<li class="list-inline-item border border-light rounded-circle text-center">
										<a class="text-light text-decoration-none" target="_blank" href="https://twitter.com/">
											<i class="fab fa-twitter fa-lg fa-fw"></i>
										</a>
									</li>
									<li class="list-inline-item border border-light rounded-circle text-center">
										<a class="text-light text-decoration-none" target="_blank" href="https://www.linkedin.com/">
											<i class="fab fa-linkedin fa-lg fa-fw"></i>
										</a>
									</li>
								</ul>
							</div>
							<!--<div class="col-auto">
								<label class="sr-only" for="subscribeEmail">Email address</label>
								<div class="input-group mb-2">
									<input type="text" class="form-control bg-dark border-light" id="subscribeEmail" placeholder="Email address"/>
										<div class="input-group-text btn-success text-light">Subscribe</div>
									</div>
							</div>-->
						</div>
					</div>

					<div class="w-100 bg-black py-3">
						<div class="container">
							<div class="row pt-2">
								<div class="col-12">
									<p class="text-left text-light">
										Copyright 2021 Company Name
										| Designed by <a rel="sponsored" href="https://templatemo.com" target="_blank">TemplateMo</a>
									</p>
								</div>
							</div>
						</div>
					</div>

				</footer>
				<!-- Fin Footer -->
			</body>
		</html>
	</xsl:template>

	<xsl:template name="Home">
		<!-- Pagina de inicio -->
		<section class="container py-5">
			<div class="row text-center pt-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">
						<xsl:value-of select="Datos/Eslogan/Frase"/>
					</h1>
					<p>
						<xsl:value-of select="Datos/Eslogan/Descripcion"/>
					</p>
				</div>
			</div>
			<div class="row">

				<!-- Muestra de productos -->
				<xsl:for-each select="Productos/Categoria[@Nombre != 'Curaciones']">
					<div class="col-12 col-md-4 p-5 mt-3">
						<a href="#">
							<img src="{Producto/Imagen}" class="rounded-circle img-fluid border"/>
						</a>
						<h2 class="h5 text-center mt-3 mb-3">
							<xsl:value-of select="Producto[@Orden = 1]/@Nombre"/>
						</h2>
						<p class="text-center">
							<a class="btn btn-success">
								<xsl:value-of select="@Nombre"/>
							</a>
						</p>
					</div>
				</xsl:for-each>

			</div>
		</section>
	</xsl:template>

	<xsl:template name="Productos">
		<!-- Empieza el contenido -->
		<div class="container py-5">
			<section>
				<div class="row">
					<!-- Nombre de las categorias de productos -->
					<div class="col-lg-3">
						<h1 class="h2 pb-4">Categorías</h1>
						<ul class="list-unstyled templatemo-accordion">
							<xsl:for-each select="Productos/Categoria">
								<li class="pb-3">
									<a class="collapsed d-flex justify-content-between h3 text-decoration-none tipofarmacia" style="cursor:pointer;" id="li{@Nombre}" data-identificador="{@Nombre}">
										<xsl:value-of select="@Nombre"/>
										<i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</div>
					<!-- Muestra la imagen, nombre, precio y descripción de los productos de la categoría seleccionada -->
					<div class="col-lg-9">
						<div class="row">
							<xsl:for-each select="Productos/Categoria">
								<div class="col-md-4 contenedores" id="{@Nombre}">
									<xsl:for-each select="Producto">
										<div class="card mb-4 product-wap rounded-0">
											<div class="card rounded-0">
												<img class="card-img rounded-0 img-fluid imagenProducto" src="{Imagen}" alt="Product"/>
											</div>
											<div class="card-body">
												<a class="h3 text-decoration-none mt-3 mb-0 ">
													<xsl:value-of select="@Nombre"/>
												</a>
												<p class="text-center mb-0 pt-3 ">
													<xsl:value-of select="Descripcion"/>
												</p>
												<p class="text-center mb-0 pt-3">
													<xsl:value-of select="Precio"/>
												</p>
											</div>
										</div>
									</xsl:for-each>

								</div>

							</xsl:for-each>
						</div>
					</div>
				</div>
			</section>
		</div>
		<!-- Script que hace de manera dinamica la muestra de productos conforme a la categoria seleccionada -->
		<script>
			$(document).ready(function(){
			$("#liMedicamento").addClass("active");
			$(".contenedores").hide();
			$("#Medicamento").show();
			$(".tipofarmacia").click(function() {
			$(".contenedores").hide();
			var nombre = $(this).data("identificador");
			$(".tipofarmacia").removeClass("active");
			$(this).addClass("active");
			$("#" + nombre).show();
			});
			});
		</script>

	</xsl:template>

	<xsl:template name="Contacto">

		<script src="//maps.googleapis.com/maps/api/js?key=AIzaSyCWeeateTaYGqsHhNcmoDfT7Us-vLDZVPs&amp;sensor=false&amp;language=en"></script>
		<script src="js/fechaHora.js" type="text/javascript" ></script>
		<script src="js/UbicacionFarmacia.js" type="text/javascript" ></script>

		<!-- Contenido de Inicio -->
		<div class="container-fluid bg-light py-5">
			<div class="col-md-6 m-auto text-center">
				<h1 class="h1">Contactanos</h1>
				<p>
					<xsl:value-of select="concat('Nos puedes ubicar en ', Datos/Direccion, ' Tel: ', Datos/Telefono)"/>
				</p>
			</div>
		</div>

		<!-- Mapa -->

		<div class="row">
			<div class="col-md-4" id="mapid" style="width: 55%; height: 300px;">
				<input id ="lat" name="lat" readonly="true" disabled="true">
					<xsl:attribute name ="value">
						<xsl:value-of select="Datos/Ubicacion/Latitud"/>
					</xsl:attribute>
				</input>
				<input id="lng" name="lng" disabled="true" readonly="true">
					<xsl:attribute name="value">
						<xsl:value-of select="Datos/Ubicacion/Longitud"/>
					</xsl:attribute>
				</input>
			</div>
			<div class="col-md-4" id="street" style="width: 45%; height: 300px;">
			</div>
		</div>

		<!-- Citas -->
		<div class="container-fluid bg-light py-5">
			<div class="col-md-6 m-auto text-center">
				<h1 class="h1">Agenda Una Cita</h1>
				<p>
					Si necesitas asistencia medica puedes ir a nuestra surcusal agendando una cita desde nuestra página web.
					Llena el siguiente formulario con tus datos.
				</p>
			</div>
		</div>

		<!-- Captura de Datos -->
		<div class="container py-5">
			<div class="row py-5">
				<form class="col-md-9 m-auto" method="post" role="form">
					<div class="row">
						<div class="form-group col-md-6 mb-3">
							<label for="inputname">Nombre Completo</label>
							<input type="text" class="form-control mt-1" id="contact_nombre" name="contact_nombre" placeholder="Ej. Eric Cruz Sanchez" required="true"/>
						</div>
						<div class="form-group col-md-6 mb-3">
							<label for="inputemail">Correo Electrónico</label>
							<input type="email" class="form-control mt-1" id="contact_email" name="contact_email" placeholder="Ej. miCorreo@gmail.com" required="true"/>
						</div>
						<div class="form-group col-md-6 mb-3">
							<label for="inputphone">Número Teléfonico/Celular</label>
							<input type="number" class="form-control mt-1" id="contact_telefono" name="contact_telefono" placeholder="Ej. 1234 245 0002"/>
						</div>
						<div class="form-group col-md-6 mb-3">
							<label for="inputsubject">Fecha</label>
							<input type="date" class="form-control mt-1" id="contact_fecha" name="contact_fecha" />
						</div>
						<div class="form-group col-md-6 mb-3">
							<label for="inputsubject">Hora</label>
							<input type="time" class="form-control mt-1" id="contact_time" name="contact_time" placeholder="Hora" required="true" max="19:00:00" min="08:00:00"/>
						</div>
					</div>

					<div class="row">
						<div class="col text-end mt-2">
							<button type="submit" class="btn btn-success btn-lg px-3">Enviar</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<script>
			<![CDATA[
			$(document).ready( function(){
				fechaConHora();
				getUbicacion();
				
			});
			]]>
		</script>

	</xsl:template>

	<xsl:template name="Tips-ayuda">

		<script src="js/draganddrop.js" type="text/javascript"></script>

		<!-- Video -->
		<section class="bg-success py-5">
			<div class="container my-4">
				<div class="row text-center py-5">
					<div class="col-md-8 text-white">
						<h1>Cuidados en tu Salud</h1>
						<p>
							Tips que te pueden ayudar para tener una vida saludable
						</p>
						<video width="100%" controls="true" poster="/img/Tips-de-salud.jpg">
							<source src="multimedia/Tips de Salud.mp4"></source>
						</video>
					</div>
				</div>
			</div>
		</section>

		<!-- Drag & Drop-->
		<section class="container py-5 ">
			<div class="row text-center pt-5 pb-3">
				<div class="col-lg-6 m-auto">
					<h1 class="h1">Ejercicio para la mente</h1>
					<p>
						Para el siguiente ejercicio debes de mover las cartas en la siguiente seccion en orden númerico y las
						que son letras eliminalas en la otra seccion.
					</p>
				</div>
			</div>

			<div class="row ">

				<div id="cuadro1" class="row col-lg-4 border" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return drop(event)">

					<div id="arrastable1"  class="col-lg-4 tarjeta" draggable="true" ondragstart="return start(event)" ondragend="return end(event)">
						<a class="navbar-brand text-success logo h1 align-self-center">
							H
						</a>
					</div>

					<div id="arrastable2"  class="col-lg-4 tarjeta" draggable="true" ondragstart="return start(event)" ondragend="return end(event)">
						<a class="navbar-brand text-success logo h1 align-self-center">
							Z
						</a>
					</div>

					<div id="arrastable3"  class="col-lg-4 tarjeta" draggable="true" ondragstart="return start(event)" ondragend="return end(event)">
						<a class="navbar-brand text-success logo h1 align-self-center">
							5
						</a>
					</div>


					<div  id="arrastable4"  class="col-lg-4 tarjeta" draggable="true" ondragstart="return start(event)" ondragend="return end(event)">
						<a class="navbar-brand text-success logo h1 align-self-center">
							6
						</a>
					</div>

					<div  id="arrastable5" class="col-lg-4 tarjeta" draggable="true" ondragstart="return start(event)" ondragend="return end(event)">
						<a class="navbar-brand text-success logo h1 align-self-center">
							1
						</a>
					</div>

					<div id="arrastable6"  class="col-lg-4 tarjeta" draggable="true" ondragstart="return start(event)" ondragend="return end(event)">
						<a class="navbar-brand text-success logo h1 align-self-center">
							J
						</a>
					</div>


					<div id="arrastable7"  class="col-lg-4 tarjeta" draggable="true" ondragstart="return start(event)" ondragend="return end(event)">
						<a class="navbar-brand text-success logo h1 align-self-center">
							3
						</a>
					</div>

					<div id="arrastable8"  class="col-lg-4 tarjeta" draggable="true" ondragstart="return start(event)" ondragend="return end(event)">
						<a class="navbar-brand text-success logo h1 align-self-center">
							2
						</a>
					</div>

					<div  id="arrastable9"  class="col-lg-4 tarjeta" draggable="true" ondragstart="return start(event)" ondragend="return end(event)">
						<a class="navbar-brand text-success logo h1 align-self-center">
							9
						</a>
					</div>


					<div id="arrastable10"  class="col-lg-4 tarjeta" draggable="true" ondragstart="return start(event)" ondragend="return end(event)">
						<a class="navbar-brand text-success logo h1 align-self-center">
							4
						</a>
					</div>

					<div  id="arrastable11"  class="col-lg-4 tarjeta" draggable="true" ondragstart="return start(event)" ondragend="return end(event)">
						<a class="navbar-brand text-success logo h1 align-self-center">
							8
						</a>
					</div>

					<div  id="arrastable12"  class="col-lg-4 tarjeta" draggable="true" ondragstart="return start(event)" ondragend="return end(event)">
						<a class="navbar-brand text-success logo h1 align-self-center">
							7
						</a>
					</div>

				</div>


				<div id="cuadro2" class="row col-lg-4 border" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return drop(event)">
					<div class="col-lg-12">
						<p class="col" width="35px"  height="35px" >Ordene aqui</p>
					</div>
					<div class="col-lg-4 tarjeta" ondragstart="return start(event)" ondragend="return end(event)" ondrop="return drop(event)">

					</div>
					<div class="col-lg-4 tarjeta" ondragstart="return start(event)" ondragend="return end(event)" ondrop="return drop(event)">

					</div>
					<div class="col-lg-4 tarjeta">

					</div>
					<div class="col-lg-4 tarjeta">

					</div>
					<div class="col-lg-4 tarjeta">

					</div>
					<div class="col-lg-4 tarjeta">

					</div>
					<div class="col-lg-4 tarjeta">

					</div>
					<div class="col-lg-4 tarjeta">

					</div>
					<div class="col-lg-4 tarjeta">

					</div>
				</div>

				<div id="papelera" class="container row col-lg-4 border" ondragenter="return enter(event)" ondragover="return over(event)" ondragleave="return leave(event)" ondrop="return eliminar(event)" >
					<p class="col" width="35px"  height="35px">Borre aqui</p>
				</div>
			</div>
		</section>

		<!-- Audio -->
		<section class="bg-light py-5">
			<div class="container my-4">
				<div class="row text-center py-3">
					<div class="col-lg-6 m-auto">
						<h1 class="h1">Relajate....</h1>
						<p>
							Toma un momento para relajarte, escucha el siguiente audio y cierra los ojos.
						</p>
						<img src="img/relajacion.jpg" width="100%"></img>
						<audio controls="true" style="width:100%">
							<source src="/multimedia/Hans Zimmer - Interstellar PIANO.mp3"></source>
						</audio>
					</div>
				</div>
			</div>
		</section>
	</xsl:template>

</xsl:stylesheet>
