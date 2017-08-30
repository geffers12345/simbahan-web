using System;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using SimbahanApp.Models;
using SimbahanApp.Services;

namespace SimbahanApp
{
    public partial class Saintslisting : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var SaintService = new SaintService();

            var patron = SaintService.GetPatron();

            foreach (string Patron in patron)
            {
               if (string.IsNullOrWhiteSpace(Patron))
                {
                    continue;
                }
                var patr = Patron.Replace(' ', '-').ToLower();

                var list = new HtmlGenericControl("li");
                list.InnerHtml = @"<button class=""button"" data-filter=""" + patr + @""">" + Patron + "</button>";


                ButtonContainer.Controls.Add(list);
            }
        }

        [WebMethod]
        public static List<Saint> GetSaints()
        {
            var saintList = new SaintService();

            return saintList.Get();
        }
    }
}