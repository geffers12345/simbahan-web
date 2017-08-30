using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanAPI.Models
{
    public class AdorationChapelModel
    {
        public Int32 AdChapelID { get; set; }
        public Int32 SimbahanID { get; set; }
        public Boolean IsOpen24By7 { get; set; }
        public Int32 ScheduleID { get; set; }
        public String Time { get; set; }
    }
}