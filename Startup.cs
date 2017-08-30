using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SimbahanApp.Startup))]
namespace SimbahanApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
