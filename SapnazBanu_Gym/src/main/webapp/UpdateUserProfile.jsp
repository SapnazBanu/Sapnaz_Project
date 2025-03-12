<%@ page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update User Details</title>
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
      height: 60px;
      z-index: 999;
      color: white;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
      background-color: #1B1E23;
    }
    .header .logo {
      font-size: 1.5rem;
      font-weight: bold;
    }
    .header .nav {
      display: flex;
      gap: 20px;
    }
    .header .nav a {
      color: white;
      text-decoration: none;
      font-size: 1rem;
      transition: color 0.3s;
    }
    .header .nav a:hover {
      color: #f0c14b;
    }
    .header .logo {
      display: flex;
      align-items: center;
    }
    .logo-img {
      max-height: 51px;
      max-width: 120%;
      height: auto;
    }
    .form-container {
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 30px;
      border: 1px solid #333;
      border-radius: 10px;
      background-color: rgba(255, 255, 255, 0);
      margin-top: 80px;
    }
    .form-image {
      max-width: 100%;
      height: auto;
      height: 100%;
        border-radius: 10px;
       box-shadow: 0px 2px 10px rgba(100 100, 100, 20);
    }
    label {
      color: white;
      font-weight: 500;
    }
    .form-group {
      margin-bottom: 20px;
    }
    .btn-center {
      display: block;
      margin: 20px auto;
      padding: 4px 100px;
      font-size: 1.2rem;
    }
     .header .profile-img {
          max-height: 40px;
          width: 40px;
          border-radius: 50%;

        }
        @media (max-width: 768px) {
              .header {
              height:auto;
                padding: 25px 15px;
              }
              .header .logo {
                font-size: 1.2rem;
              }
              .header .nav {
                gap: 10px;
              }
              .header .nav a {
                font-size: 1.2rem;
              }
              .logo-img {
                max-height: 35px;
              }
              .form-container {
                padding: 15px;
                margin-top: 50px;
                padding:10px 30px;

              }
              .form-image {
              height:300px;
             margin-left:22%;
                margin-bottom: 50px;
              }
              .btn-center {
                padding: 8px 40px;
                font-size: 0.9rem;
              }
              .header .profile-img {
                max-height: 30px;
                width: 30px;
              }
            }
  </style>
</head>
<body>
  <header class="header">
    <div class="logo">
      <img src="https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=277,h=270,fit=crop/AwvJoE0xx0IZMJ8K/ft_power_gym_logo_file_png-01-Yg2apa87NxI6eQXX.png" alt="Logo" class="logo-img">
    </div>
    <nav class="nav">
      <a href="index.jsp">Home</a>
      <a href="#">Profile</a>
            <img src="photo/${entity.profileImage}" alt="Profile Picture" class="profile-img">


    </nav>
  </header>
  <div class="container mt-5 form-container">
    <div class="row">
      <div class="col-md-5">
        <img src="https://media.istockphoto.com/id/542197916/photo/running-on-treadmill.jpg?s=612x612&w=0&k=20&c=CYywmb71uOepSHWa534hG9230AzawSa4i3sA89o4qCQ=" alt="Form Image" class="form-image">
      </div>
      <div class="col-md-7">
        <h2 class="text-center" style="color:white">Update User Details</h2>
        <form action="updateUserProfile" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label for="firstName">Full Name</label>
            <input type="text" class="form-control form-control-lg" id="firstName" name="name" placeholder="Enter full name" required value="${entity.name}" onblur="validData(event)" readonly>
            <span id="nameValid"></span>
          </div>
          <div class="form-row">
           <div class="form-group col-md-6">
                                 <label for="email">Email</label>
                                            <input type="text" class="form-control form-control-lg" id="email" name="email" placeholder="Enter email" required value="${entity.email}" onblur="validData(event)" readonly>
                                            <span id="emailvalid"></span>
                               </div>

                     <div class="form-group col-md-6">
                       <label for="phone">Phone Number</label>
                       <input type="tel" class="form-control form-control-lg" id="phone" name="phoneNo" placeholder="Enter phone number" required value="${entity.phoneNumber}" onblur="validData(event)" readonly>
                        <span id="phonevalid"></span>
                     </div>

                   </div>
          <div class="form-row">

            <div class="form-group col-md-6">
              <label for="phone">Age</label>
              <input type="text" class="form-control form-control-lg" id="age" name="age" placeholder="Enter age" required value="${entity.age}">
            </div>
               <div class="form-group col-md-6">
                          <label for="phone">Weight</label>
                          <input type="text" class="form-control form-control-lg" id="weight" name="weight" placeholder="Enter weight" required value="${entity.weight}">

                        </div>
          </div>
          <div class="form-row">

                      <div class="form-group col-md-6">
                        <label for="phone">Height</label>
                        <input type="text" class="form-control form-control-lg" id="height" name="height" placeholder="Enter height" required value="${entity.height}" >
                      </div>
                         <div class="form-group col-md-6">
                                    <label for="phone">Chest size</label>
                                    <input type="text" class="form-control form-control-lg" id="size" name="chestSize" placeholder="Enter chest size" required value="${entity.chestSize}">

                                  </div>
                    </div>

          <div class="form-group">
          <label for="phone">Upload Profile Image</label>
            <input type="file" class="form-control form-control-lg" id="formFile" name="thisfile" accept="image/*" value="${entity.profileImage}">
          </div>
          <button type="submit" class="btn btn-primary btn-center">Save Changes</button>
        </form>
      </div>
    </div>
  </div>

  <script>
    const validData = (event) => {
      const { name, value } = event.target;
      const regex = /^[A-Za-z]+(?: [A-Za-z]+)*$/;
      const regex1 = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      const regex2 = /^[0-9]+$/;
      const passwordRegex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
      if (name === "name" && value.length >= 2 && regex.test(value) && value !== "") {
        document.getElementById("nameValid").innerHTML = "<span></span>";
      } else if (name === "name" && (value.length < 2 || !regex.test(value) || value === "")) {
        document.getElementById("nameValid").innerHTML = "<span style='color:red'>Name invalid</span>";
      }

      if (name === "email" && regex1.test(value)) {
        document.getElementById("emailvalid").innerHTML = "<span></span>";
      } else if (name === "email" && !regex1.test(value)) {
        document.getElementById("emailvalid").innerHTML = "<span style='color:red'>Email invalid</span>";
      }

      if (name === "phoneNo" && value.length === 10 && regex2.test(value)) {
        document.getElementById("phonevalid").innerHTML = "<span></span>";
      } else if (name === "phoneNo" && (value.length !== 10 || !regex2.test(value))) {
        document.getElementById("phonevalid").innerHTML = "<span style='color:red'>Phone Number invalid</span>";
      }

      if (name === "password" && passwordRegex.test(value) && value !== "") {
        document.getElementById("passwordValid").innerHTML = "<span></span>";
      } else if (name === "password" && (!passwordRegex.test(value) || value === "")) {
        document.getElementById("passwordValid").innerHTML = "<span style='color:red'>Password Invalid</span>";
      }
    };
  </script>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>