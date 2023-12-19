<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="index.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


</head>
<body>
	<div class="container">
		<h1>Editar Clientes</h1>

		<form action="Editar" method="post">
			<div class="mb-3">
				<label class="form-label">CANTIDAD</label> <input type="number"
					name="cantidad" class="form-control"
					value="<c:out value="${editar.cantidad}" />" pattern="[0-9]+"
					title="Solo numeros permitidas" required>
			</div>

			<div class="mb-3">
				<label class="form-label">Nombre</label> <input type="text"
					name="nombre" class="form-control"
					value="<c:out value="${editar.nombre}" />"
					pattern="[A-Za-z0-9. ]+" title="Solo letras permitidas"
					required>
			</div>

			<div class="mb-3">
				<label class="form-label">PRECIO</label> <input type="text"
					name="PRECIO" class="form-control" pattern="[0-9]+(\.[0-9]+)?"
					value="<c:out value="${editar.PRECIO}" />"
					title="Solo numeros permitidas"
					required>
			</div>



			<div class="mb-3">
				<label class="form-label">FECHA DE INGRESO</label> <input
					type="date" name="FECHA_INGRESO" class="form-control"
					value="<c:out value="${editar.FECHA_INGRESO}" />" required>
			</div>

			<div class="mb-3">
				<label class="form-label">FECHA DE DEPRECIACION</label> <input
					type="date" name="FECHA_DEPRECIAICION" class="form-control"
					value="<c:out value="${editar.FECHA_DEPRECIAICION}" />" required>
			</div>

			<div class="mb-3">
				<label class="form-label">TIPO DE DEPRECIACION</label> <select
					id="PROCEDIMIENTOS_ID" name="PROCEDIMIENTOS_ID"
					class="form-control">
					<option value="1"
						<c:if test="${editar.PROCEDIMIENTOS_ID eq '1'}">selected</c:if>>Ganaderia
						y Pesca</option>
					<option value="2"
						<c:if test="${editar.PROCEDIMIENTOS_ID eq '2'}">selected</c:if>>Transporte
						Terreste</option>
					<option value="3"
						<c:if test="${editar.PROCEDIMIENTOS_ID eq '3'}">selected</c:if>>Maquinaria
						Petrolera</option>
					<option value="4"
						<c:if test="${editar.PROCEDIMIENTOS_ID eq '4'}">selected</c:if>>Equipo
						de Procesamiento de Datos</option>
					<option value="5"
						<c:if test="${editar.PROCEDIMIENTOS_ID eq '5'}">selected</c:if>>Maquinaria
						y equipo Adquirido a partir del 1/1/1991</option>
					<option value="6"
						<c:if test="${editar.PROCEDIMIENTOS_ID eq '6'}">selected</c:if>>Otros
						bienes de activos Fijos</option>
				</select>
			</div>

			<div class="mb-3">
				<label class="form-label">AREA DESIGNADA</label> <select
					id="AREAS_ID" name="AREAS_ID" class="form-control">
					<option value="1"
						<c:if test="${editar.AREAS_ID eq '1'}">selected</c:if>>PRODUCCION</option>
					<option value="2"
						<c:if test="${editar.AREAS_ID eq '2'}">selected</c:if>>CONTABILIDAD</option>
					<option value="3"
						<c:if test="${editar.AREAS_ID eq '3'}">selected</c:if>>MARKETING</option>
					<option value="4"
						<c:if test="${editar.AREAS_ID eq '4'}">selected</c:if>>RECURSOS
						HUMANOS</option>
					<option value="5"
						<c:if test="${editar.AREAS_ID eq '5'}">selected</c:if>>VENTAS</option>

				</select>
			</div>

			<button type="submit" class="btn btn-primary">Aceptar</button>
			<a href="listarTodos" style="color: white;"><button type="button"
					class="btn btn-secondary">Cancelar</button></a>
		</form>
	</div>
</body>
</html>
