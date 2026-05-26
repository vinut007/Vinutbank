package com.bank.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import javax.xml.crypto.Data;

import com.bank.dao.dblogic;
import com.bank.dto.customerdetails;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Depositserv")
public class Depositserv  extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		double amount =Double.parseDouble( req.getParameter("amount")) ;
	     
		
		
		try {
			boolean val = dblogic.depositamount(customerdetails.getcid(), amount);
			if(val) {
				 dblogic.transactionhst(customerdetails.getcid(), "deposit", amount, LocalDateTime.now() );				
				RequestDispatcher rd = req.getRequestDispatcher("service.jsp");
				rd.forward(req, resp);
			}else {
				
				RequestDispatcher rd = req.getRequestDispatcher("Deposit.jsp");
				rd.forward(req, resp);
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

}
