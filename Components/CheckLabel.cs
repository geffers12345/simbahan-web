using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanApp.Components
{
    public class CheckLabel : IComponent
    {
        public string Label { get; set; }

        public CheckLabel(string label)
        {
            Label = label;
        }

        public string ToHtml()
        {

            return
                "<span itemprop=\"additionalProperty\">" +
                    Label +
                "</span>";
        }
    }
}