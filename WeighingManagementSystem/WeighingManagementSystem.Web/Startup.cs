using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(OANTech.Web.Startup))]
namespace OANTech.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
