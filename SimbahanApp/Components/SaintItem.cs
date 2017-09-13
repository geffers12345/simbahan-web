using SimbahanApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanApp.Components
{
    public class SaintItem : IComponent
    {
        private Saint Saint;

        public SaintItem(Saint saint)
        {
            Saint = saint;
        }

        public string ToHtml()
        {
            return "<div class=\"panel panel-primary\">" +
                    "<div class=\"panel-body\">" +
                        "<div class=\"row\">" +
                            "<div class=\"col-md-3\">" +
                                "<img src=\"" + Saint.ImagePath + "\" class=\"img-responsive\" />" +
                            "</div>" +
                            "<div class=\"col-md-9\">" +
                                "<h4>" + Saint.Name + "</h4>" +
                                "<h5 class=\"text-muted\">" + Saint.Patron + "</h5>" +
                                "<button id=\"btnViewSaintDetail\" data-id=\"" + Saint.Id + "\" class=\"btn btn-primary\">View Saint Details</button>" +
                            "</div>" +
                        "</div>" +
                    "</div>" +
                "</div>";
        }
    }
}