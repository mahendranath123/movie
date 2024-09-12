using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mevie2
{
    public partial class land : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("LG.aspx");
        }

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("RG.aspx");

        }
        protected void AdRotator1_AdCreated(object sender, AdCreatedEventArgs e)
        {

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            // Handle the Timer Tick event here
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                Response.Redirect("Landview.aspx?nm=" + e.CommandArgument.ToString());
            }
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                Response.Redirect("landlive.aspx?nm=" + e.CommandArgument.ToString());
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                Response.Redirect("landsport.aspx?nm=" + e.CommandArgument.ToString());
            }
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }

}