package com.bank.dao;

import java.net.Authenticator.RequestorType;
import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import com.bank.dto.customerdetails;
import com.sun.net.httpserver.Request;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpSession;

public class dblogic {
	static Connection con = null;
	
	
	
	
	public static boolean insertdata(String name,String email,long phone,String password) throws  SQLException, ClassNotFoundException {
		
			con =Provideconnection.givemeconnection();
			PreparedStatement pstmt = con.prepareStatement("insert into vinutbank.customer(name ,email,phone,password) values(?,?,?,?) ");
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setLong(3, phone);
			pstmt.setString(4, password);
			 
			int val =pstmt.executeUpdate();
			if(val>0) {
				return true;
			}else {
				return false;
			}
			
			
		
		
		
		
	}
	public static boolean fetchdata(String email,String password) throws  SQLException, ClassNotFoundException {
		
		con =Provideconnection.givemeconnection();
		PreparedStatement pstmt = con.prepareStatement("select * from vinutbank.customer where email=? and password=? ");
	    pstmt.setString(1, email);
		pstmt.setString(2, password);
		
		 
		ResultSet val =pstmt.executeQuery();
		if(val.next()) {
		customerdetails cus = new customerdetails();
		cus.setId(val.getInt(1));
		cus.setName(val.getString(2));
		cus.setEmail(val.getString(3));
		cus.setPhone(val.getLong(4));
		cus.setPin(val.getInt(5));
	
		
		customerdetails.setcid(val.getInt(1));
		System.out.print(cus.getId());
		System.out.print(cus.getName());
		System.out.print(cus.getEmail());
		
	
			
			
			return true;
		}else {
			return false;
		}
	


}
	public static boolean depositamount(int id, double amount) throws ClassNotFoundException, SQLException {

	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        con = Provideconnection.givemeconnection();
	       
	        pstmt = con.prepareStatement(
	            "UPDATE vinutbank.customer SET balance = balance + ? WHERE id = ?"
	        );
	        pstmt.setDouble(1, amount);
	        pstmt.setInt(2, id);

	        int val = pstmt.executeUpdate();

	        if (val > 0) {
	           
	           
	            return true;
	        } else {
	           
	            return false;
	        }

	    } catch (Exception e) {

	       
	        e.printStackTrace();
	        return false;

	    } 
	}

	
	
	
	
	
public static double balence(int id) throws ClassNotFoundException, SQLException {
		
		double amount=0.0;
	PreparedStatement pstmt = con.prepareStatement("select balance from vinutbank.customer where id=?");
	   
		pstmt.setInt(1, id); 
		ResultSet val =pstmt.executeQuery();
		if(val.next()) {
		amount =val.getDouble("balance");
			
	}
		
		return amount;
		
	
	
}
	
	
	
	
	public static boolean widthamount(int id ,double amt) throws ClassNotFoundException, SQLException {
		
		 double amount =dblogic.balence(customerdetails.getcid());
		if(amt<amount) {
			PreparedStatement pstmt =con.prepareStatement("update vinutbank.customer set balance=balance-? where id=?");
			
			pstmt.setDouble(1, amt);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
			return true;
			
		}else {
			return false;
			
		}	
		
		
		
		
	}
	public static boolean transferdata(int id , double amt) throws ClassNotFoundException, SQLException {
		
		double amount =dblogic.balence(customerdetails.getcid());
//		con.setAutoCommit(false);
		if(amt<amount) {
//			con.commit();
			PreparedStatement pstmt =con.prepareStatement("update vinutbank.customer set balance=balance+? where id=?");
			
			pstmt.setDouble(1, amt);
			pstmt.setInt(2, id);
		int val=pstmt.executeUpdate();
		
		if(val>0) {
			PreparedStatement pstmt1 =con.prepareStatement("update vinutbank.customer set balance=balance-? where id=?");
			pstmt1.setDouble(1, amt);
			pstmt1.setInt(2, customerdetails.getcid());
			pstmt1.executeUpdate();
			if(val>0) {
				return true;
				
			}else {
//				con.rollback();
				return false;
			}
			
		}
			
		}
//		con.commit();
		return false;
		
			
		
		
		
		
		
	}
	
	
	
public static boolean transactionhst(int cid , String type, double amount ,LocalDateTime date  ) throws ClassNotFoundException, SQLException {
		
		
			
			
			PreparedStatement pstmt =con.prepareStatement("insert into vinutbank.transaction(cid,type,amount,data) values(?,?,?,?)");
			
			pstmt.setInt(1, cid);
			pstmt.setString(2, type);
			pstmt.setDouble(3, amount);
			pstmt.setTimestamp(4, java.sql.Timestamp.valueOf(date)); 
			
			int val= pstmt.executeUpdate();
			if(val>0) {
				return true;
			}else {
				return false;
			}
			    
			
		
		
		
		
	}

public static ResultSet transactionfecth() throws ClassNotFoundException, SQLException {

    PreparedStatement pstmt = con.prepareStatement(
        "select * from  vinutbank.transaction where cid = ?"
    );

    pstmt.setInt(1, customerdetails.id);

    
    ResultSet val = pstmt.executeQuery();

    return val;   
}

	   

}