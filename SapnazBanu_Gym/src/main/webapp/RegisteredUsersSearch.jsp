<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registred Users</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
  <style>
  body {
    min-height: 100vh;
    margin: 0;
    background-image: url("https://img.freepik.com/premium-photo/3d-rendering-iron-fitness-equipment-black-podium_338925-153.jpg?w=1060");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
    color: #000;

     overflow: hidden;

  }

 .table-container {
   margin-top: 0;
   background-color: #fff;
   padding: 20px;
   padding-top:0px;
   border-radius: 10px;
   box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
   max-height: calc(100vh - 170px);
   overflow-y: auto;
 }

 .table-name {
   position: sticky;
   top: 0;
   background-color: #f8f9fa;
   padding: 10px;
   z-index: 2;
   text-align: center;
   font-size: 1.25rem;
   font-weight: bold;
   border-bottom: 1px solid #dee2e6;
 }

 table thead tr {
   position: sticky;
   top: 40px;
   background-color: #f8f9fa;
   z-index: 1;
 }

 table th {
   background-color: #f8f9fa;
 }


  .container {
    margin-top: 40px;
    margin-bottom: 50px; /* Add margin to the bottom */
    width: 100%;
  /* Slightly more opaque background */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15); /* Softer shadow for a smoother effect */
    transition: background-color 0.3s ease; /* Smooth transition for background-color */
    margin-bottom: 10px;
  }



   .search-message {
          display: flex;
          justify-content: center; /* Center horizontally */
          align-items: center; /* Center vertically within the flex container */
          margin-top: 20px; /* Add some spacing from the search-row */
          text-align: center; /* Ensure text is centered */
      }

      /* Optional: Styling for search-row */
      .search-row {
          display: flex;
          justify-content: right;
          align-items: center;
          margin-bottom: 20px;
      }

      /* Optional: Style the form controls */
      .form-control {
          padding: 10px;
          font-size: 16px;
      }

  .pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
  }

  .page-link {
    color: #007bff;
    text-decoration: none;
    margin: 0 5px;
    padding: 8px 12px;
    border: 1px solid #007bff;
    border-radius: 5px;
  }

  .page-link:hover {
    background-color: #007bff;
    color: #fff;
  }

  .page-link.active {
    background-color: #007bff;
    color: #fff;
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

    .update{
    font-size:30px;
    }
       #nameValid {
                margin-top: 10px;
                color: green;
            }

             .header .profile-img {
                  max-height: 40px;
                  width: 40px;
                  border-radius: 50%;

                }
  </style>
</head>
<body>
  <!-- Centered Message -->
  <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); text-align: center;">
    <h5 style="color: red;">${failure}</h5>
    <p class="update" style="colr:red">${notupdated}</p>
     <p class="update" style="color:green">${enquiryName}</p>

  </div>

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


  <div class="container">
    <!-- Search Row -->
    <div class="search-row" style="display: flex; flex-direction: column; gap: 10px; align-items: flex-end;">
           <form action="searchDetails" style="display: flex; gap: 10px; align-items: center;">
               <input type="text" class="form-control" id="searchName" name="searchName" placeholder="Search name" oninput="onField()" required>
               <input type="text" class="form-control" id="searchPhoneNo" name="searchPhoneNo" placeholder="Search phone number" oninput="onField()" required>
               <button type="submit" class="btn btn-primary">Search</button>
           </form>

           <!-- Div to display validation or result message below the form -->
           <div id="nameValid" style="margin-top: 0px; color: red; margin-right:170px"></div>
       </div>




    <!-- This div is for the messages -->
    <div class="search-message">
        <h4 style="color: red;">${listEmpty}</h4>
        <h4 style="color: red;">${notFound}</h4>
    </div>


    <!-- Table Container -->
    <c:if test="${not empty list}">
     <div class="table-container">
       <h4 class="table-name">User Details</h4>
       <form action="updatebutton" method="post">
         <table class="table table-striped table-bordered table-hover">
           <colgroup>

             <col style="width: 18%;">
             <col style="width: 15%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
             <col style="width: 10%;">
           </colgroup>
           <thead>
             <tr>
               <th>Name</th>
               <th>Email</th>
               <th>Phone Number</th>
               <th>Package</th>
               <th>Trainer</th>
               <th>Total Amount</th>
               <th>Amount Paid</th>
               <th>Balance Amount</th>
                <th>update</th>
                <th>View</th>
             </tr>
           </thead>
           <tbody>
           <c:forEach items="${list}" var="enquiry">
             <tr>
               <form action="updatebutton" method="post" >  <!-- Form for each row -->
                 <!-- Hidden input to store the enquiry id -->
                 <input type="hidden" name="id" value="${enquiry.id}" />
                 <input type="hidden" name="name" value="${enquiry.name}" />
                   <input type="hidden" name="totalAmount" value="${enquiry.amount}" />
                  <input type="hidden" name="trainer" value="${enquiry.trainer}" />
                    <input type="hidden" name="phoneNumber" value="${enquiry.phoneNumber}" />
                 <input type="hidden" name="gympackage" value="${enquiry.gympackage}" />
                   <input type="hidden" name="balanceAmount" value="${enquiry.balanceAmount}" />


                 <td>${enquiry.name}</td>
                 <td>${enquiry.email}</td>
                 <td>${enquiry.phoneNumber}</td>
                 <td>${enquiry.gympackage}</td>
                 <td>${enquiry.trainer}</td>
                 <td>${enquiry.amount}</td>
                 <td>${enquiry.amountPaid}</td>
                  <td>${enquiry.balanceAmount}</td>

                 <td>
                   <button type="submit" class="btn btn-success">Update</button>  <!-- Update button for each row -->
                 </td>
                  <td>
                                <a href="view?id=${enquiry.id}" class="btn btn-success">View</a>
                                  </td>
               </form>
             </tr>
           </c:forEach>

           </tbody>
         </table>

       </form>
     </div>

        <!-- Pagination Links -->
        <c:if test="${totalPages > 1}">
          <div class="pagination">
            <c:forEach begin="1" end="${totalPages}" var="i">
              <a href="followupoperation?page=${i}" class="page-link ${currentPage == i ? 'active' : ''}">${i}</a>
            </c:forEach>
          </div>
        </c:if>
      </div>
    </c:if>
  </div>


  <script>
    function toggleMenu() {
        document.querySelector('.mobile-nav').classList.toggle('show');
      }

     const onField = () => {
         var searchName = document.getElementById("searchName").value;
         var searchPhoneNo = document.getElementById("searchPhoneNo").value;
         var nameValidDiv = document.getElementById("nameValid");

         // Regular expressions for validation
         var namePattern = /^[A-Za-z\s]+$/; // Allows only alphabets and spaces
         var phonePattern = /^[0-9]*$/; // Allows only digits

         // Name validation (only alphabets and spaces)
         if (searchName !== "" && !namePattern.test(searchName)) {
             nameValidDiv.innerHTML = "Please enter only alphabets for the name.";
             return; // Stop execution if invalid input is detected
         }

         // Phone number validation (only digits)
         if (searchPhoneNo !== "" && !phonePattern.test(searchPhoneNo)) {
             nameValidDiv.innerHTML = "Please enter only numbers for the phone number.";
             return; // Stop execution if invalid input is detected
         }

         // Clear error message if inputs are valid
         nameValidDiv.innerHTML = "";

         // Proceed with AJAX call if both fields are valid
         if (searchName !== "" && searchPhoneNo !== "") {
             var xhttp = new XMLHttpRequest();
             var url = "http://localhost:8080/Charan_gym/search?searchName=" + encodeURIComponent(searchName) + "&searchPhoneNo=" + encodeURIComponent(searchPhoneNo);
             xhttp.open("GET", url, true);
             xhttp.send();

             xhttp.onload = function () {
                 nameValidDiv.innerHTML = this.responseText;
             };
         }
     };

    </script>
</body>

</html>