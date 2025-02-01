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
        <ul>
            <li><a href="Success.jsp">Home</a></li>
            <li><a href="Enquiry.jsp">Enquiry</a></li>
            <li><a href="http://localhost:8080/chethan_gym/follow">Follow</a></li>
            <li><a href="http://localhost:8080/chethan_gym/registration">Registration</a></li>
        </ul>
    </nav>

    <div class="form-container">
        <h2 class="text-center" style="color: #1e3a8a;">Update Form</h2>
        <form action="update" method="post">

        <div class="form-group col-md-6">
            <label for="email">Search Email:</label>
            <input type="text" name="email" class="form-control" id="email" >
            <span id="displayEmail" class="error"></span>
            <button type="button" class="btn btn-primary" onclick="searchEmail()">Search</button>
        </div>

<div class="form-group">
            <label for="name">Name:</label>
            <input type="text" name="name" class="form-control" id="name" required value="${registrationEntity.name}">
        </div>

        <div class="form-group">
            <label for="reg_id">Reg Id:</label>
            <input type="number" name="reg_id" class="form-control" id="reg_id" required value="${registrationEntity.reg_id}">
        </div>


        <div class="form-group">
            <label for="packages">Package:</label>
                <input type="text" name="packages" class="form-control" id="packages" required value="${registrationEntity.packages}">
        </div>

        <div class="form-group">
            <label for="trainer">Personal Trainer:</label>
            <div class="form-check form-check-inline">
                <input type="radio" name="trainer" value="yes" class="form-check-input" id="trainerYes" required>
                <label class="form-check-label" for="trainerYes">Yes</label>
            </div>
            <div class="form-check form-check-inline">
                <input type="radio" name="trainer" value="no" class="form-check-input" id="trainerNo" required>
                <label class="form-check-label" for="trainerNo">No</label>
            </div>
        </div>

        <div class="form-group">
            <label for="amount">Amount:</label>
            <input type="number" name="amount" class="form-control" id="amount" required value="${registrationEntity.amount}">
        </div>

<div class="form-group">
             <label for="lastPaidAmount">Last Payment:</label>
             <input type="number" name="lastPaidAmount" class="form-control" id="lastPaidAmount" required value="${registrationEntity.paidAmount}">
         </div>

        <div class="form-group">
            <label for="oldBalance">Old Balance:</label>
            <input type="number" name="oldBalance" class="form-control" id="oldBalance" required value="${registrationEntity.balance}">
        </div>

        <div class="form-group">
             <label for="paidAmount">Paid Amount:</label>
             <input type="number" name="paidAmount" class="form-control" id="paidAmount" required>
         </div>

        <div class="form-group">
            <label for="balance">Balance:</label>
            <input type="number" name="balance" class="form-control" id="balance" required>
        </div>

        <button type="submit" class="btn btn-primary btn-block">Submit</button>
    </form>

    <form action="viewPaymentDetails" method="post">
        <input type="hidden" name="reg_id" value="${registrationEntity.reg_id}">
        <button type="submit" class="btn btn-secondary btn-block">View Payment Details</button>
    </form>

    </div>
    <img src="https://www.pngall.com/wp-content/uploads/13/Dragon-Ball-PNG-Image-HD.png"
         alt="Fitness Image" class="fitness-image" style="width: 6cm; height: 6cm; position: relative; top: 1cm; right:5cm;">

    <script>
        // Search button function
        function searchEmail() {
            var email = document.getElementById('email').value;
            if (email !== "") {
                var form = document.createElement('form');
                form.method = 'POST';
                form.action = 'search'; // Adjust the URL for your search action
                var emailInput = document.createElement('input');
                emailInput.type = 'hidden';
                emailInput.name = 'email';
                emailInput.value = email;
                form.appendChild(emailInput);
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>

</body>
</html>