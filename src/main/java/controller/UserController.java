package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import db.UserDao;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/user/*")
@MultipartConfig(
		fileSizeThreshold = 1024 * 1024 * 1,		// 1 MB
		maxFileSize = 1024 * 1024 * 10,				// 10 MB
		maxRequestSize = 1024 * 1024 * 10
)
public class UserController extends HttpServlet {
	public static final String PROFILE_PATH = "c:/Temp/profile/";

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] uri = request.getRequestURI().split("/");
		String action = uri[uri.length - 1];
		HttpSession session = request.getSession();
		session.setAttribute("menu", "user");
		UserDao uDao = new UserDao();
		
		RequestDispatcher rd = null;
		switch (action) {
		case "list":
			rd = request.getRequestDispatcher("/WEB-INF/view/user/list.jsp");
			rd.forward(request, response);
			break;
		case "login":
			if (request.getMethod().equals("GET")) {
				rd = request.getRequestDispatcher("/WEB-INF/view/user/login.jsp");
				rd.forward(request, response);
			} else {
				
			}
			break;
		case "register":
			if (request.getMethod().equals("GET")) {
				rd = request.getRequestDispatcher("/WEB-INF/view/user/register.jsp");
				rd.forward(request, response);
			} else {
				String uid = request.getParameter("uid");
				String pwd = request.getParameter("pwd");
				String pwd2 = request.getParameter("pwd2");
				String uname = request.getParameter("uname");
				String email = request.getParameter("email");
				Part filePart = request.getPart("profile");
				String addr = request.getParameter("addr");
				
				String filename = null;
				if (filePart != null) {
					filename = filePart.getSubmittedFileName();
					int dotPosition = filename.indexOf(".");
					String firstPart = filename.substring(0, dotPosition);
					filename = filename.replace(firstPart, uid);
					filePart.write(PROFILE_PATH + filename);
				}
				
				// uid가 중복?
				// pwd == pwd2?
				response.sendRedirect("/bbs/user/login");
			}
			break;
		}
	}


}
