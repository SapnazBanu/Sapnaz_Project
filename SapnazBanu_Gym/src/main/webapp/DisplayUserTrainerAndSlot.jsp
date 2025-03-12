<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trainer and Slot Page</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #000000;  /* fallback for old browsers */
                     background: -webkit-linear-gradient(to bottom, #434343, #000000);  /* Chrome 10-25, Safari 5.1-6 */
                     background: linear-gradient(to top, #434343, #000000); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

        }

    @import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: "Open Sans", sans-serif;
    }

    body {
      min-height: 100vh;
      width: 100%;
      background-position: center;
      background-size: cover;
      background-repeat: no-repeat;
      color: white;
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 15px 30px;
      position: sticky;
      top: 0;
      width: 100%;
      height: 65px;
      z-index: 999;
      color: white;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      background-color: #0E0E0E;
      margin-bottom:8%;
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

    /* Adjust layout for small screens */
    @media (max-width: 768px) {
      .nav {
        display: none;
      }
    }

        .container {
            width: 50%; /* Default width */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
             background: rgba(0, 0, 0, 0.5); /* Black with 50% transparency */
             backdrop-filter: blur(8px); /* Optional: Adds blur effect */
             border-radius: 12px;
            margin: 20px auto; /* Center the container */
              border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .trainer, .slot {
            width: 90%; /* Slightly smaller than container */
            margin: 10px;
            padding: 20px;

            border-radius: 8px;
           background: #C9D6FF;  /* fallback for old browsers */
           background: -webkit-linear-gradient(to right, #E2E2E2, #C9D6FF);  /* Chrome 10-25, Safari 5.1-6 */
           background: linear-gradient(to right, #E2E2E2, #C9D6FF); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

            text-align: center; /* Align text in the middle */
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .container {
                width: 70%; /* Adjust for smaller screens */
            }

            .trainer, .slot {
                width: 100%; /* Full width on smaller screens */
            }



            .trainer h2, .slot h2 {
                font-size: 20px; /* Smaller font size for subheadings */
            }

            .trainer h1, .slot h1 {
                font-size: 18px; /* Smaller font size for content */
            }
        }

        @media (max-width: 480px) {
            .container {

                width: 70%; /* Full width on very small screens */
                padding:0px -10px ; /* Reduce padding */

            }




            .trainer h2, .slot h2 {
                font-size: 18px; /* Smaller font size for subheadings */
            }

            .trainer h1, .slot h1 {
                font-size: 16px; /* Smaller font size for content */
            }

            .trainer, .slot {
                padding: 15px; /* Reduce padding */
                margin: 5px; /* Reduce margin */
            }
        }
    </style>
</head>
<body>
<header class="header">
    <!-- Logo -->
    <div class="logo">
      <img src="https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=277,h=270,fit=crop/AwvJoE0xx0IZMJ8K/ft_power_gym_logo_file_png-01-Yg2apa87NxI6eQXX.png" alt="Logo" class="logo-img">
    </div>


 <nav class="nav">
      <a href="UserHomePage">Home</a>
      <a href="UserProfile">Profile</a>
      <a href="trainerAndSlot">Trainer And Slot</a>
      <a href="exerciseDiet">Exercise and Diet</a>

    </nav>

    <!-- Profile Image + Toggle Menu (Right Side) -->
    <div style="display: flex; align-items: center;">
      <img src="photo/${registrationEntity.profileImage}" alt="Profile Picture" class="profile-img">
      <div class="menu-toggle" onclick="toggleMenu()">
        <div></div>
        <div></div>
        <div></div>
      </div>
    </div>

 <!-- Toggle Menu -->
 <nav class="mobile-nav">
     <a href="UserHomePage">Home</a>

     <a href="UserProfile" class="nav-link">
         <img src="https://i.ibb.co/SXWPRLz/user.png" alt="Personal Profile Icon" style="width: 20px; height: 20px;">
         Personal Profile
     </a>

     <a href="trainerAndSlot" class="nav-link">
         <img src="https://cdn-icons-png.flaticon.com/512/9050/9050508.png" alt="Trainer And Slot Icon" style="width: 20px; height: 20px;">
         Trainer And Slot
     </a>
      <a href="exerciseDiet" class="nav-link">
                   <img src="https://i.ibb.co/zWy1BBG4/exercise-1.png" alt="Trainer And Slot Icon" style="width: 20px; height: 20px;">
                Exercise and Diet
               </a>

     <a href="index.jsp">Logout</a>
 </nav>


  </header>


<div class="container">
    <section class="trainer">
        <h2 style="color:black; margin-bottom:10px">Trainer</h2>
        <h1 style="color:black;">${entity.trainerName}</h1>
    </section>

    <section class="slot">
        <h2 style="color:black; margin-bottom:10px">Slot</h2>
        <h1 style="color:black;">${entity.slot}</h1>
    </section>
</div>

<script>
    function toggleMenu() {
      document.querySelector('.mobile-nav').classList.toggle('show');
    }
  </script>
</body>
</html>