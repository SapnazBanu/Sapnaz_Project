<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Slots</title>
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
    background-color: rgba(255, 255, 255, 0.7); /* Slightly more opaque background */
    padding: 20px;

    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15); /* Softer shadow for a smoother effect */
    transition: background-color 0.3s ease; /* Smooth transition for background-color */

  }



   .search-message {
          display: flex;
          justify-content: center; /* Center horizontally */
          align-items: center; /* Center vertically within the flex container */
          margin-top: 20px; /* Add some spacing from the search-row */
          text-align: center; /* Ensure text is centered */
      }


      .search-row {
          display: flex;
          justify-content: right;
          margin-top:50px;
          align-items: center;
          margin-bottom: 10px;
          margin-right: 80px;
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

                .deleteMessage{
                color:red;
                margin-left:40%;
                }

                .table-container{
                padding-bottom:80px;

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
      <a href="index.jsp">Home</a>
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
      <a href="index.jsp">Home</a>
      <a href="enquiry">Enquiry</a>
      <a href="followup">FollowUp</a>
      <a href="register">Registration</a>
      <a href="registrationUpdate">Update</a>
      <a href="addSlots">Slots</a>
      <a href="viewtrainer">View Trainer</a>
        <a href="AssignUsers">AssignUsers</a>
                      <a href="index.jsp">Logout</a>
    </nav>
  </header>

<div class="search-row" >

            <a href="createSlot" class="btn btn-primary">
              <button class="btn btn-primary">Create Slot</button>
            </a>
        </div>

  <div class="container" style="margin-bottom:10%;">

    <h4 class="deleteMessage">${deleteSlot}</h4>
    <!-- Table Container -->
    <p style="color:red;text-align: center;font-size:20px">${added}</p>
    <c:if test="${not empty slotsEntityList}">
     <div class="table-container">
       <h4 class="table-name">Slot Timing Details</h4>
       <form action="deletebutton" method="post">
         <table class="table table-striped table-bordered table-hover">
           <colgroup>

             <col style="width: 18%;">
             <col style="width: 15%;">
             <col style="width: 10%;">
             <col style="width: 10%;">


           </colgroup>
           <thead>
             <tr>
               <th>Start Time</th>
               <th>End Time</th>
               <th>Duration</th>
               <th>Delete</th>

             </tr>
           </thead>
           <tbody>
           <c:forEach items="${slotsEntityList}" var="slotsEntityList">
             <tr>
               <form action="deleteSlot" method="post">  <!-- Form for each row -->
                 <!-- Hidden input to store the enquiry id -->

                 <input type="hidden" name="idForDelete" value="${slotsEntityList.id}" />


                 <td>${slotsEntityList.startTime}</td>
                 <td>${slotsEntityList.endTime}</td>
                 <td>${slotsEntityList.duration}</td>


                 <td>
                   <button type="submit" class="btn btn-success">Delete</button>  <!-- Update button for each row -->
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

         if (searchName !== "" && searchPhoneNo !== "") {
             var xhttp = new XMLHttpRequest();

             // Send both values as query parameters in the URL
             var url = "http://localhost:8080/Charan_gym/search?searchName=" + encodeURIComponent(searchName) + "&searchPhoneNo=" + encodeURIComponent(searchPhoneNo);

             xhttp.open("GET", url, true);
             xhttp.send();

             xhttp.onload = function() {
                 // Update the DOM with the server's response
                 document.getElementById("nameValid").innerHTML = this.responseText;
             };
         } else {

         }
     };

    </script>
</body>

</html>