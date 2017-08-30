using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanApp.Components
{
    public class PaginationButton : IComponent
    {
        public bool IsDisabled { get; set; }
        public bool IsActive { get; set; }
        public string Value { get; set; }

        public PaginationButton(string value, bool isDisabled = false, bool isActive = false)
        {
            Value = value;
            IsDisabled = isDisabled;
            IsActive = isActive;
        }

        public string ToHtml()
        {
            if (IsActive)
                return "<li class=\"active\"><a>" + Value + " <span class=\"sr-only\">(current)</span></a></li>";

            if (IsDisabled)
                return "<li class=\"disabled\">" + Value + "</li>";

            return "<li>" + Value + "</li>";
        }
    }
}