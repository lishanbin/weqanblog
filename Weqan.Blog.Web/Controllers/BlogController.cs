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
        private readonly DAL.BlogDAL dal;
        private readonly DAL.CategoryDAL cadal;

        public BlogController(DAL.BlogDAL bdal,DAL.CategoryDAL cadal)
        {
            this.dal = bdal;
            this.cadal = cadal;
        }

        /// <summary>
        /// 取博客记录数
        /// </summary>
        /// <returns></returns>
        public IActionResult GetTotalCount(string key,string month,string cabh)
        {
            int totalcount = dal.CalcCount(GetCond(key,month,cabh));
            return Content(totalcount.ToString());
        }
        /// <summary>
        /// 拼接条件
        /// </summary>
        /// <param name="key"></param>
        /// <param name="month"></param>
        /// <param name="cabh"></param>
        /// <returns></returns>
        private string GetCond(string key, string month, string cabh)
        {
            string cond = "1=1";
            if (!string.IsNullOrEmpty(key))
            {
                key = Tool.GetSafeSQL(key);
                cond += $" and Title like '%{key}%'";
            }
            if (!string.IsNullOrEmpty(month))
            {
                DateTime d;
                if (DateTime.TryParse(month+"-01",out d))
                {
                    cond += $" and CreateDate>='{d.ToString("yyyy-MM-dd")}' and CreateDate<'{d.AddMonths(1).ToString("yyyy-MM-dd")}'";
                }
            }

            if (!string.IsNullOrEmpty(cabh))
            {
                cabh = Tool.GetSafeSQL(cabh);
                cond += $" and cabh='{cabh}'";
            }

            return cond;

        }

        /// <summary>
        /// 取分页数据，返回JSON
        /// </summary>
        /// <param name="pageindex"></param>
        /// <param name="pagesize"></param>
        /// <returns></returns>
        public IActionResult List(int pageindex, int pagesize,string key,string month,string cabh)
        {
            List<Model.Blog> list = dal.GetList("Sort asc,Id desc", pagesize, pageindex, GetCond(key,month,cabh));
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
            ViewBag.bdal = dal;

            ViewBag.calist = cadal.GetList("");
            ViewBag.blogmonth = dal.GetBlogMonth();
            
            Model.Blog b = dal.GetModel(id);
            if (b==null)
            {
                return Content("找不到该博客！");
            }
            return View(b);
        }
    }
}