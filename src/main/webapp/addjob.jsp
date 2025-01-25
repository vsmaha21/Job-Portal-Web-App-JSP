<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head> 
    <meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>My Job Portal</title> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"> 
    <style>
        body {
            background-color: #f4f6f9; /* Softer off-white background */
            color: #4a4a4a; /* Softer text color */
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar-custom {
            background-color: #343a40; /* Dark gray for the navbar */
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
            text-align: left; /* Align text to the left */
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
            background-color: #f8f9fa; /* Light gray for card background */
            color: #495057; /* Darker text for readability */
            border: 1px solid #dee2e6; /* Light border */
        }

        /* Align form inputs and labels to the left */
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
                    <li class="nav-item"><a class="nav-link" href="viewalljobs" style="font-size: 14px;">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="mailto:vsmahamuni21@gmail.com" style="font-size: 14px;">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card card-job">
                    <div class="card-body">
                        <h2 class="mb-3 fs-3 font-weight-bold">Post a New Job</h2>
                        <form:form action="handleForm" method="post" modelAttribute="jobPost">
                            <div class="mb-3">
							    <label for="postId" class="form-label">Post ID</label>
							    <input type="text" class="form-control" id="postId" name="postId" required>
							    <small class="form-text text-muted" style="font-size: 12px; color: yellow; font-style: italic;">Use existing post id to update job details.</small>
							</div>


                            <div class="mb-3">
                                <label for="postProfile" class="form-label">Post Profile</label>
                                <input type="text" class="form-control" id="postProfile" name="postProfile" required>
                            </div>

                            <div class="mb-3">
                                <label for="postDesc" class="form-label">Post Description</label>
                                <textarea class="form-control" id="postDesc" name="postDesc" rows="2" required></textarea>
                            </div>

                            <div class="mb-3">
                                <label for="reqExperience" class="form-label">Required Experience</label>
                                <input type="number" class="form-control" id="reqExperience" name="reqExperience" required>
                            </div>

                            <div class="mb-3">
                                <label for="postTechStack" class="form-label">Tech Stack</label>
                                <select multiple class="form-select" id="postTechStack" name="postTechStack" required>
                                    <option value="Java">Java</option>
                                    <option value="JavaScript">JavaScript</option>
                                    <option value="C/C++">C/C++</option>
                                    <option value="Swift">Swift</option>
                                    <option value="TypeScript">TypeScript</option>
                                    <option value="Go">Go</option>
                                    <option value="Kotlin">Kotlin</option>
                                    <option value="Rust">Rust</option>
                                    <option value="PHP">PHP</option>
                                    <option value="HTML5">HTML5</option>
                                    <option value="CSS3">CSS3</option>
                                    <option value="GraphQL">GraphQL</option>
                                    <option value="Hibernate">Hibernate</option>
                                    <option value="RestAPI">RestAPI</option>
                                    <option value="Junit">Junit</option>
                                    <option value="SQL">SQL</option>
                                    <option value="Spring FrameWork">Spring FrameWork</option>
                                    <option value="Maven">Maven</option>
                                    <option value="Microservices">Microservices</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

</body>
</html>
