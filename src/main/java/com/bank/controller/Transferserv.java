package com.bank.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;

import com.bank.dao.dblogic;
import com.bank.dto.customerdetails;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/Transferserv")
public class Transferserv extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		double amt =Double.parseDouble(req.getParameter("amount"));
		
		try {
			boolean val= dblogic.transferdata(id, amt);
			dblogic.transactionhst(customerdetails.getcid(), "TransferdMoney to  "+id+ " Account", amt, LocalDateTime.now() );
			if(val) {
				RequestDispatcher rd = req.getRequestDispatcher("service.jsp");
				rd.forward(req, resp);
			}else {
				RequestDispatcher rd = req.getRequestDispatcher("Transfer.jsp");
				rd.forward(req, resp);
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
