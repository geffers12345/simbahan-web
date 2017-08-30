using SimbahanApp.Models;

namespace SimbahanApp.Transformers
{
    public class OrganizationReviewTransformer : Transformer<OrganizationReview>
    {
        protected override OrganizationReview Parse()
        {
            return new OrganizationReview
            {
                Id = ToInt(OrganizationReviewID),
                OrganizationId = ToInt(OrganizationID),
                UserId = ToInt(UserID),
                Name = Name.ToString(),
                StarCount = ToInt(StarCount),
                Title = Title.ToString(),
                Comment = Comment.ToString(),
                DateCreated = ToDateTime(DateCreated)
            };
        }

        #region Private Properties

        private object OrganizationReviewID { get; set; }
        private object UserID { get; set; }
        private object OrganizationID { get; set; }
        private object Name { get; set; }
        private object StarCount { get; set; }
        private object Comment { get; set; }
        private object Title { get; set; }
        private object DateCreated { get; set; }

        #endregion
    }
}