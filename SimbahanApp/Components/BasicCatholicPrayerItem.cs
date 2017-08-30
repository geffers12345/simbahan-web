namespace SimbahanApp.Components
{
    public class BasicCatholicPrayerItem : IComponent
    {
        private readonly Models.BasicCatholicPrayer Prayer;

        public BasicCatholicPrayerItem(Models.BasicCatholicPrayer prayer)
        {
            Prayer = prayer;
        }

        public string ToHtml()
        {
            return "<div><p></p><div><div class=\"tqquote\">" + Prayer.Prayer +
                   "</div></div></div><div class=\"authors\"><p id=\"devotions\" class=\"tqauthor\"> - " +
                   Prayer.Title + "</p></div>";
        }
    }
}