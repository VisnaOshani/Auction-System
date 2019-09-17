package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.RegisterDao;

@WebServlet("/Register")
public class Register extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		String sql = "insert into login (name,uname,pass,email) values (?,?,?,?)";

		
			RegisterDao dao = new RegisterDao();

			if (dao.check(name, uname, pass, email)) {
				request.setAttribute("successMessage", "You have successfully registered !!");
				request.getRequestDispatcher("register.jsp").forward(request, response);

			} else {
				response.sendRedirect("register.jsp");
			}
		}
	}


