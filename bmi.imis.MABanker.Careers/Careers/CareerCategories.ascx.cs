using bmi.imis.MABanker.Careers.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity.Infrastructure;

namespace bmi.imis.MABanker.Careers.Careers
{
    public partial class CareerCategories : CareersBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Page.DataBind();
            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<bmi.imis.MABanker.Careers.Models.CareerCategory> dgCareerCategories_GetData()
        {
            var context = new CareersContext();
            return context.Categories;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void dgCareerCategories_DeleteItem(int Id)
        {
            using (var context = new CareersContext())
            {
                var career = context.Categories.Where(c => c.Id == Id).Select(c => c).FirstOrDefault();
                context.Categories.Remove(career);
                context.SaveChanges();
            }
            gvCareerCategories.DataBind();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void gvCareerCategories_UpdateItem(CareerCategory category)
        {
            using (var context = new CareersContext())
            {
                context.Entry(category).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
        }

        public void fvCareerCategory_InsertItem(CareerCategory category)
        {
            var item = new bmi.imis.MABanker.Careers.Models.CareerCategory();
                var context = new CareersContext();
                context.Categories.Add(category);
                context.SaveChanges();
        }

        protected void fvCareerCategory_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            fvCareerCategory.Visible = false;
            gvCareerCategories.DataBind();
            btnNew.Visible = true;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {   
            fvCareerCategory.Visible = false;
            btnNew.Visible = true;
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            TextBox name = (TextBox)fvCareerCategory.FindControl("tbName");
            name.Text = string.Empty;
            fvCareerCategory.Visible = true;
            btnNew.Visible = false;
        }

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public bmi.imis.MABanker.Careers.Models.CareerCategory fvCareerCategory_GetItem(int id)
        {
            return null;
        }
    }
}