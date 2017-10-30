using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace SimbahanApp.Components
{
    public class Carousel : IComponent
    {
        private List<string> Indicators;
        private List<string> Images;

        public Carousel()
        {
            Indicators = new List<string>();
            Images = new List<string>();
        }

        public void AddImage(int id, string imagePath)
        {
            AddIndicator(id);
            AddImageItem(id, imagePath);
        }

        public string ToHtml()
        {
            string indicators = "";
            foreach (string indicator in Indicators)
            {
                indicators += indicator;
            }

            string images = "";
            foreach (string image in Images)
            {
                images += image;
            }

            return
                CarouselMain() +
                    IndicatorMain() +
                        indicators +
                    ClosingOl() +
                    CarouselInner() +
                        images +
                    ClosingDiv() +
                    PreviousButton() +
                    NextButton() +
                ClosingDiv();
        }

        private string CarouselMain()
        {
            return "<div id=\"myCarousel\" class=\"carousel slide\" data-ride=\"carousel\">";
        }

        private string IndicatorMain()
        {
            return "<ol class=\"carousel-indicators\">";
        }

        private string PreviousButton()
        {
            return "<a class=\"left carousel-control\" href=\"#myCarousel\" data-slide=\"prev\">" +
                    "<span class=\"glyphicon glyphicon-chevron-left\"></span>" +
                    "<span class=\"sr-only\">Previous</span>" +
                  "</a>";
        }
        private string NextButton()
        {
            return " <a class=\"right carousel-control\" href=\"#myCarousel\" data-slide=\"next\">" +
                    "<span class=\"glyphicon glyphicon-chevron-right\"></span>" +
                    "<span class=\"sr-only\">Next</span>" +
                  "</a>";
        }
        private void AddIndicator(int id)
        {
            var activeClass = "";
            if (id == 0)
                activeClass = "active";

            Indicators.Add("<li data-target=\"#myCarousel\" data-slide-to=\"" + id + "\" class=\"" + activeClass + "\"></li>");
        }

        private void AddImageItem(int id, string image)
        {
            var activeClass = "item";
            if (id == 0)
                activeClass = "item active";
            
            var imagepath = "http://" + HttpContext.Current.Request.Url.Host + @"\Images\Photos\" + image;

            Images.Add("<div class=\"" + activeClass + "\"><img src=\""+ imagepath +"\"/></div>");
        }

        private string CarouselInner()
        {
            return "<div class=\"carousel-inner\">";
        }

        private string ClosingDiv()
        {
            return "</div>";
        }

        private string ClosingOl()
        {
            return "</ol>";
        }
    }
}