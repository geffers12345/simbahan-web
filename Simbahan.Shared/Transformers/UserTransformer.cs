using Simbahan.Models;

namespace Simbahan.Transformers
{
    public class UserTransformer : Transformer<User>
    {
        protected override User Parse()
        {
            return new User
            {
                Id = ToInt(RegID),
                FirstName = FirstName.ToString(),
                LastName = LastName.ToString(),
                Email = EmailAddress.ToString(),
                DateOfBirth = Birthday.ToString(),
                Gender = Gender.ToString(),
                DateRegistered = ToDateTime(DateRegistered)
            };
        }

        #region Private Properties

        /// <summary>
        ///     Property that represents the column RegID from data layer.
        /// </summary>
        private object RegID { get; set; }

        /// <summary>
        ///     Property that represents the column FirstName from data layer.
        /// </summary>
        private object FirstName { get; set; }

        /// <summary>
        ///     Property that represents the column LastName from data layer.
        /// </summary>
        private object LastName { get; set; }

        /// <summary>
        ///     Property that represents the column Email from data layer.
        /// </summary>
        private object EmailAddress { get; set; }

        /// <summary>
        ///     Property that represents the column Gender from data layer.
        /// </summary>
        private object Gender { get; set; }

        /// <summary>
        ///     Property that represents the column Birthday from data layer.
        /// </summary>
        private object Birthday { get; set; }

        /// <summary>
        ///     Property that represents the column DateRegistered from data layer.
        /// </summary>
        private object DateRegistered { get; set; }

        #endregion
    }
}