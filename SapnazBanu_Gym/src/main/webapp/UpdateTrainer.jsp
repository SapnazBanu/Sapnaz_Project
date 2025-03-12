   <%@ page isELIgnored="false" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Trainer Details</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      margin: 0;
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

              width: 100%;
              height: 65px;
              z-index: 999;
              color: white;
           box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
                 background-color: #1B1E23;
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


    .form-container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: auto;
    }
    .form-box {
      background-color: rgba(57, 55, 55, 0.9);
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
      width: 40%;
    }
    label {
      color: white;
      font-weight: 500;
    }
    .form-control {
      width: 100%;
    }
    .input-group {
      display: flex;
      align-items: center;
    }
    .input-group-append {
      margin-left: 10px;
      color: white;
      font-weight: 500;
    }
    .btn-submit {
      width: 100%;
      padding: 10px;
      font-size: 1.2rem;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      margin-top: 15px;
    }
    .btn-submit:hover {
      background-color: #0056b3;
    }
    @media (max-width: 768px) {
          .nav {
            display: none;
          }
          .form-box {
            width: 90%;
          }
        }
        @media (max-width: 480px) {
          .header {
            padding: 10px 20px;
            margin-bottom:20%;
          }
          .menu-toggle div {
            width: 25px;
            height: 2.5px;
          }
           .form-container {
                display: flex;
                justify-content: center;
                align-items: center;
                height: auto;
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

  <div class="container form-container">
    <div class="form-box">

      <h2 class="text-center" style="color: white;padding-bottom:30px;">Add Trainer</h2>
      <form action="updateTrainer" method="post">
      <p style="color:red; text-align:center">${error}</p>
        <div class="form-group">
          <label for="trainer">Trainer Name</label>
          <input type="text" class="form-control" name="trainer" placeholder="Enter trainer Name"required onblur="validData(event)" >
            <span id="nameValid"></span>
        </div>
        <div class="form-group">
          <label for="phone">Phone Number</label>
          <input type="tel" class="form-control" id="phone" name="phoneNo" placeholder="Enter phone number" oninput="validData(event)" required>
        <span id="phonevalid"></span>
        </div>
        <div class="form-group">
           <label for="state">Slot Time</label>
                        <select name="trainerDropdown" class="form-control" required>
                          <option value="">Select Time Slot</option>
                            <c:forEach var="trainer" items="${slotsEntityList}">
                                <option>${trainer.startTime} - ${trainer.endTime} (${trainer.duration})</option>
                            </c:forEach>
                        </select>
        </div>

        <button type="submit" class="btn btn-submit">Update</button>
      </form>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function toggleMenu() {
      document.querySelector('.mobile-nav').classList.toggle('show');
    }

     const validData=(event)=>{
      const {name,value}=event.target;
       const regex = /^[A-Za-z]+(?: [A-Za-z]+)*$/;
      var regex2 = /^[0-9]+$/;

      if(name==="trainer" && value.length>=2 && regex.test(value) && value!==""){
              console.log("valid name");
            document.getElementById("nameValid").innerHTML="<span></span>"
          }
          else if(name==="trainer" && (value.length<2 || !regex.test(value) || value==="" )){
          console.log("name not valid");
          document.getElementById("nameValid").innerHTML="<span style='color:red'}> Trainer Name Invalid</span>"
          }
       if(name==="phoneNo" && value.length==10 && regex2.test(value)){
                  document.getElementById("phonevalid").innerHTML="<span></span>";
              }
              else if(name==="phoneNo" && (value.length!=10 || !regex2.test(value))){
                  document.getElementById("phonevalid").innerHTML="<span style='color:red'}> Phone Number invalid</span>";
              }

     }

</script>

</body>
</html>