<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://t3.ftcdn.net/jpg/08/27/87/60/360_F_827876077_k0EWo3jSiWZPR8fRgsSbZFT9SkrozNuj.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            padding-bottom: 200px;
        }
        .btn-container {
            text-align: center;
            color: black;
        }
        .btn {
            background-color: black;
            color: white;
            width: 150px;
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="btn-container">
            <a href="AdminLogin.jsp"><button class="btn btn-lg">Admin Login</button></a><br>
            <a href="UserLogin.jsp"><button class="btn btn-lg">User Login</button></a>
        </div>
    </div>
</body>
</html>
