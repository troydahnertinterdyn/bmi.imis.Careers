using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using bmi.imis.MABanker.Careers.Models;
using System.Security.Principal;
using System.Configuration;

namespace bmi.imis.MABanker.Careers.Careers
{
    public class CareersBase :  System.Web.UI.UserControl
    //public class CareersBase :  Asi.Web.UI.UserControl 
    {
        public bool IsAuthenticated
        {
            get
            {
                if (bool.Parse(ConfigurationManager.AppSettings["DevelopmentMode"])) return true;
                return (HttpContext.Current.User != null && HttpContext.Current.User.Identity != null && HttpContext.Current.User.Identity.IsAuthenticated);
            }
        }
        public bool IsStaffUser {
            get
            {
                if (bool.Parse(ConfigurationManager.AppSettings["DevelopmentMode"])) return true;  
                Asi.iBO.ContentManagement.CWebUser currentUser = Asi.iBO.ContentManagement.CWebUser.LoginByPrincipal(HttpContext.Current.User);
                if (currentUser != null && currentUser.IsInRole("Administrator"))return true;
                else return false;
            }
        }
        public void RedirectToLogin() 
        {
            Response.Redirect(System.Web.Security.FormsAuthentication.LoginUrl + "?returnURL=" + HttpContext.Current.Request.Url.PathAndQuery);
        }
        private List<CareerCategory>  _categories;
        public List<CareerCategory> Categories
        {
            get {
                if (_categories == null)
                {
                    using (CareersContext context = new CareersContext())
                    {
                        _categories = context.Categories.ToList();
                    }
                }
                return _categories;
            }
        }
        private List<CareerState> _states;

        public List<CareerState> States
        {
			get 
            {
				if(_states == null)
				{
					using(var context = new CareersContext())
                    {
						_states = context.States.ToList();
					}
				}
				return _states;
			}
        }
        
    }
}