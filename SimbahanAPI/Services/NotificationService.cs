using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SimbahanApp.Models;
using SimbahanApp.Transformers;

namespace SimbahanApp.Services
{
    public class NotificationService : IBasicService<Notification>
    {
        private readonly NotificationTransformer _notificationTransformer;
        private readonly UserTransformer _userTransformer;

        public NotificationService()
        {
            _notificationTransformer = new NotificationTransformer();
            _userTransformer = new UserTransformer();
        }

        public Notification Create(Notification notification)
        {
            var createdNotification = new Notification();


            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spCreateNotification", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@title", notification.Title);
                        cmd.Parameters.AddWithValue("@comment", notification.Description);
                        cmd.Parameters.AddWithValue("@userID", notification.UserId);
                        cmd.Parameters.AddWithValue("@action", notification.Action);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            createdNotification = _notificationTransformer.Transform(reader);
                            createdNotification.User = _userTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return createdNotification;
        }

        public Notification Find(int id)
        {
            throw new NotImplementedException();
        }

        public Notification Update(int id, Notification model)
        {
            throw new NotImplementedException();
        }

        public void Delete(Notification model)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// </summary>
        /// <param name="relationId">User Id</param>
        /// <param name="relationId2"></param>
        /// <param name="relationId3"></param>
        /// <param name="relationId4"></param>
        /// <returns></returns>
        public List<Notification> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0, int relationId4 = 0)
        {
            var notifications = new List<Notification>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetNotifications", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", relationId);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var notification = _notificationTransformer.Transform(reader);
                            notification.User = _userTransformer.Transform(reader);

                            notifications.Add(notification);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return notifications;
        }

        public void CreateUserNotification(int notificationId, int userId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                var cmd = new SqlCommand
                {
                    CommandText = string.Format(
                        "INSERT INTO [Notification_User] (UserId, NotificationId, HasRead) VALUES ({0}, {1}, 0)",
                        userId, notificationId),
                    CommandType = CommandType.Text,
                    Connection = dbconn
                };


                cmd.ExecuteReader();
            }
        }

        public void MarkAsRead(int notificationId, int userId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spMarkNotificationAsRead", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@notificationID", notificationId);
                        cmd.Parameters.AddWithValue("@userID", userId);

                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }
        }

        public int GetNumberOfUnreadNotification(int userId)
        {
            var unreadNotificationCount = 0;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetNumberOfUnreadNotification", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            unreadNotificationCount = Convert.ToInt32(reader["count"]);
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return unreadNotificationCount;
        }
    }
}