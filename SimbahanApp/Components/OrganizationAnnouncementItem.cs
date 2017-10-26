using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanApp.Components
{
    public class OrganizationAnnouncementItem
    {
        public int ID { get; set; }
        public int OrganizationID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string ImagePath { get; set; }

        public OrganizationAnnouncementItem(int id, int organizationId, string name, string address, string image)
        {
            ID = id;
            OrganizationID = organizationId;
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
                                "<button id=\"btnViewOrgDetail\" data-id=\"" + OrganizationID + "\" class=\"btn btn-primary\">View Church Details</button>" +
                            "</div>" +
                        "</div>" +
                    "</div>" +
                "</div>";
        }
    }
}