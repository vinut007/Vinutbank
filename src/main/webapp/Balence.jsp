<%@page import="com.bank.dto.customerdetails"%>
<%@page import="com.bank.dao.dblogic"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PrimeBank | Balance Details</title>

    <!-- Bootstrap CSS -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary: #2563eb;
            --accent: #f59e0b;
            --bg: #f3f4f6;
            --text-main: #0f172a;
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: radial-gradient(circle at top, #dbeafe 0, #ffffff 55%, #fefce8 100%);
            color: var(--text-main);
            margin: 0;
        }

        html {
            scroll-behavior: smooth;
        }

        a {
            text-decoration: none;
            color: inherit;
        }
        a:hover {
            text-decoration: none;
        }

        /* glass navbar */
        .navbar-premium {
            position: sticky;
            top: 0;
            z-index: 50;
            background: rgba(255, 255, 255, 0.16);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            padding-top: 1.1rem;
            padding-bottom: 1.1rem;
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
            position: relative;
        }

        .nav-link.active {
            color: #2563eb !important;
        }

        .nav-link::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -4px;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, #2563eb, #f59e0b);
            transition: width 0.2s ease-out;
        }

        .nav-link:hover::after,
        .nav-link.active::after {
            width: 100%;
        }

        .btn-logout {
            border-radius: 999px;
            padding: 0.35rem 1.2rem;
            border: 1px solid #f59e0b;
            color: #b45309;
            background: rgba(255, 255, 255, 0.9);
        }

        .btn-logout:hover {
            background: #f59e0b;
            color: #111827;
        }

        /* BIG balance box */
        .show-balance-wrapper {
            padding: 4rem 0 4rem;
        }

        .show-balance-card {
            max-width: 900px;              /* wider */
            min-height: 380px;             /* taller */
            margin: 0 auto;
            border-radius: 1.8rem;
            background: rgba(255, 255, 255, 0.98);
            border: 1px solid #e5e7eb;
            box-shadow: 0 24px 60px rgba(15, 23, 42, 0.18);
            padding: 3rem 3rem;            /* more inner space */
            text-align: center;
        }

        .show-title {
            font-size: 2rem;               /* big title */
            font-weight: 600;
        }

        .show-sub {
            font-size: 1rem;
            color: #4b5563;
            margin-bottom: 2.2rem;
        }

        .balance-badge {
            display: inline-block;
            padding: 50px 100px;          /* BIG pill */
            border-radius: 20px;
            background: #ecfdf5;
            color: #166534;
            font-weight: 700;
            font-size: 1.6rem;             /* big amount text */
            box-shadow: 0 22px 50px rgba(22, 163, 74, 0.38);
        }

        .mini-note {
            font-size: 0.9rem;
            color: #6b7280;
            margin-top: 1rem;
        }

        .btn-back {
            margin-top: 2.5rem;
            border-radius: 999px;
            padding: 0.7rem 2.1rem;
            border: none;
            background: linear-gradient(135deg, #2563eb, #22c55e);
            color: #ffffff;
            font-size: 1rem;
            box-shadow: 0 14px 32px rgba(37, 99, 235, 0.5);
        }

        .btn-back:hover {
            filter: brightness(1.05);
        }

        footer {
            border-top: 1px solid #e5e7eb;
            padding: 1rem 0;
            background: #f9fafb;
            font-size: 0.85rem;
            color: #6b7280;
        }

        @media (max-width: 768px) {
            .show-balance-card {
                padding: 2.2rem 1.6rem;
                max-width: 100%;
                min-height: 0;
            }
            .show-title {
                font-size: 1.6rem;
            }
            .balance-badge {
                padding: 1.2rem 2rem;
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>



<section class="show-balance-wrapper">
    <div class="container">
        <div class="show-balance-card">
            <div class="show-title">Account balance</div>
            <p class="show-sub">
                Here is the latest available balance for your selected account.
            </p>

            <%double bal = dblogic.balence(customerdetails.getcid());%>

            <div class="balance-badge">
                Account:<%=bal %>
                
            </div>

            <div class="mini-note">
                If this looks incorrect, refresh after a few seconds or check your recent transactions.
            </div>

            <div>
                <a href="Home.jsp">
                    <button type="button"  class="btn-back">GO TO HOME PAGE</button>
                </a>
            </div>
        </div>
    </div>
</section>

<footer>
    <div class="container d-flex flex-wrap justify-content-between">
        <span>© <%= java.time.Year.now() %> PrimeBank. All rights reserved.</span>
        <span>Keep your account details private and secure.</span>
    </div>
</footer>

<!-- Bootstrap JS -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
