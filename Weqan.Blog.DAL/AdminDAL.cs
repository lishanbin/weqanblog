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
        /// 数据库连接字符串，从web层传入
        /// </summary>
        public string ConnStr { get; set; }


        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public int Insert(Model.Admin m)
        {
            using (var connection=ConnectionFactory.GetOpenConnection(ConnStr))
            {
                int resid = connection.Query<int>(@"INSERT INTO Admin(username,password) values(@username,@password);SELECT @@IDENTITY;", m).FirstOrDefault();
                return resid;
            }
        }

        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public Admin Login(string userName, string password)
        {
            string sql = "select * from Admin where UserName=@username and Password=@password";
            using (var connection=ConnectionFactory.GetOpenConnection(ConnStr))
            {
                var m = connection.Query<Model.Admin>(sql, new { username = userName, password = password }).FirstOrDefault();
                return m;
            }
        }

        /// <summary>
        /// 获取实体类
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Admin GetModel(int id)
        {
            using (var connection=ConnectionFactory.GetOpenConnection(ConnStr))
            {
                var m = connection.Query<Model.Admin>("select * from Admin where Id=@id", new { id = id }).FirstOrDefault();
                return m;
            }
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="password"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool UpdatePwd(string password, int id)
        {
            using (var connection=ConnectionFactory.GetOpenConnection(ConnStr))
            {
                int res = connection.Execute(@"update Admin set Password=@password where Id=@id", new { password = password, id = id });

                if (res>0)
                {
                    return true;
                }
                return false;
            }
        }
    }
}
