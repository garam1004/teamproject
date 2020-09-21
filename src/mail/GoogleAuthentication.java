package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
	PasswordAuthentication passAuth;
	
	public GoogleAuthentication() {
		passAuth = new PasswordAuthentication("ansqkdtkdn1@gmail.com", "wjdfo7123");
	}

	public PasswordAuthentication getPasswordAuthentication () {
		return passAuth;
	}	
}