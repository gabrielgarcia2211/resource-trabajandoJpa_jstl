package mensajeJPA.util;

import java.util.List;

import mensajeJPA.dao.MensajeDao;
import mensajeJPA.dao.UsuarioDao;
import mensajeJPA.entities.Mensaje;
import mensajeJPA.entities.Usuario;

public class Prueba {

	public static void main(String[] args) {
		MensajeDao uDao = new MensajeDao();
		List<Mensaje> usuarios  = uDao.list();
		System.out.println(usuarios.size());
		
		Mensaje men = new Mensaje();
		Usuario user =new Usuario();
		
		user.setUser("cc");
		user.setClave("1234");
		
		men.setEmail("sss");
		men.setMessage("scdcs");
		men.setName("ssss");
		men.setUsuarioBean(user);
		men.setWebsite("wwwww");
		
		
		uDao.insert(men);
	}

}
