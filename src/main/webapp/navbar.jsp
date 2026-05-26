<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bank.dto.customerdetails"%>
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <style>
    
        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --accent: #f59e0b;
            --accent-soft: #ffedd5;
            --bg: #f3f4f6;
            --text-main: #0f172a;
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--bg);
            color: var(--text-main);
            margin: 0;
        }

        html {
            scroll-behavior: smooth;
        }

        a, button {
            transition: all 0.25s ease-out;
        }

        /* BIG navbar with effects */
        .navbar-premium {
            background: #ffffff;
            padding-top: 1.6rem;      /* more vertical space */
            padding-bottom: 1.6rem;
            min-height: 110px;        /* big bar */
            box-shadow: 0 16px 36px rgba(15, 23, 42, 0.2);
            position: relative;
            z-index: 10;
        }

        .navbar-premium::after {
            content: "";
            position: absolute;
            left: 8%;
            right: 8%;
            bottom: -14px;
            height: 14px;
            background: radial-gradient(circle, rgba(37,99,235,0.3), transparent 70%);
            opacity: 0.9;
            pointer-events: none;
        }

        .navbar-brand {
            font-weight: 600;
            font-size: 1.9rem;        /* big brand text */
            letter-spacing: 0.6px;
            color: #111827 !important;
            display: flex;
            align-items: center;
            gap: 0.7rem;
        }

        .brand-logo {
            width: 52px;              /* bigger logo */
            height: 52px;
            border-radius: 999px;
            background: radial-gradient(circle at 30% 30%, #fde68a, #f97316);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: #111827;
            font-weight: 700;
            font-size: 1.5rem;
            box-shadow: 0 0 24px rgba(252, 211, 77, 0.9);
            animation: logoPulse 3s ease-in-out infinite;
        }

        @keyframes logoPulse {
            0%, 100% { transform: scale(1); box-shadow: 0 0 24px rgba(252,211,77,0.9); }
            50% { transform: scale(1.05); box-shadow: 0 0 32px rgba(252,211,77,1); }
        }

        .nav-center {
            flex: 1;
            display: flex;
            justify-content: center;
        }

        .nav-link {
            color: #4b5563 !important;
            font-weight: 500;
            font-size: 1.08rem;       /* bigger font */
            margin: 0 1.1rem;         /* more spacing */
            position: relative;
        }

        .nav-link::after {
            content: "";
            position: absolute;
            left: 0;
            bottom: -6px;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, #2563eb, #f59e0b);
            transition: width 0.2s ease-out;
        }

        .nav-link:hover::after,
        .nav-link.active::after {
            width: 100%;
        }

        

        .nav-link:hover {
            color: #1d4ed8 !important;
        }

        .btn-outline-gold {
            border-color: #f59e0b;
            color: #b45309;
            position: relative;
            overflow: hidden;
        }

        .btn-outline-gold::before {
            content: "";
            position: absolute;
            top: 0;
            left: -120%;
            width: 80%;
            height: 100%;
            background: linear-gradient(120deg, transparent, rgba(255,255,255,0.6), transparent);
            transform: skewX(-20deg);
            transition: left 0.45s ease-out;
        }

        .btn-outline-gold:hover::before {
            left: 140%;
        }

        .btn-outline-gold:hover {
         background: linear-gradient(120deg, rgba(255,255,255,0.6));
         background-color:#1f2937;
         
            color: #1f2937;
            box-shadow: 0 8px 20px rgba(245, 158, 11, 0.4);
        }

        .btn-login {
            border-radius: 999px;
             padding:10px 20px;
            border: 1px solid #d1d5db;
            font-size: 0.98rem;
            color: #374151;
            background: #f9fafb;
        }
        #but{
        padding:10px 20px;
        background-color: #FFE52A;
       
        
        
        
        }

        .btn-login:hover {
           
           
            transform: translateY(-1px);
            box-shadow: 0 6px 15px rgba(15, 23, 42, 0.15);
        }

        /* Hero long section with effects */
        .hero {
            min-height: 2000px;
            padding: 4rem 0 3rem;
            background: radial-gradient(circle at top left, #dbeafe 0, #ffffff 40%, #fefce8 100%);
            display: flex;
            align-items: flex-start;
            position: relative;
            overflow: hidden;
        }

        .hero::before,
        .hero::after {
            content: "";
            position: absolute;
            border-radius: 999px;
            filter: blur(40px);
            opacity: 0.35;
            pointer-events: none;
        }

        .hero::before {
            width: 220px;
            height: 220px;
            background: #bfdbfe;
            top: 5%;
            right: 5%;
            animation: floatGlow 10s ease-in-out infinite;
        }

        .hero::after {
            width: 260px;
            height: 260px;
            background: #fed7aa;
            bottom: -40px;
            left: 0;
            animation: floatGlow 12s ease-in-out infinite;
        }

        @keyframes floatGlow {
            0%, 100% { transform: translateY(0) translateX(0); }
            50% { transform: translateY(-20px) translateX(10px); }
        }

        .hero-title {
            font-size: 2.8rem;
            font-weight: 600;
            line-height: 1.2;
            color: #111827;
        }

        .hero-title span {
            background: linear-gradient(135deg, #16a34a, #f97316);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero-subtitle {
            font-size: 1rem;
            color: #4b5563;
            margin-top: 1rem;
        }

        .pill-info {
            display: inline-flex;
            align-items: center;
            gap: 0.45rem;
            background: #e0f2fe;
            color: #1d4ed8;
            border-radius: 999px;
            padding: 0.3rem 0.9rem;
            font-size: 0.85rem;
            font-weight: 500;
            box-shadow: 0 6px 14px rgba(37, 99, 235, 0.25);
        }

        .pill-info span.dot {
            width: 8px;
            height: 8px;
            border-radius: 999px;
            background: #22c55e;
            box-shadow: 0 0 8px rgba(34, 197, 94, 0.7);
        }

        .hero-cta {
            margin-top: 2rem;
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .btn-primary-premium {
            background: linear-gradient(135deg, #2563eb, #22c55e);
            border: none;
            padding: 0.8rem 1.9rem;
            border-radius: 999px;
            font-weight: 500;
            box-shadow: 0 14px 32px rgba(37, 99, 235, 0.48);
            transform-origin: center;
        }

        .btn-primary-premium:hover {
            filter: brightness(1.1);
            transform: translateY(-2px) scale(1.02);
            box-shadow: 0 18px 40px rgba(22, 163, 74, 0.55);
        }

        .btn-primary-premium:active {
            transform: translateY(0) scale(0.99);
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.35);
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #111827;
        }

        .section-sub {
            color: #4b5563;
            font-size: 0.95rem;
        }

        .info-card,
        .product-card {
            border-radius: 1rem;
            background: #ffffff;
            padding: 1.4rem;
            border: 1px solid #e5e7eb;
            box-shadow: 0 8px 24px rgba(15, 23, 42, 0.06);
            height: 100%;
            position: relative;
            overflow: hidden;
            transition: transform 0.25s ease-out, box-shadow 0.25s ease-out, border-color 0.25s ease-out;
        }

        .info-card::before,
        .product-card::before {
            content: "";
            position: absolute;
            inset: -1px;
            border-radius: inherit;
            border: 1px solid transparent;
            background: linear-gradient(135deg, rgba(37,99,235,0.0), rgba(245,158,11,0.0)) border-box;
            opacity: 0;
            transition: opacity 0.25s ease-out;
        }

        .info-card:hover,
        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 18px 40px rgba(15, 23, 42, 0.15);
            border-color: transparent;
        }

        .info-card:hover::before,
        .product-card:hover::before {
            opacity: 1;
            background: linear-gradient(135deg, rgba(37,99,235,0.5), rgba(245,158,11,0.6)) border-box;
        }

        .info-card h6 {
            font-weight: 600;
            margin-bottom: 0.4rem;
        }

        .info-card p {
            font-size: 0.9rem;
            color: #4b5563;
        }

        .badge-soft {
            background: var(--accent-soft);
            color: #9a3412;
            border-radius: 999px;
            font-size: 0.75rem;
            padding: 0.2rem 0.7rem;
            font-weight: 500;
        }

        .strip {
            margin-top: 4rem;
            padding: 2.5rem 0;
            border-radius: 1.5rem;
            background: linear-gradient(90deg, #eff6ff, #e0f2fe);
            position: relative;
            overflow: hidden;
        }

        .strip::after {
            content: "";
            position: absolute;
            width: 220px;
            height: 220px;
            border-radius: 999px;
            background: rgba(59,130,246,0.15);
            right: -60px;
            top: 50%;
            transform: translateY(-50%);
            filter: blur(20px);
        }
        #but{
      padding: 10px;
   
      
      }
      .btn-outline-gold {
	border-color: #f59e0b;
	color: #b45309;
	position: relative;
	overflow: hidden;
}

.btn-outline-gold::before {
	content: "";
	position: absolute;
	top: 0;
	left: -120%;
	width: 80%;
	height: 100%;
	background: linear-gradient(120deg, transparent, rgba(255, 255, 255, 0.6),
		transparent);
	transform: skewX(-20deg);
	transition: left 0.45s ease-out;
}

.btn-outline-gold:hover::before {
	left: 140%;
}

.btn-outline-gold:hover {
	background: #f59e0b;
	color: #1f2937;
	box-shadow: 0 8px 20px rgba(245, 158, 11, 0.4);
}

.btn-login {
	border-radius: 999px;
	padding: 0.55rem 1.6rem;
	border: 1px solid #d1d5db;
	font-size: 0.98rem;
	color: #374151;
	background: #f9fafb;
}

.btn-login:hover {
	background: #e5e7eb;
	transform: translateY(-1px);
	box-shadow: 0 6px 15px rgba(15, 23, 42, 0.15);
} 

        .product-card h6 {
            font-weight: 600;
            margin-bottom: 0.4rem;
        }

        .product-tag {
            font-size: 0.78rem;
            color: #1d4ed8;
            background: #dbeafe;
            border-radius: 999px;
            padding: 0.15rem 0.6rem;
            display: inline-block;
            margin-bottom: 0.4rem;
        }

        .faq-item {
            padding: 0.7rem 0;
            border-bottom: 1px solid #e5e7eb;
        }

        .faq-item:last-child {
            border-bottom: none;
        }

        .faq-question {
            font-weight: 500;
            font-size: 0.95rem;
        }

        .faq-answer {
            font-size: 0.85rem;
            color: #4b5563;
        }

        .reveal {
            opacity: 0;
            transform: translateY(24px);
            transition: opacity 0.5s ease-out, transform 0.5s ease-out;
        }

        .reveal.visible {
            opacity: 1;
            transform: translateY(0);
        }

        footer {
            border-top: 1px solid #e5e7eb;
            padding: 1rem 0;
            background: #f9fafb;
            font-size: 0.85rem;
            color: #6b7280;
        }

        @media (max-width: 992px) {
            .nav-center {
                justify-content: flex-start;
            }
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.1rem;
            }
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-premium sticky-top">
    <div class="container">
        <!-- Left: logo -->
      
        <a class="navbar-brand" href="Home.jsp">
        <%char name1='U';
        if(customerdetails.name !=null){
        	name1=customerdetails.name.charAt(0);
        	
        }
        	%>
        
            <span class="brand-logo"><%=name1 %></span>
           <%= customerdetails.name %>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarNav" aria-controls="navbarNav"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Center: nav links, Right: buttons -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <div class="nav-center">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link " href="Home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="service.jsp">Services</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Profile.jsp">Profile</a>
                    </li>
                </ul>
            </div>

            <div class="d-flex align-items-center gap-2 ms-lg-3 mt-2 mt-lg-0">
               
                <form action="Login.jsp" method="post" class="d-inline">
                    <button type="submit" id="but" class="btn btn-outline-gold btn-sm px-3">
                        Logout
                    </button>
                </form>
            </div>
        </div>
    </div>
</nav>


