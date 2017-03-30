using OanTech.Framework.OanTechHelper;
using OanTech.Paging;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Weighing.App.Web.Helper;
using Weighing.App.Web.ViewModels;
using Weighing.Entities;
using Weighing.Setting.Models;
using OanTech.Common;
namespace Weighing.App.Web.Controllers
{
    public class GeneralSettingController : Controller
    {
        // GET: GeneralSetting
        OanTechHelper ent = new OanTechHelper(MyEntities.Setting);

        [SessionAuthorize]
        public ViewResult Index(int? page, string filter, string cFilter, string sortKey, string sortDir, string cSortDir)
        {
            //DEFAULT
            if (sortKey == null && sortDir == null)
            {
                sortKey = ViewBag.SortKey = "GSCode";                                               //yang harus diisi
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
            var query = from a in ent.Resolve<GeneralSetting>().AsQueryable()                       //yang harus dibikin
                        select new
                        {
                            GeneralSettingId = a.GeneralSettingId,
                            GSCode = a.GSCode,
                            GSKey = a.GSKey,
                            GSValue = a.GSValue
                        };

            //CUSTOM FILTER
            if (!string.IsNullOrEmpty(filter))
            {
                query = query.Where(x => x.GSCode.Contains(filter) || x.GSValue.Contains(filter));           //yang harus ditentukan
            }

            //ORDER BY & TOOGLE SORT DIRECTION
            query = query.OrderByField(sortKey, sortDir == "ASC" ? true : false);

            //GET PAGING
            var pagingResult = query.ToPaging(pageNumber, pageSize);

            //Map to VIEW MODEL
            GeneralSettingViewPaging pagingList = new GeneralSettingViewPaging();
            pagingList.Paging = pagingResult;
            pagingList.Data = new List<GeneralSettingViewModel>();

            foreach (var item in pagingResult)
            {
                GeneralSettingViewModel data = new GeneralSettingViewModel();
                data.GeneralSettingId = item.GeneralSettingId;
                data.GSCode = item.GSCode;
                data.GSKey = item.GSKey;
                data.GSValue = item.GSValue;
                pagingList.Data.Add(data);
            }


            //Ga usah dirubah
            ViewBag.cSortDir = sortDir; //buat jaga kondisi sort 
            ViewBag.SortDir = sortDir == "ASC" ? "DESC" : "ASC";  //buat bolak balikin (Toogle)
            ViewBag.SortKey = sortKey;
            ViewBag.cFilter = filter;


            ViewBag.FormName = "General Setting";
            return View(pagingList);
        }

        [SessionAuthorize]
        public ActionResult Create()
        {
            ViewBag.FormName = "INI FORM NAME";
            ViewBag.FormDescription = "Ini form description";
            return View(new GeneralSettingViewModel());
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(GeneralSettingViewModel model, string submit)
        {
            if (ModelState.IsValid)
            {
                //taruh logic Insert disini, 
                return RedirectToAction("Index");
            }

            ViewBag.FormName = "General Setting";
            return View(model);
        }
    }
}