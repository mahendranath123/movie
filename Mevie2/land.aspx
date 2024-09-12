<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="land.aspx.cs" Inherits="Mevie2.land" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: Arial, sans-serif;
            box-sizing: border-box;
        }
        .nav {
            position: fixed;
            top: 0;
            display: flex;
            justify-content: space-between;
            width: 100%;
            height: 100px;
            line-height: 100px;
            background-color: black; /* Changed to black */
            z-index: 100;
            padding: 0 20px;
        }
        .nav-logo p {
            color: white;
            font-size: 25px;
            font-weight: 600;
            margin: 0;
        }
        .nav-menu ul {
            display: flex;
            margin: 0;
            padding: 0;
            list-style: none;
        }
        .nav-menu ul li {
            margin: 0 15px;
            color:white
        }
        .nav-menu ul li .link {
            text-decoration: none;
            font-weight: 500;
            color: white; /* Changed to white */
            padding-bottom: 15px;
        }
        .link:hover, .active {
            border-bottom: 2px solid white; /* Changed to white */
        }
        .nav-button {
            display: flex;
            align-items: center;
        }
        .btn {
            width: 130px;
            height: 40px;
            font-weight: 500;
            background: rgba(255, 255, 255, 0.4);
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: .3s ease;
            margin-left: 15px;
        }
        .btn:hover {
            background: rgba(255, 255, 255, 0.3);
        }
        .btn.white-btn {
            background: rgba(255, 255, 255, 0.7);
        }
        .btn.white-btn:hover {
            background: rgba(255, 255, 255, 0.5);
        }
        .nav-menu-btn {
            display: none;
        }
        .ad-container {
            margin-top: 120px; /* Adjust this value to fit your design */
            text-align: center;
        }
        .content {
            padding: 20px;
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
                width: 100px;
                height: 35px;
                font-size: 14px;
                margin-left: 5px;
            }
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
        .auto-style1 {
            margin-right: 9px;
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
                    <%--<li><a href="index.aspx" class="link">Home</a></li>
                    <li><a href="about.aspx" class="link">About</a></li>
                    <li><a href="contact.aspx" class="link">Contact</a></li>--%>
                </ul>
            </div>
            <div class="nav-button">
                <asp:Button ID="loginBtn" runat="server" Text="Sign In" CssClass="btn Blue-btn" OnClick="login_Click" BackColor="Black" Font-Bold="True" ForeColor="White" />
                <asp:Button ID="registerBtn" runat="server" Text="Sign Up" CssClass="btn" OnClick="register_Click" BackColor="Black" Font-Bold="True" ForeColor="White" />
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
            <h2>Coming Soon</h2>
            <asp:DataList ID="DataList1" runat="server" CssClass="auto-style1" DataSourceID="SqlDataSource1" RepeatDirection="Horizontal" RepeatColumns="5" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" Height="409px" Width="285px" ImageUrl='<%# Eval("Img") %>' />
                    <br /><br />
                    <strong>Movie: <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>'></asp:Label></strong>
                    <br /><strong>Genre: <asp:Label ID="Label2" runat="server" Text='<%# Eval("Genre") %>'></asp:Label></strong>
                    <br /><br />
                    <asp:Button ID="Button1" runat="server" Text="view" CommandName="view" CommandArgument='<%# Eval("Title") %>' BackColor="Black" Font-Bold="True" ForeColor="White" Height="32px" Width="113px" OnClick="Button1_Click" />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString5 %>" SelectCommand="SELECT * FROM [Movies]"></asp:SqlDataSource>
        </div>
            <p>
            </p>
           
                <div class="midd_img">
            <asp:ImageButton ID="ImageButton1" CssClass="middle" runat="server" ImageUrl="~/image/middle_image.jpg" width="1250px"/>
                    <br />
        </div>

           

             <div class="content">
            <h2>The Best Of Live Event</h2>
            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatDirection="Horizontal" OnItemCommand="DataList2_ItemCommand">
                <ItemTemplate>
                    <asp:Image ID="Image2" runat="server" Height="415px" ImageUrl='<%# Eval("image") %>' Width="294px" />
                    <asp:Button ID="Button2" runat="server" CommandName="view" CommandArgument='<%# Eval("eventName") %>' Text="View" BackColor="Black" Font-Bold="True" ForeColor="White" Height="27px" Width="67px" OnClick="Button2_Click" />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString7 %>" SelectCommand="SELECT * FROM [LIVE_EVENT]"></asp:SqlDataSource>
        </div>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString6 %>" SelectCommand="SELECT * FROM [LIVE_EVENT]" OnSelecting="SqlDataSource2_Selecting"></asp:SqlDataSource>
            <br />

            <div class="content">
            <h2>Sports Events</h2>
            <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource3" RepeatDirection="Horizontal" OnItemCommand="DataList3_ItemCommand">
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

                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString4 %>" SelectCommand="SELECT * FROM [sport_EVENT]"></asp:SqlDataSource>
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
                    <p>Welcome to MovieBooker, your ultimate destination for booking movie tickets effortlessly! Our platform provides an easy and intuitive way to find and book tickets
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

