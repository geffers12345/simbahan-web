namespace SimbahanApp.Transformers
{
    public class OtherCatholicPrayerTransformer : Transformer<Models.OtherCatholicPrayer>
    {
        protected override Models.OtherCatholicPrayer Parse()
        {
            return new Models.OtherCatholicPrayer
            {
                Id = ToInt(OtherCatholicPrayerID),
                ImagePath = ImagePath.ToString(),
                Prayer = Prayer.ToString(),
                Title = Title.ToString(),
                Category = Categories.ToString()
            };
        }

        #region Private Properties

        private object OtherCatholicPrayerID { get; set; }
        private object ImagePath { get; set; }
        private object Prayer { get; set; }
        private object Title { get; set; }
        private object Categories { get; set; }

        #endregion
    }
}