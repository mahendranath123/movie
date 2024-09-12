﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Mevie2.index" %>


   <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Movie Tickets</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: Arial, sans-serif;
            box-sizing: border-box;
            background-color: #f0f0f0;
        }
        .nav {
            position: fixed;
            top: 0;
            display: flex;
            justify-content: space-between;
            width: 100%;
            height: 80px;
            line-height: 80px;
            background-color: #000;
            z-index: 100;
            padding: 0 20px;
        }
        .nav-logo img {
            height: 60px;
        }
        .nav-menu ul {
            display: flex;
            margin: 0;
            padding: 0;
            list-style: none;
        }
        .nav-menu ul li {
            margin: 0 15px;
            color: white;
        }
        .nav-menu ul li a {
            text-decoration: none;
            font-weight: 500;
            color: white;
            padding-bottom: 15px;
        }
        .nav-menu ul li a:hover, .nav-menu ul li .active {
            border-bottom: 2px solid white;
        }
        .nav-button {
            display: flex;
            align-items: center;
        }
        .btn {
            width: 100px;
            height: 35px;
            font-weight: 500;
            background: #ff3d2e;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-left: 10px;
        }
        .btn:hover {
            background: #ff1a0a;
        }
        .ad-container {
            margin-top: 100px;
            text-align: center;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .content {
            padding: 20px;
            text-align: center;
        }
        .movie-item {
            display: inline-block;
            margin: 10px;
            background-color: #fff;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        .movie-item img {
            width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .footer {
            background: #333;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            position: relative;
            bottom: 0;
            width: 100%;
        }
        .footer .footer-content {
            display: flex;
            justify-content: space-around;
            padding: 20px;
        }
        .footer .footer-section {
            flex: 1;
            padding: 10px;
        }
        .footer .footer-bottom {
            background: #222;
            color: #aaa;
            padding: 10px 0;
            text-align: center;
        }
        .footer .footer-section h2 {
            margin-bottom: 15px;
        }
        .footer .footer-section ul {
            list-style: none;
            padding: 0;
        }
        .footer .footer-section ul li {
            margin-bottom: 10px;
        }
        .footer .footer-section ul li a {
            color: #bbb;
            text-decoration: none;
        }
        .footer .footer-section ul li a:hover {
            color: #fff;
        }
        @media (max-width: 768px) {
            .nav {
                flex-direction: column;
                height: auto;
                padding: 10px;
            }
            .nav-logo, .nav-button {
                margin-bottom: 10px;
            }
            .nav-menu ul {
                flex-direction: column;
                align-items: center;
            }
            .nav-menu ul li {
                margin: 10px 0;
            }
            .btn {
                width: 80px;
                height: 30px;
                font-size: 14px;
                margin-left: 5px;
            }
            .ad-container, .content {
                padding: 10px;
            }
        }
        .auto-style1 {
            margin-left: 17px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="nav">
            <div class="nav-logo">
                <asp:Image ID="Image1" runat="server" Height="75px" Width="204px" ImageUrl="~/image/ti.jpg" />
            </div>
            <div class="nav-menu">
                <ul>
                     <li><h1>Welcome to Tickets</h1></li>
                   <li><a href="index.aspx" class="link">Home</a></li>
                    <li><a href="movie.aspx" class="link">Movies</a></li>
                    <li><a href="event.aspx" class="link">Live Events</a></li>
                    <li><a href="sportevent.aspx" class="link">Sport Events</a></li>
                    <li><a href="wishlist.aspx" class="link">Wishlist</a></li>
                </ul>
            </div>
            <div class="nav-button">
            </div>
            <div class="nav-menu-btn">
                <i class="bx bx-menu" onclick="myMenuFunction()"></i>
            </div>
        </div>
        <div class="ad-container">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/slider.xml" OnAdCreated="AdRotator1_AdCreated" Height="400px" Width="100%" />
                    <asp:Timer ID="Timer1" runat="server" Interval="2500" OnTick="Timer1_Tick"></asp:Timer>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div class="content">
            <div class="content">
            <h2>Movies</h2>
            <asp:DataList ID="DataList1" runat="server" CssClass="auto-style1" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" RepeatColumns="5" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" Height="409px" Width="285px" ImageUrl='<%# Eval("Img") %>' />
                    <br /><br />
                    <strong>Movie: <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>'></asp:Label></strong>
                    <br /><strong>Genre: <asp:Label ID="Label2" runat="server" Text='<%# Eval("Genre") %>' Font-Bold="True"></asp:Label></strong>
                    <br /><br />
                    <asp:Button ID="Button1" runat="server" Text="View" CommandName="view" CommandArgument='<%# Eval("Title") %>' BackColor="Black" ForeColor="White" />
                    <asp:Button ID="WishlistButton" runat="server" Text="Add to Wishlist" CommandName="wishlist" CommandArgument='<%# Eval("MovieID") %>' BackColor="Black" ForeColor="White" />
        <br />
    
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" SelectCommand="SELECT * FROM [Movies]"></asp:SqlDataSource>
        </div>
            <p>
            </p>
           
                <div class="midd_img">
            <asp:ImageButton ID="ImageButton1" CssClass="middle" runat="server" ImageUrl="~/image/middle_image.jpg" width="1250px"/>
                    <br />
        </div>
             <div class="content">
            <h2>The Best Of Live Event</h2>
            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" OnItemCommand="DataList2_ItemCommand" OnSelectedIndexChanged="DataList2_SelectedIndexChanged">
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" Height="415px" ImageUrl='<%# Eval("image") %>' Width="294px" />
                    <asp:Button ID="Button2" runat="server" CommandName="view" CommandArgument='<%# Eval("eventName") %>' Text="View" BackColor="Black" Font-Bold="True" ForeColor="White" Height="27px" Width="67px" />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString7 %>" SelectCommand="SELECT * FROM [LIVE_EVENT]"></asp:SqlDataSource>
        </div>

            <h2>Top Game And Sport Event</h2>
<div class="content">
            <h2>Sports Events</h2>
            <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" RepeatDirection="Horizontal" OnItemCommand="DataList3_ItemCommand" OnSelectedIndexChanged="DataList3_SelectedIndexChanged">
                <ItemTemplate>
                    <asp:Image ID="Image3" runat="server" Height="409px" ImageUrl='<%# Eval("image") %>' Width="285px" />
                    <br />
                    <strong>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("eventName") %>'></asp:Label>
                    </strong>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                    <br />
                    <asp:Button ID="Button3" runat="server" CommandName="view" CommandArgument='<%# Eval("eventName") %>' CssClass="auto-style1" Text="View" BackColor="Black" ForeColor="White" />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString8 %>" SelectCommand="SELECT * FROM [sport_EVENT]"></asp:SqlDataSource>
        </div>

                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString8 %>" SelectCommand="SELECT * FROM [sport_EVENT]"></asp:SqlDataSource>
            <p>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ASP_netConnectionString %>" SelectCommand="SELECT * FROM [event1] WHERE ([IMDB] = @IMDB)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="IMDB" QueryStringField="ca" Type="Double" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
        </div>
        <footer class="footer">
            <div class="footer-content">
                <div class="footer-section about">
                    <h2>About Us</h2>
                    <p>Welcome to T I C K E T S, your ultimate destination for booking movie tickets effortlessly! Our platform provides an easy and intuitive way to find and book tickets
                        for your favorite movies. From the latest blockbusters to timeless classics, we bring the magic of cinema right to your fingertips.
                        <p>&copy; 2024 Ticket | Designed by Ticket Team</p>
</p>
                </div>
                <div class="footer-section links">
                    <h2>Quick Links</h2>
                    <ul>
                        <li><a href="Home.aspx">Home</a></li>
                        <li><a href="About.aspx">About</a></li>
                        <li><a href="Contact.aspx">Contact</a></li>
                        <li><a href="Privacy.aspx">Privacy Policy</a></li>

                    </ul>
                </div>
                <div class="footer-section contact">
                    <h2>Contact Us</h2>
                    <p>Email: info@ticket.com</p>
                    <p>Phone: +123-456-7890</p>
                    <p>Address: 123 Ticket Street, Ticket City, TS 12345</p>
                </div>
            </div>
            <div class="footer-bottom">
                &copy; 2024 Ticket | Designed by Ticket Team
            </div>
        </footer>
    </form>
</body>
</html>