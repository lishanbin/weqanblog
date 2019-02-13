using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Weqan.Blog.Web.Controllers
{
    public class BlogController : Controller
    {
        DAL.BlogDAL dal = new DAL.BlogDAL();

        /// <summary>
        /// 取博客总记录数
        /// </summary>
        /// <returns></returns>
        public IActionResult GetTotalCount()
        {
            int totalcount = dal.CalcCount("");
            return Content(totalcount.ToString());
        }

        /// <summary>
        /// 取分页数据，返回JSON
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <returns></returns>
        public IActionResult List(int pageindex, int pagesize)
        {
            List<Model.Blog> list = dal.GetList("Sort asc,Id desc", pagesize, pageindex, "");
            ArrayList arr = new ArrayList();
            foreach (var item in list)
            {
                arr.Add(new
                {
                    id = item.Id,
                    title = item.Title,
                    createDate = item.CreateDate.ToString("yyyy-MM-dd HH:mm"),
                    caName
 = item.CaName,
                    desc =Tool.ReplaceHtmlTag(item.Body,66) 
                });
            }

            return Json(arr);
        }

        /// <summary>
        /// 显示博客
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IActionResult Show(int id)
        {
            Model.Blog b = dal.GetModel(id);
            if (b==null)
            {
                return Content("找不到该博客！");
            }
            return View(b);
        }
    }
}