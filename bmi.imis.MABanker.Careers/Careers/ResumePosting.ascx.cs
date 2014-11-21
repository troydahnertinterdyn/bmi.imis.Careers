﻿using bmi.imis.MABanker.Careers.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;


namespace bmi.imis.MABanker.Careers.Careers
{
    public partial class ResumePosting : CareersBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int tempResumeId;
            if (int.TryParse(Request.QueryString["ResumeId"], out tempResumeId)) ResumeId = tempResumeId;
            else ResumeId = null;
            
            if (!Page.IsPostBack)
            {
                Page.DataBind();
                if (ResumeId == null || IsStaffUser) fvResume.ChangeMode(FormViewMode.Edit);
                else fvResume.ChangeMode(FormViewMode.ReadOnly);
            }
        }
        public int? ResumeId { get; set; }
        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public bmi.imis.MABanker.Careers.Models.Resume fvResume_GetItem([QueryString("ResumeId")] int? resumeId)
        {
            Resume rtn;
            if (resumeId == null) return new Resume();
            using (var context = new CareersContext())
            {
                context.Configuration.LazyLoadingEnabled = true;
                rtn = context.Resumes.Include(r => r.ResumeBinary).Where(r => r.ResumeID == resumeId ).FirstOrDefault();
                if (rtn == null) return rtn;                
                if (rtn.Category == null) rtn.Category = 0;
                else
                {
                    var currentCategory = rtn.Category;
                    if (context.Categories.Where(c => c.Id == currentCategory).Count() == 0)
                    {
                        rtn.Category = 0;
                    }
                }
            }
            return rtn;
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void fvResume_UpdateItem(Resume resume)
        {
            var fileUploadResume = (FileUpload)fvResume.FindControl("fuResume");
            using (var context = new CareersContext())
            {
                Resume retrievedResume;
                retrievedResume = context.Resumes.Find(resume.ResumeID);                
                ResumeBinary resumeBinary;
                if (resume.ResumeID != 0)
                {
                    TryUpdateModel(retrievedResume);
                    if (retrievedResume.ResumeBinary == null)
                    {
                        resumeBinary = new ResumeBinary();
                        retrievedResume.ResumeBinary = resumeBinary;
                    }
                    else resumeBinary = retrievedResume.ResumeBinary;
                }
                else
                {
                    resume.ResumeBinary = new ResumeBinary();
                    resumeBinary = resume.ResumeBinary;
                }

                if (fileUploadResume.HasFile)
                {
                        resumeBinary.ResumeBytes = fileUploadResume.FileBytes;
                        resumeBinary.ContentType = fileUploadResume.PostedFile.ContentType;
                        resumeBinary.FileName = fileUploadResume.PostedFile.FileName;
                }
                if (resume.ResumeID == 0) context.Entry(resume).State = System.Data.Entity.EntityState.Added;
                else context.Entry(retrievedResume).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
            }
            Response.Redirect(Request.Url.AbsolutePath + "?ResumeId=" + resume.ResumeID.ToString());
        }

        protected void lnkDownload_Click(object sender, EventArgs e)
        {
            int id = int.Parse((sender as LinkButton).CommandArgument);
            byte[] resumeBytes;
            using (var context = new CareersContext())
            {
                var resumeBinary = (from r in context.Resumes
                                    where r.ResumeID == id
                                    select r.ResumeBinary).FirstOrDefault();
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = string.Empty;
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.ContentType = resumeBinary.ContentType;
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + resumeBinary.FileName);
                resumeBytes = resumeBinary.ResumeBytes;
            }
            Response.BinaryWrite(resumeBytes);
            Response.Flush();
            Response.End();
        }

        protected void btnFileDelete_Click(object sender, EventArgs e)
        {
            using (var context = new CareersContext())
            {
                int id = int.Parse((sender as Button).CommandArgument);
                var resumeBinary = (from rb in context.ResumeBinaries
                                   where rb.ResumeID == id
                                   select rb).FirstOrDefault();
                if (resumeBinary != null)
                {
                    context.Entry(resumeBinary).State = System.Data.Entity.EntityState.Deleted;
                    context.SaveChanges();
                    ((FileUpload)fvResume.FindControl("fuResume")).Visible = true;
                    ((LinkButton)fvResume.FindControl("lnkDownload")).Visible = false;
                    ((Button)fvResume.FindControl("btnFileDelete")).Visible = false;
                }
            }
        }

        protected void lbView_Click(object sender, EventArgs e)
        {
            fvResume.ChangeMode(FormViewMode.ReadOnly);
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            fvResume.ChangeMode(FormViewMode.Edit);
        }

        protected void vafuResume_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var fileUploadResume = (FileUpload)fvResume.FindControl("fuResume");
            string extn = string.Empty;
            if (!fileUploadResume.HasFile) args.IsValid = true;
            extn = System.IO.Path.GetExtension(fileUploadResume.FileName);
            if (".pdf" != extn && ".doc" != extn && ".docx" != extn && ".rtf" != extn) args.IsValid = false;
        }
    }
}