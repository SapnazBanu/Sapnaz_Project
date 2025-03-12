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
      margin-bottom:3%;
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
    width: 100%;
    max-width: 1200px;
    margin: auto;
}

/* Weekly Exercise Plan */
.week-container {
     background: rgba(0, 0, 0, 0.5);
                backdrop-filter: blur(10px);
                border-radius: 8px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    width: 96.5%;
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
    background: #f8f9fa;
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
             color:white;
}


.day select{
width:103%;
}
/* Select Dropdown */
select {
    width: 54%;
    padding: 8px;
    border-radius: 5px;
    border: 1px solid #ccc;
    font-size: 0.9rem;
    margin-top:10px;
}

/* Monthly Diet Plan */
.month-container {
      background: rgba(0, 0, 0, 0.5);
                backdrop-filter: blur(10px);
                border-radius: 8px;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    width: 40%;
    text-align: center;
    margin-left:28%;
    color:white;
}

label {
    font-weight: bold;
    display: block;
    margin-top: 15px;
}

/* File Upload */
input[type="file"] {
    width: 50%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
        margin-top:10px;
}
input[type="month"] {
    width: 50%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 5px;
        margin-top:10px;
}

/* Image Preview */
.image-preview img {
    max-width: 10%;
    height: 5%;
    margin-top: -40px;

    border-radius: 5px;
}

#submit-btn {
    display: block;
    width: 10%;
    margin: 20px auto;
    padding: 10px;
    font-size: 1rem;
    font-weight: bold;
    color: white;
    background-color: #28a745;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: 0.3s;
}

#submit-btn:hover {
    background-color: #218838;
}
/* Responsive Styles */
@media (max-width: 768px) {
    .week-grid {
        grid-template-columns: repeat(2, 1fr);
    }
      .nav {
             display: none;

         }

    body{
    width:90%;
    }
    #submit-btn{
    width:100px;
    }
}

@media (max-width: 480px) {
    .week-grid {
        grid-template-columns: repeat(1, 1fr);
    }
      .nav {
             display: none;
           }
         .month-container{
         width:90%;
         margin-left:20px;
         }
         .week-container{
         margin-left:20px;
         width:90%;
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

<form id="exercisediet" enctype="multipart/form-data" action="exercisediet" method="post">
    <!-- Weekly Exercise Plan -->
    <div class="week-container">
        <h2 style="color:#00fdff;">Weekly Exercise Plan</h2>
        <div class="week-grid">
            <div class="day"><h3>Monday</h3>
                <select name="monday" required>
                    <option  value="">Select Exercise</option>
                    <option  value="Push-ups">Push-ups</option>
                    <option  value="Squats">Squats</option>
                    <option  value="Running">Running</option>
                </select>
            </div>
            <div class="day"><h3>Tuesday</h3>
                <select name="tuesday" required>
                    <option  value="">Select Exercise</option>
                    <option  value="Bench Press">Bench Press</option>
                    <option  value="Pull-ups">Pull-ups</option>
                    <option  value="Cycling">Cycling</option>
                </select>
            </div>
            <div class="day"><h3>Wednesday</h3>
                <select name="wednesday" required>
                    <option  value="">Select Exercise</option>
                    <option  value="Deadlift">Deadlift</option>
                    <option  value="Lunges">Lunges</option>
                    <option  value="Rowing">Rowing</option>
                </select>
            </div>
            <div class="day"><h3>Thursday</h3>
                <select name="thursday" required>
                    <option  value="">Select Exercise</option>
                    <option  value="Plank">Plank</option>
                    <option  value="Jumping Jacks">Jumping Jacks</option>
                    <option  value="Yoga">Yoga</option>
                </select>
            </div>
            <div class="day"><h3>Friday</h3>
                <select name="friday" required>
                    <option  value="">Select Exercise</option>
                    <option  value="Burpees">Burpees</option>
                    <option  value="Kettlebell Swings">Kettlebell Swings</option>
                    <option  value="Swimming">Swimming</option>
                </select>
            </div>
            <div class="day"><h3>Saturday</h3>
                <select name="saturday" required>
                    <option  value="">Select Exercise</option>
                    <option  value="Shadow Boxing">Shadow Boxing</option>
                    <option  value="Elliptical">Elliptical</option>
                    <option  value="Skipping Rope">Skipping Rope</option>
                </select>
            </div>
            <div class="day"><h3>Sunday</h3>
                <select name="sunday" required>
                    <option  value="">Select Exercise</option>
                    <option value="Hiking">Hiking</option>
                    <option  value="Stretching">Stretching</option>
                    <option  value="Light Cardio">Light Cardio</option>
                </select>
            </div>
        </div>
    </div>

    <!-- Monthly Diet Plan -->
    <div class="month-container">
        <h2 style="color:#00fdff;">Monthly Diet Plan</h2>
        <label>Select Month:</label>
        <input type="month" id="month" name="month" required>

        <label>Select Diet Plan:</label>
        <select id="diet-dropdown" name="dietPlan" required>
            <option value="">Select Diet</option>
            <option value="keto">Keto Diet</option>
            <option value="vegan">Vegan Diet</option>
            <option value="paleo">Paleo Diet</option>
        </select>

        <label>Upload Monthly Image:</label>
        <input type="file" id="diet-image" name="dietImage" accept="image/*" required>

        <div class="image-preview">
            <img id="preview" src="#" alt="Diet Plan Image" style="display:none;">
        </div>
    </div>
<input type="hidden" name="id" value="${Userid}">
    <!-- Submit Button -->

    <button type="submit" id="submit-btn">Submit</button>
</form>


<script>


 function toggleMenu() {
      document.querySelector('.mobile-nav').classList.toggle('show');
    };
</script>

</body>
</html>