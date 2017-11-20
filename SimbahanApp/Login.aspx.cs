using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using SimbahanApp.Models;

namespace SimbahanApp
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void LogIn(object sender, EventArgs e)
        {
            User user;
            string redirect = "<script>window.open('http://localhost:9164/HTMLClient/');</script>";
            if (ValidateUser(Email.Text, Password.Text, out user))
            {
                var ticket = new FormsAuthenticationTicket(1, Email.Text, DateTime.Now, DateTime.Now.AddDays(7), true,
                    user.ToString());

                var encryptedCookie = FormsAuthentication.Encrypt(ticket);

                var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedCookie);
                cookie.Expires = ticket.Expiration;
                cookie.Path = ticket.CookiePath;
                Response.Cookies.Add(cookie);

                if (Request.Cookies["intendedRedirect"] != null && Request.Cookies["intendedRedirect"].Value != null)
                    Response.Redirect(Request.Cookies["intendedRedirect"].Value);

                if (Auth.user().RoleID == 1)
                    Response.Write(redirect);
                else if (Auth.user().RoleID == 2)
                    Response.Redirect("Profile.aspx");
                else if (Auth.user().RoleID == 3)
                    Response.Redirect("Profile.aspx");
            }
            else
            {
                FailureText.Text = "Invalid Email Address or Password!";
                ErrorMessage.Visible = true;
            }
        }

        private bool ValidateUser(string email, string password, out User user)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                user = new User();

                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertLoginDetails", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@EmailAddress", email);
                        cmd.Parameters.AddWithValue("@Password", password);

                        var reader = cmd.ExecuteReader();

                        var EmailFromDB = string.Empty;
                        var PasswordFromDB = string.Empty;

                        while (reader.Read())
                        {
                            EmailFromDB = reader["EmailAddress"].ToString();
                            PasswordFromDB = reader["Password"].ToString();

                            user.Id = Convert.ToInt32(reader["RegID"]);
                            user.FirstName = reader["FirstName"].ToString();
                            user.LastName = reader["LastName"].ToString();
                            user.Email = reader["EmailAddress"].ToString();
                            user.Gender = reader["Gender"].ToString();
                            user.DateOfBirth = reader["Birthday"].ToString();
                            user.RoleID = Convert.ToInt32(reader["RoleID"]);
                        }

                        if (EmailFromDB == email && PasswordFromDB == password)
                        {
                            return true;
                        }
                        else
                        {
                            user = new User();

                            return false;
                        }
                    }
                    catch (Exception)
                    {
                    }
                    finally
                    {
                        dbconn.Close();
                        dbconn.Dispose();
                    }
                }
            }

            user = new User();

            return false;
        }
    }
}