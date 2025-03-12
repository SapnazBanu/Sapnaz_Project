<%@ page isELIgnored = "false"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Home</title>
  <style>
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
      background: url("https://images.pexels.com/photos/1552242/pexels-photo-1552242.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"), #000;
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

    .center-container {
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      margin-top: 50px;
      text-align: center;
    }

    .center-container img {
      height: 150px;
      width: 150px;
      border-radius: 75px;
      margin-bottom: 20px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    }

    .message-container {
      display: flex;
      align-items: center;
      justify-content: center;
      width: auto;
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(8px);
      border-radius: 12px;
      text-align: center;
      padding: 20px;
      border: 1px solid rgba(255, 255, 255, 0.1);
      margin-top: 20px;
    }

    .message-container h1 {
      font-size: 2rem;
      font-weight: bold;
      color: yellow;
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
      <img src="photo/${list.image}" alt="Profile Picture" class="profile-img">
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

  <!-- Center Section (Image + Welcome Text) -->
  <div class="center-container">
    <img src="photo/${list.image}" alt="Centered Image" class="centreImg">
    <div class="message-container">
      <h1>Welcome back, ${list.name}</h1>
    </div>
  </div>

  <!-- JavaScript for Menu Toggle -->
  <script>
    function toggleMenu() {
      document.querySelector('.mobile-nav').classList.toggle('show');
    }
  </script>

</body>
</html>