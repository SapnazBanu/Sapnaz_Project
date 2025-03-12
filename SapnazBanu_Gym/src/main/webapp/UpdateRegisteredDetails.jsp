
<%@ page isELIgnored = "false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>update Form</title>
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

    .form-container {
      display: flex;
      justify-content: center;
      margin-top: 20px;
      padding: 20px;
      padding-bottom: 0px;
      border: 1px solid rgba(57, 55, 55, 0.3);
      border-radius: 10px;
      background-color: rgba(57, 55, 55, 0);
      width: 45%;
          box-shadow: 0px 2px 10px rgba(200, 200, 200, 0.6);

    }
    label {
      color: white;
      font-weight: 500;
    }
    .form-control {
      width: 100%;
    }
    .input-group-text {
      background-color: #aca5a5;
      color: #000;
    }
    .form-group {
      margin-bottom: 15px;
    }
    .btn-center {
      display: block;
      margin: 15px auto;
      padding: 10px 50px;
      font-size: 1.2rem;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
    }
    .btn-center:hover {
      background-color: #0056b3;
      color:#bdc7c0;
    }
     .header .profile-img {
          max-height: 40px;
          width: 40px;
          border-radius: 50%;

        }
         /* Media query for mobile devices */
            @media (max-width: 768px) {
              .form-container {
                width: 95%; /* Full width on mobile */
                padding: 15px; /* Reduced padding */
              }
              .form-row {
                flex-direction: column; /* Stack form fields vertically */
              }
              .form-group.col-md-6 {
                width: 100%; /* Full width for stacked fields */
              }
              .btn-center {
                padding: 8px 30px; /* Smaller button for mobile */
                font-size: 1rem; /* Smaller font size */
              }
              .nav {
                display: none; /* Hide desktop nav on mobile */
              }
              .header {
                padding: 10px 15px; /* Reduced padding */
              }
              .logo-img {
                max-height: 40px; /* Smaller logo */
              }
              .profile-img {
                max-height: 30px; /* Smaller profile image */
                width: 30px;
              }
              .menu-toggle div {
                width: 25px; /* Smaller toggle bars */
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


  <div class="container form-container">
    <form action="updateRegister" method="post">
      <h2 class="text-center" style="color: white;">Update Form</h2>

          <input type="hidden" name="id" value="${id}" />
           <input type="hidden" name="totalAmount" value="${totalAmount}" id="totalAmount" />
           <input type="hidden" name="name" value="${name}" />
           <input type="hidden" name="phoneNo" value="${phoneNumber}" />


      <div class="form-group">
        <label for="firstName">Full Name</label>
        <input style="color:black" type="text" class="form-control" id="firstName" name="name" placeholder="Enter full name" value="${name}" disabled>
      </div>
      <div class="form-group">
        <label for="phone">Phone Number</label>
        <input style="color:black" type="tel" class="form-control" id="phone" name="phoneNo" placeholder="Enter phone number" value="${phoneNumber}" required disabled>
      </div>
      <!-- Package and Trainer Fields in One Row -->
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="gympackage">Package</label>
         <select class="form-control" name="gympackage" required value="${packag}">
             <option value="BASIC" ${packag == 'BASIC' ? 'selected' : ''}>BASIC</option>
             <option value="PRO" ${packag == 'PRO' ? 'selected' : ''}>PRO</option>
             <option value="ELITE" ${packag == 'ELITE' ? 'selected' : ''}>ELITE</option>
              <option value="VIP" ${packag == 'VIP' ? 'selected' : ''}>VIP</option>
                            </select>
        </div>
        <div class="form-group col-md-6">
          <label for="trainer">Trainer</label>
          <select class="form-control" name="trainer" required value="${trainer}">
          <option value="RAJU" ${trainer == 'RAJU' ? 'selected' : ''}>RAJU</option>
           <option value="NANDAN" ${trainer == 'NANDAN' ? 'selected' : ''}>NANDAN</option>
           <option value="LIKI" ${trainer == 'LIKI' ? 'selected' : ''}>LIKI</option>
           <option value="NOT_REQUIED" ${trainer == 'NOT_REQUIED' ? 'selected' : ''}>NOT_REQUIED</option>
              </select>
        </div>
      </div>

      <div class="form-group">
        <label for="amount">Balance Amount</label>
        <div class="input-group">
          <span class="input-group-text">&#8377;</span>
          <input type="text" class="form-control" id="amount" name="balancePrice" value="${balanceAmount}">
          <span class="input-group-text">.00</span>
        </div>
      </div>
      <div class="form-row">
        <div class="form-group col-md-6">
          <label for="amountPaid">Amount Paying</label>
          <div class="input-group">
            <span class="input-group-text">&#8377;</span>
            <input type="text" class="form-control" id="amountPaying" name="amountPaid" required>
            <span class="input-group-text">.00</span>
          </div>
        </div>
        <div class="form-group col-md-6">
          <label for="balanceamount">Remaining Balance</label>
          <div class="input-group">
            <span class="input-group-text">&#8377;</span>
            <input type="text" class="form-control" id="remainingBalance" name="balanceAmount">
            <span class="input-group-text">.00</span>
          </div>
        </div>
      </div>
      <button type="submit" class="btn btn-center">Update</button>
    </form>
  </div>
  <script>

    function toggleMenu() {
        document.querySelector('.mobile-nav').classList.toggle('show');
      }
    const packagePrices = {
      "BASIC": 10000,
      "PRO": 13000,
      "ELITE": 15000,
      "VIP": 25000
    };

    document.addEventListener("DOMContentLoaded", function () {
      const packageField = document.querySelector("select[name='gympackage']");
      const balanceAmountField = document.querySelector("input[name='balancePrice']");
      const amountPayingField = document.querySelector("input[name='amountPaid']");
      const remainingBalanceField = document.querySelector("input[name='balanceAmount']");
      const totalAmountField = document.querySelector("input[name='totalAmount']");

      const initialPackage = packageField.value;
      const initialBalance = parseFloat(balanceAmountField.value) || 0;
      const initialTotalAmount = parseFloat(totalAmountField.value) || 0;

      const updateBalances = () => {
        const selectedPackage = packageField.value;
        const currentBalance = parseFloat(balanceAmountField.value) || 0;
        const amountPaying = parseFloat(amountPayingField.value) || 0;

        const initialPackagePrice = packagePrices[initialPackage];
        const selectedPackagePrice = packagePrices[selectedPackage];

        const priceDifference = selectedPackagePrice - initialPackagePrice;
        const newBalanceAmount = initialBalance + priceDifference;
        balanceAmountField.value = newBalanceAmount.toFixed(2);

        const remainingBalance = newBalanceAmount - amountPaying;
        remainingBalanceField.value = remainingBalance.toFixed(2);

        // Update the total amount
        const newTotalAmount = initialTotalAmount + priceDifference;
        totalAmountField.value = newTotalAmount.toFixed(2);
      };

      packageField.addEventListener("change", updateBalances);
      amountPayingField.addEventListener("input", updateBalances);
    });
  </script>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.4.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>