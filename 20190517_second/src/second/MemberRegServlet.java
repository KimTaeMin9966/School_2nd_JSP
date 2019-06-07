package second;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/MemberRegServlet")
public class MemberRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberRegServlet GET 요청");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("MemberRegServlet POST 요청");
		
		/*
		 * name
		 * addr
		 * mobile
		 * hobby
		 */
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String mobile = request.getParameter("mobile");
		String hobby = request.getParameter("hobby");
		
		System.out.println("name : "+ name +" addr : "+ addr +" mobile : "+ mobile +" hobby : "+ hobby);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.println("이름 : " + name);
		pw.println("주소 : " + addr);
		pw.println("전화 : " + mobile);
		pw.println("취미 : " + hobby);
		pw.println("<a href='index.html'>메인으로</a>");
		//pw.println("<script>location.href='index.html'</script>");
	}
}


