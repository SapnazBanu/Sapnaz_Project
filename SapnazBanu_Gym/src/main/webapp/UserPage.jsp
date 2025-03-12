<%@ page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
           background: #000000;  /* fallback for old browsers */
           background: -webkit-linear-gradient(to bottom, #434343, #000000);  /* Chrome 10-25, Safari 5.1-6 */
           background: linear-gradient(to top, #434343, #000000); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

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

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding-top: 70px; /* To avoid overlap with sticky header */

        }

        .center-container {
          background: #000000;  /* fallback for old browsers */
          background: -webkit-linear-gradient(to bottom, #434343, #000000);  /* Chrome 10-25, Safari 5.1-6 */
          background: linear-gradient(to top, #434343, #000000); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            color:white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 700px;
            width: 100%;
        }

        .profile-card img {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            object-fit: cover;
            display: block;
            margin: 0 auto 15px;
            -webkit-box-shadow: -4px 2px 22px 3px rgba(94,94,94,1);
            -moz-box-shadow: -4px 2px 22px 3px rgba(94,94,94,1);
            box-shadow: -4px 2px 22px 3px rgba(94,94,94,1);
        }

        .profile-details {
            text-align: left;
            margin-top: 10px;
        }

        .profile-details p {
            margin: 5px 0;
        }

        .profile-details strong {
            font-weight: bold;
        }

        .personal-info {
            margin-top: 20px;
            text-align: left;
        }

        .personal-info table {
            width: 100%;
            border-collapse: collapse;
        }

        .personal-info table th, .personal-info table td {
            text-align: left;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .save-button {
            display: inline-block;
            background-color: #f54b64;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
            text-decoration: none;
        }

        .save-button:hover {
            background-color: #e43e57;
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


 <nav class="nav">
      <a href="UserHomePage">Home</a>
      <a href="UserProfile">Profile</a>
      <a href="trainerAndSlot">Trainer And Slot</a>
      <a href="exerciseDiet">Exercise and Diet</a>

    </nav>

    <!-- Profile Image + Toggle Menu (Right Side) -->
    <div style="display: flex; align-items: center;">
      <img src="photo/${list.profileImage}" alt="Profile Picture" class="profile-img">
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
    <div class="center-container">
        <h1></h1>
        <div class="profile-card">
            <img src="photo/${list.profileImage}" alt="Profile Picture">
        </div>


        <div class="profile-details">
            <p><strong>Age  :   </strong> ${list.age}</p>
            <p><strong>Weight  :</strong> ${list.weight}</p>
            <p><strong>Height  :</strong> ${list.height}</p>
            <p><strong>Chest Size  :</strong> ${list.chestSize}</p>
        </div>

        <div class="personal-info">
            <h3>Personal Info</h3>
            <table>
                <tr>
                    <th>Full Name</th>
                    <td>${list.name}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>${list.email}</td>
                </tr>
                <tr>
                    <th>Contact Number</th>
                    <td>${list.phoneNumber}</td>
                </tr>
                <tr>
                    <th>Gym Package</th>
                    <td>${list.gympackage}</td>
                </tr>

                <tr>
                    <th>Total Amount</th>
                    <td>${list.amount}</td>
                </tr>
                <tr>
                    <th>Total Amount Paid</th>
                    <td>${list.totalAmountPaid}</td>
                </tr>
                <tr>
                    <th>Discount</th>
                    <td>${list.discount} %</td>
                </tr>
                <tr>
                    <th>Balance Amount</th>
                    <td>${list.balanceAmount}</td>
                </tr>
            </table>
            <a href="updateProfile" class="save-button">Update Profile</a>
        </div>
    </div>
</div>

<script>
    function toggleMenu() {
      document.querySelector('.mobile-nav').classList.toggle('show');
    }
  </script>
</body>
</html>