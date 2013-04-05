using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

namespace vsr
{
    public partial class AddPost : System.Web.UI.Page
    {
        protected bool DoesPostIdExist(Guid post_id)
        {
            VsrDataContext db = new VsrDataContext();
            
            var q = from p in db.Posts
                    where p.post_id == post_id
                    select p;

            return (q.Count() > 0);

        }

        protected void DisplayPost(Guid g)
        {
            VsrDataContext db = new VsrDataContext();

            var query = from p in db.Posts
                        where p.enabled == true && p.post_id == g
                        orderby p.posted descending
                        select p;

            rpPosts.DataSource = query.Take(1);
            rpPosts.DataBind();

        }

        protected void PopulateComments(Guid g)
        {
            VsrDataContext db = new VsrDataContext();

            var query = from p in db.PostComments
                        where p.posts_id == g
                        orderby p.post_date descending
                        select p;

            rpComments.DataSource = query;
            rpComments.DataBind();

        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            VsrDataContext db = new VsrDataContext();
            Guid id = Guid.Empty;

            if (Request.QueryString["post"] != null)
            {
                id = new Guid(Request.QueryString["post"].ToString());
            } 
            else
            {
                // redirect if user tries to access page directly
                Response.Redirect("Default.aspx");
            }

            // redirect if post id does not exist
            if (!DoesPostIdExist(id)) Response.Redirect("Default.aspx");

            DisplayPost(id);
            PopulateComments(id);
        }

        protected void btnCommentSubmit_Click(object sender, EventArgs e)
        {
            VsrDataContext db = new VsrDataContext();
            Guid postid = Guid.Empty;

            if (Request.QueryString["post"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                postid = new Guid(Request.QueryString["post"].ToString());
                if(!DoesPostIdExist(postid))
                    Response.Redirect("Default.aspx");
            }


            if (txtComment.Text.ToString().Length > 3 && txtUsername.Text.ToString().Length > 3)
            {
                PostComment p = new PostComment();
                p.comment_id = Guid.NewGuid();
                p.posts_id = postid;
                p.post_date = DateTime.Now;
                p.praise_count = 0;
                p.criticism_count = 0;
                p.source_ip = Request.ServerVariables["REMOTE_ADDR"];
                p.username = txtUsername.Text.ToString();
                p.posttext = txtComment.Text.ToString();

                db.PostComments.InsertOnSubmit(p);
                db.SubmitChanges();

                txtComment.Text = "";
                txtUsername.Text = "";

                PopulateComments(postid);

            }
        }
    }
}
