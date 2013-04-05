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
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = "I have worked in the technology industry for nearly 15 years.  My biggest " +
                "issues with my technological expertise is that I am well rounded in various technologies " +
                "but am stuck with the unfortunate stain of not being an absolute expert at any one thing.  " +
                "This has worked to my advantage in my current field, involving Network Technology and intranets, " +
                "but has given me a major struggle when it comes to doing something deeply focused such as " +
                "writing an entire website from the bottom up.  Below is a list of technologies I have worked on " +
                "in my years in the industry.  I plan to focus this site on the basics of each of the technologies " +
                "that I list below.";

            /*
            BulletedList1.BulletStyle = BulletStyle.Disc;
            BulletedList1.DisplayMode = BulletedListDisplayMode.LinkButton;
            ListItem bl1 = new ListItem();
            bl1.Value = "Linux Platforms";
            BulletedList1.Items.Add(bl1);
            */

            Label3.Text = "Additionally, I am a computer consultant for several small businesses in San Diego. " +
                "I use my knowledge in computing to assist them in day to day operations or any new business " +
                "opportunities that may come up.  Thanks for stopping by.  Please feel free to drop me a line " +
                "if you have any questions!";

            Label4.Text = "If you are interested in any consulting work or need help with anything, please use " +
                "the contact form by clicking on the link in the menu above.";
                

        }
    }
}
