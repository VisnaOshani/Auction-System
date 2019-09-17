package com.feedback;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class feedback
 */
@WebServlet("/feedback")
public class feedback extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String uname = (String) session.getAttribute("username");
		String sub = request.getParameter("subject");
		String desc = request.getParameter("desc");
		
		feedbackDao dao = new feedbackDao();
		
		if(dao.check(uname, sub, desc))
		{
			request.setAttribute("successMessage", "You have successfully send the feedback !!");
			request.getRequestDispatcher("feedback.jsp").forward(request, response);
		}
		
		else {
			request.setAttribute("failMessage", "You have fail to send the feedback !!");
			request.getRequestDispatcher("feedback.jsp").forward(request, response);
		}
	}

}
