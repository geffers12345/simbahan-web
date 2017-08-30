using SimbahanApp.Models;

namespace SimbahanApp.Transformers
{
    public class SpamReportTransformer : Transformer<SpamReport>
    {
        protected override SpamReport Parse()
        {
            return new SpamReport
            {
                Id = ToInt(SpamId),
                CommentId = ToInt(CommentId),
                ReporterId = ToInt(ReporterId),
                DateReported = ToDateTime(DateReported)
            };
        }

        #region Private Properties

        private object SpamId;

        private object CommentId;

        private object ReporterId;

        private object DateReported;

        #endregion
    }
}