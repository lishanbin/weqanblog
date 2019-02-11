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
        public static DbConnection GetOpenConnection()
        {
            var connection = new SqlConnection(@"Data Source=.;Initial Catalog=blogcore;User ID=sa;Password=lsb@1972");
            connection.Open();

            return connection;
        }
    }
}
