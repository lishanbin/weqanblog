using System;
using System.Collections.Generic;
using System.Text;

namespace Weqan.Blog.Model
{
    /// <summary>
    /// layui的树形菜单的节点模型
    /// </summary>
    public class TreeNode_LayUI
    {
        public int id { get; set; }
        public string name { get; set; }
        public bool spread { get; set; }
        public List<TreeNode_LayUI> children { get; set; }
        public int pid { get; set; }
    }
}
