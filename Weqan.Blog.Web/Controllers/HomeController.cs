using Microsoft.AspNetCore.Mvc;

namespace Weqan.Blog.Web.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index(string key,string month,string cabh)
        {
            ViewBag.calist = new DAL.CategoryDAL().GetList("");
            ViewBag.blogmonth = new DAL.BlogDAL().GetBlogMonth();

            ViewBag.search_key = key;
            ViewBag.search_month = month;
            ViewBag.search_cabh = cabh;
                       
            return View();
        }


    }
}
