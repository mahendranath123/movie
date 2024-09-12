using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;


namespace Mevie2
{
    public partial class LG : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-BH61VB6\SQLEXPRESS;Initial Catalog=project;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select email,password from users where email='" + TextBox1.Text + "' and password='" + TextBox2.Text + "' ", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["id"] = TextBox1.Text;
                Response.Redirect("~/index.aspx");
            }
            else
            {
                Response.Write("Invalid user");
            }


        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}