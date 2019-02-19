using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Weqan.Blog.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class LoginController : Controller
    {
        private readonly DAL.AdminDAL adal;

        public LoginController(DAL.AdminDAL adal)
        {
            this.adal = adal;
        }

        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Index(string userName,string password)
        {
            userName = Tool.GetSafeSQL(userName);
            password = Tool.MD5Hash(password);

            Model.Admin a = adal.Login(userName, password);
            if (a==null)
            {
                return Content("<script>alert('登录失败，用户名或者密码出错！');location.href='/Admin/Login';</script>","text/html;charset=utf-8;");
            }

            HttpContext.Session.SetString("adminusername", a.UserName);
            HttpContext.Session.SetInt32("adminid", a.Id);

            return Redirect("/Admin/Home/Index");
        }

        /// <summary>
        /// 退出登录
        /// </summary>
        /// <returns></returns>
        public IActionResult LoginOut()
        {
            HttpContext.Session.Remove("adminusername");
            HttpContext.Session.Remove("adminid");

            return Redirect("/Admin/Login");
        }




    }
}