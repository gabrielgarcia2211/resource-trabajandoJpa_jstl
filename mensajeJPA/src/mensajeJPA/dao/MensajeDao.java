package mensajeJPA.dao;

import mensajeJPA.entities.Mensaje;
import mensajeJPA.util.Conexion;

	public class MensajeDao 
	extends Conexion<Mensaje> 
	implements GenericDao<Mensaje> {
		
		public MensajeDao(){
			super(Mensaje.class);
		}
		
	}
