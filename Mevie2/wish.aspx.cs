using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace Mevie2
{
    public partial class wish : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindWishlist();
            }
        }

        protected void ButtonRemove_Click(object sender, EventArgs e)
        {

        }
        private void BindWishlist()
        {
            int userId = GetUserID();
            if (userId > 0)
            {
                SqlDataSourceWishlist.SelectParameters["MovieID"].DefaultValue = userId.ToString();
                DataListWishlist.DataBind();
            }
        }

        protected void DataListWishlist_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "remove")
            {
                int wishlistId = Convert.ToInt32(e.CommandArgument);
                RemoveFromWishlist(wishlistId);
                BindWishlist();
            }
        }

        private void RemoveFromWishlist(int wishlistId)
        {
            string connectionString = "Data Source=DESKTOP-BH61VB6\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM wishlist2 WHERE WishlistID = @WishlistID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@WishlistID", wishlistId);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // Optionally, you can provide feedback to the user or log a success message
                        // Response.Write("Wishlist item deleted successfully.");
                        // Or use a message label to inform the user
                    }
                    else
                    {
                        // Optionally, provide feedback that the wishlist item was not found
                        // Response.Write("No wishlist item found with the provided WishlistID.");
                        // Or use a message label to inform the user
                    }
                }
            }
        }

        private int GetUserID()
        {
            // Implement your logic to get the currently logged-in user's ID
            // Example: return (int)Session["UserID"];
            return 1; // Placeholder for demonstration
        }
    }
}