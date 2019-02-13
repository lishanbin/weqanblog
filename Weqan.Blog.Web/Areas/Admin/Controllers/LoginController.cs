using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Weqan.Blog.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Index(string userName,string password)
        {
            userName = Tool.GetSafeSQL(userName);
            password = Tool.MD5Hash(password);

            Model.Admin a = new DAL.AdminDAL().Login(userName, password);
            if (a==null)
            {
                return Content("登录失败，用户名或者密码出错！");
            }

            HttpContext.Session.SetString("adminusername", a.UserName);
            HttpContext.Session.SetInt32("adminid", a.Id);

            return Redirect("/Admin/Home/Index");
        }







    }
}