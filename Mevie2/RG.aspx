<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RG.aspx.cs" Inherits="Mevie2.RG" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Page</title>
    <style type="text/css">
        /* Resetting default margin and padding */
        html, body {
            margin: 0;
            padding: 0;
        }

        /* Styling for the whole body */
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

        /* Styling for the form */
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

        /* Styling for the subtitle */
        .subtitle {
            font-weight: 300;
            color: #333333;
            font-size: 20px;
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

        /* Styling for the button */
        .button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        .button:hover {
            background-color: #444444; /* Slightly lighter black for hover effect */
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div>
                <div class="title">T I C K E T S</div>
                <div class="subtitle">REGISTER</div>
                <p>Please fill in the information below:</p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Invalid name" ValidationExpression="^[a-zA-Z\s]{1,50}$">invalid name</asp:RegularExpressionValidator>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="textbox-large" placeholder="First name" CausesValidation="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="Invalid name" ValidationExpression="^[a-zA-Z\s]{1,50}$">regex validator</asp:RegularExpressionValidator>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="textbox-large" placeholder="Last name"></asp:TextBox>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="textbox-large" placeholder="Email"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="TextBox3" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" CssClass="textbox-large" placeholder="Password"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" Text="Register" CssClass="button" OnClick="Button1_Click" />
            </div>
        </form>
    </div>
</body>
</html>
