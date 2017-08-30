using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using SimbahanApp.Models;
using SimbahanApp.Transformers;

namespace SimbahanApp.Services
{
    public class OrganizationService
    {
        private bool HasColumn(IDataRecord dr, string columnName)
        {
            for (int i = 0; i < dr.FieldCount; i++)
            {
                if (dr.GetName(i).Equals(columnName, StringComparison.InvariantCultureIgnoreCase))
                    return true;
            }
            return false;
        }

        public List<Organization> Search(string keyword, string location, string organizationName, string useSchedule, string time, string language, string day, string activities, string attendees, string ventilation, string parking, string venue)
        {
            var organizationTransformer = new OrganizationTransformer();
            var organizations = new List<Organization>();
            char[] commaSeparator = { ',' };
            char[] pipeSeparator = { '|' };

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spSearchOrganizations", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@keyword", keyword);
                        cmd.Parameters.AddWithValue("@location", location);
                        cmd.Parameters.AddWithValue("@organizationName", organizationName);
                        cmd.Parameters.AddWithValue("@schedule", useSchedule);
                        cmd.Parameters.AddWithValue("@scheduleDay", day);
                        cmd.Parameters.AddWithValue("@scheduleTime", time);
                        cmd.Parameters.AddWithValue("@scheduleLanguage", language);
                        cmd.Parameters.AddWithValue("@activities", activities);
                        cmd.Parameters.AddWithValue("@attendees", attendees);
                        cmd.Parameters.AddWithValue("@ventilation", ventilation);
                        cmd.Parameters.AddWithValue("@parking", parking);
                        cmd.Parameters.AddWithValue("@venue", venue);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var organization = organizationTransformer.Transform(reader);

                            //TODO: Organization Photos

                            if (! HasColumn(reader, "Schedules"))
                            {
                                organizations.Add(organization);
                                continue;
                            }
                                

                            var schedules = reader["Schedules"].ToString().Split(commaSeparator, StringSplitOptions.None);

                            foreach (var scheduleItem in schedules)
                            {
                                var schedule = scheduleItem.Split(pipeSeparator, StringSplitOptions.None);
                                string araw = ""; //LOL
                                switch (Convert.ToInt32(schedule[1]))
                                {
                                    case 1:
                                        araw = "Sunday";
                                        break;
                                    case 2:
                                        araw = "Monday";
                                        break;
                                    case 3:
                                        araw = "Tuesday";
                                        break;
                                    case 4:
                                        araw = "Wednesday";
                                        break;
                                    case 5:
                                        araw = "Thursday";
                                        break;
                                    case 6:
                                        araw = "Friday";
                                        break;
                                    case 7:
                                        araw = "Saturday";
                                        break;
                                }

                                organization.Masses.Add(new OrganizationMass
                                {
                                    Id = Convert.ToInt32(schedule[0]),
                                    ScheduleId = Convert.ToInt32(schedule[1]),
                                    Time = schedule[2],
                                    TimeStandardId = Convert.ToInt32(schedule[3]),
                                    Day = araw
                                });
                            }

                            organizations.Add(organization);
                        }

                    }
                    catch (Exception e)
                    {
                        // ignored
                    }
                }
            }

            return organizations;
        }

        public Organization Find(int id)
        {
            var organizationTransformer = new OrganizationTransformer();
            var organization = new Organization();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindOrganization", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@organizationID", id);

                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            organization = organizationTransformer.Transform(reader);

                        reader.NextResult();
                        while (reader.Read())
                            organization.Locations.Add(reader["OrgLocation"].ToString());

                        reader.NextResult();
                        while (reader.Read())
                            organization.Ventilations.Add(reader["OrgVentilationType"].ToString());

                        reader.NextResult();
                        while (reader.Read())
                        {
                            // TODO: Implement
                        }

                        reader.NextResult();
                        while (reader.Read())
                            organization.Parkings.Add(reader["OrgVehicleParkingType"].ToString());

                        reader.NextResult();
                        while (reader.Read())
                            organization.Attendees.Add(reader["AttendeesType"].ToString());

                        reader.NextResult();
                        while (reader.Read())
                            organization.Activities.Add(reader["ActivityName"].ToString());

                        reader.NextResult();
                        while (reader.Read())
                            organization.Masses.Add(new OrganizationMass
                            {
                                Id = Convert.ToInt32(reader["OrgMassID"]),
                                ScheduleId = Convert.ToInt32(reader["ScheduleID"]),
                                TimeStandardId = Convert.ToInt32(reader["TimeStandardID"]),
                                OrganizationId = Convert.ToInt32(reader["OrganizationID"]),
                                Day = reader["Days"].ToString(),
                                Time = reader["Time"].ToString()
                            });

                        reader.NextResult();
                        while (reader.Read())
                            organization.BibleStudySchedules.Add(new OrganizationMass
                            {
                                Id = Convert.ToInt32(reader["OrgBibleScheduleID"]),
                                ScheduleId = Convert.ToInt32(reader["ScheduleID"]),
                                TimeStandardId = Convert.ToInt32(reader["TimeStandardID"]),
                                OrganizationId = Convert.ToInt32(reader["OrganizationID"]),
                                Day = reader["Days"].ToString(),
                                Time = reader["Time"].ToString()
                            });

                        reader.NextResult();
                        while (reader.Read())
                            organization.WorshipSchedules.Add(new OrganizationMass
                            {
                                Id = Convert.ToInt32(reader["OrgWorshipScheduleID"]),
                                ScheduleId = Convert.ToInt32(reader["ScheduleID"]),
                                TimeStandardId = Convert.ToInt32(reader["TimeStandardID"]),
                                OrganizationId = Convert.ToInt32(reader["OrganizationID"]),
                                Day = reader["Days"].ToString(),
                                Time = reader["Time"].ToString()
                            });

                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return organization;
        }
    }
}