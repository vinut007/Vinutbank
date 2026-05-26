<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vinut Bank - Secure Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow: hidden;
        }

        /* Animated background elements */
        .bg-animation {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 0;
        }

        .bubble {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 15s infinite;
        }

        .bubble:nth-child(1) { width: 80px; height: 80px; left: 10%; animation-delay: 0s; }
        .bubble:nth-child(2) { width: 120px; height: 120px; left: 20%; animation-delay: 2s; }
        .bubble:nth-child(3) { width: 60px; height: 60px; left: 60%; animation-delay: 4s; }
        .bubble:nth-child(4) { width: 100px; height: 100px; left: 80%; animation-delay: 6s; }
        .bubble:nth-child(5) { width: 90px; height: 90px; left: 40%; animation-delay: 3s; }

        @keyframes float {
            0%, 100% { transform: translateY(100vh) rotate(0deg); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(-100vh) rotate(360deg); opacity: 0; }
        }

        .container {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            width: 100%;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            align-items: center;
        }

        /* Left side - Features */
        .features-section {
            color: white;
            padding: 40px;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 40px;
        }

        .logo-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #ffd700, #ffed4e);
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            font-weight: bold;
            color: #667eea;
            box-shadow: 0 10px 30px rgba(255, 215, 0, 0.3);
        }

        .logo h1 {
            font-size: 32px;
            font-weight: 700;
        }

        .features-section h2 {
            font-size: 42px;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .features-section p {
            font-size: 18px;
            opacity: 0.9;
            margin-bottom: 40px;
        }

        .feature-list {
            display: grid;
            gap: 20px;
        }

        .feature-item {
            display: flex;
            align-items: center;
            gap: 15px;
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            transition: all 0.3s;
        }

        .feature-item:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateX(10px);
        }

        .feature-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #ffd700, #ffed4e);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
        }

        /* Right side - Login form */
        .login-card {
            background: white;
            border-radius: 30px;
            padding: 50px 40px;
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
        }

        .login-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(90deg, #667eea, #764ba2, #f093fb);
        }

        .login-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .login-header h2 {
            font-size: 32px;
            color: #333;
            margin-bottom: 10px;
        }

        .login-header p {
            color: #666;
            font-size: 16px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 600;
            font-size: 14px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #667eea;
            font-size: 20px;
        }

        .form-control {
            width: 100%;
            padding: 15px 15px 15px 50px;
            border: 2px solid #e0e0e0;
            border-radius: 12px;
            font-size: 16px;
            transition: all 0.3s;
        }

        .form-control:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
        }

        .toggle-password {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            color: #666;
            font-size: 20px;
        }

        .form-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .checkbox-wrapper {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .checkbox-wrapper input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .checkbox-wrapper label {
            margin: 0;
            font-weight: normal;
            cursor: pointer;
        }

        .forgot-password {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        .btn-login {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.3);
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 15px 40px rgba(102, 126, 234, 0.4);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .divider {
            text-align: center;
            margin: 30px 0;
            position: relative;
        }

        .divider::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            width: 100%;
            height: 1px;
            background: #e0e0e0;
        }

        .divider span {
            background: white;
            padding: 0 15px;
            position: relative;
            color: #666;
            font-size: 14px;
        }

        .alt-login {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .btn-alt {
            padding: 12px;
            border: 2px solid #e0e0e0;
            background: white;
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            font-weight: 600;
            color: #333;
        }

        .btn-alt:hover {
            border-color: #667eea;
            background: #f8f9ff;
        }

        .signup-link {
            text-align: center;
            margin-top: 30px;
            color: #666;
        }

        .signup-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        .security-badge {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
            padding: 15px;
            background: #f0f7ff;
            border-radius: 12px;
            color: #667eea;
            font-size: 14px;
            font-weight: 600;
        }

        @media (max-width: 968px) {
            .container {
                grid-template-columns: 1fr;
            }
            .features-section {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="bg-animation">
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
        <div class="bubble"></div>
    </div>

    <div class="container">
        <!-- Left Side - Features -->
        <div class="features-section">
            <div class="logo">
                <div class="logo-icon">💎</div>
                <h1>VinutBank</h1>
            </div>

            <h2>Banking Made Simple & Secure</h2>
            <p>Experience next-generation digital banking with enterprise-grade security and premium features.</p>

            <div class="feature-list">
                <div class="feature-item">
                    <div class="feature-icon">🔒</div>
                    <div>
                        <h3>Bank-Grade Security</h3>
                        <p style="margin: 0; font-size: 14px; opacity: 0.8;">256-bit encryption & biometric authentication</p>
                    </div>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">⚡</div>
                    <div>
                        <h3>Instant Transactions</h3>
                        <p style="margin: 0; font-size: 14px; opacity: 0.8;">Real-time transfers 24/7 worldwide</p>
                    </div>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">📊</div>
                    <div>
                        <h3>Smart Analytics</h3>
                        <p style="margin: 0; font-size: 14px; opacity: 0.8;">AI-powered insights & spending reports</p>
                    </div>
                </div>

                <div class="feature-item">
                    <div class="feature-icon">🎁</div>
                    <div>
                        <h3>Premium Rewards</h3>
                        <p style="margin: 0; font-size: 14px; opacity: 0.8;">Exclusive cashback & loyalty benefits</p>
                    </div>
                </div>
            </div>
        </div>
        <%String name =(String) session.getAttribute("name"); 
        if(name==null){
        	name=" ";
        }
        
        
        %>

        <!-- Right Side - Login Form -->
        <div class="login-card">
            <div class="login-header">
                <h2>Welcome Back!  <%=name %></h2>
                <p>Login to access your premium account</p>
            </div>

            <form action="Loginserv" method="post" onsubmit="return validateForm()">
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <div class="input-wrapper">
                        <span class="input-icon"  >📧</span>
                        <input 
                            type="email" 
                            id="email" 
                            name="email" 
                            class="form-control" 
                            placeholder="Enter your email"
                            required
                        >
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-wrapper">
                        <span class="input-icon">🔐</span>
                        <input 
                            type="password" 
                            id="password" 
                            name="password" 
                            class="form-control" 
                            placeholder="Enter your password"
                            required
                        >
                        <button type="button" class="toggle-password" onclick="togglePassword()">
                            👁️
                        </button>
                    </div>
                </div>

                <div class="form-options">
                    <div class="checkbox-wrapper">
                        <input type="checkbox" id="remember" name="remember">
                        <label for="remember">Remember me</label>
                    </div>
                    <a href="#" class="forgot-password">Forgot Password?</a>
                </div>

                <button type="submit" class="btn-login">
                    Login In Securely
                </button>

                <div class="security-badge">
                    <span>🛡️</span>
                    <span>Protected by 256-bit SSL Encryption</span>
                </div>

                <div class="divider">
                    <span>Or continue with</span>
                </div>

                <div class="alt-login">
                    
                </div>

                <div class="signup-link">
                    Don't have an account? <a href="Signup.html">Sign Up Now</a>
                </div>
            </form>
        </div>
    </div>

    
</body>
</html>