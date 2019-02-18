using Dapper;
using System;
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
        /// 编号计算
        /// </summary>
        /// <param name="pbh">父编号</param>
        /// <param name="x">每一级编号的位数</param>
        /// <returns></returns>
        public string GenBH(string pbh,int x)
        {
            string sql = "select right(max(bh)," + x + ") from Category where pbh=" + pbh;
            using (var connection=ConnectionFactory.GetOpenConnection())
            {
                string res = connection.ExecuteScalar<string>(sql);
                if (string.IsNullOrEmpty(res))
                {
                    int a = 1;
                    if (pbh!="0")
                    {
                        return pbh + a.ToString("d" + x);
                    }
                    return a.ToString("d" + x);
                }
                else
                {
                    int a = int.Parse(res) + 1;
                    int b = (int)Math.Pow(10, x);
                    if (a>=b)
                    {
                        //return "编号超过限制！";
                        throw new Exception("编号超过限制！");
                    }
                    if (pbh!="0")
                    {
                        return pbh + a.ToString("d" + x);
                    }
                    return a.ToString("d" + x);
                }
            }
        }

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
        /// 根据分类编号取实体类
        /// </summary>
        /// <param name="caBh"></param>
        /// <returns></returns>
        public Category GetModelByBh(string caBh)
        {
            using (var connection=ConnectionFactory.GetOpenConnection())
            {
                var m = connection.Query<Model.Category>("select * from Category where Bh=@Bh", new { Bh = caBh }).FirstOrDefault();
                return m;
            }
        }
        /// <summary>
        /// 计算记录数
        /// </summary>
        /// <param name="cond"></param>
        /// <returns></returns>
        public int CalcCount(string cond)
        {
            string sql = "select count(1) from Category";
            if (!string.IsNullOrEmpty(cond))
            {
                sql += $" where {cond}";
            }
            using (var connection=ConnectionFactory.GetOpenConnection())
            {
                int res = connection.ExecuteScalar<int>(sql);
                return res;
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
        /// <summary>
        /// 取所有分类的数据拼接成json字符中返回
        /// </summary>
        /// <returns></returns>
        public dynamic GettreeJson()
        {
            List<Model.TreeNode_LayUI> list_return = new List<TreeNode_LayUI>();
            List<Model.Category> list = GetList("");
            var top = list.Where(a => a.Pbh == "0");
            foreach (var item in top)
            {
                Model.TreeNode_LayUI node = new TreeNode_LayUI() { id = item.Id, name = item.CaName, spread = true ,pid=0};
                var sub = list.Where(a => a.Pbh == item.Bh);
                List<Model.TreeNode_LayUI> list_sub = new List<TreeNode_LayUI>();
                foreach (var item2 in sub)
                {
                    Model.TreeNode_LayUI node2 = new TreeNode_LayUI() { id = item2.Id, name = item2.CaName, spread = true,pid=item.Id };
                    list_sub.Add(node2);
                }
                node.children = list_sub;
                list_return.Add(node);
            }
            return Newtonsoft.Json.JsonConvert.SerializeObject(list_return);
        }
    }
}
