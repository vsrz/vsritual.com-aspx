using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace vsr
{
    public partial class Default : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            rpPosts.ItemDataBound += new RepeaterItemEventHandler(rpPosts_ItemDataBound);
            
        }

        protected void btnAddComment_Click(object sender, EventArgs e)
        {
        }

        void rpPosts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {                      
            VsrDataContext db = new VsrDataContext();

            if ((e.Item.ItemType == ListItemType.Item) || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var query = from p in db.PostComments
                            where p.posts_id == new Guid(((Post)e.Item.DataItem).post_id.ToString())
                            select p;

                Repeater nr = (Repeater)e.Item.FindControl("rpComments");
                nr.DataSource = query.Take(10);
                nr.DataBind();               
                
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            VsrDataContext db = new VsrDataContext();

            var query = from p in db.Posts
                        where p.enabled == true
                        orderby p.posted descending
                        select p;
            rpPosts.DataSource = query.Take(10);
            rpPosts.DataBind();
            

            //title.Text = query.First().title.ToString();
            /*
            title.Text = db.Posts.First().title.ToString();
            post_date.Text = "On ";
            post_date.Text += db.Posts.First().posted.ToLongDateString();
            posttext.Text = db.Posts.First().post_content.ToString();
            username.Text = "Posted by " + db.Posts.First().submitter.ToString();
            */
            
        }


    }
}
