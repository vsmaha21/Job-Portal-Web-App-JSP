<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<!DOCTYPE html> 
<html lang="en"> 
<head> 
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>My Job Portal</title> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"> 
    <style>
        body {
            background-color: #f4f6f9; 
            color: #4a4a4a; 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar-custom {
            background-color: #343a40; /* Same dark gray for the navbar */
        }

        .navbar-brand, .nav-link {
            color: white !important;
        }

        .navbar-nav .nav-link:hover {
            color: #ffcc00 !important; /* Soft gold color on hover */
        }

        .footer-custom {
            background-color: #343a40; /* Dark gray footer to match the navbar */
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: 50px;
            font-size: 14px;
        }

        .footer-custom a {
            color: #ffc107; /* Soft gold color for links */
            text-decoration: none;
        }

        .footer-custom a:hover {
            color: #ffcc00;
        }

        .card {
            border: none;
            border-radius: 8px; /* Slight rounding of corners */
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* Subtle hover effect */
        }

        .card-body {
            padding: 30px;
            text-align: center;
        }

        .btn-primary {
            background-color: #28a745;
            border: none;
            font-size: 20px;
            padding: 12px 24px;
        }

        .btn-primary:hover {
            background-color: #218838;
        }

        .card-job {
            background-color: #f8f9fa; /* Light gray for card background */
            color: #495057; /* Darker text for readability */
            border: 1px solid #dee2e6; /* Light border */
        }
    </style>
</head> 
<body>

    <nav class="navbar navbar-expand-lg navbar-light navbar-custom">
        <div class="container">
            <a class="navbar-brand fs-1 fw-medium" href="#">My Job Portal Web App</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="home" style="font-size: 14px;">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="viewalljobs" style="font-size: 14px;">All Jobs</a></li>
                    <li class="nav-item"><a class="nav-link" href="mailto:vsmahamuni21@gmail.com" style="font-size: 14px;">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row">
            <!-- Card 1: View All Jobs -->
            <div class="col-md-6 mb-5">
                <div class="card card-job">
                    <div class="card-body">
                        <form action="/myjob/rest/viewalljobs" method="get">
                            <button type="submit" class="btn btn-primary">View All Jobs</button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Card 2: Add Job -->
            <div class="col-md-6 mb-5">
                <div class="card card-job">
                    <div class="card-body">
                        <form action="/myjob/rest/addjob" method="get">
                            <button type="submit" class="btn btn-primary">Add New Job</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer-custom">
        <p style="font-size: 14px; margin: 0;">Find the project on <a href="https://github.com/vsmaha21" target="_blank">GitHub</a></p>
        <p style="font-size: 12px; margin: 0;">&copy; 2025 My Job Portal</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
