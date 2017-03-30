using AccountManagement.Models;
using AutoMapper;
using OanTech.Framework.OanTechHelper;
using OanTech.Paging;
using OANTech.Web.ViewModel;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace OANTech.Web.Controllers
{
    public class TemplateController : Controller
    {
        OanTechHelper ent = new OanTechHelper(MyEntities.AccountManagement);
        // GET: Template
        public ActionResult InputOneColumn()
        {
            return View();
        }

        public ViewResult DataTable(int? page, string filter, string cFilter, string sortKey, string sortDir, string cSortDir)
        {
            



            ////PAGING DENGAN 1 Model

            ////Default Sort
            //if (sortKey == null && sortDir == null)
            //{
            //    sortKey = ViewBag.SortKey = "RoleName";
            //    sortDir = "ASC";
            //}

            ////Page, Filter & Sort Dir
            //page = filter == null ? page : 1;
            //int pageNumber = page ?? 1;
            //int pageSize = 5;

            //filter = filter == null ? cFilter : filter;
            //sortDir = sortDir == null ? cSortDir : sortDir;

            ////Query
            //var dataResult = ent.Resolve<Role>().GetQueryableQuery();
            //if (!String.IsNullOrEmpty(filter))
            //{
            //    dataResult = ent.Resolve<Role>().GetQueryableQuery().Where(x => x.RoleName.Contains(filter));
            //}

            ////Order by
            //dataResult = dataResult.OrderByField(sortKey, sortDir == "ASC" ? true : false);

            //ViewBag.cSortDir = sortDir; //buat jaga kondisi sort 
            //ViewBag.SortDir = sortDir == "ASC" ? "DESC" : "ASC";  //buat bolak balikin (Toogle)
            //ViewBag.SortKey = sortKey;
            //ViewBag.cFilter = filter;

            //return View(dataResult.ToPaging(pageNumber, pageSize));




            //DEFAULT
            if (sortKey == null && sortDir == null)
            {
                sortKey = ViewBag.SortKey = "RoleName";
                sortDir = "ASC";
            }

            //Page
            page = filter == null ? page : 1;
            int pageNumber = page ?? 1;
            int pageSize = 5;

            //NEW OR CURRENT --> FILTER & SORT
            filter = filter == null ? cFilter : filter;
            sortDir = sortDir == null ? cSortDir : sortDir;

            //QUERY
            var query = from a in ent.Resolve<Role>().AsQueryable()
                        select new
                        {
                            RoleId = a.RoleId,
                            RoleName = a.RoleName,
                            Date = a.DtCrt
                        };

            //CUSTOM FILTER
            if (!string.IsNullOrEmpty(filter))
            {
                query = query.Where(x => x.RoleName.Contains(filter));
            }

            //ORDER BY & TOOGLE SORT DIRECTION
            query = query.OrderByField(sortKey, sortDir == "ASC" ? true : false);

            //GET PAGING
            var pagingResult = query.ToPaging(pageNumber, pageSize);

            //Map to VIEW MODEL
            UserRoleViewPaging pagingList = new UserRoleViewPaging();
            pagingList.Paging = pagingResult;
            pagingList.Data = new List<UserRoleViewModel>();


            //pagingList.Data = pagingResult.Cast<UserRoleViewModel>().ToList();

            //var xx = pagingResult.Select(s => new { RoleId = s.RoleId, RoleName = s.RoleName }).ToList();
            //List<object> data = pagingResult.Cast<object>().ToList();


            //var listFiles = new List<UserRoleViewModel>();
            //listFiles = new BindingList<UserRoleViewModel>(pagingResult);



            ////pagingList.Data = data.ToList();

            ////pagingList.Data = new List<UserRoleViewModel>();

            ////EmployeeViewItem employeeViewItem = Mapper.Map<Employee, Employee>(employee);

            foreach (var item in pagingResult)
            {
                UserRoleViewModel data = new UserRoleViewModel();
                data.RoleId = item.RoleId;
                data.FirstName = item.RoleName;
                data.LastName = item.RoleName;
                data.BirthDate = item.Date;
                data.Email = item.RoleName;
                pagingList.Data.Add(data);
            }

            ViewBag.cSortDir = sortDir; //buat jaga kondisi sort 
            ViewBag.SortDir = sortDir == "ASC" ? "DESC" : "ASC";  //buat bolak balikin (Toogle)
            ViewBag.SortKey = sortKey;
            ViewBag.cFilter = filter;

            return View(pagingList);



            //var queryPaged = query.ToPaging(pageNumber, pageSize);

            //List<UserRoleViewModel> listData = new List<UserRoleViewModel>();
            //foreach (var item in queryPaged)
            //{
            //    UserRoleViewModel data = new UserRoleViewModel();
            //    data.RoleId = item.RoleId;
            //    data.FirstName = item.RoleName;
            //    data.LastName = item.RoleName;
            //    data.BirthDate = item.Date;
            //    data.Email = item.RoleName;
            //    listData.Add(data);
            //}

            //return View(queryPaged);
            //var vm = Mapper.Map<IEnumerable<queryPaged>, IEnumerable<UserRoleViewModel>>(queryPaged.ToArray());

            //datanya.listDataViewModel = query.ToPaging(pageNumber, pageSize).ToList();

            //ViewBag.cSortDir = sortDir; //buat jaga kondisi sort 
            //ViewBag.SortDir = sortDir == "ASC" ? "DESC" : "ASC";  //buat bolak balikin (Toogle)
            //ViewBag.SortKey = sortKey;
            //ViewBag.cFilter = filter;

            //return View(query.ToPaging(pageNumber, pageSize));

            //query = query.OrderByField(sortKey, sortDir == "ASC" ? true : false);

            //List<PagingUserViewModel> listData = new List<PagingUserViewModel>();
            //var result = query.ToPaging(pageNumber, pageSize)

            //PagingUserViewModel data = null;

            //foreach (var item in result)
            //{
            //    data = new PagingUserViewModel();
            //    data.RoleId = int.Parse(item.RoleId.ToString());
            //    data.FirstName = item.FirstName.ToString();
            //    data.LastName = item.LastName.ToString();
            //    data.BirthDate = DateTime.Parse(item.BirthDate.ToString());
            //    data.Email = item.Email.ToString();
            //    listData.Add(data);
            //}
            //return View(listData);
        }
    }
}