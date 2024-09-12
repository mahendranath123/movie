using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mevie2
{
    public partial class sportevent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DataList3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource5_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "view")
            {
                Response.Redirect("sportview.aspx?nm=" + e.CommandArgument.ToString());
            }
        }
    }
}