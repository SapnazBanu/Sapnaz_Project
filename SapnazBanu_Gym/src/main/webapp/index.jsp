<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>

        header {
    position: fixed;
    top: 0;

    left: 0;
    width: 100%;
    z-index: 1000; /* Ensure header stays above other content */
    background: #222;
    color: #fff;
    padding: 10px 8px 0 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* Add padding to body to prevent content from being hidden behind the fixed header */
body {
    padding-top: 60px; /* Adjust based on header height */
    font-family: Arial, sans-serif;
    margin: 0;
    background-color: #f4f4f9;
}

        header .container {
            width: 90%;
            max-width: 1200px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        header .logo img {
            margin-left: 28px;
            height: 50px;
        }

        nav {
            flex-grow: 1;
            text-align: center;
        }

        nav ul {
            list-style: none;
            padding: 0;
            margin: 0;
            margin-left:-40%;
            display: inline-flex;
        }

        nav ul li {
            margin-right: 20px;
        }

        nav ul li a {
            color: #fff;
            text-decoration: none;
        }

        .actions {
            display: flex;
            align-items: center;
            text-decoration: none;
        }

        .actions a, .actions button {
            color: #fff;
            background-color: #f39c12;
            border: none;
            padding: 10px 20px;
            margin-left: 10px;
            cursor: pointer;
            border-radius: 40px;
        }

        /* Hamburger Menu */
        .hamburger {
            display: none;
            flex-direction: column;
            cursor: pointer;
            position: relative;
        }

        .hamburger div {
            width: 25px;
            height: 3px;
            background-color: #fff;
            margin: 4px 0;
        }

        /* Mobile Menu */
        .mobile-menu {
            display: none;
            position: absolute;
            top: 70px;
            right: 20px;
            background: #3b3a3a;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }

        .mobile-menu.active {
            display: block;
        }

        .mobile-menu ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .mobile-menu ul li {
            padding: 15px 20px;
            border-bottom: 1px solid #444;
        }

        .mobile-menu ul li a {
            color: #fff;
            text-decoration: none;
            display: block;
        }

        .mobile-menu ul li:last-child {
            border-bottom: none;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            nav ul {
                display: none;
            }

            .actions {
                display: none;
            }

            .hamburger {
                display: flex;
            }

            .mobile-menu {
                display: none;
            }

            .mobile-menu.active {
                display: block;
            }
        }

        .video-section {
            position: relative;
            text-align: left;

            padding: 0px 0;
            background-color: #000;
        }

        .video-section video {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;

        }

        .video-text {
            position: absolute;
            top: 20px;
            left: 20px;
            color: #fff;
            z-index: 2;
            padding-top: 40px;
        }

        .video-text h1 {
            font-size: 36px;
            margin: 0;
        }

        .video-text h2 {
            font-size: 24px;
            margin: 10px 0;
        }

        .video-text p {
            font-size: 18px;
            margin: 10px 0;
        }

        .hero {
            background: url('https://img.freepik.com/premium-photo/fitness-lifestyle-woman-holding-jump-rope-black-background-studio-copy-free-space-webbanner_116547-114618.jpg?w=1060') no-repeat center center;
            background-size: cover;

            padding: 100px 0;
            text-align: center;
            width: 100%;
            height: 120px;
            position: relative;
        }

        .hero::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        .hero-text {
            position: relative;
            z-index: 2;
            margin-left: 30%;
        }

        .hero h1 {
            font-size: 48px;
            margin: 0;
            color: #03b5f0;
            font-family: cursive;
        }

        .hero h2 {
            font-size: 36px;
            margin: 10px 0;
            color: yellowgreen;
        }

        .hero p {
            font-size: 18px;
            margin: 20px 0;
            color: #add6e8;
            font-family: cursive;

        }

        .product-list {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            flex-wrap: nowrap;
        }

        .products {
            padding: 50px 70px;
            padding-top:15%;
            text-align: center;
            background: #C6FFDD;
            background: -webkit-linear-gradient(to left, #f7797d, #FBD786, #C6FFDD);
            background: linear-gradient(to left, #f7797d, #FBD786, #C6FFDD);
            box-shadow: rgba(0, 0, 0, 0.96) 0px 22px 70px 4px;
        }
        /* Hover Effect */
        .product-item:hover {
            transform: scale(1.05);
             background: -webkit-linear-gradient(to left, #3b8d99, #6b6b83, #aa4b6b);
                        background: linear-gradient(to top, #3b8d99, #6b6b83, #aa4b6b);
                        box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;

        }

        .product-item {
            width: 22%;
            text-align: center;
            margin-bottom: 20px;
            background: #aa4b6b;
            background: -webkit-linear-gradient(to left, #3b8d99, #6b6b83, #aa4b6b);
            background: linear-gradient(to left, #3b8d99, #6b6b83, #aa4b6b);
            box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .product-item h3 {
            color: #BDBDBC;
        }

        .product-item p {
            color: #BDBDBC;
            font-family: serif;
            padding: 5px;
        }

        .product-item img {
            width: 80%;
            height: auto;
            object-fit: cover;
            border-radius: 8px;
        }

        footer {
            background: #333;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

        .social-media {
            list-style: none;
            padding: 0;
        }

        .social-media li {
            display: inline;
            margin: 0 10px;
        }

        .top-notch-facilities {
            padding: 50px 0;
            text-align: center;
            background: #0F2027;
            background: -webkit-linear-gradient(to right, #2C5364, #203A43, #0F2027);
            background: linear-gradient(to right, #2C5364, #203A43, #0F2027);
            box-shadow: rgba(0, 0, 0, 0.56) 0px 22px 70px 4px;
        }

        .top-notch-facilities .facility-list {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .top-notch-facilities .facility-item {
            width: 22%;
            text-align: center;
            box-shadow: rgba(0, 0, 0, 0.25) 0px 54px 55px, rgba(0, 0, 0, 0.12) 0px -12px 30px, rgba(0, 0, 0, 0.12) 0px 4px 6px, rgba(0, 0, 0, 0.17) 0px 12px 13px, rgba(0, 0, 0, 0.09) 0px -3px 5px;
        }

        .top-notch-facilities .facility-item img {
            width: 100%;
            height: auto;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: rgba(0, 0, 0, 0.25) 0px 14px 28px, rgba(0, 0, 0, 0.22) 0px 10px 10px;

        }

        .exclusive-banner {
            position: absolute;
            top: -130px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 2;
            text-align: center;
            width: auto;
        }

        .products .container {
            position: relative;
        }

        /* Font Styles for "Top Notch Facilities" and "Exclusive Packages" */

        .exclusive-banner h2{
            font-family: 'Georgia', serif;
            color: #e10000;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }
        .top-notch-facilities h1 {
            font-family: 'Georgia', serif;
            color: #ffcc00;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .exclusive-banner h2 {
            font-size: 40px; /* Larger font size for desktop */
        }

        .top-notch-facilities h1 {
            font-size: 40px; /* Larger font size for desktop */
        }

        /* Hamburger Menu */
        .hamburger {
            display: none;
            flex-direction: column;
            cursor: pointer;
        }

        .hamburger div {
            width: 25px;
            height: 3px;
            background-color: #fff;
            margin: 4px 0;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .hamburger {
                display: flex;
            }

            nav ul {
                display: none;
                flex-direction: column;
                align-items: flex-start;
                background: #222;
                position: absolute;
                top: 80px;
                left: 0;
                width: 100%;
                padding: 10px 0;
            }

            nav ul.active {
                display: flex;
            }

            nav ul li {
                margin-right: 0;
                margin-bottom: 10px;
            }

            .actions {
                flex-direction: column;
                align-items: flex-start;
            }

            .actions a, .actions button {
                margin-left: 0;
                margin-bottom: 10px;
            }

            .video-text h1 {
                font-size: 24px;
            }

            .video-text h2 {
                font-size: 18px;
            }

            .video-text p {
                font-size: 14px;
            }

            .hero-text {
                margin-left: 0;
                text-align: center;
            }

            .hero h1 {
                font-size: 36px;
            }

            .hero h2 {
                font-size: 24px;
            }

            .hero p {
                font-size: 16px;
            }

            .product-list {
                flex-direction: column;
                align-items: center;
            }

            .product-item {
                width: 80%;
            }

            .top-notch-facilities .facility-item {
                width: 80%;
            }

            /* Updated Font Styles for Mobile */

            .top-notch-facilities h1 {
                font-size: 32px;
            }
            .exclusive-banner h2 {

        white-space: nowrap; /* Prevents text from wrapping */
        font-size: 32px; /* Adjust font size for smaller screens */

    }
    .products {
        padding: 80px 20px 30px 20px; /* Further reduced padding for smaller screens */
    }

    .exclusive-banner {
        padding-top: 50px;

        margin-bottom: 5px; /* Further reduced margin for smaller screens */
    }

    /* Top Notch Facilities Images Stacked One Below the Other */
    .top-notch-facilities .facility-list {
        flex-direction: column; /* Stack items vertically */
        align-items: center; /* Center items horizontally */

    }

    .top-notch-facilities .facility-item {

        width: 60%; /* Full width for stacking */
        margin-bottom: 20px; /* Add space between stacked items */
    }

    .top-notch-facilities .facility-item img {
        width: 100%; /* Ensure images are responsive */
         /* Maintain aspect ratio */
    }
        }

        @media (max-width: 480px) {
            .video-text h1 {
                font-size: 20px;
            }

            .video-text h2 {
                font-size: 16px;
            }

            .video-text p {
                font-size: 12px;
            }

            .hero h1 {
                font-size: 24px;
            }

            .hero h2 {
                font-size: 18px;
            }

            .hero p {
                font-size: 14px;
            }

            .product-item {
                width: 70%;
            }

            .top-notch-facilities .facility-item {
                width: 90%;

            }

            /* Updated Font Styles for Smaller Screens */
            .exclusive-banner h2 {
                font-size: 22px;
            }

            .top-notch-facilities h1 {
                font-size: 24px;
            }
            .exclusive-banner h2 {
        font-size: 24px; /* Smaller font size for very small screens */
    }

    /* Top Notch Facilities Images Stacked One Below the Other */
    .top-notch-facilities .facility-item {
        width: 70%;
        margin: 10px 30px;
        box-shadow: rgb(250, 153, 255, 0.56) 0px 22px 70px 4px;
    }

        }
    </style>
</head>
<body>

    <header>
        <div class="container">
            <a href="#" class="logo">
                <img src="https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=277,h=270,fit=crop/AwvJoE0xx0IZMJ8K/ft_power_gym_logo_file_png-01-Yg2apa87NxI6eQXX.png" alt="Cult.Fit Logo">
            </a>
            <nav>
                <ul>
    <li><a href="#products" style="font-weight:bold">PACKAGES</a></li>
                    <li><a href="#top-notch-facilities" style="font-weight:bold">FACILITIES</a></li>
                </ul>
            </nav>
            <div class="actions">
                <a href="AdminLogin.jsp" style="text-decoration: none;">Admin</a>
                <a href="UserLogin" style="text-decoration: none;">User</a>
            </div>
            <div class="hamburger" onclick="toggleMenu()">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
        <!-- Mobile Menu -->
        <div class="mobile-menu" id="mobileMenu">
            <ul>
                      <li><a href="#products">PACKAGES</a></li>
                                        <li><a href="#top-notch-facilities">FACILITIES</a></li>
                <li><a href="AdminLogin.jsp">Admin</a></li>
                <li><a href="UserLogin">User</a></li>
            </ul>
        </div>
    </header>

    <section class="video-section">
        <div class="video-text">
            <h1 style="color:#B1F4C5;">Join Our Community</h1>
            <h2 style="color:#C4EFA8;">Get Fit, Stay Healthy</h2>
            <h3 style="color:#C1EFAC;">Experience the best workouts with our top-notch facilities.</h3>
        </div>
        <video id="gymVideo" autoplay muted loop>
            <source src="https://videos.pexels.com/video-files/5756199/5756199-hd_1920_816_24fps.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
    </section>

    <section class="hero">
        <div class="container">
            <div class="hero-text">
                <h1>SUMMER SALE</h1>
                <h2>60% OFF</h2>
                <p>WORKOUT IN GROUP CLASSES, GYMS & AT-HOME</p>
            </div>
        </div>
    </section>

    <section class="products" id="products">
        <div class="container">
            <div class="exclusive-banner">
                <h2>Exclusive Packages</h2>
            </div>
            <div class="product-list">
                <div class="product-item">
                    <img src="https://img.freepik.com/free-photo/gym-fitness-woman-working-gym-exercises-workout-fit-gym_169016-63231.jpg?t=st=1737456398~exp=1737459998~hmac=8a10aa4f45cc34880d58c1d251f1dfc63b61ea9e75b5fea51fc919f5935dcee9&w=900" alt="Personal Training">
                    <h3>VIP PACK</h3>
                    <p>All ELITE PACK Benefits<br>Unlimited VIP Sessions<br> Access To Special Events</p>
                </div>
                <div class="product-item">
                    <img src="https://img.freepik.com/free-photo/powerful-stylish-bodybuilder-with-tattoo-his-arm-doing-exercises-with-dumbbells-isolated-dark-background_613910-5209.jpg?t=st=1737456019~exp=1737459619~hmac=bfec948134dc4988f7cbae2119272f2614d4ed31dbbfa1974c68bf5eeb0fd00e&w=826" alt="Nutrition Plans">
                    <h3>ELITE PACK</h3>
                    <p>All PRO PACK Benefits<br>Premium Classes<br>Presonal Trainer Sessions</p>
                </div>
                <div class="product-item">
                    <img src="https://img.freepik.com/free-photo/girl-athlete-keeps-disc-from-bar-weighting-agent-doing-crossfit-fitness-concept-sports-equipment-weight-loss_639032-1603.jpg?t=st=1737456918~exp=1737460518~hmac=fad0fbf6c8cc595872eb81e5fdece384f5a4670c7246daeebc26cd95858be338&w=740" alt="Yoga Classes">
                    <h3>PRO PACK</h3>
                    <p>All Basic Benefits<br>Group Fitness Classes<br></p>
                </div>
                <div class="product-item">
                    <img src="https://img.freepik.com/premium-photo/determined-strong-fitness-woman-exercising-with-heavy-weights-fitness-club-sportswoman-holdin_78492-7802.jpg?w=900" alt="Cultpass">
                    <h3>BASIC PACK</h3>
                    <p>Access to Gym Equipmentgy<br> Personal workout Plan<br>Nutrition Guidance</p>
                </div>
            </div>
        </div>
    </section>

    <section class="top-notch-facilities" id="top-notch-facilities">
        <div class="text-center py-8 bg-gradient-to-b from-black to-purple-900">
            <h1>Top Notch Facilities</h1>
        </div>
        <div class="facility-list">
            <div class="facility-item">
                <img src="https://storage.googleapis.com/a1aa/image/2Tl7NNTIQ8YxK1ZxaEJUUtLxNmk0K6PfxdkRcslx9JaWYhDKA.jpg" alt="Gym equipment and facilities">
            </div>
            <div class="facility-item">
                <img src="https://storage.googleapis.com/a1aa/image/vogFFsbtF15iK15fGgNkbBGrk1mZJExU9RZfcXCGnZ5nwCHUA.jpg" alt="People working out in the gym">
            </div>
            <div class="facility-item">
                <img style="height: 100%;" src="https://images.pexels.com/photos/1954524/pexels-photo-1954524.jpeg?auto=compress&cs=tinysrgb&w=600" alt="Group of people in the gym">
            </div>
            <div class="facility-item">
                <img src="https://storage.googleapis.com/a1aa/image/vSxdV45RT4phC5rel4FeuC7ld5RyUe1SuxwGS1wnegBmCLcQB.jpg" alt="Group of people in the gym">
            </div>
        </div>
    </section>

    <script>
        function toggleMenu() {
            const navMenu = document.getElementById('navMenu');
            navMenu.classList.toggle('active');
        }

    function toggleMenu() {
        const mobileMenu = document.getElementById('mobileMenu');
        mobileMenu.classList.toggle('active');
    }

    </script>

</body>
</html>