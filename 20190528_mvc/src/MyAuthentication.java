import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

class MyAuthentication extends Authenticator {

	PasswordAuthentication authentication;

	public MyAuthentication() {
		String userName = "chlrlrms1@gmail.com";
		String password = "kte123456";

		authentication = new PasswordAuthentication(userName, password);
	}

	@Override
	public PasswordAuthentication getPasswordAuthentication() {
		return authentication;
	}
}