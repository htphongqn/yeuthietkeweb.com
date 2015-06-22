using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;

namespace YeuThietKeWeb.UIs
{
    public partial class Static : System.Web.UI.UserControl
    {
        #region Declare
        Config cf = new Config();
        Propertity per = new Propertity();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            lblOnline.Text = string.Format("{0:#,#}", Utils.CIntDef(Application["Online"]));
            var _hit = cf.Config_meta();
            if (_hit.ToList().Count > 0)
            {
                int sum = Utils.CIntDef(_hit.ToList()[0].CONFIG_HITCOUNTER);
                lblSum.Text = string.Format("{0:#,#}", sum);
            }
            if (!IsPostBack) { Loadonlineday(); }
        }

        public void Loadonlineday()
        {
            try
            {
                //cf.Addvister();
                var list = cf.counter();
                if (list.Count > 0)
                {
                    var list1 = list.Where(a => (a.HIT_DATE.Value.Date - DateTime.Now.Date).Days == 0).ToList();
                    if (list1.Count > 0)
                    {
                        lblToDay.Text = list1[0].HIT_VALUE.ToString();
                    }
                    var list2 = list.Where(a => (a.HIT_DATE.Value.Date - DateTime.Now.Date).Days == -1).ToList();
                    if (list2.Count > 0)
                    {
                        lblYesterday.Text = list2[0].HIT_VALUE.ToString();
                    }
                }
            }
            catch (Exception)
            {

            }
        }
    }
}