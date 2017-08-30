using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanApp.Components
{
    public class OrganizationItem : IComponent
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string ImagePath { get; set; }

        public OrganizationItem(int id, string name, string address, string image)
        {
            ID = id;
            Name = name;
            Address = address;
            ImagePath = image;
        }

        public string ToHtml()
        {
            return
                "<div class=\"panel panel-primary\">" +
                "<div class=\"panel-body\">" +
                "<div class=\"row\">" +
                "<div class=\"col-md-3\">" +
                "<img src=\"" + ImagePath + "\" class=\"img-responsive\" />" +
                "</div>" +
                "<div class=\"col-md-9\">" +
                "<h4>" + Name + "</h4>" +
                "<h5 class=\"text-muted\">" + Address + "</h5>" +
                "<button id=\"btnViewOrganizationDetail\" data-id=\"" + ID + "\" class=\"btn btn-primary\">View Organization Details</button>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>";
        }
    }
}