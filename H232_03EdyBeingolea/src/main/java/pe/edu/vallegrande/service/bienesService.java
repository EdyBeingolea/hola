package pe.edu.vallegrande.service;

import java.io.FileWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pe.edu.vallegrande.conexion.Acceso;
import pe.edu.vallegrande.model.bienes;

public class bienesService {

	public List<bienes> getAll() {
		List<bienes> getAll = new ArrayList<>();
		String sql = "select codigo, cantidad , b.NOMBRE as nombre, PRECIO, FORMAT(FECHA_INGRESO, 'dd/MM/yyyy') as FECHA_INGRESO, FORMAT(FECHA_DEPRECIAICION, 'dd/MM/yyyy') as FECHA_DEPRECIAICION,"
				+ "DEPRECIACION_ANUAL ,DEPRECIACION_MENSUAL ,DEPRECIACION_ACUMULADA,a.NOMBRE  AS AREAS FROM BIENES as b inner join AREAS as a on a.ID = b.AREAS_ID";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql);
				ResultSet rs = pstm.executeQuery()) {
			while (rs.next()) {
				bienes bie = new bienes();
				bie.setCodigo(rs.getString("codigo"));
				bie.setCantidad(rs.getInt("cantidad"));
				bie.setNombre(rs.getString("nombre"));
				bie.setPRECIO(rs.getDouble("PRECIO"));
				bie.setFECHA_INGRESO(rs.getString("FECHA_INGRESO"));
				bie.setFECHA_DEPRECIAICION(rs.getString("FECHA_DEPRECIAICION"));
				bie.setDEPRECIACION_ANUAL(rs.getDouble("DEPRECIACION_ANUAL"));
				bie.setDEPRECIACION_MENSUAL(rs.getDouble("DEPRECIACION_MENSUAL"));
				bie.setDEPRECIACION_ACUMULADA(rs.getDouble("DEPRECIACION_ACUMULADA"));
				bie.setAREAS(rs.getString("AREAS"));
				getAll.add(bie);
			}
		} catch (Exception e) {
			System.out.println("Error en los listar los bienes de todos " + e.getMessage());
		}
		return getAll;
	}

	public List<bienes> getActive() {
		List<bienes> getActive = new ArrayList<>();
		String sql = "select codigo, cantidad , b.NOMBRE as nombre, PRECIO, FORMAT(FECHA_INGRESO, 'dd/MM/yyyy') as FECHA_INGRESO, FORMAT(FECHA_DEPRECIAICION, 'dd/MM/yyyy') as FECHA_DEPRECIAICION,"
				+ "DEPRECIACION_ANUAL ,DEPRECIACION_MENSUAL ,DEPRECIACION_ACUMULADA,a.NOMBRE  AS AREAS FROM BIENES as b inner join AREAS as a on a.ID = b.AREAS_ID where  b.ESTADO = 'ALTO'";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql);
				ResultSet rs = pstm.executeQuery()) {
			while (rs.next()) {
				bienes bie = new bienes();
				bie.setCodigo(rs.getString("codigo"));
				bie.setCantidad(rs.getInt("cantidad"));
				bie.setNombre(rs.getString("nombre"));
				bie.setPRECIO(rs.getDouble("PRECIO"));
				bie.setFECHA_INGRESO(rs.getString("FECHA_INGRESO"));
				bie.setFECHA_DEPRECIAICION(rs.getString("FECHA_DEPRECIAICION"));
				bie.setDEPRECIACION_ANUAL(rs.getDouble("DEPRECIACION_ANUAL"));
				bie.setDEPRECIACION_MENSUAL(rs.getDouble("DEPRECIACION_MENSUAL"));
				bie.setDEPRECIACION_ACUMULADA(rs.getDouble("DEPRECIACION_ACUMULADA"));
				bie.setAREAS(rs.getString("AREAS"));
				getActive.add(bie);

			}
		} catch (Exception e) {
			System.out.println("Error en los listar los bienes activos" + e.getMessage());
		}
		return getActive;
	}

	public List<bienes> getInactive() {
		List<bienes> getInactive = new ArrayList<>();
		String sql = "select codigo, cantidad , b.NOMBRE as nombre, PRECIO, FORMAT(FECHA_INGRESO, 'dd/MM/yyyy') as FECHA_INGRESO, FORMAT(FECHA_DEPRECIAICION, 'dd/MM/yyyy') as FECHA_DEPRECIAICION,"
				+ "DEPRECIACION_ANUAL ,DEPRECIACION_MENSUAL ,DEPRECIACION_ACUMULADA,a.NOMBRE  AS AREAS FROM BIENES as b inner join AREAS as a on a.ID = b.AREAS_ID where  b.ESTADO = 'BAJO'";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql);
				ResultSet rs = pstm.executeQuery()) {
			while (rs.next()) {
				bienes bie = new bienes();
				bie.setCodigo(rs.getString("codigo"));
				bie.setCantidad(rs.getInt("cantidad"));
				bie.setNombre(rs.getString("nombre"));
				bie.setPRECIO(rs.getDouble("PRECIO"));
				bie.setFECHA_INGRESO(rs.getString("FECHA_INGRESO"));
				bie.setFECHA_DEPRECIAICION(rs.getString("FECHA_DEPRECIAICION"));
				bie.setDEPRECIACION_ANUAL(rs.getDouble("DEPRECIACION_ANUAL"));
				bie.setDEPRECIACION_MENSUAL(rs.getDouble("DEPRECIACION_MENSUAL"));
				bie.setDEPRECIACION_ACUMULADA(rs.getDouble("DEPRECIACION_ACUMULADA"));
				bie.setAREAS(rs.getString("AREAS"));
				getInactive.add(bie);

			}
		} catch (Exception e) {
			System.out.println("Error en los listar los bienes bienes " + e.getMessage());
		}
		return getInactive;
	}

	public bienes getByid(String codigo) {
		bienes bien = null;
		String sql = "select * from bienes where codigo = ?";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setString(1, codigo);
			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				bien = new bienes();
				bien.setCodigo(rs.getString("codigo"));
				bien.setCantidad((rs.getInt("cantidad")));
				bien.setNombre(rs.getString("nombre"));
				bien.setPRECIO(rs.getDouble("precio"));
				bien.setFECHA_INGRESO(rs.getString("FECHA_INGRESO"));
				bien.setFECHA_DEPRECIAICION(rs.getString("FECHA_DEPRECIAICION"));
				bien.setPROCEDIMIENTOS_ID(rs.getInt("PROCEDIMIENTOS_ID"));
				bien.setAREAS_ID(rs.getInt("AREAS_ID"));

			}
		} catch (Exception e) {
			System.out.println("error al buscar por codigo" + e.getMessage());
		}
		return bien;
	}

	public bienes insert(bienes bean) {
		String sql = "SET DATEFORMAT dmy;" + "INSERT INTO BIENES"
				+ "(CANTIDAD, NOMBRE, PRECIO, FECHA_INGRESO, FECHA_DEPRECIAICION, PROCEDIMIENTOS_ID, AREAS_ID)"
				+ "VALUES" + "(?, ?, ?, ?, ?, ?, ?)";

		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setInt(1, bean.getCantidad());
			pstm.setString(2, bean.getNombre());
			pstm.setDouble(3, bean.getPRECIO());
			pstm.setString(4, bean.getFECHA_INGRESO());
			pstm.setString(5, bean.getFECHA_DEPRECIAICION());
			pstm.setInt(6, bean.getPROCEDIMIENTOS_ID()); // Aquí puede haber un error si PROCEDIMIENTOS_ID es un
															// porcentaje
			pstm.setInt(7, bean.getAREAS_ID());
			pstm.executeUpdate(); // ¡Es importante ejecutar la actualización!
		} catch (Exception e) {
			System.out.println("error en insertar bienes" + e.getMessage());
		}
		return bean;
	}

	public bienes update(bienes bean) {
		String sql = "SET DATEFORMAT dmy;"
				+ "update BIENES set CANTIDAD = ? ,NOMBRE = ?,PRECIO = ?,FECHA_INGRESO = ?,FECHA_DEPRECIAICION =  ? ,PROCEDIMIENTOS_ID = ?,AREAS_ID = ?"
				+ "where CODIGO =  ? ";

		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setInt(1, bean.getCantidad());
			pstm.setString(2, bean.getNombre());
			pstm.setDouble(3, bean.getPRECIO());
			pstm.setString(4, bean.getFECHA_INGRESO());
			pstm.setString(5, bean.getFECHA_DEPRECIAICION());
			pstm.setInt(6, bean.getPROCEDIMIENTOS_ID());
			pstm.setInt(7, bean.getAREAS_ID());
			pstm.setString(8, bean.getCodigo());
			pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("error en actualizar bienes" + e.getMessage());
		}
		return bean;
	}

	public void delete(String codigo) {
		String sql = "update bienes set estado = 'BAJO' where codigo = ?";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setString(1, codigo);
			pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error en eliminar de manera logica un bien" + e.getMessage());
		}
	}

	public void restore(String codigo) {
		String sql = "update bienes set estado = 'ALTO' where codigo = ?";
		try (PreparedStatement pstm = Acceso.getConnection().prepareStatement(sql)) {
			pstm.setString(1, codigo);
			pstm.executeUpdate();
		} catch (Exception e) {
			System.out.println("Error en restaurar de manera logica un bien" + e.getMessage());
		}
	}

	
}
