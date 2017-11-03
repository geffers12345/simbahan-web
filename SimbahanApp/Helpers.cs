using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanApp
{
    public static class Helpers
    {
        public static string GenerateURL(string resource)
        {
            return "http://" + HttpContext.Current.Request.Url.Host + resource;
        }
    }
}