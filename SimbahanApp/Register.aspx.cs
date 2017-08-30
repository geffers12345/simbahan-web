using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using SimbahanApp.Models;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


namespace SimbahanApp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void CreateUser_Click(object sender, EventArgs e)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                using (SqlCommand cmd = new SqlCommand("spInsertRegistrationDetails", dbconn))
                {
                    try
                    {
                        int email = 0;
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@FirstName", FirstName.Text);
                        cmd.Parameters.AddWithValue("@LastName", LastName.Text);
                        cmd.Parameters.AddWithValue("@Birthday", Birthday.Text);
                        cmd.Parameters.AddWithValue("@Gender", Gender.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@EmailAddress", Email.Text);
                        cmd.Parameters.AddWithValue("@Password", Password.Text);

                        cmd.Parameters.Add("@RegAutoID", SqlDbType.BigInt).Direction = ParameterDirection.Output;

                        SqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            email = Convert.ToInt32(reader["result"]);
                        }
                       
                        string message = string.Empty;
                        switch (email)
                        {
                            case -1:
                                message = "Email Address already exists. Please choose a different email address.";
                                break;
                                   
                            default:
                                message = "Registered successfully.";
                                Response.Redirect("Login.aspx");
                                break;
                        }

                        lblmsg.Text = message;
                    }


                    catch (Exception ex)
                    {
                        lblmsg.Text = ex.Message.ToString();
                        
                    }
                }

            }
        }
    }
}

