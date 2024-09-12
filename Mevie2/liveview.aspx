<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="liveview.aspx.cs" Inherits="Mevie2.liveview" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Live Event Details</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 900px;
            max-width: 100%;
        }
        .movie-item {
            border-bottom: 1px solid #e0e0e0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .movie-item:last-child {
            border-bottom: none;
        }
        .movie-img {
            width: 300px;
            height: 450px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        .movie-title {
            font-size: 24px;
            font-weight: bold;
            margin: 10px 0;
        }
        .movie-details {
            font-size: 16px;
            margin-bottom: 5px;
        }
        .book-button {
            background-color: #ff6f61;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .book-button:hover {
            background-color: #ff3d2e;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="1" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <ItemTemplate>
                    <div class="movie-item">
                        <asp:Image ID="Image1" runat="server" CssClass="movie-img" ImageUrl='<%# Eval("image") %>' />
                        <div class="movie-title">
                            Event: <asp:Label ID="Label1" runat="server" Text='<%# Eval("eventName") %>'></asp:Label>
                        </div>
                        <div class="movie-details">
                            Date: <asp:Label ID="Label2" runat="server" Text='<%# Eval("ReleaseDate") %>'></asp:Label>
                        </div>
                        <div class="movie-details">
                            Description: <asp:Label ID="Label3" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Book tickets" CssClass="book-button" OnClick="Button1_Click" BackColor="Black" />
                    </div>
                </ItemTemplate>
            </asp:DataList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString13 %>" SelectCommand="SELECT * FROM [LIVE_EVENT] WHERE ([eventName] = @eventName)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="eventName" QueryStringField="nm" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
