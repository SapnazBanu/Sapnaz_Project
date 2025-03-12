<%@ page isELIgnored = "false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Submission Details</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8i7c1U4ur7I4pP1M18h72s6Xl3Xlz5jsFz7lF4Vn2ptS4Z1z0o76d2tS8m" crossorigin="anonymous">
    <style>
        body {
            background: url('https://img.freepik.com/premium-photo/room-with-light-ceiling-sign-that-says-gym_662214-535394.jpg?w=1060') no-repeat center center / cover;
            background-attachment: fixed;
            color: #fff;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .container {
            max-width: 700px;
            width: 100%;
            background: rgba(0, 0, 0, 0.7);
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #fff;
        }

        .table {
            background-color: #FFDEE9;
            background-image: linear-gradient(270deg, #FFDEE9 0%, #B5FFFC 100%);

            color: #333;
            margin: 0 auto;
            width: auto;
            border-radius: 10px;
             box-shadow: 0px 2px 10px rgba(200 200, 200, 70);

        }

        .table th, .table td {
            padding: 15px;
        }

        .btn-primary {
            width: 100%;
            font-size: 1.2rem;
            margin-top: 30px;
        }

        .go-back {
            text-align: center;
           margin-top:20px;
        }

        .go-back a {

            color: #fff;
            font-size: 1rem;
            text-decoration: none;
            background-color: #5c6bc0;
            padding: 10px 20px;
            border-radius: 5px;
        }

        .go-back a:hover {
            background-color: #3949ab;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Submitted Details</h2>
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <th>Name</th>
                    <td>${enquiryDTO.name}</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>${enquiryDTO.email}</td>
                </tr>
                <tr>
                    <th>Phone Number</th>
                    <td>${enquiryDTO.phoneNumber}</td>
                </tr>
                <tr>
                    <th>Age</th>
                    <td>${enquiryDTO.age}</td>
                </tr>
                <tr>
                    <th>Gender</th>
                    <td>${enquiryDTO.gender}</td>
                </tr>
                <tr>
                    <th>Address</th>
                    <td>${enquiryDTO.address}</td>
                </tr>
                <tr>
                    <th>Status</th>
                    <td>Enquiry</td>
                </tr>
                <tr>
                    <th>Area</th>
                    <td>${enquiryDTO.areaName}</td>
                </tr>
            </tbody>
        </table>
        <div class="go-back">
            <a href="enquiry" class="btn btn-primary">Go Back</a>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0v8Fq3u3g7zVt10xFLOAy5JlApU7gsA2A2AKxjc16I37V7t3" crossorigin="anonymous"></script>
</body>
</html>