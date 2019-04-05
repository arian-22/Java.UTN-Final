package utils;

@SuppressWarnings("serial")
public class ApplicationExceptions extends Exception{
	
	public ApplicationExceptions(){
		super();
	}
	
	public String errorSQL() throws ApplicationExceptions{
		
		System.out.println("Estoy en exept");
		return "Error en la consulta de SQL. Por favor vuelva a intentar";
	}


}
