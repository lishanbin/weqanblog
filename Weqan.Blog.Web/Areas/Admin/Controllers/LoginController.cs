using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
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
        public IActionResult Index(string UserName,string Password)
        {
            UserName = Tool.GetSafeSQL(UserName);
            Password = Tool.MD5Hash(Password);

            Model.Admin a = new DAL.AdminDAL().Login(UserName, Password);
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