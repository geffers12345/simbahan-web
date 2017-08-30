using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanApp.Models
{
    public class SaintReflection
    {
        public int Id { get; set; }
        public int SaintId { get; set; }
        public Saint Saint { get; set; }
        public int UserId { get; set; }
        public User User { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public string FormattedCreatedDate => CreatedAt.ToString("MMMM dd, yyyy");
        public string FormattedUpdatedDate => UpdatedAt.ToString("MMMM dd, yyyy");
    }
}