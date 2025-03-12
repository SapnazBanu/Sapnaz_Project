<%@ page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> <!-- Font Awesome -->
  <style>
    body {
      margin: 0;
      margin-top:10%;
      height: auto; /* Full height of the viewport */
      display: flex;
      justify-content: center; /* Horizontally center the content */
      align-items: center; /* Vertically center the content */
      background-image: url("https://img.freepik.com/premium-photo/sneakers-dumbbells-sport-fitness-healthy-lifestyle_645697-4779.jpg?w=1380");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-attachment: fixed;
      color: #000;
    }

    .form-container {
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 30px;
      width: 90%; /* Adjusted for mobile */
            max-width: 600px;
      border: 1px solid #333;
      border-radius: 10px;
      background-color: rgba(255, 255, 255, 0);
      box-shadow: 0px 2px 10px rgba(200 200, 200, 20);
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

    .btn-center {
      display: block;
      margin: 20px auto;
      padding: 8px 60px;
      font-size: 1.2rem;
    }

    .password-toggle {
      position: absolute;
      right: 15px;
      top: 42px;
      cursor: pointer;
      font-size: 1.3rem;
      color: #007bff;
    }

    .form-group {
      position: relative;
    }
    .message{
    color:red;
    }
    #nameValid{
    color:red;
    font-size:15px;
    }
    h6{
    color:red;
    }
     /* Responsive adjustments */
        @media (max-width: 768px) {
        body{
        margin:0;
       margin-top:20%;
        }
          .form-container {
            width: 85%; /* Full width on mobile */
            padding: 15px 0;
          }
                .form-image {
                height:280px;
                width:270px;
                margin-bottom:10px;
                }
          .row {
            flex-direction: column; /* Stack columns vertically */
          }

          .col-md-5, .col-md-7 {
            width: 100%; /* Full width for columns */
            margin:0;
          }

          h2 {
            font-size: 1.5rem; /* Smaller heading for mobile */
          }

          .btn-center {
            padding: 8px 40px; /* Smaller button padding */
            font-size: 1rem; /* Smaller button text */
          }

          .password-toggle {
            top: 38px; /* Adjust icon position */
          }
        }
  </style>
</head>
<body>

  <div class="container form-container">
    <div class="row">
      <div class="col-md-5">
        <img src="https://media.istockphoto.com/id/542197916/photo/running-on-treadmill.jpg?s=612x612&w=0&k=20&c=CYywmb71uOepSHWa534hG9230AzawSa4i3sA89o4qCQ=" alt="Form Image" class="form-image">
      </div>
      <div class="col-md-7">
      <h6>${locked}</h6>
      <h6>${tryafter2min}</h6>
        <h2 class="text-center" style="color:white">User Login</h2>
        <form action="userLogin" method="post">
        <span class="message">${failure}</span>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="useremail" placeholder="Enter email" required onblur="onField()">
            <span id="nameValid"></span>
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
            <i class="fas fa-eye password-toggle" id="togglePassword" onclick="togglePassword()"></i> <!-- Font Awesome icon -->
            <span id="nameValid">${invalidPassword}</span>
          </div>
          <button type="submit" class="btn btn-primary btn-center">Login</button>
        </form>
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
    function togglePassword() {
      const passwordField = document.getElementById('password');
      const toggleIcon = document.getElementById('togglePassword');
      if (passwordField.type === 'password') {
        passwordField.type = 'text';
        toggleIcon.classList.remove('fa-eye');
        toggleIcon.classList.add('fa-eye-slash'); // Change to eye-slash icon when password is visible
      } else {
        passwordField.type = 'password';
        toggleIcon.classList.remove('fa-eye-slash');
        toggleIcon.classList.add('fa-eye'); // Change back to eye icon when password is hidden
      }
    }

      const onField=()=>{
      var name=document.getElementById("email");
         var value=name.value;
      if(value!=""){
            var xhttp=new XMLHttpRequest();
              xhttp.open("GET","http://localhost:8080/Charan_gym/name/" + value,true);
              xhttp.send();

              xhttp.onload = function() {
                  document.getElementById("nameValid").innerHTML = this.responseText;
              }
              }

      }
  </script>
</body>
</html>