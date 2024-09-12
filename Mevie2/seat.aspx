<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="seat.aspx.cs" Inherits="Mevie2.seat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ticket Booking</title>
    <!--Google Fonts and Icons-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Round|Material+Icons+Sharp|Material+Icons+Two+Tone" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet" />
    <style>
        body {
            width: 100%;
            height: 100vh;
            margin: 0;
            padding: 0;
        }
        .center {
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(to right, rgb(162, 216, 162), rgb(102, 194, 102));
        }
        .tickets {
            width: 550px;
            height: fit-content;
            border: 0.4mm solid rgba(0, 0, 0, 0.08);
            border-radius: 3mm;
            box-sizing: border-box;
            padding: 10px;
            font-family: poppins;
            max-height: 96vh;
            overflow: auto;
            background: white;
            box-shadow: 0px 25px 50px -12px rgba(0, 0, 0, 0.25);
        }
        .ticket-selector {
            background: rgb(243, 243, 243);
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-direction: column;
            box-sizing: border-box;
            padding: 20px;
        }
        .head {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 30px;
        }
        .title {
            font-size: 16px;
            font-weight: 600;
        }
        .seats {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            min-height: 150px;
            position: relative;
        }
        .status {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-evenly;
        }
        .seats::before {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translate(-50%, 0);
            width: 220px;
            height: 7px;
            background: rgb(141, 198, 255);
            border-radius: 0 0 3mm 3mm;
            border-top: 0.3mm solid rgb(180, 180, 180);
        }
        .item {
            font-size: 12px;
            position: relative;
        }
        .item::before {
            content: "";
            position: absolute;
            top: 50%;
            left: -12px;
            transform: translate(0, -50%);
            width: 10px;
            height: 10px;
            background: rgb(255, 255, 255);
            outline: 0.2mm solid rgb(120, 120, 120);
            border-radius: 0.3mm;
        }
        .item:nth-child(2)::before {
            background: rgb(180, 180, 180);
            outline: none;
        }
        .item:nth-child(3)::before {
            background: rgb(28, 185, 120);
            outline: none;
        }
        .all-seats {
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            grid-gap: 15px;
            margin: 60px 0;
            margin-top: 20px;
            position: relative;
        }
        .seat {
            width: 20px;
            height: 20px;
            border-radius: 0.5mm;
            cursor: pointer;
        }
        .seat.booked {
            background: rgb(180, 180, 180);
            outline: none;
        }
        .seat.golden {
            background: gold;
            outline: 0.3mm solid rgb(180, 180, 180);
        }
        .seat.silver {
            background: silver;
            outline: 0.3mm solid rgb(180, 180, 180);
        }
        .seat.platinum {
            background: #e5e4e2;
            outline: 0.3mm solid rgb(180, 180, 180);
        }
        input {
            display: none;
        }
        .timings {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin-top: 30px;
        }
        .dates {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .dates-item {
            width: 50px;
            height: 40px;
            background: rgb(233, 233, 233);
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 10px 0;
            border-radius: 2mm;
            cursor: pointer;
        }
        .day {
            font-size: 12px;
        }
        .times {
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 10px;
        }
        .time {
            font-size: 14px;
            width: fit-content;
            padding: 7px 14px;
            background: rgb(233, 233, 233);
            border-radius: 2mm;
            cursor: pointer;
        }
        .timings input:checked + label {
            background: rgb(28, 185, 120);
            color: white;
        }
        .price {
            width: 100%;
            box-sizing: border-box;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .total {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            justify-content: center;
            font-size: 16px;
            font-weight: 500;
        }
        .total span {
            font-size: 11px;
            font-weight: 400;
        }
        .price button {
            background: rgb(60, 60, 60);
            color: white;
            font-family: poppins;
            font-size: 14px;
            padding: 7px 14px;
            border-radius: 2mm;
            outline: none;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center">
            <div class="tickets">
                <div class="ticket-selector">
                    <div class="head">
                        <div class="title">Seats</div>
                    </div>
                    <div class="seats">
                        <div class="status">
                            <div class="item">Available</div>
                            <div class="item">Booked</div>
                            <div class="item">Selected</div>
                        </div>
                        <div class="all-seats" id="allSeats">
                            <!-- Initial seat (booked example) -->
                            <asp:CheckBox ID="s1" runat="server" CssClass="seat booked" />
                        </div>
                    </div>
                    <div class="timings">
                        <div class="dates">
                            <asp:RadioButton ID="d1" runat="server" GroupName="date" CssClass="dates-item" Checked="True" Text="Sun<br />11" />
                            <asp:RadioButton ID="d2" runat="server" GroupName="date" CssClass="dates-item" Text="Mon<br />12" />
                            <asp:RadioButton ID="d3" runat="server" GroupName="date" CssClass="dates-item" Text="Tue<br />13" />
                            <asp:RadioButton ID="d4" runat="server" GroupName="date" CssClass="dates-item" Text="Wed<br />14" />
                            <asp:RadioButton ID="d5" runat="server" GroupName="date" CssClass="dates-item" Text="Thu<br />15" />
                            <asp:Button ID="Button1" runat="server" Text="Button" />
                            <asp:RadioButton ID="d6" runat="server" GroupName="date" CssClass="dates-item" Text="Fri<br />16" />
                            <asp:RadioButton ID="d7" runat="server" GroupName="date" CssClass="dates-item" Text="Sat<br />17" />
                        </div>
                        <div class="times">
                            <asp:RadioButton ID="t1" runat="server" GroupName="time" CssClass="time" Checked="True" Text="11:00" />
                            <asp:RadioButton ID="t2" runat="server" GroupName="time" CssClass="time" Text="14:30" />
                            <asp:RadioButton ID="t3" runat="server" GroupName="time" CssClass="time" Text="18:00" />
                            <asp:RadioButton ID="t4" runat="server" GroupName="time" CssClass="time" Text="21:30" />
                        </div>
                    </div>
                </div>
                <div class="price">
                    <div class="total">
                        <span><span id="count" runat="server">0</span> Tickets</span>
                        <div class="amount" id="amount" runat="server">0</div>
                    </div>
                    <div>

                    <asp:Button ID="btnBook" runat="server" Text="Book" OnClick="btnBook_Click" CssClass="btn" />
                        
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>
        let seats = document.querySelector(".all-seats");
        for (var i = 0; i < 59; i++) {
            let category = ["golden", "silver", "platinum"][Math.floor(Math.random() * 3)];
            let randint = Math.floor(Math.random() * 2);
            let booked = randint === 1 ? "booked" : "";
            seats.insertAdjacentHTML(
                "beforeend",
                '<input type="checkbox" name="tickets" id="s' + (i + 2) + '" /><label for="s' + (i + 2) + '" class="seat ' + category + ' ' + booked + '"></label>'
            );
        }

        let tickets = seats.querySelectorAll("input");
        tickets.forEach((ticket) => {
            ticket.addEventListener("change", () => {
                let amount = document.querySelector(".amount").innerHTML;
                let count = document.querySelector("#count").innerHTML;
                let label = document.querySelector("label[for='" + ticket.id + "']");
                amount = Number(amount);
                count = Number(count);
                let price = 0;

                if (label.classList.contains("golden")) {
                    price = 500;
                } else if (label.classList.contains("silver")) {
                    price = 400;
                } else if (label.classList.contains("platinum")) {
                    price = 200;
                }

                if (ticket.checked) {
                    count += 1;
                    amount += price;
                } else {
                    count -= 1;
                    amount -= price;
                }
                document.querySelector(".amount").innerHTML = amount;
                document.querySelector("#count").innerHTML = count;
            });
        });
    </script>
</body>
</html>
