package util;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthenticator extends Authenticator {

	PasswordAuthentication authentication;

	public GoogleAuthenticator() {

		try {
			String path = GoogleAuthenticator.class.getResource("../prop/mail.properties").getPath();
			Properties prop = new Properties();
			prop.load(new FileReader(path));
			String auth = prop.getProperty("auth");
			String pass = prop.getProperty("pass");
			System.out.println("auth : " + auth + " | pass : " + pass);

			authentication = new PasswordAuthentication(auth, pass);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public PasswordAuthentication getPasswordAuthentication() {
		return authentication;
	}

}