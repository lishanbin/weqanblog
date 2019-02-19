using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Weqan.Blog.Web.Areas.Admin.Controllers
{
    public class AdminController : BaseController
    {
        private readonly DAL.AdminDAL dal;

        public AdminController(DAL.AdminDAL dal)
        {
            this.dal = dal;
        }
        
        public IActionResult ModPwd()
        {
            return View();
        }

        [AutoValidateAntiforgeryToken()]
        [HttpPost]
        public IActionResult ModPwd(string oldpwd,string newpwd,string newpwd2)
        {
            if (string.IsNullOrEmpty(oldpwd)||string.IsNullOrEmpty(newpwd)||string.IsNullOrEmpty(newpwd2))
            {
                return Content("<script>alert('请把修改密码信息填写完整！');location.href='/Admin/Admin/ModPwd';</script>", "text/html;charset=utf-8");
            }
            if (newpwd!=newpwd2)
            {
                return Content("<script>alert('两次密码输入不相同！');location.href='/Admin/Admin/ModPwd';</script>", "text/html;charset=utf-8");
            }

            oldpwd = Tool.MD5Hash(oldpwd);

            int? adminid = HttpContext.Session.GetInt32("adminid");
            if (adminid==null)
            {//未登录
                return Redirect("/Admin/Login");
            }

            Model.Admin a = dal.GetModel(adminid.Value);
            if (a==null)
            {
                return Content("<script>alert('adminid不存在，请联系管理员！');location.href='/Admin/Admin/ModPwd';</script>", "text/html;charset=utf-8");
            }
            if (a.Password!=oldpwd)
            {
                return Content("<script>alert('原密码不正确！');location.href='/Admin/Admin/ModPwd';</script>", "text/html;charset=utf-8");
            }
            a.Password = Tool.MD5Hash(newpwd);
            bool b = dal.UpdatePwd(a.Password, a.Id);

            if (b)
            {
                return Content("<script>alert('修改密码成功！');parent.location.href='/Admin/Login';</script>", "text/html;charset=utf-8");
            }
            else
            {
                return Content("<script>alert('修改密码失败，请联系管理员！');location.href='/Admin/Admin/ModPwd';</script>", "text/html;charset=utf-8");
            }
        }


    }
}