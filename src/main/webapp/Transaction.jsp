<%@page import="com.bank.dao.dblogic"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PrimeBank | Transaction Detail</title>

    <!-- Bootstrap CSS -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: radial-gradient(circle at top, #dbeafe 0, #ffffff 55%, #fefce8 100%);
            margin: 0;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        a:hover {
            text-decoration: none;
        }
        .navbar-premium {
            position: sticky;
            top: 0;
            z-index: 50;
            background: rgba(255, 255, 255, 0.16);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            padding: 1.1rem 0;
            box-shadow: 0 12px 30px rgba(15, 23, 42, 0.2);
        }
        .navbar-brand {
            font-weight: 600;
            font-size: 1.4rem;
            color: #111827 !important;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .brand-logo {
            width: 40px;
            height: 40px;
            border-radius: 999px;
            background: radial-gradient(circle at 30% 30%, #fde68a, #f97316);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: #111827;
            font-weight: 700;
            box-shadow: 0 0 18px rgba(252, 211, 77, 0.8);
        }
        .nav-link {
            color: #111827 !important;
            font-weight: 500;
            font-size: 0.98rem;
            margin: 0 0.7rem;
        }

        .page-wrapper {
            padding: 3rem 0;
        }

        .tx-card {
            max-width: 800px;
            margin: 0 auto;
            border-radius: 1.5rem;
            background: #ffffff;
            border: 1px solid #e5e7eb;
            box-shadow: 0 16px 40px rgba(15, 23, 42, 0.12);
            padding: 2rem;
        }

        .tx-title {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .tx-sub {
            font-size: 0.9rem;
            color: #4b5563;
            margin-bottom: 1.5rem;
        }

        .table-sm th,
        .table-sm td {
            padding: 0.5rem 0.75rem;
            font-size: 0.9rem;
        }

        .badge-type {
            padding: 0.25rem 0.7rem;
            border-radius: 999px;
            font-size: 0.75rem;
        }
        .badge-credit { background: #dcfce7; color: #15803d; }
        .badge-debit { background: #fee2e2; color: #b91c1c; }

        .mini-note {
            font-size: 0.8rem;
            color: #6b7280;
            margin-top: 0.75rem;
        }

        footer {
            border-top: 1px solid #e5e7eb;
            padding: 1rem 0;
            background: #f9fafb;
            font-size: 0.85rem;
            color: #6b7280;
        }
        #cust{
       
background: rgba(255, 0, 0, 0.2);
border-radius: 16px;
box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
backdrop-filter: blur(5px);
-webkit-backdrop-filter: blur(5px);
border: 1px solid rgba(255, 255, 255, 0.3);
        
        }
    </style>
</head>
<body>



<section class="page-wrapper">
    <div class="container">
        <div class="tx-card">
            <div class="tx-title">Transaction detail</div>
            <p class="tx-sub">
                This shows one transaction record with ID, customer ID, type, amount, and date.
            </p>
            

            

            <table class="table table-sm table-striped mb-0">
                <thead>
                <tr>
                    <th scope="col">Txn ID</th>
                    <th scope="col">Customer ID</th>
                    <th scope="col">Type</th>
                    <th scope="col">Amount (₹)</th>
                    <th scope="col">Date</th>
                </tr>
                </thead>
                <tbody>
              <% 
    ResultSet rs = dblogic.transactionfecth();

    while(rs.next()) {
        int id = rs.getInt("tid");
        int customerId = rs.getInt("cid");
        String ttype = rs.getString("type");
        double amount = rs.getDouble("amount");
        String date = rs.getString("data");  // or "tdate" if your column name is different
%>

<tr>
    <td><%=id %> </td>
    <td><%=customerId %></td>

    <td>
            <%if(ttype.equals("deposit")){ %>
            <span class="badge-type badge-credit">Credit</span>
            <%}else{ %>
            <span class="badge-type badge-credit" id="cust">Debits</span>
            <%} %>
        
            
      
    </td>

    <td>₹ <%=amount %></td>
    <td><%=date %></td>
</tr>

<% } %>
              
                </tbody>
            </table>
            <div class="mini-note">
                Types are usually “credit” for money added and “debit” for money taken out.
            </div>

            <div class="mt-3">
                <a href="service.jsp" class="mini-note">&larr; Back to service page</a>
            </div>
        </div>
    </div>
</section>

<footer>
    <div class="container d-flex flex-wrap justify-content-between">
        <span>© <%= java.time.Year.now() %> PrimeBank. All rights reserved.</span>
        <span>Review your transactions regularly for security.</span>
    </div>
</footer>

<!-- Bootstrap JS -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">

</script>
</body>
</html>
