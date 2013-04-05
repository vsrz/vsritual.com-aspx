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
    public partial class Admin : System.Web.UI.Page
    {
        // init dbase
        VsrDataContext db = new VsrDataContext();

        // not saved bc of viewstate
        protected Guid guidPost;

        private string _fckContents;

        public string PostText
        {
            get { return _fckContents; }
            set { _fckContents = value; }
        }

        public string ViewStateText
        {
            get
            {
                if (ViewState["ViewStateText"] == null)
                    return String.Empty;
                else
                    return (string)ViewState["ViewStateText"];
            }

            set
            {
                ViewState["ViewStateText"] = value;
            }

        }
        protected void Page_Init(object sender, EventArgs e)
        {
           // Page.RegisterRequiresPostBack(fckWindow);
        }
        
        protected override void OnInit(EventArgs e)
        {
            // Page.RegisterRequiresPostBack(fckWindow);
            // if (Page.IsPostBack) Page.RegisterRequiresPostBack(fckWindow);
        
            base.OnInit(e);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            // Make sure user is authenticated
            if ((!Request.IsAuthenticated) && !Roles.IsUserInRole("Administrators"))
                Response.Redirect("Default.aspx");

            int pid = 0;
            if(Request.QueryString["pid"]!=null) pid = Int32.Parse(Request.QueryString["pid"]);
            mvA.ActiveViewIndex = pid;
            fckWindow.StylesXmlPath = "/fckeditor/fckstyles.xml";
        }

        public void ButtonCreateNew_Clicked(object s, EventArgs e)
        {
            if (Session["guidPost"] != null) Session["guidPost"] = null;
            txtPostDate.Text = DateTime.Today.ToString();
            txtTitle.Text = "";
            fckWindow.Value = "";
            cbxPostEnabled.Checked = true;

            mvNewPost.ActiveViewIndex = 0;
            mvNewPost.Visible = true;
        }
        public void PostListChanged(object sender, EventArgs e)
        {
            VsrDataContext db = new VsrDataContext();

            aspnet_Membership a = new aspnet_Membership();

            

        }

        public void ButtonEditPost_Clicked(object s, EventArgs e)
        {
            var q = from p in db.Posts
                    where p.post_id == new Guid(ddlPostListing.SelectedValue)
                    select p;

            guidPost = q.First().post_id;
            fckWindow.Value = q.First().post_content.ToString();
            txtPostDate.Text = q.First().posted.ToLongDateString();
            txtTitle.Text = q.First().title.ToString();
            if (q.First().enabled.HasValue) cbxPostEnabled.Checked = true;
            else cbxPostEnabled.Checked = false;
            
            mvNewPost.ActiveViewIndex = 0;
            mvNewPost.Visible = true;
            Session["guidPost"] = guidPost;

        }

        protected void PopulateBlogListing()
        {
            var query = from p in db.Posts
                        orderby p.posted descending
                        select p;
            ListItem l = new ListItem();

            ddlPostListing.DataSource = query;
            ddlPostListing.DataTextField = "title";
            ddlPostListing.DataValueField = "post_id";
            ddlPostListing.DataBind();
        }

        public void postListingInit(object sender, EventArgs e)
        {
            PopulateBlogListing();
        }


        public override void RenderControl(HtmlTextWriter w)
        {
            base.RenderControl(w);
        }

        protected void btnRemovePost_Click(object sender, EventArgs e)
        {
            Post p;
            if (Session["guidPost"] != null) guidPost = (Guid)Session["guidPost"];

            if (guidPost != Guid.Empty)
            {
                var query = from q in db.Posts
                            where q.post_id == guidPost
                            select q;

                p = query.First();

                db.Posts.DeleteOnSubmit(p);
                db.SubmitChanges();

            }

            PopulateBlogListing();
            mvNewPost.ActiveViewIndex = 2;
            
        }

        protected void btnSavePost_Click(object sender, EventArgs e)
        {
            Post p;
            if (Session["guidPost"] != null) guidPost = (Guid)Session["guidPost"];

            // check for update or new record
            if (guidPost != Guid.Empty)
            {
                // existing post
                var query = from q in db.Posts
                            where q.post_id == guidPost
                            select q;
                p = query.First();
            }
            else
            {
                // this is a new post
                p = new Post();
                p.post_id = Guid.NewGuid();
            }

            p.posted = Convert.ToDateTime(txtPostDate.Text);
            p.submitter = Page.User.Identity.Name;
            p.enabled = cbxPostEnabled.Checked;
            p.title = txtTitle.Text;
            p.post_content = fckWindow.Value;

            if (guidPost == Guid.Empty)
            {
                db.Posts.InsertOnSubmit(p);
            }

            db.SubmitChanges();

            mvNewPost.ActiveViewIndex = 1;
        }
    }
}
