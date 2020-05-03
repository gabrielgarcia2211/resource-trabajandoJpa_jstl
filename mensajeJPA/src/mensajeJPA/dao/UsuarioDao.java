package mensajeJPA.dao;

import mensajeJPA.entities.Usuario;
import mensajeJPA.util.Conexion;

	public class UsuarioDao 
	extends Conexion<Usuario> 
	implements GenericDao<Usuario> {
		
		
			public UsuarioDao(){
				super(Usuario.class);
			}

	}
