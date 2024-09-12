using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mevie2
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the page is loaded for the first time
            if (!IsPostBack)
            {
                // Optionally handle any initialization logic here
            }
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("LG.aspx");
        }

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("RG.aspx");
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "wishlist")
            {
                int movieId = Convert.ToInt32(e.CommandArgument);
                AddToWishlist(movieId);
            }
            else if (e.CommandName == "view")
            {
                Response.Redirect("view.aspx?nm=" + e.CommandArgument.ToString());
            }
        }
        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                Response.Redirect("view.aspx?nm=" + e.CommandArgument.ToString());
            }
        }
        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                Response.Redirect("view.aspx?nm=" + e.CommandArgument.ToString());
            }
        }
        private void AddToWishlist(int movieId)
        {
            int userId = GetUserID(); // Method to get the current logged-in user's ID

            if (userId > 0 && movieId > 0)
            {
                string connectionString = "Data Source=DESKTOP-BH61VB6\\SQLEXPRESS;Initial Catalog=project;Integrated Security=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();

                    // Fetch movie details from Movies table
                    string fetchQuery = "SELECT Img, Title FROM Movies WHERE MovieID = @MovieID";
                    using (SqlCommand fetchCmd = new SqlCommand(fetchQuery, con))
                    {
                        fetchCmd.Parameters.AddWithValue("@MovieID", movieId);
                        SqlDataReader reader = fetchCmd.ExecuteReader();

                        if (reader.Read())
                        {
                            string img = reader["Img"].ToString();
                            string title = reader["Title"].ToString();
                            reader.Close();

                            // Insert into wishlist2 with current date/time
                            string insertQuery = "INSERT INTO wishlist2 (UserID, MovieID, Img, Title) " +
                                                 "VALUES (@UserID, @MovieID, @Img, @Title); SELECT SCOPE_IDENTITY()";
                            using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                            {
                                insertCmd.Parameters.AddWithValue("@UserID", userId);
                                insertCmd.Parameters.AddWithValue("@MovieID", movieId);
                                insertCmd.Parameters.AddWithValue("@Img", img);
                                insertCmd.Parameters.AddWithValue("@Title", title);

                                // Execute the insert command and get the generated WishlistID
                                int wishlistId = Convert.ToInt32(insertCmd.ExecuteScalar());

                                // Provide feedback to the user
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Movie added to your wishlist!');", true);
                            }
                        }
                        else
                        {
                            // Handle case where movie details are not found
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Movie details not found!');", true);
                        }
                    }
                }
            }
            else
            {
                // Handle case where user or movie ID is invalid
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Unable to add movie to wishlist!');", true);
            }
        }


        private int GetUserID()
        {
            // Placeholder method; implement your logic to get the currently logged-in user's ID
            return 1; // Example: return (int)Session["UserID"];
        }

        protected void AdRotator1_AdCreated(object sender, AdCreatedEventArgs e)
        {

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DataList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}