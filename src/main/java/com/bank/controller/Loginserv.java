package com.bank.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.bank.dao.dblogic;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/Loginserv")
public class Loginserv  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email =req.getParameter("email");
		String password =req.getParameter("password");
		
		try {
			boolean val = dblogic.fetchdata(email, password);
			if(val) {
				RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
				rd.forward(req, resp);
			
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
				rd.forward(req, resp);
			}
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
	}
	
	

}
