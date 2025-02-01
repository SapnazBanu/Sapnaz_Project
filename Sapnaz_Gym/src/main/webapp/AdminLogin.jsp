<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gym Admin Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: url('https://t3.ftcdn.net/jpg/06/06/54/92/360_F_606549277_BMzgu4QoNfqHDkmUgngJrFHuxZXvkS7d.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: flex-start;
            align-items: center;
            height: 100vh;
            padding-left: 200px;
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 25px;
            padding: 30px;
            box-shadow: black;
            width: 400px;
        }
        label {
            color: black;
        }
        input.form-control:focus {
            border-color: black;
            box-shadow: 0px 5px 10px black;
        }
        .form-group input {
            border-radius: 25px;
            height: 45px;
            font-size: 15px;
            border: 1px solid #ddd;
        }
        .form-group input:focus {
            border-color: black;
        }
        .btn {
            border-radius: 25px;
            height: 45px;
            font-size: 20px;
            border: 1px solid #ddd;
        }
        .btn:focus {
            border-color: black;
            box-shadow: 0px 5px 10px black;
        }
        .error {
            color: red;
            font-size: 0.9rem;
        }
        h6 {
        color:red;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="text-center" style="color:black; margin-bottom: 1.5rem;">Gym Admin Login</h2>
        <form id="loginForm" action="login" method="post">
            <div class="form-group">
                <label for="email">Admin Email:</label>
                <input type="text" name="email" class="form-control" id="email" required>
                <small id="emailError" class="error"></small>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" name="password" class="form-control" id="password" required>
                <small id="passwordError" class="error"></small>
            </div>
            <button type="submit" class="btn btn-primary btn-block" style="background-color:black;">Login</button>
            <h6>${logInerror}</h6>
        </form>
    </div>

    <script>
        document.getElementById("loginForm").addEventListener("submit", function(event) {
            event.preventDefault();
            const email = document.getElementById("email").value;
            const password = document.getElementById("password").value;
            const emailError = document.getElementById("emailError");
            const passwordError = document.getElementById("passwordError");
            emailError.textContent = "";
            passwordError.textContent = "";
            let valid = true;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                emailError.textContent = "Please enter a valid email address.";
                valid = false;
            }
            if (password.length < 6) {
                passwordError.textContent = "Password must be at least 6 characters long.";
                valid = false;
            }
            if (valid) {
                alert("Form submitted successfully!");
                this.submit();
            }
        });
    </script>
</body>
</html>