<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Slots</title>
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
                  margin-bottom:50px;
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

     .form-container {
       display: flex;
       justify-content: center;
       align-items: center;
       height: auto;
    margin-bottom:10%;
     }
     .form-box {
       background-color: rgba(57, 55, 55, 0.9);
       padding: 30px 20px;
       border-radius: 10px;
       box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
       width: 90%;
       max-width: 400px;
     }
     label {
       color: white;
       font-weight: 500;
     }
     .form-control {
       width: 100%;
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
           .menu-toggle {
             display: flex;
             flex-direction: column;
           }
           .form-box {
             width: 95%;
             padding: 15px;

           }
           .header{
           margin-bottom:30%;
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
      <img src="photo/${profile}" alt="Profile Picture" class="profile-img">
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

<div class="container form-container" style="margin-botton:10%">
  <div class="form-box">
    <h2 class="text-center" style="color: white; padding-bottom:20px;">Create Slot</h2>
    <form action="slot" method="post">
         <span id="nameValid"style="color:red;text-align: center;font-size:18px;padding:0px">${alreadyPresent}</span>
      <div class="form-group">
        <label for="startTime">Start Time</label>
        <input type="time" class="form-control" id="startTime" name="startTime" required value="${start}">
      </div>
      <div class="form-group">
        <label for="endTime">End Time</label>
        <input type="time" class="form-control" id="endTime" name="endTime" required value="${end}" ="onField()">
              <span id="timeRangeError" style="color: red; display: none;">Please use 24-hour format.</span>

      </div>
       <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="slotTime">Slot Time</label>
                            <input type="text" class="form-control" id="slotTime" name="slotTime" readonly>

                  </div>
                  <div class="form-group col-md-6">
                   <label for="duration">Duration (minutes)</label>
                           <input type="text" class="form-control" id="duration" name="duration" readonly>
                  </div>
                </div>

      <button type="submit" class="btn btn-submit">Add Slot</button>
    </form>
  </div>
</div>

<script>
 document.addEventListener("DOMContentLoaded", function () {
console.log("hi")
 document.getElementById("startTime").addEventListener("change", updateSlotTime);
    document.getElementById("endTime").addEventListener("change", updateSlotTime);
    document.getElementById("slotForm").addEventListener("submit", sendSlotData);
function updateSlotTime() {
      var slotName = document.getElementById("slotTime");
      var placeValue = slotName.value;
        console.log("placeValue");
      console.log(placeValue);
      if (placeValue != "") {
        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "http://localhost:8080/Charan_gym/slotName/" + placeValue, true);
        xhttp.send();

        xhttp.onload = function () {
          document.getElementById("nameValid").innerHTML = this.responseText;
        }
      }
      }
})
  function toggleMenu() {
    document.querySelector('.mobile-nav').classList.toggle('show');
  }

  document.getElementById("startTime").addEventListener("change", calculateDuration);
  document.getElementById("endTime").addEventListener("change", calculateDuration);

  function calculateDuration() {
    let startTime = document.getElementById("startTime").value;
    let endTime = document.getElementById("endTime").value;
    let durationField = document.getElementById("duration");
    let timeRangeError = document.getElementById("timeRangeError");

    if (startTime && endTime) {
      let start = new Date("1970-01-01T" + startTime + "Z");
      let end = new Date("1970-01-01T" + endTime + "Z");

      let diff = (end - start) / (1000 * 60); // Convert milliseconds to minutes

      if (diff < 0) {
        durationField.value = "Invalid time range";
        timeRangeError.style.display = "block"; // Show the error message
      } else {
        durationField.value = diff + " min";
        timeRangeError.style.display = "none"; // Hide the error message
      }
    } else {
      durationField.value = "";
      timeRangeError.style.display = "none"; // Hide the error message
    }
  }



    document.getElementById("startTime").addEventListener("change", updateSlotTime);
    document.getElementById("endTime").addEventListener("change", updateSlotTime);

    function updateSlotTime() {
      let startTime = document.getElementById("startTime").value;
      let endTime = document.getElementById("endTime").value;
      let slotTimeField = document.getElementById("slotTime");
      let durationField = document.getElementById("duration");
      let timeRangeError = document.getElementById("timeRangeError");

      if (startTime && endTime) {
        let start = new Date("1970-01-01T" + startTime + "Z");
        let end = new Date("1970-01-01T" + endTime + "Z");
        let diff = (end - start) / (1000 * 60); // Convert milliseconds to minutes

        if (diff < 0) {
          durationField.value = "Invalid time range";
          slotTimeField.value = "";
          timeRangeError.style.display = "block";
        } else {
          durationField.value = diff + " min";
          slotTimeField.value = startTime + " - " + endTime; // Concatenates Start Time and End Time
          timeRangeError.style.display = "none";
        }
      } else {
        durationField.value = "";
        slotTimeField.value = "";
        timeRangeError.style.display = "none";
      }
    }

</script>



<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>