<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Landview.aspx.cs" Inherits="Mevie2.Landview" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Details</title>
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
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="1" RepeatDirection="Vertical">
                <ItemTemplate>
                    <div class="movie-item">
                        <asp:Image ID="Image1" runat="server" CssClass="movie-img" ImageUrl='<%# Eval("Img") %>' />
                        <div class="movie-title">
                            Movie: <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </div>
                        <div class="movie-details">
                            Director: <asp:Label ID="Label2" runat="server" Text='<%# Eval("Director") %>'></asp:Label>
                        </div>
                        <div class="movie-details">
                            Genre: <asp:Label ID="Label3" runat="server" Text='<%# Eval("Genre") %>'></asp:Label>
                        </div>
                        <div class="movie-details">
                            Release Date: <asp:Label ID="Label4" runat="server" Text='<%# Eval("ReleaseDate") %>'></asp:Label>
                        </div>
                        <div class="movie-details">
                            Description: <asp:Label ID="Label5" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </div>
                        <asp:Button ID="Button1" runat="server" Text="Please Sign In to book tickets" CssClass="book-button" BackColor="Black" OnClick="Button1_Click" />
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString5 %>" SelectCommand="SELECT * FROM [Movies] WHERE ([Title] = @Title)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Title" QueryStringField="nm" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

