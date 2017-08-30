using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.UI;

namespace SimbahanApp
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkID=303951
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
                            "~/Scripts/WebForms/WebForms.js",
                            "~/Scripts/WebForms/WebUIValidation.js",
                            "~/Scripts/WebForms/MenuStandards.js",
                            "~/Scripts/WebForms/Focus.js",
                            "~/Scripts/WebForms/GridView.js",
                            "~/Scripts/WebForms/DetailsView.js",
                            "~/Scripts/WebForms/TreeView.js",
                            "~/Scripts/WebForms/WebParts.js"));

            bundles.Add(new ScriptBundle("~/bundles/jquery/ui").Include(
                            "~/Scripts/jquery/ui/accordion.mine899.js",
                            "~/Scripts/jquery/ui/autocomplete.mine899.js",
                            "~/Scripts/jquery/ui/core.mine899.js",
                            "~/Scripts/jquery/ui/datepicker.mine899.js",
                            "~/Scripts/jquery/ui/menu.mine899.js",
                            "~/Scripts/jquery/ui/mouse.mine899.js",
                            "~/Scripts/jquery/ui/position.mine899.js",
                            "~/Scripts/jquery/ui/sortable.mine899.js",
                            "~/Scripts/jquery/ui/tabs.mine899.js",
                            "~/Scripts/jquery/ui/widget.mine899.js"));

            bundles.Add(new ScriptBundle("~/bundles/js/dist").Include(
                            "~/Scripts/js/dist/js_composer_front.min972f.js"));

            bundles.Add(new ScriptBundle("~/bundles/js").Include(
                            "~/Scripts/js/backbone.min9632.js",
                            "~/Scripts/js/comment-reply.mine100.js",
                            "~/Scripts/js/eldt-login.js",
                            "~/Scripts/js/js_composer_front.min972f.js",
                            "~/Scripts/js/like.min5152.js",
                            "~/Scripts/js/listings.mine100.js",
                            "~/Scripts/js/media-audiovideo.mine100.js",
                            "~/Scripts/js/media-editor.mine100.js",
                            "~/Scripts/js/media-models.mine100.js",
                            "~/Scripts/js/media-views.mine100.js",
                            "~/Scripts/js/mediaelement-and-player.min51cd.js",
                            "~/Scripts/js/modules.mine100.js",
                            "~/Scripts/js/shortcode.mine100.js",
                            "~/Scripts/js/smoothPageScrolle100.js",
                            "~/Scripts/js/third-party.mine100.js",
                            "~/Scripts/js/underscore.min4511.js",
                            "~/Scripts/js/utils.mine100.js",
                            "~/Scripts/js/wp-a11y.mine100.js",
                            "~/Scripts/js/wp-backbone.mine100.js",
                            "~/Scripts/js/wp-embed.mine100.js",
                            "~/Scripts/js/wp-mediaelement.mine100.js",
                            "~/Scripts/js/wp-util.mine100.js"));

            bundles.Add(new ScriptBundle("~/bundles/js/phpupload").Include(
                            "~/Scripts/js/phpupload/phpupload.full.mincc91.js",
                            "~/Scripts/js/phpupload/wp-phpupload.mine100.js"));

            // Order is very important for these files to work, they have explicit dependencies
            bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include(
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                    "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

            // Use the Development version of Modernizr to develop with and learn from. Then, when you’re
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                            "~/Scripts/modernizr-*"));

            ScriptManager.ScriptResourceMapping.AddDefinition(
                "respond",
                new ScriptResourceDefinition
                {
                    Path = "~/Scripts/respond.min.js",
                    DebugPath = "~/Scripts/respond.js",
                });
        }
    }
}