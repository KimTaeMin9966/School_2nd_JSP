
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("*.test")
public class UploadTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// upload.test fileUpload.test
		request.setCharacterEncoding("UTF-8");
		String command = request.getRequestURI().substring(request.getContextPath().length() + 1);

		if (command.equals("upload.test")) request.getRequestDispatcher("/upload.jsp").forward(request, response);

		if (command.equals("fileUpload.test")) {
			System.out.println("파일 업로드 요청");

			String testText = request.getParameter("testText");
			String uploadFile = request.getParameter("uploadFile");

			System.out.println("testText : " + testText);
			System.out.println("uploadFile : " + uploadFile);

			String saveDir = "/upload";
			String realPath = request.getSession().getServletContext().getRealPath(saveDir);
			System.out.println(realPath);

			MultipartRequest multi = new MultipartRequest(request, realPath, 1024 * 1024 * 10, "utf-8",
					new DefaultFileRenamePolicy());

			String file = (String) multi.getFileNames().nextElement();
			String fileName = multi.getFilesystemName(file);
			System.out.println("upload된 파일 이름 : " + fileName);
			String file_origin = multi.getOriginalFileName(file);
			System.out.println("원본 파일 이름 : " + file_origin);
			System.out.println("testText : " + multi.getParameter("testText"));
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
