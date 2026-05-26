<%@page import="com.bank.dto.customerdetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PrimeBank | Profile</title>

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

        /* remove underline from all links */
        a {
            text-decoration: none;
            color: inherit;
        }
        a:hover {
            text-decoration: none;
        }

        /* glass navbar similar to other pages */
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

        /* profile layout */
        .profile-wrapper {
            padding: 3rem 0 3rem;
        }

        .profile-card {
            border-radius: 1.5rem;
            background: rgba(255, 255, 255, 0.96);
            border: 1px solid #e5e7eb;
            box-shadow: 0 16px 40px rgba(15, 23, 42, 0.12);
            padding: 2rem;
        }

        .avatar-wrapper {
            text-align: center;
        }

        .avatar-circle {
            width: 120px;
            height: 120px;
            border-radius: 999px;
            background: radial-gradient(circle at 30% 30%, #bfdbfe, #2563eb);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            color: #ffffff;
            box-shadow: 0 16px 40px rgba(37, 99, 235, 0.5);
        }

        .profile-name {
            margin-top: 1rem;
            font-size: 1.4rem;
            font-weight: 600;
        }

        .profile-tag {
            font-size: 0.9rem;
            color: #6b7280;
        }

        .profile-badges {
            margin-top: 1rem;
        }

        .pill {
            display: inline-block;
            padding: 0.25rem 0.7rem;
            border-radius: 999px;
            font-size: 0.75rem;
            margin: 0 0.25rem 0.25rem 0;
        }

        .pill-blue {
            background: #dbeafe;
            color: #1d4ed8;
        }

        .pill-green {
            background: #dcfce7;
            color: #15803d;
        }

        .profile-detail-label {
            font-size: 0.82rem;
            color: #6b7280;
            text-transform: uppercase;
            letter-spacing: 0.03em;
        }

        .profile-detail-value {
            font-size: 0.95rem;
            font-weight: 500;
        }

        .section-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.6rem;
        }

        .section-sub {
            font-size: 0.9rem;
            color: #4b5563;
        }

        .form-control {
            font-size: 0.9rem;
        }

        .btn-save {
            border-radius: 999px;
            padding: 0.45rem 1.4rem;
            border: none;
            background: linear-gradient(135deg, #2563eb, #22c55e);
            color: #ffffff;
            font-size: 0.9rem;
            box-shadow: 0 10px 26px rgba(37, 99, 235, 0.45);
        }

        .btn-save:hover {
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
            .profile-card {
                padding: 1.5rem;
            }
        }
    </style>
</head>
<body>


<section class="profile-wrapper">
    <div class="container">
        <div class="profile-card">
            <div class="row g-4">
                <!-- Left: avatar and basic info -->
                <div class="col-md-4">
                    <div class="avatar-wrapper">
                        <div class="avatar-circle">
                            <!-- You can replace with user initial from session -->
                            <span><%=customerdetails.name.charAt(0) %></span>
                        </div>
                        <div class="profile-name mt-3">
                            <!-- Example: use session attribute -->
                            <%=customerdetails.name %>
                        </div>
                        <div class="profile-tag">
                            VBank Customer
                        </div>

                        <div class="profile-badges">
                            <span class="pill pill-blue">Savings account</span>
                            <span class="pill pill-green">Active</span>
                        </div>

                        <div class="mt-3 text-start">
                            <div class="profile-detail-label">Customer ID</div>
                            <div class="profile-detail-value">PB-2025-0001</div>

                            <div class="profile-detail-label mt-3">Primary account</div>
                            <div class="profile-detail-value">Savings • **** 4821</div>
                        </div>
                    </div>
                </div>

                <!-- Right: details and edit form -->
                <div class="col-md-8">
                    <div class="mb-3">
                        <div class="section-title">Personal details</div>
                        <p class="section-sub">
                            Review your registered information. If anything is incorrect, update it here and our team
                            will keep your profile in sync across all services.
                        </p>
                    </div>
                    <%
                    
                    
                    %>

                    <form action="Home.jsp" method="post">
                        <div class="row g-3">
                        
                        
                        <div class="col-md-6">
                                <label class="form-label">ID</label>
                                 <p  class="form-control"
                                       > <%=customerdetails.id %> </p>
                                
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Full name</label>
                                <p  class="form-control"
                                       > <%=customerdetails.name %> </p>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Email</label>
                                 <p  class="form-control"
                                       > <%=customerdetails.email %> </p>
                               
                             
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Mobile number</label>
                                <p  class="form-control"
                                       > <%=customerdetails.phone %> </p>
                            </div>
                            
                            
                        </div>

                        <div class="mt-4">
                            <div class="section-title">Security & contact preferences</div>
                            <p class="section-sub">
                                Choose how PrimeBank contacts you for alerts, and keep your contact details safe and
                                up to date.
                            </p>
                        </div>

                        <div class="row g-3">
                           
                          
                        </div>

                        <div class="mt-4 d-flex justify-content-end">
                            <button type="submit" class="btn btn-save"  >Go to HomePage</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<footer>
    <div class="container d-flex flex-wrap justify-content-between">
        <span>© <%= java.time.Year.now() %> PrimeBank. All rights reserved.</span>
        <span>Keep your profile updated for a smoother banking experience.</span>
    </div>
</footer>

<!-- Bootstrap JS -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
