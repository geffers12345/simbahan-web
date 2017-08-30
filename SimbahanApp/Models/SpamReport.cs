using System;

namespace SimbahanApp.Models
{
    public class SpamReport
    {
        public int Id { get; set; }
        public int CommentId { get; set; }
        public int ReporterId { get; set; }
        public DateTime DateReported { get; set; }
    }
}