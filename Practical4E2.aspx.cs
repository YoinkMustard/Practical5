using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practical4
{
    public partial class Practical4E2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ctl01_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            sdsOrders.SelectParameters["EmployeeID"].DefaultValue =
                ddlName.SelectedValue;

            sdsOrders.SelectParameters["Year"].DefaultValue =
                rblYear.SelectedValue;
        }
    }
}