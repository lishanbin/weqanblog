using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IO;
using System.Net.Http.Headers;

namespace Weqan.Blog.Web.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HomeController : Controller
    {
        private readonly IHostingEnvironment hostingEnv;

        public HomeController(IHostingEnvironment env)
        {
            this.hostingEnv = env;
        }


        public IActionResult Index()
        {
            int? adminid = HttpContext.Session.GetInt32("adminid");
            if (adminid==null)
            {
                //未登录
                return Redirect("/Admin/Login");
            }

            return View();
        }

        public IActionResult Top()
        {
            return View();
        }

        public IActionResult Left()
        {
            return View();
        }

        public IActionResult Welcome()
        {
            return View();
        }

        /// <summary>
        /// layui编辑器里的上传图片功能
        /// </summary>
        /// <returns></returns>
        ///   {
        //  "code": 0 //0表示成功，其它失败
        //  ,"msg": "" //提示信息 //一般上传失败后返回
        //  ,"data": {
        //    "src": "图片路径"
        //    ,"title": "图片名称" //可选
        //  }
        //}
        public IActionResult ImgUpload()
        {
            var imgFile = Request.Form.Files[0];
            if (imgFile != null && !string.IsNullOrEmpty(imgFile.FileName))
            {
                long size = 0;
                string tempname = "";
                var filename = ContentDispositionHeaderValue.Parse(imgFile.ContentDisposition).FileName.Trim('"');
                var extname = filename.Substring(filename.LastIndexOf("."), filename.Length - filename.LastIndexOf("."));//扩展名,如.jpg

                #region 判断后缀
                if (!extname.ToLower().Contains("jpg") || !extname.ToLower().Contains("png") || !extname.ToLower().Contains("gif"))
                {
                    return Json(new { code = 1, msg = "只允许上传jpg,png,gif格式的图片。" });
                }

                #endregion
                #region 判断大小
                long mb = imgFile.Length / 1024 / 1024;  //MB
                if (mb > 5)
                {
                    return Json(new { code = 1, msg = "只允许上传 5MB 的图片。" });
                }
                #endregion


                var filename1 = System.Guid.NewGuid().ToString().Substring(0, 6) + extname;
                tempname = filename1;

                var path = hostingEnv.WebRootPath;
                string dir = DateTime.Now.ToString("yyyyMMdd");
                if (!System.IO.Directory.Exists(hostingEnv.WebRootPath + $@"\upload\{dir}"))
                {
                    System.IO.Directory.CreateDirectory(hostingEnv.WebRootPath + $@"\upload\{dir}");
                }
                filename = hostingEnv.WebRootPath + $@"\upload\{dir}\{filename1}";
                size += imgFile.Length;
                using (FileStream fs = System.IO.File.Create(filename))
                {
                    imgFile.CopyTo(fs);
                    fs.Flush();
                }

                return Json(new { code = 0, msg = "上传成功", data = new { src = $"/upload/{dir}/{filename1}", title = filename } });
            }

            return Json(new { code = 1, msg = "上传失败" });


        }

    }
}