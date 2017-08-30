using SimbahanApp.Models;
using SimbahanApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SimbahanApp
{
    public partial class VisitaIglesiaProgress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            VisitaIglesiaService service = new VisitaIglesiaService();

            if (! service.HasExistingData(Auth.user().Id))
            {
                Response.Redirect("VisitaIglesia.aspx");
            }

            if (Request.QueryString["id"] != null)
            {
                string id = Request.Params["id"];

                List<Models.VisitaIglesia> churches = service.Get(Convert.ToInt32(id));

                string script = "var churchUserData = [";

                foreach (Models.VisitaIglesia item in churches)
                {
                    script += item.ToJson() + ",";
                }

                if (churches.Count > 0)
                {
                    char[] separator = { ',' };
                    script.TrimEnd(separator);
                }

                script += "];";

                ClientScript.RegisterClientScriptBlock(this.GetType(), "ChurchItems", script, true);
            }
        }

        [WebMethod]
        public static List<Models.VisitaIglesia> GetChurches()
        {
            VisitaIglesiaService service = new VisitaIglesiaService();

            return service.Get(Auth.user().Id);
        }

        [WebMethod]
        public static bool UpdateStatus(int churchId, int statusId)
        {
            VisitaIglesiaService service = new VisitaIglesiaService();

            if (statusId == 3)
            {
                service.ResetCurrentlyHere(Auth.user().Id);
            }

            var visitaIglesia = new Models.VisitaIglesia
            {
                SimbahanId = churchId,
                UserId = Auth.user().Id,
                StatusId = statusId
            };

            service.Update(churchId, visitaIglesia);

            return true;
        }
    }
}