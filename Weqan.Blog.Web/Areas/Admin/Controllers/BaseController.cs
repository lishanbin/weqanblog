using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Weqan.Blog.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class BaseController : Controller
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (HttpContext.Session.GetInt32("adminid")==null)
            {
                var con = new ContentResult();

                string r = "登录超时，请重新登录！";
                con.Content = $"<script>alert('{r}');parent.location.href='/Admin/Login'</script>";
                con.ContentType = "text/html;charset=utf-8";

                context.Result = con;
            }

            base.OnActionExecuting(context);
        }
    }
}