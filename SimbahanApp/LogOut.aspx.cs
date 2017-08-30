using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using SimbahanApp.Components;
using SimbahanApp.Models;
using SimbahanApp.Services;

namespace SimbahanApp
{
    public partial class LogOut : System.Web.UI.Page
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();

            Response.Redirect("Login.aspx");

        }

       

    }
}