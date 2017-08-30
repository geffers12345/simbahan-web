using System;
using System.Web;
using System.Web.Services;
using System.Web.UI;

namespace SimbahanApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static void SetInputToSession(string keywords, string location, string category)
        {
            HttpContext.Current.Session.Add("Keywords", keywords);
            HttpContext.Current.Session.Add("Location", location);
            HttpContext.Current.Session.Add("Category", category);
        }
    }
}