<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background: url('https://wallpaperaccess.com/full/4615469.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin-top: 0px;
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 25px;
            padding: 30px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            width: 600px;
            max-height: 700px;
            overflow-y: auto;
            margin-right: 450px;
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
        label {
            color: black;
            font-size: 14px;
        }
        input.form-control, select.form-control {
            border-radius: 25px;
            height: 45px;
            font-size: 14px;
            border: 1px solid #ddd;
        }
        input.form-control:focus, select.form-control:focus {
            border-color: #1e3a8a;
            box-shadow: 0px 5px 10px #1e3a8a;
        }
        .btn {
            border-radius: 25px;
            height: 45px;
            font-size: 18px;
            background-color: #1e3a8a;
            color: white;
            border: none;
        }
        .btn:hover {
            background-color: #143362;
        }
        .form-check-inline {
            margin-right: 15px;
        }
        @media (max-width: 768px) {
            .form-container {
                width: 90%;
            }
        }
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: transparent;
            padding: 15px 0;
            z-index: 10;
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
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="#" class="logo"><img src="https://www.pngall.com/wp-content/uploads/13/Dragon-Ball-PNG-Image-HD.png" alt="Gym Logo"></a>
    </nav>

    <div class="form-container">
        <h2 class="text-center" style="color: #1e3a8a;">Update Form</h2>
        <form action="updateUserProfile" method="post">


<div class="form-group">
            <input type="hidden" name="reg_id" class="form-control" id="reg_id" required value="${registrationEntity.reg_id}">
        </div>

        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" name="name" class="form-control" id="name" required value="${registrationEntity.name}">
        </div>

        <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="text" name="email" class="form-control" id="email" required value="${registrationEntity.email}">
                </div>

       <div class="form-group">
            <label for="ph">Ph:</label>
            <input type="number" name="ph" class="form-control" id="ph" required value="${registrationEntity.ph}">
        </div>

       <div class="form-group">
                    <label for="age">Age:</label>
                    <input type="number" name="age" class="form-control" id="age" required>
       </div>

       <div class="form-group">
                           <label for="weight">Weight:</label>
                           <input type="number" name="weight" class="form-control" id="weight" required>
       </div>

       <div class="form-group">
             <label for="Height">Height in feet:</label>
             <input type="text" name="height" class="form-control" id="height" required>
       </div>

       <div class="form-group">
                   <label for="plan">Plan:</label>
                   <div class="form-check form-check-inline">
                       <input type="radio" name="plan" value="Weight Gain" class="form-check-input" id="gain" required>
                       <label class="form-check-label" for="gain">Weight Gain</label>
                   </div>
                   <div class="form-check form-check-inline">
                       <input type="radio" name="plan" value="Weight Loss" class="form-check-input" id="loss" required>
                       <label class="form-check-label" for="loss">Weight Loss</label>
                   </div>
               </div>

         Upload Picture<input class="form-control" type="file" id="picture" name="picture">

        <button type="submit" class="btn btn-primary btn-block">Sumbit</button>
    </form>

    </div>
    <img src="https://www.pngall.com/wp-content/uploads/13/Dragon-Ball-PNG-Image-HD.png"
         alt="Fitness Image" class="fitness-image" style="width: 6cm; height: 6cm; position: relative; top: 1cm; right:5cm;">


</body>
</html>