<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background: url('https://static.vecteezy.com/system/resources/previews/032/160/239/non_2x/ai-generative-interior-of-a-modern-gym-with-fitness-equipment-3d-rendering-photo.jpeg') no-repeat center center fixed;
            background-size: cover;
            background-position: center 40%;
            font-family: 'Arial', sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
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
            animation: bounce 2s ease-out infinite;
            filter: hue-rotate(180deg);
        }
        @keyframes bounce {
            0% { transform: translateY(0); }
            25% { transform: translateY(-10px); }
            50% { transform: translateY(0); }
            75% { transform: translateY(-5px); }
            100% { transform: translateY(0); }
        }
        .navbar ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: flex-end;
        }
        .navbar ul li {
            margin-right: 40px;
        }
        .navbar ul li a {
            color: white;
            font-size: 18px;
            font-weight: 600;
            text-decoration: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }
        .navbar ul li a:hover {
            background-color: black;
            color: white;
        }
        .navbar ul li.active a {
            background-color: #007bff;
            color: white;
        }
        .content {
            text-align: center;
            padding: 100px 20px;
            max-width: 800px;
            margin: auto;
            background: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
        }
        .content h1 {
            font-size: 3.5rem;
            font-weight: 700;
            color: #007bff;
            margin-bottom: 20px;
        }
        .content p {
            font-size: 1.2rem;
            margin-bottom: 30px;
            color: #333;
        }
        .content button {
            padding: 12px 30px;
            font-size: 18px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .content button:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        .bottom-navbar {
            position: fixed;
            bottom: 0px;
            width: 100%;
            background-color: rgba(280, 280, 280, 0.85);
            padding: 25px 0;
            text-align: center;
            color: #28a745;
            font-size: 0.8rem;
            font-weight: bold;
        }
        .bottom-navbar h4 {
            color: #8D5A38;
        }
        .bottom-navbar p {
            color: #333;
        }
        .bottom-navbar h6 {
            color: black;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="#" class="logo"><img src="https://www.pngall.com/wp-content/uploads/13/Dragon-Ball-PNG-Image-HD.png" alt="Gym Logo"></a>
        <ul>
            <li><a href="Enquiry.jsp">Enquiry</a></li>
            <li><a href="http://localhost:8080/Sapnaz_Gym/follow">Follow</a></li>
            <li><a href="http://localhost:8080/Sapnaz_Gym/registration">Registration</a></li>
            <li><a href="http://localhost:8080/Sapnaz_Gym/update">Update</a></li>
        </ul>
    </nav>

    <div class="bottom-navbar">
        <h4>Visit Us</h4>
        <p> Iron Pulse Rajajinagar , FlexFit BTM , Titan Strength Indiranagar , Forge Fitness HSR Layout , Peak Fitness JP Nagar</p>
        <h6>8660286768 | 7899861534</h6>
    </div>

</body>
</html>