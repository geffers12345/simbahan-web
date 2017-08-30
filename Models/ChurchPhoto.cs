using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace SimbahanApp.Models
{
    public class ChurchPhoto
    {
        private static string[] FileTypes =
        {
            ".jpg",
            ".jpeg",
            ".png",
            ".bmp"
        };

        public static readonly string ThumbnailDirectory = @"..\Images\Photos\Thumbnails\";


        public static string GetChurchThumbnail(int simbahanId, string photo)
        {
            Directory.SetCurrentDirectory(AppDomain.CurrentDomain.RelativeSearchPath);
            string byId = GetChurchThumbnailById(simbahanId);
            string byChurchCode = GetChurchThumbnailByChurchCode(photo);

            if (!String.IsNullOrEmpty(byId))
                return byId;
            else if (!String.IsNullOrEmpty(byChurchCode))
                return byChurchCode;

            return "";
        }

        private static string GetChurchThumbnailByChurchCode(string churchCode)
        {
            return churchCode == string.Empty ? "" : ThumbnailDirectory + churchCode;
        }

        private static string GetChurchThumbnailById(int simbahanId)
        {
            foreach (var fileType in FileTypes)
            {
                if (File.Exists(ThumbnailDirectory + simbahanId + fileType))
                    return ThumbnailDirectory + simbahanId + fileType;
            }

            return "";
        }
    }
}
