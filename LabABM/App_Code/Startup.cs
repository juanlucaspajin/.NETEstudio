using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LabABM.Startup))]
namespace LabABM
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
