
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mailTest")
public class GoogleMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Properties props = System.getProperties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");
		System.out.println(props);

		Authenticator authenticator = new MyAuthentication();
		Session session = Session.getDefaultInstance(props, authenticator);
		MimeMessage msg = new MimeMessage(session);

		try {
			msg.setSentDate(new Date());
			InternetAddress address = new InternetAddress("hap0p9y@nate.com");
			msg.setRecipient(Message.RecipientType.TO, address);
			msg.setSubject("테스트 입니다.");
			msg.setText("테스트 내용입니다.");
			msg.setHeader("Content-Type", "text/html; charset=UTF-8");
			Transport.send(msg);
			System.out.println("메일 전송 성공");
		} catch (MessagingException e) {
			e.printStackTrace();
			System.out.println("메일 전송 실패");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
