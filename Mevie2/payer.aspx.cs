using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pay
{
    public partial class payer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Simulate payment processing
            bool paymentSuccess = ProcessPayment(CardNumber.Text, ExpiryDate.Text, CVV.Text);

            if (paymentSuccess)
            {
                Response.Redirect("paysuccess.aspx");
            }
            else
            {
                Response.Redirect("payfail.aspx");
            }
        }

        private bool ProcessPayment(string cardNumber, string expiryDate, string cvv)
        {
            // Dummy payment processing logic for simulation
            // In real application, you would integrate with a payment gateway here

            // For simulation, assume payment is successful if CVV is "123"
            return cvv == "123";
        }
    }
}
