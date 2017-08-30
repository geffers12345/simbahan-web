using SimbahanApp.Models;

namespace SimbahanApp.Transformers
{
    public class SaintReflectionTransformer : Transformer<SaintReflection>
    {
        protected override SaintReflection Parse()
        {
            return new SaintReflection
            {
                Id = ToInt(UserDailySaintReflectionID),
                SaintId = ToInt(SaintID),
                UserId = ToInt(UserID),
                Title = Title.ToString(),
                Content = ReflectionContent.ToString(),
                CreatedAt = ToDateTime(CreatedAt),
                UpdatedAt = ToDateTime(UpdatedAt)
            };
        }

        #region Private Properties

        private object UserDailySaintReflectionID;
        private object SaintID;
        private object UserID;
        private object Title;
        private object ReflectionContent;
        private object CreatedAt;
        private object UpdatedAt;

        #endregion
    }
}