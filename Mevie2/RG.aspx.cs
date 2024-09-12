using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Mevie2
{
    public partial class RG : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-BH61VB6\SQLEXPRESS;Initial Catalog=project;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("insert into users values(@a,@b,@c,@d)", con);
            con.Open();
            cmd.Parameters.AddWithValue("a", TextBox1.Text);
            cmd.Parameters.AddWithValue("b", TextBox2.Text);
            cmd.Parameters.AddWithValue("c", TextBox3.Text);
            cmd.Parameters.AddWithValue("d", TextBox4.Text);

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("LG.aspx");


        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

