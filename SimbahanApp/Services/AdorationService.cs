using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SimbahanApp.Models;
using SimbahanApp.Transformers;
using SimbahanAPI.Models;

namespace SimbahanApp.Services
{
    public class AdorationService
    {
        public List<Adoration> Search(string keyword, string location, string day, string time, string chapelLocation,
            string ventilation)
        {
            var adorations = new List<Adoration>();
            var churchTransformer = new ChurchTransformer();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spSearchAdorations", dbconn))
                {
                    try
                    {
                        if (day == "8")
                            day = (int)DateTime.Now.DayOfWeek + 1 + "";

                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@keyword", keyword);
                        cmd.Parameters.AddWithValue("@location", location);
                        cmd.Parameters.AddWithValue("@scheduleTime", time);
                        cmd.Parameters.AddWithValue("@scheduleDay", day);
                        cmd.Parameters.AddWithValue("@chapelLocation", chapelLocation);
                        cmd.Parameters.AddWithValue("@ventilation", ventilation);

                        var dr = cmd.ExecuteReader();

                        while (dr.Read())
                        {
                            var adoration = new Adoration
                            {
                                AdorationID = Convert.ToInt32(dr["AdorationID"]),
                                SimbahanID = Convert.ToInt32(dr["SimbahanId"]),
                                Is247 = Convert.ToBoolean(dr["IsOpen24By7"]),
                                DisplayText = dr["DisplayText"].ToString()
                            };

                            char[] separator = {','};
                            char[] pipeSeparator = {'|'};

                            var ventilations = dr["Ventilations"].ToString().Split(separator, StringSplitOptions.None);

                            foreach (var ventilationItem in ventilations)
                                adoration.Ventilations.Add(ventilationItem);

                            var photos = dr["AdorationPhotos"].ToString().Split(separator, StringSplitOptions.None);
                            foreach (var photo in photos)
                                if (photo != string.Empty)
                                    adoration.Images.Add(@"Images\Photos\" + photo);

                            if (adoration.Images.Count == 0)
                                adoration.Images.Add(@"Images\default.jpg");

                            var masses = dr["Masses"].ToString().Split(separator, StringSplitOptions.None);

                            foreach (var massDb in masses)
                            {
                                var massDetail = massDb.Split(pipeSeparator, StringSplitOptions.None);

                                var mass = new MassDetailsModel
                                {
                                    ScheduleId = Convert.ToInt32(massDetail[2]),
                                    Time = massDetail[3],
                                    TimeStandardId = Convert.ToInt32(massDetail[4])
                                };

                                switch (Convert.ToInt32(massDetail[2]))
                                {
                                    case 1:
                                        mass.Days = "Sunday";
                                        adoration.SundaySchedule.Add(mass);
                                        break;
                                    case 2:
                                        mass.Days = "Monday";
                                        adoration.MondaySchedule.Add(mass);
                                        break;
                                    case 3:
                                        mass.Days = "Tuesday";
                                        adoration.TuesdaySchedule.Add(mass);
                                        break;
                                    case 4:
                                        mass.Days = "Wednesday";
                                        adoration.WednesdaySchedule.Add(mass);
                                        break;
                                    case 5:
                                        mass.Days = "Thursday";
                                        adoration.ThursdaySchedule.Add(mass);
                                        break;
                                    case 6:
                                        mass.Days = "Friday";
                                        adoration.FridaySchedule.Add(mass);
                                        break;
                                    case 7:
                                        mass.Days = "Saturday";
                                        adoration.SaturdaySchedule.Add(mass);
                                        break;
                                }
                            }

                            adoration.Church = churchTransformer.Transform(dr);

                            adorations.Add(adoration);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return adorations;
        }
    }
}