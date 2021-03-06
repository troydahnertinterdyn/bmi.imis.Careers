﻿using bmi.imis.MABanker.Careers.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace bmi.imis.MABanker.Careers.Careers
{
    public partial class JobPostings : CareersBase
    {
        protected void Page_Load(object sender, EventArgs e) 
        {
            string rootPath = HttpContext.Current.Request.ApplicationPath;
            if (!rootPath.EndsWith("/"))
            {
                rootPath += "/";
            }

            Uri requestUri = HttpContext.Current.Request.Url;
            string folderPath = requestUri.AbsolutePath.Remove(0, rootPath.Length);
            string lastSegment = requestUri.Segments[requestUri.Segments.Length - 1];
            folderPath = folderPath.Remove(folderPath.LastIndexOf(lastSegment));

            AppRelativeTemplateSourceDirectory = "~/" + folderPath;


            if (!Page.IsPostBack)
            {
                ddlCategory.DataSource = Categories;
                ddlCategory.DataBind();
                ddlState.DataSource = States;
                ddlState.DataBind();
            }
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void gvJobPostings_DeleteItem(Posting posting)
        {
            using (var context = new CareersContext())
            {
                context.Entry(posting).State = System.Data.Entity.EntityState.Deleted;
                context.SaveChanges();
            }
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<bmi.imis.MABanker.Careers.Models.Posting> gvJobPostings_GetData()
        {
            var context = new CareersContext();            
                IQueryable<Posting> rtn = context.Postings;
                var dateAfterWhichListingsExpire = DateTime.Now.AddDays(-int.Parse(ConfigurationManager.AppSettings["DaysAfterWhichListingsExpire"]));
            if (IsStaffUser)
            {
                rtn = rtn.Where(p => p.PostDate >= dateAfterWhichListingsExpire || p.PostDate == null);
            }
            else
            {
                rtn = rtn.Where(p => p.PostDate >= dateAfterWhichListingsExpire && p.Approved == true);
            }

                if (ddlCategory.SelectedIndex != 0)
                {
                    int category = int.Parse(ddlCategory.SelectedValue);
                    rtn = rtn.Where(r => r.Category == category);
                }
                if (ddlState.SelectedIndex != 0) rtn = rtn.Where(r => r.State == ddlState.SelectedValue);
                if (tbKeyword.Text != string.Empty)
                {
                    //TODO:  Not efficient.  Unable to find faster method
                    rtn = rtn.Where(p => p.Description.Contains(tbKeyword.Text) ||
                        p.Comments.Contains(tbKeyword.Text) ||
                        p.City.Contains(tbKeyword.Text) ||
                        p.Company.Contains(tbKeyword.Text) ||
                        p.Title.Contains(tbKeyword.Text));
                       //.IndexOf(tbKeyword.Text, StringComparison.OrdinalIgnoreCase) != -1);
                }
                return rtn;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            gvJobPostings.Visible = true;
            gvJobPostings.DataBind();
        }

        protected void gvJobPostings_PreRender(object sender, EventArgs e)
        {
            gvJobPostings.Columns[0].Visible = IsStaffUser;
        }

        protected void gvJobPostings_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (!IsStaffUser && e.Row.RowType == DataControlRowType.DataRow && !((Posting)e.Row.DataItem).Approved) e.Row.Visible = false;
        }

    }
}