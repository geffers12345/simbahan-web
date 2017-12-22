using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace SimbahanApp.Models
{
    public class User
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Gender { get; set; }
        public string DateOfBirth { get; set; }
        public DateTime DateRegistered { get; set; }
        public int RoleID { get; set; }
        public string FullName => FirstName + " " + LastName;

        public static User Parse(string userData)
        {
            var data = userData.Split(',');

            var user = new User();
            user.Id = Convert.ToInt32(data[0]);
            user.FirstName = data[1];
            user.LastName = data[2];
            user.Email = data[3];
            user.Gender = data[4];
            user.DateOfBirth = data[5];
            user.RoleID = Convert.ToInt32(data[7]);
            return user;
        }

        public override string ToString()
        {
            if (string.IsNullOrEmpty(Email))
                return "";

            var stringBuilder = new StringBuilder();

            stringBuilder.Append(Id)
                .Append(",")
                .Append(FirstName)
                .Append(",")
                .Append(LastName)
                .Append(",")
                .Append(Email)
                .Append(",")
                .Append(Gender)
                .Append(",")
                .Append(DateOfBirth)
                .Append(",")
                .Append(RoleID);

            return stringBuilder.ToString();
        }

        public bool HasPermission(int simbahanId)
        {
            using (SqlConnection dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                {
                    dbconn.Close();
                }
                dbconn.Open();

                var query = String.Format("SELECT count(*) AS role_count FROM ChurchRoles WHERE RoleID = {0} AND RegID = {1} AND SimbahanID = {2}", RoleID, Id, simbahanId);

                //Simbahan Parking
                using (SqlCommand cmd = new SqlCommand(query.ToString(), dbconn))
                {
                    var reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        int count = Convert.ToInt32(reader["role_count"]);

                        if (count > 0)
                            return true;
                    }
                }
            }
            return false;
        }
    }
}