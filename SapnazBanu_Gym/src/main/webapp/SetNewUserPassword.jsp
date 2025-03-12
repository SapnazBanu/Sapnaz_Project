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
      height: 100vh; /* Full height of the viewport */
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
      width: 50%;
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
    color:green;
    }
    #nameValid{
    color:red;
    font-size:15px;
    }
    .link{
    color:white;
    margin-left:41%;
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
              <span class="message" >${Setnewpassword}</span>
                          <span class="message">${notSetnewpassword}</span>

        <h2 class="text-center" style="color:white">Reset Password</h2>
        <form action="setuserPassword" method="post">
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" value="${userEmail}" readonly>
            <span id="nameValid"></span>
          </div>
          <div class="form-group">
            <label for="password">Enter New Password</label>
            <input type="password" class="form-control" id="newpassword" name="password" placeholder="Enter password" required oninput="getName(event)">
            <i class="fas fa-eye password-toggle" id="togglePassword" onclick="togglePassword()"></i> <!-- Font Awesome icon -->
          <span style="color:red" id="passwordValid"></span>
          </div>

          <div class="form-group">
            <label for="password">Re-enter New Password</label>
            <input type="password" class="form-control" id="password" name="confirmpassword" placeholder="Enter confirm password" required  oninput="getName(event)">
            <i class="fas fa-eye password-toggle" id="toggleconPassword" onclick="toggleConPassword1()"></i> <!-- Font Awesome icon -->
          <span style="color:red" id="conpasswordValid"></span>
          </div>
          <button type="submit" class="btn btn-primary btn-center">Reset</button>
        </form>
                  <a class="link" href="UserLoginPage.jsp">Login in ?</a>

      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
    function togglePassword() {
      const passwordField = document.getElementById('newpassword');
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
     function toggleConPassword1() {
          const passwordField = document.getElementById('password');
          const toggleIcon = document.getElementById('toggleconPassword');
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
      var placeName=document.getElementById("email");
         var placeValue=placeName.value;
      if(placeValue!=""){
            var xhttp=new XMLHttpRequest();
              xhttp.open("GET","http://localhost:8080/Charan_gym/placeName/" + placeValue,true);
              xhttp.send();

              xhttp.onload = function() {
                  document.getElementById("nameValid").innerHTML = this.responseText;
              }
              }

      }
      var getName=(event)=>{
      var {name,value}=event.target;
           const passwordRegex=/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/

      console.log(name);
      console.log(value);

        if(name==="password" && passwordRegex.test(value) && value!==""){
                  console.log("valid password");
                document.getElementById("passwordValid").innerHTML="<span></span>"
              }
              else if(name==="password" && (!passwordRegex.test(value) || value==="" )){
              console.log("password not valid");
              document.getElementById("passwordValid").innerHTML="<span style='color:red'}>Password must contain [A-Z,a-z,0-9,special char]</span>"
              }

      if(name==="confirmpassword" && value===document.getElementById("newpassword").value){
      console.log("new password and confirm password matching");
      document.getElementById("conpasswordValid").innerHTML="<span style='color:red'></span>"

      }
      else if(name==="confirmpassword" && value!==document.getElementById("newpassword").value){
      document.getElementById("conpasswordValid").innerHTML="<span style='color:red'>Password and Confirm password must be same</span>"
      console.log("new password and confirm password notMatching");

      }

      }
  </script>
</body>
</html>