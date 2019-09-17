package com.retrieve;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.xdevapi.Statement;

@WebServlet("/retrieve")
public class retrieve extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String pid = request.getParameter("pid");
		String minBid = request.getParameter("minBid");
		String sql = "UPDATE Product SET MinBid = ? WHERE pid = ?";
		
		retrieveDao dao = new retrieveDao();
		
		if(dao.check(pid, minBid) ) 
		{
			request.setAttribute("successMessage", "You have successfully Update the product !!");
			request.getRequestDispatcher("bidding.jsp").forward(request, response);
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	}

		
}
