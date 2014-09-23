using bmi.imis.MABanker.Careers.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Asi.Web.UI;
using System.Web.ModelBinding;

namespace bmi.imis.MABanker.Careers.Careers
{
    public partial class JobPosting : CareersBase
    //public partial class JobPosting : ControlBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
                //if ((Request.QueryString["Mode"] ?? string.Empty) == "Edit")
                //{
                //    fvJobPosting.ChangeMode(FormViewMode.Edit);
                //}
            }
        }
        public Posting GetPosting([QueryString("PostingId")]int? postingId)
        {
            Posting rtn;
            if (postingId == null)
            {
                rtn = new Posting();
            }
            else
            {
                using (var context = new CareersContext())
                {
                    rtn = (from p in context.Postings
                          where p.JobID == postingId
                               select p).SingleOrDefault();
                }
            }
            return rtn;            
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            fvJobPosting.ChangeMode(FormViewMode.Edit);
        }

        protected void fvJobPosting_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            //switch (e.CommandName)
            //{
            //    case "UpdateInfo":
            //        throw new NotImplementedException();
            //        break;
            //    case "SubmitInfo":
            //        throw new NotImplementedException();
            //        break;
            //    case "CancelUpdate":
            //        fvJobPosting.ChangeMode(FormViewMode.ReadOnly);
            //        break;
            //    case "CanelInsert":
            //        fvJobPosting.ChangeMode(FormViewMode.ReadOnly);
            //        break;                
            //    default:
            //        break;
            //}
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void fvJobPosting_UpdateItem(Posting posting)
        {

        }

        protected void ddCategory_DataBinding(object sender, EventArgs e)
        {
            
        }

        protected void ddlState_CreatingModelDataSource(object sender, CreatingModelDataSourceEventArgs e)
        {

        }

        protected void ddlState_CallingDataMethods(object sender, CallingDataMethodsEventArgs e)
        {

        }


    }
}