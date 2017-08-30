namespace SimbahanApp.Components
{
    public class OtherCatholicPrayerItem : IComponent
    {
        private readonly Models.OtherCatholicPrayer Prayer;

        public OtherCatholicPrayerItem(Models.OtherCatholicPrayer prayer)
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