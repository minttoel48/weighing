using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Weighing.App.Web.Startup))]
namespace Weighing.App.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
