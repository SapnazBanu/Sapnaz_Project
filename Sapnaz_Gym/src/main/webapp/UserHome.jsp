<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
 body {
            background: url('https://wallpaperaccess.com/full/4615469.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding-top: 0px;
            margin-top: 0px;
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 25px;
            padding: 30px;
            box-shadow: black;
            width: 500px;
            margin-left: -500px;
        }
        label {
            color: black;
        }
        input.form-control:focus {
            border-color: #1e3a8a;
            box-shadow: 0px 5px 10px #1e3a8a;
        }
        .form-group {
            position: relative;
        }
        .form-group input {
            border-radius: 25px;
            height: 45px;
            font-size: 15px;
            border: 1px solid #ddd;
            padding-left: 40px;
        }
        .form-group input:focus {
            border-color: #1e3a8a;
        }
        .input-icon {
            position: absolute;
            left: 15px;
            top: 70%;
            transform: translateY(-50%);
            color: #1e3a8a;
        }
        .btn {
            border-radius: 25px;
            height: 45px;
            font-size: 20px;
            border: 1px solid #ddd;
        }
        .btn:focus {
            border-color: #1e3a8a;
            box-shadow: 0px 5px 10px #1e3a8a;
        }
        .error {
            color: red;
            text-align: center;
            margin-top: 10px;
            font-size: 14px;
        }
        select.form-control:focus {
            border-color: #1e3a8a;
            box-shadow: 0px 5px 10px #1e3a8a;
        }
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: transparent;
            padding: 15px 0;
            z-index: 10;
        }
.fitness-image {
        width: 6cm;
        height: 6cm;
        position: relative;
        top: -13cm;
        right: -30cm;
        animation: fadeIn 5s ease-in-out infinite;
        opacity: 0;
    }
    @keyframes fadeIn {
        0% {
            opacity: 0;
        }
        50% {
            opacity: 1;
        }
        100% {
            opacity: 0;
        }
    }
        .navbar .logo img {
            height: 60px;
            animation: bounce 5s ease-out infinite;
            filter: hue-rotate(180deg);
        }
        @keyframes bounce {
            0% { transform: translateY(0); }
            25% { transform: translateY(-10px); }
            50% { transform: translateY(0); }
            75% { transform: translateY(-5px); }
            100% { transform: translateY(0); }
        }
        .navbar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: flex-end;
        }
        .navbar ul li {
            margin-right: 40px;
        }
        .navbar ul li a {
            color: white;
            font-size: 18px;
            font-weight: 600;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .navbar ul li a:hover {
            background-color: black;
            color: white;
        }
        .navbar ul li.active a {
            background-color: #007bff;
            color: white;
        }    </style>
</head>
<body>
    <nav class="navbar">
        <a href="#" class="logo"><img src="https://www.pngall.com/wp-content/uploads/13/Dragon-Ball-PNG-Image-HD.png" alt="Gym Logo"></a>
    </nav>

    <div class="form-container">
        <h2 class="text-center" style="color:darkblue; margin-bottom: 1.5rem;">Hi , ${registrationEntity.name}</h2>

        <table class="table table-bordered table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>Details</th>
                    <th>Values</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Name</td>
                    <td>${registrationEntity.name}</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>${registrationEntity.email}</td>
                </tr>
                <tr>
                    <td>Ph</td>
                    <td>${registrationEntity.ph}</td>
                </tr>
                <tr>
                    <td>Package</td>
                    <td>${registrationEntity.packages}</td>
                </tr>
                <tr>
                    <td>PT</td>
                    <td>${registrationEntity.trainer}</td>
                </tr>
                <tr>
                    <td>Gym</td>
                    <td>${registrationEntity.gymName}</td>
                </tr>
                <tr>
                     <td>Total Amount</td>
                     <td>${registrationEntity.amount}</td>
                </tr>

                <tr>
                      <td>Balance Amount</td>
                      <td>${registrationEntity.balance}</td>
                </tr>
            </tbody>
        </table>

        <div class="text-center mt-4">
            <form action="userUpdate" method="post">
                <input type="hidden" name="email" value="${registrationEntity.email}">
                <button type="submit" class="btn btn-primary">Update</button>
            </form>
        </div>


    </div>

    <img src="https://www.pngall.com/wp-content/uploads/13/Dragon-Ball-PNG-Image-HD.png"
         alt="Fitness Image" class="fitness-image" style="width: 6cm; height: 6cm; position: relative; top: -3cm; right: -6cm;">

</body>
</html>