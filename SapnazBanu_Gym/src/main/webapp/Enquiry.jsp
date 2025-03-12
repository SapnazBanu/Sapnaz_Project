<%@ page isELIgnored = "false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Enquiry Form</title>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 0;
            background: url("https://img.freepik.com/premium-photo/sneakers-dumbbells-sport-fitness-healthy-lifestyle_645697-4779.jpg?w=1380"), #000;
            background-position: center;
            background-size: cover;
            padding-top: 80px; /* Adjust to prevent content from hiding behind fixed header */
        }

        .container {
            position: relative;
            max-width: 700px;
            width: 100%;
            background: #fff;
            padding: 25px;
            border-radius: 8px;
            margin-bottom:20px;
        }

        .container header {
            font-size: 1.5rem;
            color: #333;
            font-weight: 500;
            text-align: center;
        }

        .container .form {
            margin-top: 30px;
        }

        .form .input-box {
            width: 100%;
            margin-top: 20px;
        }

        .input-box label {
            color: #333;
        }

        .form :where(.input-box input, .select-box) {
            position: relative;
            height: 50px;
            width: 100%;
            outline: none;
            font-size: 1rem;
            color: #707070;
            margin-top: 8px;
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 0 15px;
        }

        .input-box input:focus {
            box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
        }

        .form .column {
            display: flex;
            column-gap: 15px;
        }

        .form .gender-box {
            margin-top: 20px;
        }

        .gender-box h3 {
            color: #333;
            font-size: 1rem;
            font-weight: 400;
            margin-bottom: 8px;
        }

        .form :where(.gender-option, .gender) {
            display: flex;
            align-items: center;
            column-gap: 50px;
            flex-wrap: wrap;
        }

        .form .gender {
            column-gap: 5px;
        }

        .gender input {
            accent-color: rgb(70, 35, 247);
        }

        .form :where(.gender input, .gender label) {
            cursor: pointer;
        }

        .gender label {
            color: #707070;
        }

        .address :where(input, .select-box) {
            margin-top: 15px;
        }

        .select-box select {
            height: 100%;
            width: 100%;
            outline: none;
            border: none;
            color: #707070;
            font-size: 1rem;
        }

        .form button {
            margin-left: 30%;
            height: 40px;
            width: 30%;
            border-radius: 30px;
            color: #fff;
            font-size: 1rem;
            font-weight: 400;
            margin-top: 30px;
            border: none;
            cursor: pointer;
            transition: all 0.2s ease;
            background: rgb(102, 74, 241);
        }

        .form button:hover {
            background: rgb(45, 6, 240);
        }

        /* Fixed Header */
        .header {
            position: fixed; /* Keep it fixed at the top */
            top: 0;
            width: 100%;
            height: 65px;
            z-index: 999;
            background-color: #0E0E0E;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 30px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            color: white;
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
            background: url("https://img.freepik.com/free-photo/confident-sportswoman-with-dumbbell-dark_23-2147752923.jpg?t=st=1736603951~exp=1736607551~hmac=3ddc491f7863cb2de154b06fbf52371c2f1bf2df52c068ff3d30de72ca78b66b&w=1060") no-repeat center center / cover;
            padding: 25px;
            margin-top: 50px; /* Ensure the container is not hidden behind the fixed header */
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            color: white;
        }

        .container header, .container label {
            color: white;
        }

        .container {
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 8px rgb(251, 250, 250);
            border-radius: 8px;
            padding: 20px;
        }

        .column {
            display: flex;
            column-gap: 15px;
        }

        .input-box select {
            height: 48px;
            width: 100%;
            outline: none;
            font-size: 1rem;
            color: #707070;
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 0 15px;
            margin-top: 15px;
        }

        /* Adjust layout for small screens */
        @media screen and (max-width: 500px) {
            .form .column {
                flex-wrap: wrap;
            }

            .form :where(.gender-option, .gender) {
                row-gap: 15px;
            }
        }

        .invalidDetails{
        color:red
        }
    </style>
</head>
<body>

<header class="header">
    <div class="logo">
        <img src="https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=277,h=270,fit=crop/AwvJoE0xx0IZMJ8K/ft_power_gym_logo_file_png-01-Yg2apa87NxI6eQXX.png" alt="Logo" class="logo-img">
    </div>

    <nav class="nav">
        <a href="homePage">Home</a>
        <a href="enquiry">Enquiry</a>
        <a href="followup">FollowUp</a>
        <a href="register">Registration</a>
    </nav>

    <div style="display: flex; align-items: center;">
        <img src="photo/${list.image}" alt="Profile Picture" class="profile-img">
        <div class="menu-toggle" onclick="toggleMenu()">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

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

<section class="container">
    <header>Enquiry Form</header>
    <form action="enquiry" class="form" method="post">
    <p class="invalidDetails">${invalidDetails}</p>
        <div class="input-box">
            <label>Full Name</label>
            <input type="text" placeholder="Enter full name" name="name" required onblur="validData(event)" />
            <span id="nameValid"></span>
        </div>

        <div class="input-box">
            <label>Email Address</label>
            <input type="text" placeholder="Enter email address" id="emailId" name="email" required oninput="validData(event)"  onblur="onField()"/>
            <span style="color:red" id="emailvalid"></span>
        </div>

        <div class="column">
            <div class="input-box">
                <label>Phone Number</label>
                <input type="text" placeholder="Enter phone number" name="phoneNumber" required onblur="validData(event)" />
                <span id="phonevalid"></span>
            </div>
            <div class="input-box">
                <label>Age</label>
                <input type="text" placeholder="Enter your age" name="age" required oninput="validData(event)" />
                 <span id="agevalid"></span>
            </div>
        </div>
        <div class="gender-box">
            <h3 style="color: #fff;">Gender</h3>
            <div class="gender-option">
                <div class="gender">
                    <input type="radio" id="check-male" name="gender" value="male" checked />
                    <label for="check-male">Male</label>
                </div>
                <div class="gender">
                    <input type="radio" id="check-female" name="gender" value="female" />
                    <label for="check-female">Female</label>
                </div>
                <div class="gender">
                    <input type="radio" id="check-other" name="gender" value="prefer_not_to_say" />
                    <label for="check-other">Prefer not to say</label>
                </div>
            </div>

        </div>
        <div class="input-box address">
            <label>Address</label>
            <input type="text" placeholder="Enter street address" name="address" required />
            <div class="column">
                <div class="input-box">
                  <select required>
                  <option>Select status</option>
                  <option>Enquiry</option>

                    </select>
                </div>
                <div class="input-box">
                    <input type="text" placeholder="Enter your area" name="areaName" required />
                </div>
            </div>


        </div>
        <button>Submit</button>
    </form>
</section>

<script>
    function toggleMenu() {
        const mobileNav = document.querySelector(".mobile-nav");
        mobileNav.classList.toggle("show");
    }


      const onField=()=>{
          var emailid=document.getElementById("emailId");
             var emailvalue=emailid.value;
          if(emailvalue!=""){
                var xhttp=new XMLHttpRequest();
                  xhttp.open("GET","http://localhost:8080/Charan_gym/emailid/" + emailvalue,true);
                  xhttp.send();

                  xhttp.onload = function() {
                      document.getElementById("emailvalid").innerHTML = this.responseText;
                  }
          }
      }

      const validData=(event)=>{
        const {name,value}=event.target;
        const regex = /^[A-Za-z]+(?: [A-Za-z]+)*$/;
        var regex1 = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        var regex2 = /^[0-9]+$/;

        if(name==="name" && value.length>=2 && regex.test(value) && value!==""){
            document.getElementById("nameValid").innerHTML="<span></span>";
        }
        else if(name==="name" && (value.length<2 || !regex.test(value) || value==="" )){
            document.getElementById("nameValid").innerHTML="<span style='color:red'}> Name Invalid</span>";
        }

        if(name==="email" && (regex1.test(value))){
            document.getElementById("emailvalid").innerHTML="<span></span>";
        }
        else if(name==="email" && !regex1.test(value)){
            document.getElementById("emailvalid").innerHTML="<span style='color:red'}> Email Invalid</span>";
        }

        if(name==="phoneNumber" && value.length==10 && regex2.test(value)){
            document.getElementById("phonevalid").innerHTML="<span></span>";
        }
        else if(name==="phoneNumber" && (value.length!=10 || !regex2.test(value))){
            document.getElementById("phonevalid").innerHTML="<span style='color:red'}> Phone Number Invalid</span>";
        }

        if(name==="age" && value>12 && value<50){
            document.getElementById("agevalid").innerHTML="<span></span>";
        }
        else if(name==="age" && (value<12 || value>50)){
            document.getElementById("agevalid").innerHTML="<span style='color:red'}>Age must be Inbetween 12 to 60</span>";
        }
    }
    </script>


</body>
</html>