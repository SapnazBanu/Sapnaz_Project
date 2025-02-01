<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style>
        body {
            background: url('https://wallpaperaccess.com/full/4615469.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: Arial, sans-serif;
            margin-top: 80px;
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 25px;
            padding: 30px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            width: 900px;
            max-height: 700px;
            overflow-y: auto;
            margin-left: 80px;
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
        .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
        .form-group {
            margin-bottom: 20px;
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
            <li><a href="http://localhost:8080/chethan_gym/update">Update</a></li>
        </ul>
    </nav>

    <div class="form-container">
        <h2 class="text-center" style="color: #1e3a8a;">Registration Form</h2>
        <form action="registration1" method="post" onsubmit="return validateForm()">
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="name">Name:</label>
                    <input type="text" name="name" class="form-control" id="name" required>
                    <span id="nameError" class="text-danger"></span>
                </div>
                <div class="form-group col-md-6">
                    <label for="email">Email:</label>
                    <input type="text" name="email" class="form-control" id="email" onchange="onEmail()" required>
                    <span id="displayEmail" class="error"></span>
                    <span id="emailError" class="text-danger"></span>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="ph">Phone:</label>
                    <input type="text" name="ph" class="form-control" id="ph" required>
                    <span id="phoneError" class="text-danger"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="packages">Package:</label>
                <select name="packages" class="form-control" id="packages" required>
                    <option value="" disabled selected>-Select a package-</option>
                    <c:forEach items="${packages}" var="pkg">
                        <option value="${pkg}">${pkg}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label>Personal Trainer:</label>
                <div class="form-check">
                    <input type="radio" name="trainer" value="yes" class="form-check-input" id="trainerYes" required>
                    <label class="form-check-label" for="trainerYes">Yes</label>
                </div>
                <div class="form-check">
                    <input type="radio" name="trainer" value="no" class="form-check-input" id="trainerNo" required>
                    <label class="form-check-label" for="trainerNo">No</label>
                </div>
            </div>
            <div class="form-group">
                <label for="gymName">Gym Name:</label>
                <select name="gymName" class="form-control" id="gymName" required>
                    <option value="" disabled selected>-Select branch-</option>
                    <c:forEach items="${gymNames}" var="gym">
                        <option value="${gym}">${gym}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="row">
                <div class="form-group col-md-6">
                    <label for="amount">Amount:</label>
                    <input type="number" name="amount" class="form-control" id="amount" required readonly>
                </div>
                <div class="form-group col-md-6">
                    <label for="discount">Discount (%):</label>
                    <input type="number" name="discount" class="form-control" id="discount" required>
                    <span id="discountError" class="text-danger"></span>
                </div>
            </div>

 <div class="form-group col-md-6">
                    <label for="installment">Installment:</label>
                    <select name="installment" class="form-control" id="installment" required>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="4">4</option>
                        <option value="12">12 (Monthly)</option>
                    </select>
                </div>

            <div class="row">

             <div class="form-group col-md-6">
                 <label for="paidAmount">Paid Amount:</label>
                 <input type="number" name="paidAmount" class="form-control" id="paidAmount" required>
             </div>


                <div class="form-group col-md-6">
                    <label for="balance">Balance:</label>
                    <input type="number" name="balance" class="form-control" id="balance" required readonly>
                </div>

            </div>
            <button type="submit" class="btn btn-primary btn-block">Submit</button>
        </form>
    </div>

    <img src="https://www.pngall.com/wp-content/uploads/13/Dragon-Ball-PNG-Image-HD.png"
         alt="Fitness Image" class="fitness-image" style="width: 6cm; height: 6cm; position: relative; top: -13cm; right:-30cm;">

    <script>
        $(document).ready(function() {
            var packageDetails = {
                'Basic': 1000,
                'Standard': 1500,
                'Premium': 2000,
                'VIP': 3000
            };
            $('#packages').change(function() {
                var selectedPackage = $(this).val();
                var amount = packageDetails[selectedPackage] || 0;
                $('#amount').val(amount * 12);
                if (selectedPackage == 'Premium' || selectedPackage == 'VIP') {
                    $('#trainerYes').prop('checked', true);
                    $('#trainerNo').prop('checked', false);
                } else {
                    $('#trainerNo').prop('checked', true);
                    $('#trainerYes').prop('checked', false);
                }
                $('#balance').val('');
            });
            $('#discount, #installment, #paidAmount').on('input change', function() {
                var amount = parseFloat($('#amount').val()) || 0;
                var discountPercentage = parseFloat($('#discount').val()) || 0;
                var paidAmount = parseFloat($('#paidAmount').val()) || 0;
                var installmentPeriod = parseFloat($('#installment').val()) || 1;
                if (amount > 0 && discountPercentage >= 0 && installmentPeriod > 0) {
                    var discountAmount = (amount * (discountPercentage / 100));
                    var finalAmount = amount - discountAmount;
                    var beforeAdvance = finalAmount - paidAmount;
                    var balance = beforeAdvance / installmentPeriod;
                    $('#balance').val(balance.toFixed(2));
                }
            });
        });
        function onEmail() {
            var email = document.getElementById('email').value;
            if (email !== "") {
                var xhttp = new XMLHttpRequest();
                xhttp.open("GET", "http://localhost:8080/Sapnaz_Gym/email/" + email, true);
                xhttp.send();
                xhttp.onload = function() {
                    document.getElementById("displayEmail").innerHTML = this.responseText;
                }
            }
        }
        function validateForm() {
            var isValid = true;
        var name = document.getElementById("name").value;
        if (name === "") {
            document.getElementById("nameError").innerText = "Name is required.";
            isValid = false;
        } else if (name.length < 3) {
            document.getElementById("nameError").innerText = "Name must be at least 3 characters.";
            isValid = false;
        } else if (!/^[a-zA-Z\s]+$/.test(name)) {
            document.getElementById("nameError").innerText = "Name must contain only letters and spaces.";
            isValid = false;
        } else {
            document.getElementById("nameError").innerText = "";
        }
            var email = document.getElementById("email").value;
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email === "") {
                document.getElementById("emailError").innerText = "Email is required.";
                isValid = false;
            } else if (!emailPattern.test(email)) {
                document.getElementById("emailError").innerText = "Invalid email format.";
                isValid = false;
            } else {
                document.getElementById("emailError").innerText = "";
            }
            var phone = document.getElementById("ph").value;
            if (phone === "") {
                document.getElementById("phoneError").innerText = "Phone number is required.";
                isValid = false;
            } else if (!/^\d{10}$/.test(phone)) {
                document.getElementById("phoneError").innerText = "Phone number must be 10 digits.";
                isValid = false;
            } else {
                document.getElementById("phoneError").innerText = "";
            }
                    var discount = document.getElementById("discount").value;
                    if (discount === "") {
                        document.getElementById("discountError").innerText = "Discount is required.";
                        isValid = false;
                    } else if (isNaN(discount) || discount < 0 || discount > 100) {
                        document.getElementById("discountError").innerText = "Discount must be a valid number between 0 and 100.";
                        isValid = false;
                    } else {
                        document.getElementById("discountError").innerText = "";
                    }
            return isValid;
        }
    </script>
</body>
</html>