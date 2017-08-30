using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SimbahanApp.Components
{
    public class Pagination : IComponent
    {
        public int TotalCount { get; set; }
        public int PerPage { get; set; }
        public int CurrentPage { get; set; }
        public int FirstPage { get; set; }
        public int LastPage { get; set; }
        public Pagination(int totalCount, int perPage, int currentPage = 1)
        {
            TotalCount = totalCount;
            PerPage = perPage;
            CurrentPage = currentPage;

            FirstPage = 1;
            LastPage = getLastPage();
        }

        private int getLastPage()
        {
            return (TotalCount - 1) / PerPage + 1;
        }

        public string ToHtml()
        {
            string pagination = "<ul class=\"pagination\" id=\"churchPagination\">";

            pagination += (new PaginationButton("<a href=\"#\">«</a>", CurrentPage == FirstPage)).ToHtml();

            pagination += (new PaginationButton(CurrentPage.ToString(), false, true)).ToHtml();

            pagination += (new PaginationButton("<a href=\"#\">»</a>", CurrentPage == LastPage)).ToHtml();

            pagination += "</ul>";

            return  "<ul class=\"pagination\" id=\"churchPagination\">" +
                        "<li class=\"disabled\"><a href=\"#\">«</a></li>" +
                        "<li class=\"active\"><a>1 <span class=\"sr-only\">(current)</span></a></li>" +
                        "<li><a href=\"#\">2</a></li>" +
                        "<li><a href=\"#\">3</a></li>" +
                        "<li class=\"disabled\"><a>...<span class=\"sr-only\">(current)</span></a></li>" +
                        "<li><a href=\"#\">" + LastPage + "</a></li>" +
                        "<li>< a href=\"#\">»</a></li>" +
                    "</ul>";
        }
    }
}