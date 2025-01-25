<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>Job Post Details</title> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <style>
        body {
            background-color: #f4f6f9; 
            color: #4a4a4a; 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        
        .navbar-custom {
            background-color: #343a40; /* Dark gray navbar */
        }

        .navbar-brand, .nav-link {
            color: white !important; /* White text for navbar */
        }

        .navbar-nav .nav-link:hover {
             color: #ffc107 !important; /* Gold color on hover */
        }

    
        .footer-custom {
            background-color: #343a40; /* Dark gray footer */
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
            border: 2px solid #343a40; /* Dark border color */
            background-color: #f8f9fa; /* Light background color */
            margin-bottom: 20px;
        }

        .card-body {
            padding: 30px;
            text-align: left;
        }

        .card-footer {
            background-color: #343a40;
            color: white;
            text-align: center;
        }

        h2 {
            font-weight: bold;
            font-size: 24px;
            color: #343a40; /* Dark text for headings */
        }

        .card-title {
            font-size: 20px;
            font-weight: bold;
            color: #343a40; /* Dark text for card title */
        }

        .card-text {
            font-size: 16px;
            color: #495057; /* Dark gray text for card details */
        }

        ul {
            list-style-type: none;
            padding-left: 0;
        }

        ul li {
            font-size: 14px;
            color: #495057; /* Dark gray text for list items */
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
                    <li class="nav-item"><a class="nav-link" href="home">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="viewalljobs">All Jobs</a></li>
                    <li class="nav-item"><a class="nav-link" href="mailto:vsmahamuni21@gmail.com">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    
    <div class="container mt-5">
        <h2 class="mb-4 text-center">${jobPostMessage}</h2>

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">${jobPost.postProfile}</h5>
                        <p class="card-text">
                            <strong>Job-Id:</strong> ${jobPost.postId}
                        </p>
                        <p class="card-text">
                            <strong>Description:</strong> ${jobPost.postDesc}
                        </p>
                        <p class="card-text">
                            <strong>Experience Required:</strong> ${jobPost.reqExperience} years
                        </p>
                        <p class="card-text">
                            <strong>Tech Stack Required:</strong>
                            <ul>
                                <c:forEach var="tech" items="${jobPost.postTechStack}">
                                    <li>${tech}</li>
                                </c:forEach>
                            </ul>
                        </p>	    
					    
					    <p class="card-text">
					    	<c:if test="${not empty candidates}">
                            <strong>${candidates}</strong>
                            <ul>
                                <c:forEach var="tech" items="${jobPost.candidates}">
                                    <li>${tech}</li>
                                </c:forEach>
                            </ul>
                            </c:if>
                        </p>
                        
                        
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
