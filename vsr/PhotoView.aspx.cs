using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace vsr
{
    public partial class PhotoView : System.Web.UI.Page
    {

        private int _pageid;
        private Guid _gid;
        VsrDataContext db = new VsrDataContext();

        public int pageid
        {
            get { return _pageid; }
            set { _pageid = value; }
        }

        public Guid photoid
        {
            get { return _gid; }
            set { _gid = value; }
        }

        private Guid GetFirstPhotoByGuid()
        {
            var query = from p in db.Photos
                        where (p.photoSequenceNumber == 0)
                        select p;

            return query.First().photoId;
        }

        protected string GetRandomPhotoLink()
        {
            var query = from p in db.Photos
                        select p;
            int nextpid = pageid;
            Random r = new Random();

            // continue to generate a random page if the number that is generated
            // is equal to the current page
            while (nextpid == pageid)
                nextpid = r.Next(0, query.Count());


            return "PhotoView.aspx?p=" + nextpid;


        }


        protected void SetPhotoNavigation()
        {
            /* find out if there is a next */
            var q2 = from p in db.Photos
                     where p.photoSequenceNumber == pageid
                     select p;



            /* is this the first image */
            if (pageid == 0)
            {
                lnkPreviousImage.Visible = !lnkPreviousImage.Visible;
                lblFirstImage.Visible = !lblFirstImage.Visible;
            }

            /* are we at the last image? */
            var q = from p in db.Photos
                    where p.photoPageType == 0
                    select p;

            if (pageid + 1 == q.Count())
            {
                lnkNextImage.Visible = !lnkNextImage.Visible;
                lblLastImage.Visible = !lblLastImage.Visible;
            }

            lnkPreviousImage.NavigateUrl = Request.Url.AbsolutePath + "?p=" + (pageid - 1);
            lnkNextImage.NavigateUrl = Request.Url.AbsolutePath + "?p=" + (pageid + 1);

            // set the random photo link
            lnkRandomImage.NavigateUrl = GetRandomPhotoLink();
        }

        /// <summary>
        /// Get the page ID from QueryString "GET" Variables 
        /// </summary>
        private void GetPageId()
        {
            if (Request.QueryString["p"] != null)
            {

                try
                {
                    pageid = Convert.ToInt32(Request.QueryString["p"], 10);

                }
                catch
                {
                    pageid = 0;
                }

            }
            else
            {
                pageid = 0;
            }

            if (Request.QueryString["gid"] != null)
            {
                try
                {
                    photoid = new Guid(Request.QueryString["gid"]);
                }
                catch
                {
                    photoid = GetFirstPhotoByGuid();
                }
            }

        }

        protected string GetImagePathByGuid(Guid g)
        {
            SqlDataSource s = new SqlDataSource();            
            s.ConnectionString = "vsrdev0_vsrConnectionString";
            s.SelectCommand = "SELECT photoLocation FROM dbo.Photos WHERE photoId = @guid";

            s.SelectParameters.Add("guid", g.ToString());

            SqlConnection con = new SqlConnection();
            SqlCommand cmd = new SqlCommand("SELECT photoLocation FROM dbo.Photos WHERE photoId = @guid");

            using (con)
            {
                con.Open();
                SqlDataReader r = cmd.ExecuteReader();
                while (r.Read())
                {

                }
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string s;
            s = GetImagePathByGuid(new Guid("F95A9A5B-6515-486F-BE27-4DD1712ECFCE"));
        }
    }
}