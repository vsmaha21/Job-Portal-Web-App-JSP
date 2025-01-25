<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Job Portal - Apply for Job</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        body {
            background-color: #f4f6f9;
            color: #4a4a4a;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar-custom {
            background-color: #343a40; 
        }

        .navbar-brand, .nav-link {
            color: white !important;
        }

        .navbar-nav .nav-link:hover {
            color: #ffcc00 !important;
        }

        .footer-custom {
            background-color: #343a40;
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: 50px;
        }

        .footer-custom a {
            color: #ffc107;
            text-decoration: none;
        }

        .footer-custom a:hover {
            color: #ffcc00;
        }

        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 30px;
            text-align: left;
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

        .form-label {
            font-size: 14px;
            font-weight: bold;
            text-align: left;
        }

        .form-select, .form-control {
            font-size: 14px;
        }

        .card-job {
            background-color: #f8f9fa;
            color: #495057;
            border: 1px solid #dee2e6;
        }

        .form-group {
            text-align: left;
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

    <!-- Job Post Details -->
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
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Application Form -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-job">
                    <div class="card-body">
                        <h2 class="mb-3 fs-3 font-weight-bold">Apply for Job</h2>
                        
                        <form:form action="applyForm" method="post" modelAttribute="jobPost">
                            
                            <form:input type="hidden" path="postId" value="${jobPost.postId}" />

                            <div class="mb-3">
                                <label for="candidate" class="form-label">Email-Id</label>
                                <input type="text" class="form-control" id="candidate" name="candidate" required>
                                <small class="form-text text-muted" style="font-size: 12px; color: yellow; font-style: italic;">Enter your valid email address to apply for this job.</small>
                            </div>
                            <button type="submit" class="btn btn-primary">Apply</button>
                        </form:form>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
