using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using Weqan.Blog.DAL;
using Weqan.Blog.Model;

namespace Weqan.Blog.Web.Controllers
{
    public class TestController : Controller
    {
        private readonly AdminDAL adal;
        //注入
        public TestController(DAL.AdminDAL adal)
        {
            this.adal = adal;
        }

        public IActionResult Index()
        {
            string str = "";
            //Random r = new Random();
            //BlogDAL blogdal = new BlogDAL();
            //CategoryDAL cadal = new CategoryDAL();

            //DAL.AdminDAL adal = new AdminDAL();



            int resid = adal.Insert(new Admin() { UserName = "lishanbin", Password =Tool.MD5Hash("123456") });
            str = "新增admin后返回的值：" + resid;

            //List<Category> list_ca = cadal.GetList("");

            //for (int i = 0; i < 102; i++)
            //{
            //    string title = $"新闻标题{i}";
            //    string body = title + "的内容";
            //    Category ca = list_ca[r.Next(0, list_ca.Count)];
            //    string cabh = ca.Bh, caname = ca.CaName;

            //    blogdal.Insert(new Model.Blog { Title = title, Body = body, VisitNum = r.Next(100, 999), CaBh = cabh, CaName = caname });
            //}
            //str += "添加102条测试新闻成功！";

            #region MyRegion
            //CategoryDAL cadal = new CategoryDAL();
            //str += "新增的分类返回的ID值：" + cadal.Insert(new Category() { CaName="NewCa",Bh="1221",Pbh="0"})+"<br/>";

            //bool b = cadal.Delete(7);
            //str += "删除ID=7的数据的值：" + b;

            //Category ca = cadal.GetModel(8);
            //if (ca!=null)
            //{
            //    ca.CaName = "World";
            //    bool b2= cadal.Update(ca);
            //    str += "修改ID=8的实体类的结果：" + b2;
            //}

            //List<Category> list = cadal.GetList("");
            //foreach (var item in list)
            //{
            //    str += "<div>"+item.CaName+"</div>";
            //}
            #endregion

            return Content(str);
        }
    }
}