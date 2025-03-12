<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assigned Users</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background: url("https://cdn.pixabay.com/photo/2016/07/13/16/00/box-1514845_1280.jpg") no-repeat center center fixed;
        background-size: cover;
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
        padding-top: 65px; /* Add padding to prevent container from being hidden behind the header */
    }

    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px 30px;
        position: fixed; /* Fix the header at the top */
        top: 0;
        width: 100%;
        height: 65px;
        z-index: 999;
        color: white;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        background-color: #0E0E0E;
    }

    .container {
        background: #0F2027;  /* fallback for old browsers */
        background: -webkit-linear-gradient(to right, #2C5364, #203A43, #0F2027);  /* Chrome 10-25, Safari 5.1-6 */
        background: linear-gradient(to right, #2C5364, #203A43, #0F2027); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        width: 400px;
        max-width: 90%;
        text-align: center;
        padding: 20px;
        margin-top: 20px; /* Add margin to ensure it doesn't overlap with the header */
    }

    /* Rest of your CSS remains unchanged */
  * {
                  margin: 0;
                  padding: 0;
                  box-sizing: border-box;
                  font-family: "Open Sans", sans-serif;
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




        table ,h3{
  border-radius: 8px;
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {



            padding: 10px;
            text-align: center;
        }

        th ,.header1 {

           background: #aa4b6b;  /* fallback for old browsers */
           background: -webkit-linear-gradient(to right, #3b8d99, #6b6b83, #aa4b6b);  /* Chrome 10-25, Safari 5.1-6 */
           background: linear-gradient(to right, #3b8d99, #6b6b83, #aa4b6b); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            border-radius: 8px 8px 0 0 ;

            color: white;
        }

        .back-btn {
            margin-top: 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 4px;
            width: 50%;
        }

        .back-btn:hover {
            background-color: #45a049;
        }

        @media (max-width: 600px) {
            .container {
                width: 90%;
                padding: 15px;
            }

            .header {
                font-size: 18px;
                padding: 8px;
            }

            table, th, td {
                font-size: 14px;
                padding: 8px;
            }

            .back-btn {
                padding: 8px;
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
                <a href="index.jsp">Logout</a>

    </nav>
  </header>

<div class="container">
    <div class="header1" style="padding:9px">Assigned Trainer To Users</div>

    <h3>Trainer: <c:out value="${trainerName}" /></h3>
    <h3>Slot: <c:out value="${slot}" /></h3>

    <table>
        <tr>
            <th>User Names</th>
        </tr>
        <c:forEach var="user" items="${assignedUsers}">
            <tr>
                <td style="color:white;fony-size:20px"><c:out value="${user}" /></td>
            </tr>
        </c:forEach>
    </table>

    <a href="AssignUsers"><button class="back-btn">Back</button></a>
</div>
</body>
</html>