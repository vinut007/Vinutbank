<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PrimeBank | Money Transfer</title>

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

        /* transfer layout */
        .transfer-wrapper {
            padding: 3rem 0 3rem;
        }

        .transfer-card {
            max-width: 760px;
            margin: 0 auto;
            border-radius: 1.5rem;
            background: rgba(255, 255, 255, 0.96);
            border: 1px solid #e5e7eb;
            box-shadow: 0 16px 40px rgba(15, 23, 42, 0.12);
            padding: 2.4rem;
        }

        .transfer-title {
            font-size: 1.7rem;
            font-weight: 600;
        }

        .transfer-sub {
            font-size: 0.9rem;
            color: #4b5563;
        }

        .form-label {
            font-size: 0.9rem;
            font-weight: 500;
        }

        .form-control,
        .form-select {
            font-size: 0.9rem;
        }

        .section-heading {
            font-size: 1rem;
            font-weight: 600;
            margin-top: 1.5rem;
            margin-bottom: 0.6rem;
        }

        .btn-transfer {
            border-radius: 999px;
            padding: 0.6rem 2rem;
            border: none;
            background: linear-gradient(135deg, #2563eb, #22c55e);
            color: #ffffff;
            font-size: 0.95rem;
            box-shadow: 0 10px 26px rgba(37, 99, 235, 0.45);
        }

        .btn-transfer:hover {
            filter: brightness(1.05);
        }

        .mini-note {
            font-size: 0.8rem;
            color: #6b7280;
        }

        footer {
            border-top: 1px solid #e5e7eb;
            padding: 1rem 0;
            background: #f9fafb;
            font-size: 0.85rem;
            color: #6b7280;
        }
    </style>
</head>
<body>


<section class="transfer-wrapper">
    <div class="container">
        <div class="transfer-card">
            <div class="mb-3">
                <div class="transfer-title">Money transfer</div>
                <p class="transfer-sub">
                    Move money from your account to another account securely. Fill in the sender, receiver, and amount details.
                </p>
            </div>

            <!-- form: fromAccount, toAccount, toName, ifsc, amount, pin, remark -->
            <form action="Transferserv" method="post">
                <!-- From account -->
                <div class="section-heading">From account</div>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Your account number</label>
                        <input type="text" name="id" class="form-control"
                               placeholder="Enter your account number" required>
                    </div>
                   
                </div>

                <!-- To account -->
                
                

                <!-- Amount and PIN -->
                <div class="section-heading">Amount & authorisation</div>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label">Amount (₹)</label>
                        <input type="number" name="amount" class="form-control"
                               placeholder="Enter amount" min="1" step="0.01" required>
                        <div class="mini-note mt-1">
                            Make sure you have enough balance before confirming the transfer.
                        </div>
                    </div>
                    
                </div>

                <!-- Remark -->
                

                <div class="d-flex justify-content-between align-items-center mt-4">
                    <a href="services.jsp" class="mini-note">&larr; Back to services</a>
                    <button type="submit" class="btn-transfer">Confirm transfer</button>
                </div>
            </form>
        </div>
    </div>
</section>

<footer>
    <div class="container d-flex flex-wrap justify-content-between">
        <span>© <%= java.time.Year.now() %> PrimeBank. All rights reserved.</span>
        <span>Transfers are subject to limits and bank processing rules.</span>
    </div>
</footer>

<!-- Bootstrap JS -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>
</body>
</html>
