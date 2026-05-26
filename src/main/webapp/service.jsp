
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PrimeBank | Services</title>

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

        /* REMOVE default link styles globally */
        a {
            text-decoration: none;   /* no underline */
            color: inherit;          /* use parent color */
        }

        a:hover {
            text-decoration: none;
        }

        a:visited {
            color: inherit;
        }

        a:active {
            color: inherit;
        }

        a:focus {
            outline: none;
        }
        /* ------------------------------------ */

        /* reuse glass navbar idea but smaller */
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

        /* page header */
        .services-hero {
            padding: 3rem 0 1rem;
            text-align: center;
        }

        .services-hero h1 {
            font-size: 2.2rem;
            font-weight: 600;
        }

        .services-hero p {
            color: #4b5563;
            font-size: 0.95rem;
            max-width: 560px;
            margin: 0.75rem auto 0;
        }

        /* service cards */
        .service-grid {
            padding: 2rem 0 3rem;
            cursor: pointer;
        }

        .service-card {
            border-radius: 1.2rem;
            background: rgba(255, 255, 255, 0.95);
            border: 1px solid #e5e7eb;
            box-shadow: 0 10px 28px rgba(15, 23, 42, 0.08);
            padding: 1.6rem 1.5rem;
            height: 100%;
            position: relative;
            overflow: hidden;
            transition: transform 0.22s ease-out, box-shadow 0.22s ease-out, border-color 0.22s ease-out;
        }

        .service-card::before {
            content: "";
            position: absolute;
            inset: -1px;
            border-radius: inherit;
            border: 1px solid transparent;
            background: linear-gradient(135deg, rgba(37,99,235,0.0), rgba(245,158,11,0.0)) border-box;
            opacity: 0;
            transition: opacity 0.22s ease-out;
        }

        .service-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 18px 40px rgba(15, 23, 42, 0.16);
            border-color: transparent;
        }

        .service-card:hover::before {
            opacity: 1;
            background: linear-gradient(135deg, rgba(37,99,235,0.55), rgba(245,158,11,0.55)) border-box;
        }

        .service-icon {
            width: 42px;
            height: 42px;
            border-radius: 14px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 0.7rem;
            font-size: 1.25rem;
            background: radial-gradient(circle at 30% 30%, #bfdbfe, #2563eb);
            color: #ffffff;
        }

        .service-title {
            font-weight: 600;
            font-size: 1.05rem;
            margin-bottom: 0.3rem;
        }

        .service-text {
            font-size: 0.9rem;
            color: #4b5563;
            margin-bottom: 0.8rem;
        }

        .service-btn {
            display: inline-block;
            border-radius: 999px;
            padding: 0.4rem 1.2rem;
            font-size: 0.9rem;
            border: none;
            background: linear-gradient(135deg, #2563eb, #22c55e);
            color: #ffffff;
            box-shadow: 0 8px 20px rgba(37, 99, 235, 0.4);
        }

        .service-btn:hover {
            filter: brightness(1.05);
            transform: translateY(-1px);
        }

        footer {
            border-top: 1px solid #e5e7eb;
            padding: 1rem 0;
            background: #f9fafb;
            font-size: 0.85rem;
            color: #6b7280;
        }

        @media (max-width: 768px) {
            .services-hero h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>



<section class="services-hero">
    <div class="container">
        <h1>Banking services at one place</h1>
        <p>
            Use these quick actions to manage your money: deposit funds, withdraw cash, check your current
            balance, transfer to others, and view your transaction history.
        </p>
    </div>
</section>

<section class="service-grid"  >
    <div class="container">
        <div class="row g-4">
            <!-- Deposit -->
            <div class="col-md-4" onclick="location.href='Deposit.jsp'">
                <div class="service-card">
                    <div class="service-icon">₹</div>
                    <div class="service-title">Deposit Amount</div>
                    <p class="service-text">
                        Add money to your account so your balance is ready for future payments.
                    </p>
                    <a href="Deposit.jsp" class="service-btn">Go to Deposit</a>
                </div>
            </div>

            <!-- Withdraw -->
            <div class="col-md-4" onclick="location.href='Withdrow.jsp'">
                <div class="service-card">
                    <div class="service-icon">⇩</div>
                    <div class="service-title">Withdraw Amount</div>
                    <p class="service-text">
                        Request a withdrawal to your linked bank or wallet, or prepare for cash withdrawal.
                    </p>
                    <a href="withdraw.jsp" class="service-btn">Go to Withdraw</a>
                </div>
            </div>

            <!-- Check Balance -->
            <div class="col-md-4" onclick="location.href='Balence.jsp'">
                <div class="service-card">
                    <div class="service-icon">👁</div>
                    <div class="service-title">Check Balance</div>
                    <p class="service-text">
                        See the latest available balance of your account with recent activity.
                    </p>
                    <a href="Balence.jsp" class="service-btn">View Balance</a>
                </div>
            </div>

            <!-- Transfer Amount -->
            <div class="col-md-4" onclick="location.href='Transfer.jsp'">
                <div class="service-card">
                    <div class="service-icon"  >⇄</div>
                    <div class="service-title">Transfer Amount</div>
                    <p class="service-text">
                        Send money to your own accounts or other bank accounts quickly and safely.
                    </p>
                    <a   class="service-btn">Transfer Money</a>
                </div>
            </div>

            <!-- Transaction History -->
            <div class="col-md-4" onclick="location.href='Transaction.jsp'">
                <div class="service-card">
                    <div class="service-icon">📜</div>
                    <div class="service-title">Transaction History</div>
                    <p class="service-text">
                        View your recent transactions and download statements when needed.
                    </p>
                    <a href="transactions.jsp" class="service-btn">View Transactions</a>
                </div>
            </div>

            <!-- Extra box (optional) -->
            <div class="col-md-4">
                <div class="service-card">
                    <div class="service-icon">⚙</div>
                    <div class="service-title">Manage Limits & Alerts</div>
                    <p class="service-text">
                        Control daily limits and configure alerts for important account activities.
                    </p>
                    <a href="settings.jsp" class="service-btn">Open Settings</a>
                </div>
            </div>
        </div>
    </div>
</section>

<footer>
    <div class="container d-flex flex-wrap justify-content-between">
        <span>© <%= java.time.Year.now() %> PrimeBank. All rights reserved.</span>
        <span>Use these services safely and review transactions regularly.</span>
    </div>
</footer>

<!-- Bootstrap JS -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
