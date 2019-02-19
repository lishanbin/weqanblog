using Microsoft.AspNetCore.Mvc;

namespace Weqan.Blog.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly DAL.CategoryDAL cadal;
        private readonly DAL.BlogDAL bdal;

        public HomeController(DAL.CategoryDAL cadal,DAL.BlogDAL bdal)
        {
            this.cadal = cadal;
            this.bdal = bdal;
        }

        public IActionResult Index(string key,string month,string cabh)
        {
            ViewBag.blogdal = bdal;

            ViewBag.calist = cadal.GetList("");
            ViewBag.blogmonth = bdal.GetBlogMonth();

            ViewBag.search_key = key;
            ViewBag.search_month = month;
            ViewBag.search_cabh = cabh;
                       
            return View();
        }


    }
}
