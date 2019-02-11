using Dapper;
using System.Collections.Generic;
using System.Linq;
using Weqan.Blog.Model;

namespace Weqan.Blog.DAL
{
    /// <summary>
    ///  分类表DAL
    /// </summary>
    public class CategoryDAL
    {
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public int Insert(Category m)
        {
            using (var connection = ConnectionFactory.GetOpenConnection())
            {
                int resid = connection.Query<int>(@"INSERT INTO Category(CaName,Bh,Pbh,Remark) VALUES(@CaName,@Bh,@Pbh,@Remark);SELECT @@IDENTITY;", m).FirstOrDefault();
                return resid;
            }
        }

        /// <summary>
        /// 删除
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public bool Delete(int id)
        {
            using (var connection = ConnectionFactory.GetOpenConnection())
            {
                int res = connection.Execute(@"DELETE FROM Category WHERE Id=@Id", new { Id = id });
                if (res > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }

        /// <summary>
        ///查询 
        /// </summary>
        /// <param name="cond"></param>
        /// <returns></returns>
        public List<Category> GetList(string cond)
        {
            using (var connection=ConnectionFactory.GetOpenConnection())
            {
                string sql = "SELECT * FROM Category";
                if (!string.IsNullOrEmpty(cond))
                {
                    sql += $" where {cond}";
                }
                var list = connection.Query<Category>(sql).ToList();
                return list;
            }
        }

        /// <summary>
        /// 获取实体类
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Category GetModel(int id)
        {
            using (var connection=ConnectionFactory.GetOpenConnection())
            {
                var m = connection.Query<Category>("select * from Category where Id=@Id", new { Id = id }).FirstOrDefault();
                return m;
            }
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public bool Update(Category m)
        {
            using (var connection=ConnectionFactory.GetOpenConnection())
            {
                int res = connection.Execute(@"UPDATE Category SET CaName=@CaName,Bh=@Bh,Pbh=@Pbh,Remark=@Remark WHERE Id=@Id", m);
                if (res>0)
                {
                    return true;
                }
                return false;
            }
        }





    }
}
