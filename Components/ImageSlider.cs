using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace SimbahanApp.Components
{
    public class ImageSlider : IComponent
    {
        public List<string> SlideRadios { get; set; }
        public List<string> PauseRadios { get; set; }
        public List<string> Images { get; set; }
        public List<string> PauseLabels { get; set; }
        public List<string> PreviousLabels { get; set; }
        public List<string> NextLabels { get; set; }

        public string FirstImage { get; set; }

        public ImageSlider()
        {
            SlideRadios = new List<string>();
            PauseRadios = new List<string>();
            Images = new List<string>();
            PauseLabels = new List<string>();
            PreviousLabels = new List<string>();
            NextLabels = new List<string>();
        }

        public void AddImage(int id, string imagePath)
        {
            Images.Add(
                ImageList(id, imagePath)
            );

            SlideRadios.Add(
                SlideRadioButton(id)
            );

            PauseRadios.Add(
                PauseRadioButton(id)
            );

            PauseLabels.Add(
                PauseCS(id)
            );

            PreviousLabels.Add(
                ArrowPreviousCS(id)
            );

            NextLabels.Add(
                ArrowNextCS(id)
            );
        }
        


        private string SlideRadioButton(int id)
        {
            return "<input name=\"cs_anchor1\" id=\"cs_slide1_" + id + "\" type=\"radio\" class=\"cs_anchor slide\">";
        }

        private string PlayRadioButton()
        {
            return "<input name=\"cs_anchor1\" id=\"cs_play1\" type=\"radio\" class=\"cs_anchor\" checked=\"\">";
        }

        private string PauseRadioButton(int id)
        {
            return "<input name=\"cs_anchor1\" id=\"cs_pause1_" + id + "\" type=\"radio\" class=\"cs_anchor pause\">";
        }

        private string ImageList(int id, string imagePath)
        {
            var imagePathAbsolute = (HttpContext.Current.Handler as Page).ResolveUrl(@"Images\Photos\" + imagePath);
            
            return "<li class=\"num" + id + " img slide\"><img src=\"" + imagePathAbsolute + "\" alt=\"\" title=\"\"></li>";
        }

        private string ImageSkeleton(string imagePath)
        {
            var imagePathAbsolute = (HttpContext.Current.Handler as Page).ResolveUrl(@"Images\Photos\" + imagePath);

            return "<li class=\"cs_skeleton\"><img src=\"" + imagePathAbsolute + "\"></li>";
        }

        private string PlayCS()
        {
            return "<label class=\"cs_play\" for=\"cs_play1\"><span><i></i><b></b></span></label>";
        }

        private string PauseCS(int id)
        {
            return "<label class=\"cs_pause num" + id + "\" for=\"cs_pause1_" + id + "\"><span><i></i><b></b></span></label>";
        }

        private string ArrowPreviousCS(int id)
        {
            return "<label class=\"num" + id + "\" for=\"cs_slide1_" + id + "\"><span><i></i><b></b></span></label>";
        }

        private string ArrowNextCS(int id)
        {
            return "<label class=\"num" + id + "\" for=\"cs_slide1_" + id + "\"><span><i></i><b></b></span></label>";
        }

        public string ToHtml()
        {
            return string.Join(" ", SlideRadios)
                + PlayRadioButton()
                + string.Join(" ", PauseRadios)
                + "<ul>"
                + ImageSkeleton(FirstImage)
                + string.Join(" ", Images)
                + "</ul>"
                + "<div class=\"cs_play_pause\">"
                + PlayCS()
                + string.Join(" ", PauseLabels)
                + "</div>"
                + "<div class=\"cs_arrowprev\">"
                + string.Join(" ", PreviousLabels)
                + "</div>"
                + "<div class=\"cs_arrownext\">"
                + string.Join(" ", NextLabels)
                + "</div>";
        }
    }
}