using Microsoft.AspNetCore.Mvc;

namespace Weqan.Blog.Web.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            ViewBag.calist = new DAL.CategoryDAL().GetList("");
            ViewBag.blogmonth = new DAL.BlogDAL().GetBlogMonth();
            return View();
        }


    }
}
