<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sales Prediction</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
            padding: 40px;
            font-family: 'Segoe UI', sans-serif;
        }

        .card {
            max-width: 600px;
            margin: auto;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            border: none;
            border-radius: 12px;
        }

        .card-header {
            background-color: #0d6efd;
            color: white;
            font-size: 1.4rem;
            text-align: center;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .card-body {
            text-align: center;
            padding: 30px;
        }

        .summary {
            font-size: 1.2rem;
            margin: 15px 0;
        }

        .highlight {
            color: #198754;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="card">
    <div class="card-header">📈 Sales Revenue Prediction</div>
    <div class="card-body">
        <p class="summary">
            Advertising Cost (10% Increase): <span class="highlight">£${adCost}</span>
        </p>
        <p class="summary">
            Predicted Revenue: <span class="highlight">£${predictedRevenue}</span>
        </p>
    </div>
</div>

</body>
</html>
