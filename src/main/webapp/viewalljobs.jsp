<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>My Job Portal</title> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous"> 
    <style>
        .navbar-custom {
            background-color: #343a40; /* Dark gray navbar */
        }

        .navbar-brand, .nav-link {
            color: white !important;
        }

        .navbar-nav .nav-link:hover {
            color: #ffc107 !important; /* Gold color on hover */
        }

        .job-post-card {
            background-color: #6c757d; /* Card background color (grayish) */
            color: white; /* Text color */
            border: none;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .job-post-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .card-body {
            padding: 20px;
        }

        .card-footer {
            background-color: #495057; /* Darker gray for card footer */
            color: white;
            font-size: 12px;
            text-align: center;
        }

        .btn-warning, .btn-danger {
            font-size: 12px;
            padding: 6px 12px;
        }

        .footer-custom {
            background-color: #343a40; /* Dark gray footer */
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: 50px;
        }

        .footer-custom a {
            color: #ffc107; /* Gold color for links */
            text-decoration: none;
        }

        .footer-custom a:hover {
            color: #ffcc00;
        }
    </style>
</head>
<body style="background-color: #f1faee;">

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

<!-- Display the list of job posts -->
<div class="container mt-5">
    <h2 class="mb-4 text-center" style="font-weight: bold; font-size: 24px;">All Available Jobs</h2>
    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
        <c:forEach var="jobPost" items="${jobPosts}">
            <div class="col">
                <div class="card job-post-card">
                    <div class="card-body">
                        <h5 class="card-title" style="font-size: 18px; font-weight: bold;">${jobPost.postProfile}</h5>
                        <p class="card-text" style="font-size: 14px;">
                            <strong>Job-Id: </strong>${jobPost.postId}
                        </p>
                        <p class="card-text" style="font-size: 14px;">
                            <strong>Description:</strong> ${jobPost.postDesc}
                        </p>
                        <p class="card-text" style="font-size: 14px;">
                            <strong>Experience Required:</strong> ${jobPost.reqExperience} years
                        </p>
                        <p class="card-text" style="font-size: 14px;">
                            <strong>Tech Stack Required:</strong>
                            <ul style="list-style-type: none; padding-left: 0;">
                                <c:forEach var="tech" items="${jobPost.postTechStack}">
                                    <li style="font-size: 14px; color: #f1faee;">${tech}</li>
                                </c:forEach>
                            </ul>
                        </p>
                    </div>
                    <div class="card-footer">
                        <a href="addjob" class="btn btn-warning btn-sm">Edit</a>
                        <a href="javascript:void(0);" onclick="clickconform(${jobPost.postId});" class="btn btn-danger btn-sm">Delete</a>
                        <a href="applyjob?postId=${jobPost.postId}" class="btn btn-success btn-sm">Apply</a> 
                        <a href="jobDetails?postId=${jobPost.postId}" class="btn btn-primary btn-sm">View</a> 
                        
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<footer class="footer-custom">
    <p style="font-size: 14px; margin: 0;">Find the project on <a href="https://github.com/vsmaha21" target="_blank">GitHub</a></p>
    <p style="font-size: 12px; margin: 0;">&copy; 2025 My Job Portal</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>

<script>
    function clickconform(postId) {
        // Display confirmation dialog
        if (confirm('Are you sure you want to delete this job post?')) {
  
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/myjob/rest/delete/" + postId, true); 
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var response = JSON.parse(xhr.responseText);
                    if (response.success) {
                        alert("Job post deleted successfully.");
                        location.reload();  // Reload the page after successful delete
                    } else {
                        alert("Failed to delete the job post.");
                    }
                }
            };
            xhr.send();  
        }
    }
</script>

</body>
</html>
