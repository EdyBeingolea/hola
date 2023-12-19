package pe.edu.vallegrande.model;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.nio.Buffer;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class bienes {
	private int id;
	private String codigo;
	private int cantidad;
	private String nombre;
	private double PRECIO;
	private String FECHA_INGRESO;
	private String FECHA_DEPRECIAICION;
	private int PROCEDIMIENTOS_ID;
	private double DEPRECIACION_ANUAL;
	private double DEPRECIACION_MENSUAL;
	private double DEPRECIACION_ACUMULADA;
	private String AREAS;
	private int AREAS_ID;
	private String ESTADO;
	private String exportarCSV = "bienes.txt";
	
	public static void exportar(int cantidad, String nombre,double PRECIO,
			String FECHA_INGRESO,String FECHA_DEPRECIAICION,int PROCEDIMIENTOS_ID,
			double DEPRECIACION_ANUAL,double DEPRECIACION_MENSUAL,double DEPRECIACION_ACUMULADA,
			String AREAS,String ESTADO,String exportarCSV) {
		try {
			FileWriter fw = new FileWriter(exportarCSV,true);
			BufferedWriter bw = new BufferedWriter(fw);
			PrintWriter pw = new PrintWriter(bw);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
