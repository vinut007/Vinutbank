package com.bank.dto;

import java.security.Timestamp;
import java.time.LocalDateTime;

public class transactionhst {
	static int tid;
	 static int cid;
	static String type;
    static	double amount;
	static LocalDateTime date;
	public static int getTid() {
		return tid;
	}
	public static void setTid(int tid) {
		transactionhst.tid = tid;
	}
	public static int getCid() {
		return cid;
	}
	public static void setCid(int cid) {
		transactionhst.cid = cid;
	}
	public static String getType() {
		return type;
	}
	public static void setType(String type) {
		transactionhst.type = type;
	}
	public static double getAmount() {
		return amount;
	}
	public static void setAmount(double amount) {
		transactionhst.amount = amount;
	}
	public static LocalDateTime getDate() {
		return date;
	}
	public static void setDate(LocalDateTime date) {
		transactionhst.date = date;
	}
	

}
