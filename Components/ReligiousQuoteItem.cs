using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SimbahanApp.Models;

namespace SimbahanApp.Components
{
    public class ReligiousQuoteItem : IComponent
    {
        private ReligiousQuote ReligiousQuote;

        public ReligiousQuoteItem(ReligiousQuote religiousQuote)
        {
            ReligiousQuote = religiousQuote;
        }

        public string ToHtml()
        {
            return "<div><p></p><div><div class=\"tqquote\">" + ReligiousQuote.Quote +
                   "</div></div></div><div class=\"authors\"><p id=\"BibleVerse\" class=\"tqauthor\"> - " +
                   ReligiousQuote.Author + "</p></div>";
        }
    }
}