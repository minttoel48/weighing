using OanTech.Framework.OanTechHelper;
using OanTech.Paging;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Weighing.App.Web.Helper;
using Weighing.App.Web.ViewModels;
using Weighing.Entities;
using Weighing.Terminal.Models;
using Weighing.Setting.Logic;
using Weighing.Setting.Models;
using OanTech.Common;
using System.Collections.ObjectModel;

namespace Weighing.App.Web.Controllers
{
    public class TerminalConfigurationController : Controller
    {
        // GET: GeneralSetting
        OanTechHelper ent = new OanTechHelper(MyEntities.Terminal);
        OanTechHelper entS = new OanTechHelper(MyEntities.Setting);
        GeneralSettingLogic objSetting = new GeneralSettingLogic();

        [SessionAuthorize]
        public ViewResult Index(int? page, string filter, string cFilter, string sortKey, string sortDir, string cSortDir)
        {
            //DEFAULT
            if (sortKey == null && sortDir == null)
            {
                sortKey = ViewBag.SortKey = "TerminalId";                                               //yang harus diisi
                sortDir = "ASC";
            }

            //Page
            page = filter == null ? page : 1;
            int pageNumber = page ?? 1;
            int pageSize = 5;                                                                       //yang harus diisi

            //NEW OR CURRENT --> FILTER & SORT
            filter = filter == null ? cFilter : filter;
            sortDir = sortDir == null ? cSortDir : sortDir;

            //QUERY
            var query = from a in ent.Resolve<TerminalConfiguration>().AsQueryable()                       //yang harus dibikin
                        select new
                        {
                           TerminalId = a.TerminalId,
                           TerminalCategory = a.TerminalCategory,
                           TerminalGroup = a.TerminalGroup,
                            TerminalDescription = a.TerminalDescription,
                            TerminalLocation = a.TerminalLocation,
                            IsAllergen = a.IsAllergen,
                            IsActive = a.IsActive
                        };

            //CUSTOM FILTER
            if (!string.IsNullOrEmpty(filter))
            {
                query = query.Where(x => x.TerminalCategory.Contains(filter) || x.TerminalLocation.Contains(filter));           //yang harus ditentukan
            }

            //ORDER BY & TOOGLE SORT DIRECTION
            query = query.OrderByField(sortKey, sortDir == "ASC" ? true : false);

            //GET PAGING
            var pagingResult = query.ToPaging(pageNumber, pageSize);

            //Map to VIEW MODEL
            TerminalConfigurationViewPaging pagingList = new TerminalConfigurationViewPaging();
            pagingList.Paging = pagingResult;
            pagingList.Data = new List<TerminalConfigurationViewModel>();

            foreach (var item in pagingResult)
            {
                TerminalConfigurationViewModel data = new TerminalConfigurationViewModel();
                data.TerminalId = item.TerminalId;
                data.TerminalCategory = item.TerminalCategory;
                data.TerminalDescription = item.TerminalDescription;
                data.TerminalGroup = item.TerminalGroup;
                data.TerminalLocation = item.TerminalLocation;
                data.IsAllergen = item.IsAllergen;
                data.IsActive = item.IsActive;
                pagingList.Data.Add(data);
            }


            //Ga usah dirubah
            ViewBag.cSortDir = sortDir; //buat jaga kondisi sort 
            ViewBag.SortDir = sortDir == "ASC" ? "DESC" : "ASC";  //buat bolak balikin (Toogle)
            ViewBag.SortKey = sortKey;
            ViewBag.cFilter = filter;


            ViewBag.FormName = "Terminal Configuration";
            return View(pagingList);
        }

        [SessionAuthorize]
        public ActionResult Create()
        {

            ViewBag.FormName = "Terminal Configuration";
            ViewBag.FormDescription = "Ini form description";
            ViewBag.TerminalId = GetListTerminal();
            //ViewBag.TerminalCategory = new SelectList(objSetting.GetListTerminalCategory(), "GSKey", "GSValue");
            //ViewBag.TerminalGroup = new SelectList(objSetting.GetListTerminalGroup(), "GSKey", "GSValue");
            return View("Create");
        }

        private IEnumerable<SelectListItem> GetListTerminal()
        {
            Collection<SelectListItem> list = new Collection<SelectListItem>();
            var data = objSetting.GetListTerminalId();

            foreach (var item in data)
            {
                list.Add(new SelectListItem() { Text = item.GSValue, Value = item.GSKey });
            }
            return list.OrderBy(x => x.Text);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(TerminalConfigurationViewModel model, string submit)
        {
            if (ModelState.IsValid)
            {
                //taruh logic Insert disini,
                TerminalConfiguration entSave = new TerminalConfiguration();
                entSave.TerminalId = model.TerminalId;
                entSave.TerminalCategory = model.TerminalCategory;
                entSave.TerminalGroup = model.TerminalGroup;
                entSave.TerminalDescription = model.TerminalDescription;
                entSave.TerminalLocation = model.TerminalLocation;
                entSave.IsAllergen = model.IsAllergen;
                entSave.IsActive = model.IsActive;
                ent.Resolve<TerminalConfiguration>().Add(entSave);
                ent.Save();
                return RedirectToAction("Index");
            }

            ViewBag.FormName = "Terminal Configuration";
            return View(model);
        }
    }
}