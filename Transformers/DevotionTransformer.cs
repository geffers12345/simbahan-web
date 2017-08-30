namespace SimbahanApp.Transformers
{
    public class DevotionTransformer : Transformer<Models.Devotion>
    {
        protected override Models.Devotion Parse()
        {
            return new Models.Devotion
            {
                Id = ToInt(DevotionID),
                ImagePath = ImagePath.ToString(),
                Prayer = Prayer.ToString(),
                Title = Title.ToString()
            };
        }

        #region Private Properties

        private object DevotionID { get; set; }
        private object ImagePath { get; set; }
        private object Prayer { get; set; }
        private object Title { get; set; }

        #endregion
    }
}