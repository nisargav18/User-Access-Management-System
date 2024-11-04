<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Software</title>
</head>
<body>
    <div class="form-container">
        <h2>Create New Software Application</h2>
        <form action="SoftwareServlet" method="post">
            <label for="name">Software Name:</label>
            <input type="text" name="name" id="name" required><br>

            <label for="description">Description:</label>
            <textarea name="description" id="description" rows="4" cols="50" required></textarea><br>

            <label for="accessLevels">Access Levels:</label><br>
            <div class="checkbox-group">
                <input type="checkbox" name="accessLevels" value="Read"> Read<br>
                <input type="checkbox" name="accessLevels" value="Write"> Write<br>
                <input type="checkbox" name="accessLevels" value="Admin"> Admin<br>
            </div>

            <button type="submit">Create Software</button>
        </form>

        <p><a href="login.jsp">Back to Login</a></p>
    </div>
</body>
<style>
    /* Page background */
    body {
        background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
        font-family: 'Roboto', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    /* Form container styling */
    .form-container {
        background-color: white;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        text-align: center;
        max-width: 450px;
        width: 100%;
    }

    h2 {
        font-size: 24px;
        color: #333;
        margin-bottom: 20px;
    }

    label {
        font-size: 16px;
        color: #555;
        margin-bottom: 8px;
        display: block;
        text-align: left;
    }

    /* Input and Textarea styling */
    input[type="text"],
    textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 16px;
        outline: none;
        transition: border-color 0.3s ease;
    }

    input[type="text"]:focus,
    textarea:focus {
        border-color: #74ebd5;
    }

    /* Checkbox group styling */
    .checkbox-group {
        text-align: left;
        margin-bottom: 20px;
    }

    /* Button styling */
    button {
        background-color: #4CAF50;
        color: white;
        padding: 12px 30px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }

    button:hover {
        background-color: #45a049;
        transform: translateY(-2px);
    }

    p {
        margin-top: 20px;
        font-size: 14px;
    }

    a {
        color: #74ebd5;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }
</style>
</html>
