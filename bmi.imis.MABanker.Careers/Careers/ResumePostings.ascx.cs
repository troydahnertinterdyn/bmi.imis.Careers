using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bmi.imis.MABanker.Careers.Careers
{
    public partial class ResumePostings : CareersBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<bmi.imis.MABanker.Careers.Models.Resume> gvResumes_GetData()
        {
            return null;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void gvResumes_DeleteItem(int id)
        {

        }

        protected void gvResumes_PreRender(object sender, EventArgs e)
        {

        }

        protected void gvResumes_DataBound(object sender, EventArgs e)
        {

        }
    }
}