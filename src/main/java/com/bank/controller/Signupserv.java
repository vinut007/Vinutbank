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

@WebServlet("/Signupserv")
public class Signupserv  extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name =req.getParameter("name");
		String email =req.getParameter("email");
		long phone = Long.parseLong(req.getParameter("phone"));
		String password =req.getParameter("password");
		
		try {
			boolean val = dblogic.insertdata(name, email, phone, password);
			if(val) {
				HttpSession hs = req.getSession();
				hs.setAttribute("name", name);
			RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
			rd.forward(req, resp);
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("Signup.html");
				rd.forward(req, resp);
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}
	

}
