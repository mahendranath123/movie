<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LG.aspx.cs" Inherits="Mevie2.LG" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body {
            font-family: Helvetica, Arial, sans-serif;
            background-color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Ensure the body covers the entire viewport */
            flex-direction: column; /* Align content in a column */
        }

        /* Styling for the container */
        .container {
            max-width: 400px; /* Adjust as needed */
            width: 100%;
            text-align: center; /* Center content within the container */
        }

        /* Styling for the login form */
        form {
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }
         /* Styling for the title */
        .title {
            font-weight: bold;
            color: #333333;
            font-size: 28px;
            margin-bottom: 20px;
        }
        /* Styling for the login title */
        .login-title {
            font-weight: bold;
          
            font-weight: 300;
            color: #333333;
             font-size: 28px;
            margin-bottom: 20px;
        }

        /* Styling for the textboxes */
        .textbox-large {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 20px;
            box-sizing: border-box; /* Include padding and border in the width */
        }

        /* Styling for the login button */
        .login-button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .login-button:hover {
            background-color: #444444; /* Slightly lighter black for hover effect */
        }

        /* Styling for the footer */
        .footer {
            background-color: #333333;
            color: #ffffff;
            padding: 20px;
            text-align: center;
            width: 100%;
            position: absolute;
            bottom: 0;
        }
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
<div class="container">
        <form id="form1" runat="server">
            <div class="title">T I C K E T S</div><br />
            <div>
                <span class="login-title">L O G I N</span>
                <p>Please enter your e-mail and password:</p>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox-large" placeholder="Username" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="textbox-large" placeholder="Password"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Login" CssClass="login-button" OnClick="Button1_Click" />
            </div>
        </form>
    </div>

    <div class="footer">
        <p>&copy; 2024 T I C K E T S. All rights reserved.</p>
    </div>

</body>
</html>
