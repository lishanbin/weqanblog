using Dapper;
using System.Collections.Generic;
using System.Linq;

namespace Weqan.Blog.DAL
{
    public class BlogDAL
    {
        /// <summary>
        /// 新增
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public int Insert(Model.Blog bo)
        {
            using (var connection = ConnectionFactory.GetOpenConnection())
            {
                int resid = connection.Query<int>(@"INSERT INTO Blog(Title,Body,Body_md,VisitNum,CaBh,CaName,Remark,Sort) VALUES(@Title,@Body,@Body_md,@VisitNum,@CaBh,@CaName,@Remark,@Sort);SELECT @@IDENTITY;", bo).FirstOrDefault();
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
                int res = connection.Execute(@"DELETE FROM Blog WHERE Id=@Id", new { Id = id });
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
        public List<Model.Blog> GetList(string cond)
        {
            using (var connection = ConnectionFactory.GetOpenConnection())
            {
                string sql = "SELECT * FROM Blog";
                if (!string.IsNullOrEmpty(cond))
                {
                    sql += $" where {cond}";
                }
                var list = connection.Query<Model.Blog>(sql).ToList();
                return list;
            }
        }

        /// <summary>
        /// 获取实体类
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Model.Blog GetModel(int id)
        {
            using (var connection = ConnectionFactory.GetOpenConnection())
            {
                var m = connection.Query<Model.Blog>("select * from Blog where Id=@Id", new { Id = id }).FirstOrDefault();
                return m;
            }
        }

        /// <summary>
        /// 修改
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public bool Update(Model.Blog bo)
        {
            using (var connection = ConnectionFactory.GetOpenConnection())
            {
                int res = connection.Execute(@"UPDATE Blog SET Title=@Title,Body=@Body,Body_md=@Body_md,VisitNum=@VisitNum,CaBh=@CaBh,CaName=@CaName,Remark=@Remark,Sort=@Sort WHERE Id=@Id", bo);
                if (res > 0)
                {
                    return true;
                }
                return false;
            }
        }


    }
}
