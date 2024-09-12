using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mevie2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GenerateSeats();

            }
        }
        protected void GenerateSeats()
        {
            Random rnd = new Random();
            for (int i = 1; i <= 60; i++)
            {
                string seatId = "s" + i;
                bool isBooked = rnd.Next(0, 2) == 1;

                seatContainer.Controls.Add(new LiteralControl(
                    $"<input type='checkbox' name='tickets' id='{seatId}' {(isBooked ? "disabled='disabled'" : "")} runat='server' />" +
                    $"<label for='{seatId}' class='seat {(isBooked ? "booked" : "")}'></label>"
                ));
            }
        }

        protected void BookTickets(object sender, EventArgs e)
        {
            Response.Redirect("RG.aspx");
        }
    }
}