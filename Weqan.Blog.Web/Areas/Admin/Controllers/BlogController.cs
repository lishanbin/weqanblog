using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace Weqan.Blog.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class BlogController : Controller
    {
        DAL.BlogDAL dal = new DAL.BlogDAL();
        DAL.CategoryDAL cadal = new DAL.CategoryDAL();
        public IActionResult Index()
        {
            List<Model.Blog> list = dal.GetList("");
            return View(list);
        }

        public IActionResult Add(int? id)
        {
            ViewBag.calist = cadal.GetList("");
            Model.Blog m = new Model.Blog();
            if (id!=null)
            {
                m = dal.GetModel(id.Value);
            }
            return View(m);
        }

        [HttpPost]
        public IActionResult Add(Model.Blog m)
        {
            Model.Category ca = cadal.GetModelByBh(m.CaBh);
            if (ca!=null)
            {
                m.CaName = ca.CaName;
            }

            if (m.Id==0)
            {
                //新增
                dal.Insert(m);
            }
            else
            {
                //修改
                dal.Update(m);
            }
            return Redirect("/Admin/Blog/Index");
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IActionResult Delete(int id)
        {
            dal.Delete(id);
            return Redirect("/Admin/Blog/Index");
        }



    }
}