using SimbahanApp.Models;

namespace SimbahanApp.Components
{
    public class BibleVerseItem : IComponent
    {
        public BibleVerseItem(BibleVerse verse)
        {
            Verse = verse;
        }

        public BibleVerse Verse { get; set; }

        public string ToHtml()
        {
            return "<div><p></p><div><div class=\"tqquote\">" + Verse.BibleVerseContent +
                   "</div></div></div><div class=\"authors\"><p id=\"BibleVerse\" class=\"tqauthor\"> - " +
                   Verse.ChapterTitle + "</p></div>";
        }
    }
}