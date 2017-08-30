using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanApp.Models
{
    public class BibleMoodsModel
    {
        public int ID { get; set; }
        public bool IsFavorite { get; set; }
        public string ChapterTitle { get; set; }
        public String BibleVerseContent { get; set; }
        public string Author { get; set; }
        public String Quote { get; set; }
    }
}