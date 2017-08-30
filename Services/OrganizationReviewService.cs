using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SimbahanApp.Models;
using SimbahanApp.Transformers;

namespace SimbahanApp.Services
{
    public class OrganizationReviewService : IBasicService<OrganizationReview>
    {
        private readonly OrganizationReviewTransformer _organizationReviewTransformer;
        private readonly OrganizationTransformer _organizationTransformer;
        private readonly UserTransformer _userTransformer;

        public OrganizationReviewService()
        {
            _organizationReviewTransformer = new OrganizationReviewTransformer();
            _organizationTransformer = new OrganizationTransformer();
            _userTransformer = new UserTransformer();
        }

        public OrganizationReview Create(OrganizationReview model)
        {
            var organizationReview = new OrganizationReview();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertOrganizationReview", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", model.UserId);
                        cmd.Parameters.AddWithValue("@organizationID", model.OrganizationId);
                        cmd.Parameters.AddWithValue("@name", model.Name);
                        cmd.Parameters.AddWithValue("@title", model.Title);
                        cmd.Parameters.AddWithValue("@rate", model.StarCount);
                        cmd.Parameters.AddWithValue("@content", model.Comment);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            organizationReview = _organizationReviewTransformer.Transform(reader);
                            if (organizationReview.UserId != 0)
                                organizationReview.User = _userTransformer.Transform(reader);
                            organizationReview.Organization = _organizationTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return organizationReview;
        }

        public OrganizationReview Find(int id)
        {
            var organizationReview = new OrganizationReview();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spFindOrganizationReview", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@organizationReviewID", id);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            organizationReview = _organizationReviewTransformer.Transform(reader);
                            if (organizationReview.UserId != 0)
                                organizationReview.User = _userTransformer.Transform(reader);
                            organizationReview.Organization = _organizationTransformer.Transform(reader);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return organizationReview;
        }

        public OrganizationReview Update(int id, OrganizationReview model)
        {
            throw new NotImplementedException();
        }

        public void Delete(OrganizationReview model)
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// </summary>
        /// <param name="relationId">Organization Id</param>
        /// <param name="relationId2"></param>
        /// <param name="relationId3"></param>
        /// <param name="relationId4"></param>
        /// <returns></returns>
        public List<OrganizationReview> Get(int relationId = 0, int relationId2 = 0, int relationId3 = 0,
            int relationId4 = 0)
        {
            var organizationReviews = new List<OrganizationReview>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetOrganizationReviews", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@organizationID", relationId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var organizationReview = _organizationReviewTransformer.Transform(reader);
                            if (organizationReview.UserId != 0)
                                organizationReview.User = _userTransformer.Transform(reader);
                            organizationReview.Organization = _organizationTransformer.Transform(reader);

                            organizationReviews.Add(organizationReview);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return organizationReviews;
        }
    }
}