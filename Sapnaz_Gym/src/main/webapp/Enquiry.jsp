<!DOCTYPE html>
<html>
<head>
    <title>Enquiry</title>
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
        .journey-heading {
            position: absolute;
            right: 250px;
            top: 70%;
            transform: translateY(-50%);
            font-size: 3rem;
            font-family: 'Lora', serif;
            color: white;
            font-weight: bold;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.6);
        }
        .journey-heading .fitness-journey {
            display: block;
            animation: slideInUp 3s ease-in-out forwards;
        }
        @keyframes slideInUp {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
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
        <ul>
            <li><a href="Success.jsp">Home</a></li>
            <li><a href="http://localhost:8080/Sapnaz_Gym/follow">Follow</a></li>
            <li><a href="http://localhost:8080/Sapnaz_Gym/registration">Registration</a></li>
            <li><a href="http://localhost:8080/Sapnaz_Gym/update">Update</a></li>
        </ul>
    </nav>

    <div class="form-container">
        <h2 class="text-center" style="color:darkblue; margin-bottom: 1.5rem;">Enquiry Form</h2>
        <form id="enquiryForm" action="enquiry" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <i class="fas fa-user input-icon"></i>
                <input type="text" name="name" class="form-control" id="name" required>
                <span id="nameError" class="error"></span>
            </div>
            <div class="form-group">
                <label for="area">Area:</label>
                <i class="fas fa-map-marker-alt input-icon"></i>
                <input type="text" name="area" class="form-control" id="area" required>
                <span id="areaError" class="error"></span>
            </div>
            <div class="form-group">
                <label for="ph">Phone:</label>
                <i class="fas fa-phone-alt input-icon"></i>
                <input type="text" name="ph" class="form-control" id="ph" onchange="onPhone()" required>
                <span id="displayPhone" class="error"></span>
            </div>
            <div class="form-group">
                <label for="distance">Distance:</label>
                <i class="fas fa-road input-icon"></i>
                <input type="text" name="distance" class="form-control" id="distance" required>
                <span id="distanceError" class="error"></span>
            </div>
            <div class="form-group">
                <label for="age">Age:</label>
                <i class="fas fa-calendar-alt input-icon"></i>
                <input type="number" name="age" class="form-control" id="age" required>
                <span id="ageError" class="error"></span>
            </div>
            <button type="submit" class="btn btn-primary btn-block" style="background-color:#1e3a8a;">Submit</button>
        </form>
    </div>

    <img src="https://www.pngall.com/wp-content/uploads/13/Dragon-Ball-PNG-Image-HD.png"
         alt="Fitness Image" class="fitness-image" style="width: 6cm; height: 6cm; position: relative; top: -3cm; right: -6cm;">

    <div class="journey-heading">
        START YOUR <span class="fitness-journey">FITNESS JOURNEY</span>
    </div>

    <script>
        function onPhone() {
            var phone = document.getElementById('ph').value;
            if (phone !== "") {
                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8080/Sapnaz_Gym/phone/" + phone, true);
                xhttp.send();
                xhttp.onload = function () {
                    document.getElementById("displayPhone").innerHTML = this.responseText;
                }
            }
        }
        document.getElementById("enquiryForm").addEventListener("submit", function (event) {
            let valid = true;
            const name = document.getElementById("name").value.trim();
            const nameError = document.getElementById("nameError");
            if (name === "" || name.length < 3) {
                nameError.textContent = "Name must be at least 3 characters long.";
                valid = false;
            } else {
                nameError.textContent = "";
            }
            const area = document.getElementById("area").value.trim();
            const areaError = document.getElementById("areaError");
            if (area === "" || area.length < 3) {
                areaError.textContent = "Area must be at least 3 characters long.";
                valid = false;
            } else {
                areaError.textContent = "";
            }
            const phone = document.getElementById("ph").value.trim();
            const phoneError = document.getElementById("displayPhone");
            const phoneRegex = /^[0-9]{10}$/;
            if (!phoneRegex.test(phone)) {
                phoneError.textContent = "Phone must be a 10-digit number.";
                valid = false;
            } else {
                phoneError.textContent = "";
            }
            const distance = document.getElementById("distance").value.trim();
            const distanceError = document.getElementById("distanceError");
            if (isNaN(distance) || distance <= 0) {
                distanceError.textContent = "Distance must be a positive number.";
                valid = false;
            } else {
                distanceError.textContent = "";
            }
            const age = document.getElementById("age").value.trim();
            const ageError = document.getElementById("ageError");
            if (isNaN(age) || age < 10 || age > 100) {
                ageError.textContent = "Age must be between 10 and 100.";
                valid = false;
            } else {
                ageError.textContent = "";
            }
            if (!valid) {
                event.preventDefault();
            }
        });
    </script>
</body>
</html>