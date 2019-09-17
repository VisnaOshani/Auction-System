package com.product.dao;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/addProduct")
public class addProduct extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("username");
		String pname = request.getParameter("pname");
		String TestminBid = request.getParameter("minBid");
		double minBid = Double.parseDouble(TestminBid);
		String category = request.getParameter("category");
		String pDesc = request.getParameter("pDesc");
		
	
		addProductDao dao = new addProductDao();

		if (dao.check(uname,pname,minBid,category,pDesc)) {
			request.setAttribute("successMessage", "You have successfully added the product !!");
			request.getRequestDispatcher("adding.jsp").forward(request, response);
				
			} else {
				request.setAttribute("failMessage", "You have fail to add the product !!");
				request.getRequestDispatcher("adding.jsp").forward(request, response);
			} 
	}

}
