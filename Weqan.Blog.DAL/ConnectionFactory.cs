using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Data.SqlClient;
using System.Text;

namespace Weqan.Blog.DAL
{
    /// <summary>
    /// 数据库连接工厂
    /// </summary>
    public class ConnectionFactory
    {
        /// <summary>
        /// 取数据库连接
        /// </summary>
        /// <param name="connStr">数据库连接字符串</param>
        /// <returns></returns>
        public static DbConnection GetOpenConnection(string connStr)
        {
            var connection = new SqlConnection(connStr);
            connection.Open();

            return connection;
        }
    }
}
