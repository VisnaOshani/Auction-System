package com.view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;


/**
 * Servlet implementation class UpdateBid
 */
@WebServlet("/UpdateBid")
public class UpdateBid extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public UpdateBid() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  double CurrentBid = Double.parseDouble( request.getParameter("currentBid") );
		  double NewBid = Double.parseDouble( request.getParameter("newBid") );
		  String NewBidder = request.getParameter("newBidder") ;
		  int pid = Integer.parseInt( request.getParameter("pid") );

		  if(CurrentBid < NewBid )
		  {
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}

				Connection connection = null;
				Statement statement = null;
				ResultSet resultSet = null;
				
				try {
					connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindatabase", "root", "");
					statement = connection.createStatement();
					String sql = "UPDATE product SET MinBid = "+ NewBid +", Lbidder = '" + NewBidder +  "'  WHERE pid =  " + pid ;
					System.out.println(sql);
					statement.execute(sql);
					connection.close();
		  } catch (Exception e) {
				System.out.println(e);
			}
	}else
		  request.setAttribute("failMessage", "You have fail to add the product !!");
		  response.sendRedirect("ProductView.jsp?ProductId="+pid );
		  

}
	
}
