<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment Details</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <style>
    body {
      min-height: 100vh;
      margin: 0;
      background-color: #212529;
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
      margin-bottom:40px;
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


    .background-image {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-image: url('https://i.ibb.co/SJ4J9Hm/3685cce6-14c2-454c-836f-22bace48038b.jpg');
      background-size: cover;
      background-position: center;
      z-index: 0;
      opacity: 1;
    }

    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.4);
      z-index: 1;
    }

    .container {
      position: relative;
      z-index: 2;
      max-width: 1200px;
      background-color: rgba(255, 255, 255, 0.8);
      padding: 30px;
      border-radius: 10px;
      box-shadow: none;
      overflow-x: auto;
    }

    table {
      width: 100%;
      table-layout: fixed;
      border-collapse: collapse;
      background-color: #343a40;
      color: #fff;
      max-height: 400px;
      overflow-y: auto;
    }

    th, td {
      text-align: center;
      padding: 10px;
      border: 1px solid #555;
    }

    th {
      background-color: #495057;
    }

    tr:hover {
      background-color: #6c757d;
    }
    .hide-column {
        display: none;
      }
       .header .profile-img {
            max-height: 40px;
            width: 40px;
            border-radius: 50%;

          }
          /* Media query for mobile devices */
              @media (max-width: 768px) {
                .container {
                  padding: 10px;
                  margin: 10px;

                }
                table {
                  font-size: 14px;
                }
                th, td {
                  padding: 8px;
                }
                h3 {
                  font-size: 1.5rem;
                }
              }
                /* Adjust layout for small screens */
                  @media (max-width: 768px) {
                    .nav {
                      display: none;
                    }
                    .header {
                      padding: 10px 15px;

                    }
                    .logo-img {
                      max-height: 40px;
                    }
                    .profile-img {
                      max-height: 30px;
                      width: 30px;
                    }
                    .menu-toggle div {
                      width: 25px;
                      height: 2px;
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
                             <a href="UpdateExerciseAndDiet">UpdateUserExerciseAndDiet</a>

                              <a href="index.jsp">Logout</a>
     </nav>
   </header>

  <div class="background-image"></div>
  <div class="overlay"></div>

  <div class="container">
    <h3 class="text-center" style="color: #212529;"> Payment Details</h3>

    <table id="followupTable" class="table">
      <thead>
        <tr>

          <th>Updated By</th>

            <th>Package</th>
             <th>Trainer</th>

          <th>Paid Amount</th>
          <th>Balance Amount</th>
           <th>Paid Date</th>

        </tr>
      </thead>
      <tbody>
        <c:forEach var="followup" items="${list}" varStatus="status">
          <tr>


            <td>${followup.updated_by}</td>

            <td>${followup.updated_packagel}</th>
            <td>${followup.updated_trainer}</th>

                        <td>${followup.amount_paid}</th>
                        <td>${followup.amount_balance}</th>
                          <td>${followup.updated_date}</td>
          </tr>
        </c:forEach>
      </tbody>

    </table>
  </div>
<script>
  function toggleMenu() {
      document.querySelector('.mobile-nav').classList.toggle('show');
    }
</script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>