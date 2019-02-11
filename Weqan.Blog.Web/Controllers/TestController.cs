using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using Weqan.Blog.DAL;
using Weqan.Blog.Model;

namespace Weqan.Blog.Web.Controllers
{
    public class TestController : Controller
    {
        public IActionResult Index()
        {
            string str = "";
            CategoryDAL cadal = new CategoryDAL();
            str += "新增的分类返回的ID值：" + cadal.Insert(new Category() { CaName="NewCa",Bh="1221",Pbh="0"})+"<br/>";

            bool b = cadal.Delete(7);
            str += "删除ID=7的数据的值：" + b;

            Category ca = cadal.GetModel(8);
            if (ca!=null)
            {
                ca.CaName = "World";
                bool b2= cadal.Update(ca);
                str += "修改ID=8的实体类的结果：" + b2;
            }

            List<Category> list = cadal.GetList("");
            foreach (var item in list)
            {
                str += "<div>"+item.CaName+"</div>";
            }



            return Content(str);
        }
    }
}