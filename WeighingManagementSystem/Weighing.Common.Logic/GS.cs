using OanTech.Framework.OanTechHelper;
using Weighing.Entities;
using Weighing.Common.Models;

namespace Weighing.Common.Logic
{
    public static class GS
    {
        public static string GetValue(string GSCode)
        {
            OanTechHelper entCommon = new OanTechHelper(MyEntities.Common);
            GeneralSetting value = entCommon.Resolve<GeneralSetting>().Get(x=> x.GSCode == GSCode);
            return value.GSValue.ToString();
        }
    }
}
