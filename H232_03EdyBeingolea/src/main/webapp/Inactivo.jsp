<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="index.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Custom styles for this page -->
<link href="vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">


</head>
<body>

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->


		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h1 class="m-0 font-weight-bold text-primary"
					style="text-align: center;">Lista de Clientes Inactivos</h1>

				<!--  Seleccinar listado -->

				<div class="dropdown">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						data-bs-toggle="dropdown" aria-expanded="false">Estado</button>
					<ul class="dropdown-menu">
						<li><a href="listarTodos"><button class="dropdown-item"
									type="submit">Listar Todos</button></a></li>
						<li><a href="listarActivos"><button class="dropdown-item"
									type="submit">Activo</button></a></li>
						<li><a href="listarInactivos"><button
									class="dropdown-item" type="button">Inactivo</button></a></li>
					</ul>

					<!--  Boton agregar -->
					<button type="submit" class="btn btn-primary">
						<a href="Agregar.jsp" style="color: white;"> Agregar</a>
					</button>
				</div>




			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>CODIGO</th>
								<th>CANTIDAD</th>
								<th>NOMBRE</th>
								<th>PRECIO</th>
								<th>FECHA_INGRESO</th>
								<th>FECHA_DEPRECIAICION</th>
								<th>DEPRECIACION_ANUAL</th>
								<th>DEPRECIACION_MENSUAL</th>
								<th>DEPRECIACION_ACUMULADA</th>
								<th>AREAS</th>
								<th>ACCIONES</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>CODIGO</th>
								<th>CANTIDAD</th>
								<th>NOMBRE</th>
								<th>PRECIO</th>
								<th>FECHA_INGRESO</th>
								<th>FECHA_DEPRECIAICION</th>
								<th>DEPRECIACION_ANUAL</th>
								<th>DEPRECIACION_MENSUAL</th>
								<th>DEPRECIACION_ACUMULADA</th>
								<th>AREAS</th>
							</tr>
						</tfoot>

						<tbody>
							<c:forEach var="inactivo" items="${Inactivos}">

								<tr>
									<td><c:out value="${inactivo.codigo}" /></td>
									<td><c:out value="${inactivo.cantidad}" /></td>
									<td><c:out value="${inactivo.nombre}" /></td>
									<td><c:out value="${inactivo.PRECIO}" /></td>
									<td><c:out value="${inactivo.FECHA_INGRESO}" /></td>
									<td><c:out value="${inactivo.FECHA_DEPRECIAICION}" /></td>
									<td><c:out value="${inactivo.DEPRECIACION_ANUAL}" /></td>
									<td><c:out value="${inactivo.DEPRECIACION_MENSUAL}" /></td>
									<td><c:out value="${inactivo.DEPRECIACION_ACUMULADA}" /></td>
									<td><c:out value="${inactivo.AREAS}" /></td>
									<td class="d-flex justify-content-center">

										<form name="restaurar" action="Restaurar" method="post">
											<button type="submit" class="btn btn-primary">Restaurar</button>
											<input type="hidden" name="id_restore" value="${inactivo.codigo}">
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->

	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="js/demo/datatables-demo.js"></script>
	<!-- End of Main Content -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>
</html>