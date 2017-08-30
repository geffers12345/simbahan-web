using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SimbahanApp.Models;
using SimbahanApp.Transformers;

namespace SimbahanApp.Services
{
    public class UserService : IBasicService<User>
    {
        private readonly UserTransformer _userTransformer;

        public UserService()
        {
            _userTransformer = new UserTransformer();
        }

        public User Create(User model)
        {
            throw new NotImplementedException();
        }

        public User Find(int id)
        {
            throw new NotImplementedException();
        }

        public User Update(int id, User model)
        {
            var user = new User();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spUpdateUserInformation", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userId", id);
                        cmd.Parameters.AddWithValue("@firstName", model.FirstName);
                        cmd.Parameters.AddWithValue("@lastName", model.LastName);
                        cmd.Parameters.AddWithValue("@gender", model.Gender);
                        cmd.Parameters.AddWithValue("@birthday", model.DateOfBirth);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            user = _userTransformer.Transform(reader);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return user;
        }

        public void Delete(User model)
        {
            throw new NotImplementedException();
        }

        public List<User> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0, int relationId4 = 0)
        {
            throw new NotImplementedException();
        }
    }
}