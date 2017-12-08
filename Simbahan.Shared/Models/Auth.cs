﻿using System.Web;
using System.Web.Security;

namespace Simbahan.Models
{
    public class Auth
    {
        public static User user()
        {
            try
            {
                var authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];

                if (authCookie == null)
                    return new User();

                var ticket = FormsAuthentication.Decrypt(authCookie.Value);

                return User.Parse(ticket.UserData);
            }
            catch (System.Exception)
            {
                FormsAuthentication.SignOut();
            }
        }

        public static bool Check()
        {
            var authCookie = HttpContext.Current.Request.Cookies[FormsAuthentication.FormsCookieName];

            if (authCookie == null)
                return false;

            var ticket = FormsAuthentication.Decrypt(authCookie.Value);

            if (ticket.UserData == "")
                return false;

            return true;
        }
    }
}