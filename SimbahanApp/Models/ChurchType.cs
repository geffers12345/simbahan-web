using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanApp.Models
{
    public class ChurchType
    {
        const int CHURCH = 1;
        const int CATHEDRAL = 2;
        const int BASILICA = 3;
        const int SHRINE = 4;
        const int CHAPEL = 5;

        public static string parseInt(int? churchTypeID)
        {
            switch (churchTypeID)
            {
                case ChurchType.CHURCH:
                    return "Church";

                case CATHEDRAL:
                    return "Cathedral";

                case BASILICA:
                    return "Basilica";

                case SHRINE:
                    return "Shrine";

                case CHAPEL:
                    return "Chapel";

                default: return "";
            }
        }
    }
}