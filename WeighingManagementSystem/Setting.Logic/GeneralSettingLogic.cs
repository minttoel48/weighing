using Weighing.Setting.Models;
using OanTech.Framework;
using OanTech.Framework.OanTechHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Weighing.Entities;

namespace Weighing.Setting.Logic
{
    public class GeneralSettingLogic
    {
        OanTechHelper entTerminal = new OanTechHelper(MyEntities.Setting);
        public List<GeneralSetting> GetListTerminalId()
        {
            List<GeneralSetting> result = entTerminal.Resolve<GeneralSetting>().GetAll(x => x.GSCode == "TERMINAL_ID").ToList();
            return result;
        }

        public List<GeneralSetting> GetListTerminalCategory()
        {
            List<GeneralSetting> result = entTerminal.Resolve<GeneralSetting>().GetAll(x => x.GSCode == "TERMINAL_CATEGORY").ToList();
            return result;
        }

        public List<GeneralSetting> GetListTerminalGroup()
        {
            List<GeneralSetting> result = entTerminal.Resolve<GeneralSetting>().GetAll(x => x.GSCode == "TERMINAL_GROUP").ToList();
            return result;
        }
    }
}
