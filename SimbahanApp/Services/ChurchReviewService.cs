using System;
using System.Data;
using SimbahanApp.Models;
using System.Configuration;
using System.Data.SqlClient;
using SimbahanApp.Transformers;
using System.Collections.Generic;

namespace SimbahanApp.Services
{
    public class ChurchReviewService : IBasicService<ChurchReview>
    {
        private readonly ChurchReviewTransformer _churchReviewTransformer;

        private readonly ChurchTransformer _churchTransformer;

        private readonly UserTransformer _userTransformer;

        public ChurchReviewService()
        {
            _churchReviewTransformer = new ChurchReviewTransformer();
            _churchTransformer = new ChurchTransformer();
            _userTransformer = new UserTransformer();
        }

        public ChurchReview Create(ChurchReview model)
        {
            var churchReview = new ChurchReview();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertChurchReview", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@simbahanID", model.SimbahanId);
                        cmd.Parameters.AddWithValue("@name", model.Name);
                        cmd.Parameters.AddWithValue("@title","");
                        cmd.Parameters.AddWithValue("@rate", model.StarCount);
                        cmd.Parameters.AddWithValue("@content", model.Comment);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            churchReview = _churchReviewTransformer.Transform(reader);
                            if (churchReview.UserId != 0)
                                churchReview.User = _userTransformer.Transform(reader);
                            churchReview.Simbahan = _churchTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return churchReview;
        }

        public ChurchReview Find(int id)
        {
            var churchReview = new ChurchReview();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindChurchReview", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@churchReviewID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            churchReview = _churchReviewTransformer.Transform(reader);
                            churchReview.User = _userTransformer.Transform(reader);
                            churchReview.Simbahan = _churchTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return churchReview;
        }

        public ChurchReview Update(int id, ChurchReview model)
        {
            var churchReview = new ChurchReview();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spUpdateChurchReviews", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@simbahanID", model.SimbahanId);
                        cmd.Parameters.AddWithValue("@title", model.Title);
                        cmd.Parameters.AddWithValue("@starCount", model.StarCount);
                        cmd.Parameters.AddWithValue("@comment", model.Comment);
                        cmd.Parameters.AddWithValue("@churchReviewID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            churchReview = _churchReviewTransformer.Transform(reader);
                            churchReview.User = _userTransformer.Transform(reader);
                            churchReview.Simbahan = _churchTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return churchReview;
        }

        public void Delete(ChurchReview model)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveChurchReview", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@churchReviewID", model.Id);


                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }
        }

        /// <summary>
        /// </summary>
        /// <param name="relationId">Simbahan Id</param>
        /// <param name="relationId2"></param>
        /// <param name="relationId3"></param>
        /// <param name="relationId4"></param>
        /// <returns></returns>
        public List<ChurchReview> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0, int relationId4 = 0)
        {
            var churchReviews = new List<ChurchReview>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetChurchReviews", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@simbahanID", relationId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var churchReview = _churchReviewTransformer.Transform(reader);
                            churchReview.User = _userTransformer.Transform(reader);
                            churchReview.Simbahan = _churchTransformer.Transform(reader);

                            churchReviews.Add(churchReview);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return churchReviews;
        }
    }
}