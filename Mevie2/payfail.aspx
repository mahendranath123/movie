<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payfail.aspx.cs" Inherits="pay.payfail" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment Failure</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }
        h2 {
            color: #f44336;
        }
        p {
            color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Payment Failed!</h2>
        <p>There was an issue with your payment. Please try again.</p>
    </div>
</body>
</html>
