<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Mevie2.Wishlist" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Wishlist</title>
    <style>
        /* Add styles similar to your existing styles */
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: Arial, sans-serif;
            box-sizing: border-box;
            background-color: #f0f0f0;
        }
        .wishlist-container {
            padding: 20px;
            text-align: center;
        }
        .wishlist-item {
            display: inline-block;
            margin: 10px;
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .wishlist-item img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .btn-remove {
            margin-top: 10px;
            width: 100px;
            height: 35px;
            font-weight: 500;
            background: #ff3d2e;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .btn-remove:hover {
            background: #ff1a0a;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wishlist-container">
            <h2>My Wishlist</h2>
            <asp:DataList ID="DataListWishlist" runat="server" RepeatDirection="Horizontal" OnItemCommand="DataListWishlist_ItemCommand" DataSourceID="SqlDataSourceWishlist">
                <ItemTemplate>
                    <div class="wishlist-item">
                        <asp:Image ID="MovieImage" runat="server" ImageUrl='<%# Eval("Img") %>' Width="200px" />
                        <br /><br />
                        <strong>Movie: <asp:Label ID="LabelMovieName" runat="server" Text='<%# Eval("Title") %>'></asp:Label></strong>
                        <br /><br />
                        <asp:Button ID="ButtonRemove" runat="server" Text="Remove" CommandName="remove" CommandArgument='<%# Eval("WishlistID") %>' CssClass="btn-remove" />
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSourceWishlist" runat="server" 
                ConnectionString="<%$ ConnectionStrings:projectConnectionString9 %>" 
                SelectCommand="SELECT * FROM [Wishlist2] WHERE ([UserID] = @UserID)" OnSelecting="SqlDataSourceWishlist_Selecting">
                <SelectParameters>
                    <asp:QueryStringParameter Name="UserID" QueryStringField="nm" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
