package second;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/choiceDog")
public class ChoiceDogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ChoiceDogServlet POST 요청");
		
		request.setCharacterEncoding("UTF-8");
		
		String[] dogs = request.getParameterValues("dog");
		
		response.setContentType("text/html;charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		for(String dog : dogs) {
			System.out.println("choice dog : " + dog);
			out.print(dog +" <br/>");
			out.print("<img src='images/"+dog+"'/><br/>");
		}
	}
}
