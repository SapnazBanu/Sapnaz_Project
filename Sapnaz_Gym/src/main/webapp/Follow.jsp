<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Follow Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
        body {
            background: url('https://wallpaperaccess.com/full/4615469.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 100vh;
            margin: 0;
            padding-top: 0px;
            margin-top: 0px;
        }
.nav-item {
            margin-right: 40px;
        }
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: transparent;
            padding: 15px 0;
            z-index: 10;
        }
        .navbar .logo img {
            height: 60px;
            animation: bounce 5s ease-out infinite;
            filter: hue-rotate(180deg);
        }
        @keyframes bounce {
            0% { transform: translateY(0); }
            25% { transform: translateY(-10px); }
            50% { transform: translateY(0); }
            75% { transform: translateY(-5px); }
            100% { transform: translateY(0); }
        }
        .nav-link {
            color: #ffffff !important;
            font-weight: bold;
        }
        .nav-link:hover {
            color: blue !important;
        }
        .table-container {
            width: 90%;
            max-width: 1200px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: calc(60px + 1cm);
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        h2 {
            color: #1e3a8a;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }
        .thead-dark th {
            background-color: #1e3a8a;
            color: #ffffff;
            text-align: center;
        }
        td, th {
            text-align: center;
            vertical-align: middle;
        }
        .form-control {
            border-radius: 5px;
        }
        .update-btn {
            background-color: #1e3a8a;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .update-btn:hover {
            background-color: black;
            color: white;
        }
        .view-btn {
            background-color: #1e3a8a;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 5px 10px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            transition: all 0.3s ease;
        }
        .view-btn:hover {
            background-color: black;
            color: white;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a href="#" class="logo">
            <img src="https://www.pngall.com/wp-content/uploads/13/Dragon-Ball-PNG-Image-HD.png" alt="Gym Logo">
        </a>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a href="Success.jsp" class="nav-link">Home</a></li>
            <li class="nav-item"><a href="Enquiry.jsp" class="nav-link">Enquiry</a></li>
            <li class="nav-item"><a href="http://localhost:8080/Sapnaz_Gym/registration" class="nav-link">Registration</a></li>
            <li class="nav-item"><a href="http://localhost:8080/Sapnaz_Gym/update" class="nav-link">Update</a></li>
        </ul>
    </nav>

    <div class="table-container">
        <h2>Enquiry List</h2>
        <table class="table table-bordered table-striped table-hover">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Area</th>
                    <th>Phone</th>
                    <th>Distance</th>
                    <th>Age</th>
                    <th>Status</th>
                    <th>Description</th>
                    <th>Update</th>
                    <th>View Details</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${enquiries}" var="enquiry">
                    <tr>
                        <td>${enquiry.enquiry_id}</td>
                        <td>${enquiry.name}</td>
                        <td>${enquiry.area}</td>
                        <td>${enquiry.ph}</td>
                        <td>${enquiry.distance}</td>
                        <td>${enquiry.age}</td>
                        <td>
                            <form action="updateEnquiry" method="POST">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <input type="hidden" name="enquiryId" value="${enquiry.enquiry_id}"/>
                                <select class="form-control" name="status">
                                    <c:forEach items="${status}" var="sta">
                                        <option value="${sta}" ${sta == enquiry.status ? 'selected' : ''}>${sta}</option>
                                    </c:forEach>
                                </select>
                        </td>
                        <td>
                                <textarea class="form-control" name="description">${enquiry.description}</textarea>
                        </td>
                        <td>
                                <button type="submit" class="update-btn">Update</button>
                            </form>
                        </td>
                        <td>
                            <form action="viewDetails" method="POST">
                                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                                <input type="hidden" name="enquiryId" value="${enquiry.enquiry_id}" />
                                <button type="submit" class="view-btn">View Details</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>