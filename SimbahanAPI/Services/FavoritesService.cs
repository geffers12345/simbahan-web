using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using SimbahanApp.Models;
using SimbahanApp.Transformers;

namespace SimbahanApp.Services
{
    public class FavoritesService
    {
        public List<Tuple<ChurchInfo, User>> GetChurchFollowers(int churchId)
        {
            var churchTransformer = new ChurchTransformer();
            var userTransformer = new UserTransformer();
            var followers = new List<Tuple<ChurchInfo, User>>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetChurchFollowers", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@churchID", churchId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var church = churchTransformer.Transform(reader);
                            var user = userTransformer.Transform(reader);
                            var follower = new Tuple<ChurchInfo, User>(church, user);

                            followers.Add(follower);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return followers;
        }

        public List<Organization> GetFavoriteOrganizations(int userId)
        {
            var organizationTransformer = new OrganizationTransformer();
            var organizations = new List<Organization>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetFavoriteOrganization", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var organization = organizationTransformer.Transform(reader);


                            //char[] separator = { ',' };
                            //var photos = reader["ChurchPhotos"].ToString().Split(separator, StringSplitOptions.None);
                            //church.ChurchPhotos = new List<ChurchPhotosModel>();
                            //foreach (var strPix in photos)
                            //    church.ChurchPhotos.Add(new ChurchPhotosModel
                            //    {
                            //        ChurchPhotos = strPix == string.Empty ? "" : @"Images\Photos\" + strPix
                            //    });

                            organizations.Add(organization);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return organizations;
        }

        public List<ChurchInfo> GetFavoriteChurches(int userId)
        {
            var churchTransformer = new ChurchTransformer();
            var churches = new List<ChurchInfo>();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetFavoriteChurch", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            var church = churchTransformer.Transform(reader);


                            char[] separator = {','};
                            var photos = reader["ChurchPhotos"].ToString().Split(separator, StringSplitOptions.None);
                            church.ChurchPhotos = new List<ChurchPhotosModel>();
                            foreach (var strPix in photos)
                                church.ChurchPhotos.Add(new ChurchPhotosModel
                                {
                                    ChurchPhotos = strPix == string.Empty ? "" : @"Images\Photos\" + strPix
                                });

                            churches.Add(church);
                        }
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return churches;
        }

        public List<BibleVerse> GetFavoriteBibleVerses(int userId)
        {
            var verses = new List<BibleVerse>();
            var bibleVerseTransformer = new BibleVerseTransformer();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetFavoriteBibleVerse", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            verses.Add(bibleVerseTransformer.Transform(reader));
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return verses;
        }

        public List<ReligiousQuote> GetFavoriteReligiousQuotes(int userId)
        {
            var religiousQuotes = new List<ReligiousQuote>();
            var religiousQuoteTransformer = new ReligiousQuoteTransformer();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetFavoriteReligiousQuote", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            religiousQuotes.Add(religiousQuoteTransformer.Transform(reader));
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return religiousQuotes;
        }

        public List<Models.MusicalInspiration> GetFavoriteInspirationalMusic(int userId)
        {
            var musicalInspirations = new List<Models.MusicalInspiration>();
            var inspirationalMusicTransformer = new InspirationalMusicTransformer();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetFavoriteInspirationalMusic", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            musicalInspirations.Add(inspirationalMusicTransformer.Transform(reader));
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return musicalInspirations;
        }

        public bool AddChurch(int userId, int simbahanId)
        {
            if (IsChurchAlreadyInFavorites(userId, simbahanId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertSimbahanFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@simbahanID", simbahanId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool AddOrganization(int userId, int organizationId)
        {
            if (IsOrganizationAlreadyInFavorites(userId, organizationId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertOrganizationFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@organizationID", organizationId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool AddBibleVerse(int userId, int bibleVerseId)
        {
            if (IsBibleVerseAlreadyInFavorites(userId, bibleVerseId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertBibleVerseFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@bibleVerseID", bibleVerseId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool AddReligiousQuote(int userId, int religiousQuoteId)
        {
            if (IsReligiousQuoteAlreadyInFavorites(userId, religiousQuoteId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertFavoriteReligiousQuote", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@religiousQuoteID", religiousQuoteId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool AddInspirationalMusic(int userId, int inspirationalMusicId)
        {
            if (IsInspirationalMusicAlreadyInFavorites(userId, inspirationalMusicId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertFavoriteInspirationalMusic", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@inspirationalMusicID", inspirationalMusicId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool IsBibleVerseAlreadyInFavorites(int userId, int bibleVerseId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spIsBibleVerseInFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@bibleVerseID", bibleVerseId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            return Convert.ToInt32(reader["result"]) == 1;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return true;
        }

        public bool IsReligiousQuoteAlreadyInFavorites(int userId, int religiousQuoteId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spIsReligiousQuoteInFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@religiousQuoteID", religiousQuoteId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            return Convert.ToInt32(reader["result"]) == 1;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return true;
        }

        public bool IsInspirationalMusicAlreadyInFavorites(int userId, int inspirationalMusicId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spIsInspirationalMusicInFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@inspirationalMusicID", inspirationalMusicId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            return Convert.ToInt32(reader["result"]) == 1;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return true;
        }

        public bool RemoveBibleVerse(int userId, int bibleVerseId)
        {
            if (!IsBibleVerseAlreadyInFavorites(userId, bibleVerseId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveBibleVerseFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@bibleVerseID", bibleVerseId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool RemoveReligiousQuote(int userId, int religiousQuoteId)
        {
            if (!IsReligiousQuoteAlreadyInFavorites(userId, religiousQuoteId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveReligiousQuoteFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@religiousQuoteID", religiousQuoteId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool RemoveInspirationalMusic(int userId, int inspirationalMusicId)
        {
            if (!IsInspirationalMusicAlreadyInFavorites(userId, inspirationalMusicId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveInspirationalMusicFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@inspirationalMusicID", inspirationalMusicId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool RemoveChurch(int userId, int simbahanId)
        {
            if (!IsChurchAlreadyInFavorites(userId, simbahanId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveChurchFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@simbahanID", simbahanId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool RemoveOrganization(int userId, int organizationId)
        {
            if (!IsOrganizationAlreadyInFavorites(userId, organizationId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveOrganizationFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@organizationID", organizationId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool IsChurchAlreadyInFavorites(int userId, int simbahanId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spIsChurchInFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@simbahanID", simbahanId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            return Convert.ToInt32(reader["result"]) == 1;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return true;
        }

        public bool IsOrganizationAlreadyInFavorites(int userId, int organizationId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spIsOrganizationInFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@organizationID", organizationId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            return Convert.ToInt32(reader["result"]) == 1;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return true;
        }

        public List<Models.BasicCatholicPrayer> GetFavoriteBasicCatholicPrayer(int userId)
        {
            var basicCatholicPrayer = new List<Models.BasicCatholicPrayer>();
            var basicCatholicPrayerTransformer = new BasicCatholicPrayerTransformer();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetFavoriteBasicCatholicPrayer", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            basicCatholicPrayer.Add(basicCatholicPrayerTransformer.Transform(reader));
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return basicCatholicPrayer;
        }

        public List<Models.Devotion> GetFavoriteDevotion(int userId)
        {
            var devotion = new List<Models.Devotion>();
            var devotionTransformer = new DevotionTransformer();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetFavoriteDevotion", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            devotion.Add(devotionTransformer.Transform(reader));
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return devotion;
        }

        public List<Models.OtherCatholicPrayer> GetFavoriteOtherCatholicPrayer(int userId)
        {
            var otherCatholicPrayers = new List<Models.OtherCatholicPrayer>();
            var otherCatholicPrayerTransformer = new OtherCatholicPrayerTransformer();

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spGetFavoriteOtherCatholicPrayer", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            otherCatholicPrayers.Add(otherCatholicPrayerTransformer.Transform(reader));
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return otherCatholicPrayers;
        }

        public bool AddBasicCatholicPrayer(int userId, int basicCatholicPrayerId)
        {
            if (IsBasicCatholicPrayerAlreadyInFavorites(userId, basicCatholicPrayerId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertFavoriteBasicCatholicPrayer", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@basiccatholicprayerID", basicCatholicPrayerId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool AddDevotion(int userId, int devotionId)
        {
            if (IsDevotionAlreadyInFavorites(userId, devotionId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertFavoriteDevotion", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@devotionID", devotionId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool AddOtherCatholicPrayer(int userId, int othercatholicprayerId)
        {
            if (IsOtherCatholicPrayerAlreadyInFavorites(userId, othercatholicprayerId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spInsertFavoriteOtherCatholicPrayer", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@othercatholicprayerID", othercatholicprayerId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool IsBasicCatholicPrayerAlreadyInFavorites(int userId, int basicCatholicPrayerId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spIsBasicCatholicPrayerInFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@basiccatholicprayerID", basicCatholicPrayerId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            return Convert.ToInt32(reader["result"]) == 1;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return true;
        }

        public bool IsDevotionAlreadyInFavorites(int userId, int devotionId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spIsDevotionInFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@devotionID", devotionId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            return Convert.ToInt32(reader["result"]) == 1;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return true;
        }

        public bool IsOtherCatholicPrayerAlreadyInFavorites(int userId, int othecatholicprayerId)
        {
            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spIsOtherCatholicPrayerInFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@othercatholicprayerID", othecatholicprayerId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        var reader = cmd.ExecuteReader();

                        while (reader.Read())
                            return Convert.ToInt32(reader["result"]) == 1;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return true;
        }

        public bool RemoveBasicCatholicPrayer(int userId, int basicCatholicPrayerId)
        {
            if (!IsBasicCatholicPrayerAlreadyInFavorites(userId, basicCatholicPrayerId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveBasicCatholicPrayerFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@basiccatholicprayerID", basicCatholicPrayerId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool RemoveDevotion(int userId, int devotionId)
        {
            if (!IsDevotionAlreadyInFavorites(userId, devotionId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveDevotionFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@devotionID", devotionId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }

        public bool RemoveOtherCatholicPrayer(int userId, int othercatholicprayerId)
        {
            if (!IsDevotionAlreadyInFavorites(userId, othercatholicprayerId)) return false;

            using (var dbconn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconn"]
                .ConnectionString))
            {
                if (dbconn.State == ConnectionState.Open)
                    dbconn.Close();
                dbconn.Open();

                using (var cmd = new SqlCommand("spRemoveOtherCatholicPrayerFavorite", dbconn))
                {
                    try
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@othercatholicprayerID", othercatholicprayerId);
                        cmd.Parameters.AddWithValue("@userID", userId);


                        cmd.ExecuteNonQuery();

                        return true;
                    }
                    catch (Exception)
                    {
                        // ignored
                    }
                }
            }

            return false;
        }
    }
}