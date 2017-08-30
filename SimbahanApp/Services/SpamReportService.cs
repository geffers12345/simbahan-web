using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SimbahanApp.Models;
using SimbahanApp.Transformers;

namespace SimbahanApp.Services
{
    public class SpamReportService : IBasicService<SpamReport>
    {
        private readonly SpamReportTransformer _spamReportTransformer;

        public SpamReportService()
        {
            _spamReportTransformer = new SpamReportTransformer();
        }

        public SpamReport Create(SpamReport model)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertSpamReport", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@CommentID", model.CommentId);
                        cmd.Parameters.AddWithValue("@ReporterID", model.ReporterId);


                        cmd.ExecuteNonQuery();
                        model.DateReported = DateTime.Now;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return model;

        }

        public SpamReport Find(int id)
        {
            throw new NotImplementedException();
        }

        public SpamReport Update(int id, SpamReport model)
        {
            throw new NotImplementedException();
        }

        public void Delete(SpamReport model)
        {
            throw new NotImplementedException();
        }

        public List<SpamReport> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0, int relationId4 = 0)
        {
            throw new NotImplementedException();
        }
    }
}