<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weekly Exercise & Monthly Diet Plan</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-image: url("https://img.freepik.com/premium-photo/3d-rendering-iron-fitness-equipment-black-podium_338925-153.jpg?w=1060");
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #000;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            position: sticky;
            top: 0;
            width: 95.2%;
            height: 45px;
            z-index: 999;
            color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            background-color: #0E0E0E;
        }

        .logo-img {
            max-height: 51px;
            height: auto;
        }

        /* Center navigation */
        .nav {
            display: flex;
            align-items: center;
            gap: 30px;
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
        }

        .nav a {
            color: white;
            text-decoration: none;
            font-size: 1rem;
            transition: color 0.3s;
        }

        .nav a:hover {
            color: #f0c14b;
        }

        /* Profile Image */
        .profile-img {
            max-height: 40px;
            width: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        /* Toggle button */
        .menu-toggle {
            display: flex;
            flex-direction: column;
            cursor: pointer;
        }

        .menu-toggle div {
            width: 30px;
            height: 3px;
            background-color: white;
            margin: 5px 0;
            transition: 0.3s;
        }

        /* Dropdown menu - hidden by default */
        .mobile-nav {
            display: none;
            flex-direction: column;
            position: absolute;
            top: 65px;
            right: 0;
            background: rgba(14, 14, 14, 0.9);
            width: 100%;
            padding: 15px 0;
            align-items: center;
        }

        .mobile-nav a {
            padding: 10px;
            color: white;
            text-decoration: none;
            font-size: 1rem;
            text-align: center;
            display: block;
            width: 100%;
            transition: color 0.3s;
        }

        .mobile-nav a:hover {
            color: #f0c14b;
        }

        .mobile-nav.show {
            display: flex;
        }

        /* Main Container */
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            width: 97%;
            max-width: 1200px;
            margin: auto;
        }

        .container1 {
            padding: 20px;
            width: 90%;
            max-width: 1200px;
            margin: auto;
        }

        /* Weekly Exercise Plan */
        .week-container {
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(10px);
            border-radius: 8px;
            padding: 20px;
            width: 100%;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Weekly Grid Layout */
        .week-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(140px, 1fr));
            gap: 15px;
            padding: 10px;
        }

        /* Day Box */
        .day {
            color: white;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            font-weight: bold;
            transition: 0.3s ease-in-out;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(10px);
            box-shadow: 0 3px 8px rgb(251, 250, 250);
            border-radius: 8px;
        }
        .day p{
        color:yellow;
        }

        /* Hover Effect */
        .day:hover {
            transform: scale(1.05);
            background: #c6c6c6;
            color: black;
        }

        /* Monthly Diet Plan */
        .month-container {
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(10px);
            border-radius: 8px;
            padding: 20px;
            text-align: center;
        }

     /* Image Container */
     .image-container {
         display: flex;
         flex-wrap: wrap; /* Allow wrapping to the next row */
         justify-content: center; /* Center items horizontally */
         gap: 20px; /* Space between items */
         margin-top: 20px;
     }

     /* Month Image */
     .month-image {
         text-align: center;
         flex-basis: calc(25% - 20px); /* 4 images per row (adjust as needed) */
         margin-bottom: 20px;
         background: rgba(0, 0, 0, 0.5);
         backdrop-filter: blur(10px);
         box-shadow: 0 3px 8px rgb(251, 250, 250);
         border-radius: 8px;
         padding: 20px;
         box-sizing: border-box;
         margin:10px;/* Include padding in width calculation */
     }



     .month-image img {
         width: 100%;
         height: 250px; /* Fixed height for the image */
         object-fit: cover; /* Ensures the image covers the container without distortion */
         border-radius: 8px;
         box-shadow: 0px 4px 10px rgba(255, 255, 255, 1);
     }

     .month-image p {
         margin-top: 10px;
         font-weight: bold;
         font-size: 1rem;
         color: yellow; /* Text color */
         text-align: center; /* Align text to the left */
     }

     /* Responsive Design */
     @media (max-width: 1200px) {
         .month-image {
             flex-basis: calc(33.33% - 20px); /* 3 images per row on medium screens */
         }
     }

     @media (max-width: 768px) {
         .month-image {
             flex-basis: calc(50% - 20px); /* 2 images per row on tablets */
         }
     }

     @media (max-width: 480px) {
         .month-image {
             flex-basis: 100%; /* 1 image per row on mobile */
         }
     }
    </style>
</head>
<body>

<!-- Header Section -->
<header class="header">
    <!-- Logo -->
    <div class="logo">
        <img src="https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=277,h=270,fit=crop/AwvJoE0xx0IZMJ8K/ft_power_gym_logo_file_png-01-Yg2apa87NxI6eQXX.png" alt="Logo" class="logo-img">
    </div>

    <!-- Navigation centered -->
    <nav class="nav">
        <a href="homePage">Home</a>
        <a href="enquiry">Enquiry</a>
        <a href="followup">FollowUp</a>
        <a href="register">Registration</a>
    </nav>

    <!-- Profile Image + Toggle Menu (Right Side) -->
    <div style="display: flex; align-items: center;">
        <img src="photo/${listimg.image}" alt="Profile Picture" class="profile-img">
        <div class="menu-toggle" onclick="toggleMenu()">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- Toggle Menu -->
    <nav class="mobile-nav">
        <a href="homePage">Home</a>
        <a href="enquiry">Enquiry</a>
        <a href="followup">FollowUp</a>
        <a href="register">Registration</a>
        <a href="registrationUpdate">Update</a>
        <a href="addSlots">Slots</a>
        <a href="viewtrainer">View Trainer</a>
        <a href="AssignUsers">AssignUsers</a>
      <a href="UpdateExerciseAndDiet">UpdateUserExerciseAndDiet</a>
        <a href="index.jsp">Logout</a>
    </nav>
</header>

<div class="container">
    <!-- Weekly Exercise Plan -->
    <div class="week-container">
        <h2 style="color:#00fdff;">Weekly Exercise Plan</h2>
        <c:forEach items="${viewUserExercise}" var="viewUserExercise">
            <div class="week-grid">
                <div class="day"><h3>Monday</h3>
                    <p>${viewUserExercise.monday}</p>
                </div>
                <div class="day"><h3>Tuesday</h3>
                    <p>${viewUserExercise.tuesday}</p>
                </div>
                <div class="day"><h3>Wednesday</h3>
                    <p>${viewUserExercise.wednesday}</p>
                </div>
                <div class="day"><h3>Thursday</h3>
                    <p>${viewUserExercise.thursday}</p>
                </div>
                <div class="day"><h3>Friday</h3>
                    <p>${viewUserExercise.friday}</p>
                </div>
                <div class="day"><h3>Saturday</h3>
                    <p>${viewUserExercise.saturday}</p>
                </div>
                <div class="day"><h3>Sunday</h3>
                    <p>${viewUserExercise.sunday}</p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<div class="container1">
    <!-- Monthly Diet Plan -->
    <div class="month-container">
        <h2 style="color:white">Monthly Diet Plan and Image</h2>

        <div id="all-images-container" class="image-container">
            <!-- Display all images with month names -->
            <c:forEach var="monthlyImages" items="${monthlyImages}">
                <div class="month-image">
                    <div class="text-container">
                        <p><span style="color:#00fdff;">Month:</span> ${monthlyImages.month}</p>
                        <p ><span style="color:#00fdff;">Diet:</span>  ${monthlyImages.dietPlan}</p>
                    </div>
                    <!-- Image Container -->
                    <img src="photo/${monthlyImages.usermonthlyImage}" alt="Diet Plan for ${monthlyImages.dietPlan}">
                </div>
            </c:forEach>
        </div>
    </div>
</div>

<script>
    document.getElementById('diet-image').addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
                const img = document.getElementById('preview');
                img.src = e.target.result;
                img.style.display = 'block';
            }
            reader.readAsDataURL(file);
        }
    });

    function toggleMenu() {
        document.querySelector('.mobile-nav').classList.toggle('show');
    }
</script>

</body>
</html>