using Data.Core;
using Data.Core.ISecurity;
using Mvc.Core.Controllers;
using Mvc.Core.Mappers;
//using Omu.Encrypto;
using SwamiXitiz.Data.Models;
using SwamiXitiz.Service;
using YogiApekshit.Models;

namespace YogiApekshit
{
    public class WindsorConfigurator
    {
        public static void Configure()
        {
            WindsorRegistrar.Register(typeof(IFormsAuthentication), typeof(FormAuthService));

            WindsorRegistrar.RegisterAllFromAssemblies("Data.Core");
            WindsorRegistrar.RegisterAllFromAssemblies("Repository.Core");
            WindsorRegistrar.RegisterAllFromAssemblies("Mvc.Core");

            WindsorRegistrar.RegisterAllFromAssemblies("SwamiXitiz.Data");
            WindsorRegistrar.RegisterAllFromAssemblies("SwamiXitiz.Service");
            WindsorRegistrar.RegisterAllFromAssemblies("YogiApekshit");
        }
    }
}