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
      padding: 20px;
      width: 90%; /* Adjusted for mobile */
      max-width: 600px; /* Added max-width for larger screens */
      border: 1px solid #333;
      border-radius: 10px;
      background-color: rgba(255, 255, 255, 0); /* Slightly transparent white background */
      box-shadow: 0px 2px 10px rgba(200, 200, 200, 0.2);
    }

    .form-image {
      max-width: 100%;
      height: auto;
      border-radius: 10px;
      box-shadow: 0px 2px 10px rgba(100, 100, 100, 0.2);
    }

    label {
      color: white; /* Changed to black for better visibility */
      font-weight: 500;
    }

    .btn-center {
      display: block;
      margin: 20px auto;
      padding: 8px 40px; /* Adjusted padding for mobile */
      font-size: 1rem; /* Adjusted font size for mobile */
    }

    .password-toggle {
      position: absolute;
      right: 15px;
      top: 42px;
      cursor: pointer;
      font-size: 1.2rem; /* Adjusted font size for mobile */
      color: #007bff;
    }

    .form-group {
      position: relative;
    }

    .message {
      color: red;
    }

   #nameValid {
     color: red;
     font-size: 14px; /* Adjusted font size for mobile */
     display: block; /* Ensure it is displayed as a block element */
     margin-top: 5px; /* Add some margin to separate it from the input field */
     width: 100%; /* Ensure it takes the full width */
   }
    /* Media query for tablets and larger screens */
    @media (min-width: 768px) {
      .form-container {
        width: 70%;
        padding: 30px;
      }

      .btn-center {
        padding: 8px 60px;
        font-size: 1.2rem;
      }

      .password-toggle {
        font-size: 1.3rem;
      }

       #nameValid {
       color:red;
          font-size: 12px; /* Smaller font size for mobile */
          margin-top: 5px; /* Add space between the input field and the error message */
          display: block; /* Ensure it is displayed as a block element */
          width: 100%; /* Take full width */
          white-space: normal; /* Allow text to wrap */
          overflow: visible; /* Ensure the text is not clipped */
        }

        .form-group {
          margin-bottom: 15px; /* Add more space between form groups */
        }
    }

    /* Media query for mobile devices */
    @media (max-width: 767px) {
      .form-image {
        height: 290px; /* Decreased height for mobile */
        width:250px;
        margin-left:30px;
        object-fit: cover; /* Ensures the image covers the area without distortion */
      }


        #nameValid {
        color:red;
           font-size: 12px; /* Smaller font size for mobile */
           margin-top: 5px; /* Add space between the input field and the error message */
           display: block; /* Ensure it is displayed as a block element */
           width: 100%; /* Take full width */
           white-space: normal; /* Allow text to wrap */
           overflow: visible; /* Ensure the text is not clipped */
         }

         .form-group {
           margin-bottom: 15px; /* Add more space between form groups */
         }
    }


    .btn-grad {
      background-image: linear-gradient(to right, #2b5876 0%, #4e4376 51%, #2b5876 100%);
      margin: 10px;
      padding: 15px 45px;
      text-align: center;
      text-transform: uppercase;
      transition: 0.5s;
      background-size: 200% auto;
      color: white;
      box-shadow: 0 0 20px #eee;
      border-radius: 10px;
      display: block;
    }

    #btn-grad:hover {
      background-position: right center; /* Change the direction of the gradient on hover */
      color: #fff;
      text-decoration: none;
    }
  </style>
</head>
<body>

  <div class="container form-container">
    <div class="row">
      <!-- Image Column (Visible on all screens) -->
      <div class="col-md-5">
        <img src="https://media.istockphoto.com/id/542197916/photo/running-on-treadmill.jpg?s=612x612&w=0&k=20&c=CYywmb71uOepSHWa534hG9230AzawSa4i3sA89o4qCQ=" alt="Form Image" class="form-image">
      </div>
      <!-- Form Column -->
      <div class="col-md-7">
        <h2 class="text-center" style="color: white;">Admin Login</h2>
        <form action="adminLogin" method="post">
          <span class="message">${failure}</span>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email" required onblur="onField()">
           <span id="nameValid" style="display: block; width: 100%;"></span>
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required>
            <i class="fas fa-eye password-toggle" id="togglePassword" onclick="togglePassword()"></i> <!-- Font Awesome icon -->
          </div>
          <button type="submit" class="btn btn-primary btn-center" id="btn-grad">Login</button>
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

    const onField = () => {
      var placeName = document.getElementById("email");
      var placeValue = placeName.value;
      if (placeValue != "") {
        var xhttp = new XMLHttpRequest();
        xhttp.open("GET", "http://localhost:8080/Charan_gym/placeName/" + placeValue, true);
        xhttp.send();

        xhttp.onload = function () {
          document.getElementById("nameValid").innerHTML = this.responseText;
        }
      }
    }
  </script>
</body>
</html>