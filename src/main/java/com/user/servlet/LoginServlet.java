package com.user.servlet;

import java.io.IOException;


import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			UserDAOImpl dao=new UserDAOImpl(DBConnect.getConnection());
			
			HttpSession session=req.getSession();
			
			String email=req.getParameter("email");
			String password=req.getParameter("password");
			/* System.out.println(email+" "+password); */
			if("admin@gmail.com".equals(email)&& "admin".equals(password)) {
				User us= new User();
				us.setName("Admin");
				/* LoginServlet us1 =new LoginServlet(); */
				session.setAttribute("userobj",us);
				resp.sendRedirect("admin/home.jsp");
			}else {
				com.entity.User us=dao.login(email, password);
				if(us!=null) {
					session.setAttribute("userobj", us);
					resp.sendRedirect("index.jsp");
				}
				else {
					session.setAttribute("failedMsg", "Email and Password is Invalid");
					resp.sendRedirect("login.jsp");
				}
				resp.sendRedirect("home.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
