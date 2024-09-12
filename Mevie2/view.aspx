<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view.aspx.cs" Inherits="Mevie2.view" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Event Details</title>
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
        .event-item {
            border-bottom: 1px solid #e0e0e0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .event-item:last-child {
            border-bottom: none;
        }
        .event-img {
            width: 300px;
            height: 450px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 15px;
        }
        .event-title {
            font-size: 24px;
            font-weight: bold;
            margin: 10px 0;
        }
        .event-details {
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
                    <div class="event-item">
                        <asp:Image ID="Image2" runat="server" CssClass="event-img" ImageUrl='<%# Eval("Img") %>' />
                        <div class="event-title">
                            Event: <asp:Label ID="Label6" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </div>
                        <div class="event-details">
                            Category: <asp:Label ID="Label7" runat="server" Text='<%# Eval("Genre") %>'></asp:Label>
                        </div>
                        <div class="event-details">
                            Date: <asp:Label ID="Label8" runat="server" Text='<%# Eval("ReleaseDate") %>'></asp:Label>
                        </div>
                        <div class="event-details">
                            Description: <asp:Label ID="Label9" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                        </div>
                        <asp:Button ID="Button2" runat="server" Text="Book tickets" CssClass="book-button" OnClick="Button2_Click" BackColor="Black" />
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" SelectCommand="SELECT * FROM [Movies] WHERE ([Title] = @Title2)">
            <SelectParameters>
                <asp:QueryStringParameter Name="Title2" QueryStringField="nm" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                :<asp:Image ID="Image2" runat="server" Height="271px" ImageUrl='<%# Eval("image") %>' Width="220px" />
                &nbsp;<asp:Label ID="eventNameLabel" runat="server" Text='<%# Eval("eventName") %>' />
                <br />
                ReleaseDate:
                <asp:Label ID="ReleaseDateLabel" runat="server" Text='<%# Eval("ReleaseDate") %>' />
<br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                <br />
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" CommandName="View" Height="26px" Text="View" Width="168px" OnClick="Button2_Click1" />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString12 %>" SelectCommand="SELECT * FROM [LIVE_EVENT] WHERE ([eventName] = @eventName)">
            <SelectParameters>
                <asp:QueryStringParameter Name="eventName" QueryStringField="nm" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3">
            <ItemTemplate>
                <asp:Image ID="Image3" runat="server" Width="249px" Height="203px" ImageUrl='<%# Eval("image") %>' />
                <asp:Button ID="Button3" runat="server" CommandName="View" Text="View" />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString8 %>" SelectCommand="SELECT * FROM [sport_EVENT] WHERE ([eventName] = @eventName)">
            <SelectParameters>
                <asp:QueryStringParameter Name="eventName" QueryStringField="tm" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
