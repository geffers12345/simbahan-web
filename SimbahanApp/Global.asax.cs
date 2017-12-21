using System;
using System.ComponentModel.Composition;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Compilation;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.UI;
using SimbahanApp.Services;
using SimpleInjector;
using SimpleInjector.Advanced;
using SimpleInjector.Diagnostics;
using System.Security.Cryptography;
using System.Web.Security;

namespace SimbahanApp
{
    public class Global : HttpApplication
    {
        private static Container container;

        private void Application_Start(object sender, EventArgs e)
        {
            Bootstrap();
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        private void Application_Error(object sender_, EventArgs e)
        {
            Exception exception = Server.GetLastError();
            if(exception is CryptographicException)
            {
                FormsAuthentication.SignOut();
            }
        }

        private static void Bootstrap()
        {
            var container = new Container();

            container.Options.PropertySelectionBehavior = new ImportAttributePropertySelectionBehavior();

            container.Register(typeof(AnnouncementService));

            Global.container = container;

            container.Verify();
        }

        private static void RegisterWebPages(Container container)
        {
            var pageTypes =
                from assembly in BuildManager.GetReferencedAssemblies().Cast<Assembly>()
                where !assembly.IsDynamic
                where !assembly.GlobalAssemblyCache
                from type in assembly.GetExportedTypes()
                where type.IsSubclassOf(typeof(Page))
                where !type.IsAbstract && !type.IsGenericType
                select type;

            foreach (var type in pageTypes)
            {
                var reg = Lifestyle.Transient.CreateRegistration(type, container);

                reg.SuppressDiagnosticWarning(
                    DiagnosticType.DisposableTransientComponent,
                    "ASP.NET creates and disposes page classes for us."
                );

                container.AddRegistration(type, reg);
            }
        }
    }

    public class ImportAttributePropertySelectionBehavior : IPropertySelectionBehavior
    {
        public bool SelectProperty(Type implementationType, PropertyInfo propertyInfo)
        {
            return typeof(Page).IsAssignableFrom(implementationType) &&
                   propertyInfo.GetCustomAttributes<ImportAttribute>().Any();
        }
    }
}