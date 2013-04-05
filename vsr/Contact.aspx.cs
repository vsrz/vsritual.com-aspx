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
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            mv1.ActiveViewIndex = 0;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            VsrDataContext db = new VsrDataContext();
            ContactMessage m = new ContactMessage();

            m.message_id = Guid.NewGuid();
            m.sender_ip = Request.UserHostAddress;
            m.name = txtName.Text.ToString();
            m.email = txtEmail.Text.ToString();
            m.sent = DateTime.Now;
            m.message = txtMessage.Text.ToString();
            db.ContactMessages.InsertOnSubmit(m);
            db.SubmitChanges();

            txtEmail.Text = "";
            txtMessage.Text = "";
            txtName.Text = "";

            mv1.ActiveViewIndex = 1;
 
        }
    }
}
