using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Weqan.Blog.Model;

namespace Weqan.Blog.DAL
{
    public class AdminDAL
    {
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public Admin Login(string userName, string password)
        {
            string sql = "select * from Admin where UserName=@username and Password=@password";
            using (var connection=ConnectionFactory.GetOpenConnection())
            {
                var m = connection.Query<Model.Admin>(sql, new { username = userName, password = password }).FirstOrDefault();
                return m;
            }
        }
    }
}
