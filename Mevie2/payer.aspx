<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payer.aspx.cs" Inherits="pay.payer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment</title>
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
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin: 15px 0 5px;
            color: #555;
        }
        input[type="text"], input[type="password"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .error {
            color: red;
            font-size: 12px;
        }
        .btn {
            display: block;
            width: 100%;
            padding: 15px;
            border: none;
            background-color: #000000;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn:hover {
            background-color: #e64a19;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Payment Form</h2>
            <label for="CardNumber">Card Number:</label>
            <asp:TextBox ID="CardNumber" runat="server" CssClass="input" />
            <asp:RegularExpressionValidator ID="CardNumberValidator" runat="server"
                ControlToValidate="CardNumber"
                ErrorMessage="Invalid card number"
                ValidationExpression="^\d{16}$"
                CssClass="error" /><br /><br />

            <label for="ExpiryDate">Expiry Date (MM/YY):</label>
            <asp:TextBox ID="ExpiryDate" runat="server" CssClass="input" />
            <asp:RegularExpressionValidator ID="ExpiryDateValidator" runat="server"
                ControlToValidate="ExpiryDate"
                ErrorMessage="Invalid expiry date"
                ValidationExpression="^(0[1-9]|1[0-2])\/\d{2}$"
                CssClass="error" /><br /><br />

            <label for="CVV">CVV:</label>
            <asp:TextBox ID="CVV" runat="server" CssClass="input" />
            <asp:RegularExpressionValidator ID="CVVValidator" runat="server"
                ControlToValidate="CVV"
                ErrorMessage="Invalid CVV"
                ValidationExpression="^\d{3}$"
                CssClass="error" /><br /><br />

            <asp:Button ID="SubmitButton" runat="server" Text="Pay" CssClass="btn" OnClick="SubmitButton_Click" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" />
        </div>
    </form>
</body>
</html>
