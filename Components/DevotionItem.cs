namespace SimbahanApp.Components
{
    public class DevotionItem : IComponent
    {
        private readonly Models.Devotion Devotion;

        public DevotionItem(Models.Devotion devotion)
        {
            Devotion = devotion;
        }

        public string ToHtml()
        {
            return "<div><p></p><div><div class=\"tqquote\">" + Devotion.Prayer +
                   "</div></div></div><div class=\"authors\"><p id=\"devotions\" class=\"tqauthor\"> - " +
                   Devotion.Title + "</p></div>";
        }
    }
}