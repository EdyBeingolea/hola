<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="index.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Agregar Bienes</title>
</head>
<body>
	<div class="container">
		<h1>Agregar Bienes</h1>
		<form action="Agregar" method="post">

			<div class="mb-3">
				<label class="form-label">CANTIDAD</label> <input type="number"
					name="cantidad" class="form-control" placeholder="0"
					pattern="[0-9]" title="Solo se ingresan numeros" required>
			</div>

			<div class="mb-3">
				<label class="form-label">NOMBRE DEL BIEN</label> <input type="text"
					name="nombre" class="form-control"
					placeholder="Escriba bien el nombre del bien"
					pattern="[A-Za-z0-9. ]+" title="Solo letras permitidas" required>
			</div>

			<label class="form-label">PRECIO</label>
			<div class="input-group flex-nowrap mb-3">
				<span class="input-group-text" id="addon-wrapping">S/.</span> <input
					type="text" name="precio" class="form-control" placeholder="00.0"
					pattern="[0-9]+(\.[0-9]+)?" title="Solo se ingresan numeros"
					required>
			</div>

			<div class="mb-3">
				<label class="form-label">FECHA DE INGRESO</label> <input
					type="date" name="FECHA_INGRESO" class="form-control" required>
			</div>

			<div class="mb-3">
				<label class="form-label">FECHA DE DEPRECIACION</label> <input
					type="date" name="FECHA_DEPRECIAICION" class="form-control"
					required>
			</div>

			<div class="mb-3">
				<label class="form-label">TIPO DE DEPRECIACION</label> <select
					id="PROCEDIMIENTOS_ID" name="PROCEDIMIENTOS_ID"
					class="form-control">
					<option value="0">Seleccione uno</option>
					<option value="1">Ganaderia y Pesca</option>
					<option value="2">Transporte Terreste</option>
					<option value="3">Maquinaria Petrolera</option>
					<option value="4">Equipo de Procesamiento de Datos</option>
					<option value="5">Maquinaria y equipo Adquirido a partir
						del 1/1/1991</option>
					<option value="6">Otros bienes de activos Fijos</option>
				</select>
			</div>

			<div class="mb-3">
				<label class="form-label">AREA DESIGNADA</label> <select
					id="AREAS_ID" name="AREAS_ID" class="form-control">
					<option value="0">Seleccione uno</option>
					<option value="1">PRODUCCION</option>
					<option value="2">CONTABILIDAD</option>
					<option value="3">MARKETING</option>
					<option value="4">RECURSOS HUMANOS</option>
					<option value="5">VENTAS</option>
				</select>
			</div>

			<button type="submit" class="btn btn-primary">Aceptar</button>
			<button type="reset" class="btn btn-primary">Limpiar</button>
			<a href="listarTodos" style="color: white;"><button type="button"
					class="btn btn-secondary">Cancelar</button></a>
		</form>
	</div>


</body>
</html>
