using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using bmi.imis.MABanker.Careers.Models;
using System.Security.Principal;
using System.Configuration;
using Asi.Soa.ClientServices;
using Asi.Soa.Core.DataContracts;

namespace bmi.imis.MABanker.Careers.Careers
{
    public class CareersBase :  System.Web.UI.UserControl
    //public class CareersBase :  Asi.Web.UI.UserControl 
    {
        public string PageRootPath { 
            get
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
            return AppRelativeTemplateSourceDirectory;

        }
        }
        public EntityManager CareersEntityManager
        {
            get
            {
                var managerPassword = ConfigurationManager.AppSettings["ManagerPassword"];
               return new EntityManager("Manager", managerPassword);
            }
        }
        public bool IsAuthenticated
        {
            get
            {
                if (bool.Parse(ConfigurationManager.AppSettings["DevelopmentMode"])) return true;
                return (HttpContext.Current.User != null && HttpContext.Current.User.Identity != null && HttpContext.Current.User.Identity.IsAuthenticated);
            }
        }
        private int _developmentModePostingCredits = 1;
        public int PostingCredits 
        { 
            get
            {
                if (bool.Parse(ConfigurationManager.AppSettings["DevelopmentMode"])) return _developmentModePostingCredits;
                if (!IsAuthenticated) throw new Exception("Career Posting credits cannot be retrieved unless user is authenticated");
                EntityManager entityManager = CareersEntityManager;
                QueryData careerJobCreditsQuery = new QueryData("CareerJobCredits");
                careerJobCreditsQuery.AddCriteria(CriteriaData.Equal("PartyId", CurrentiMISID));
                FindResultsData careerJobCredits = entityManager.Find(careerJobCreditsQuery);
                if (careerJobCredits.Result == null || careerJobCredits.Result.Count <= 0) return 0;
                else
                {
                    GenericEntityData data = (GenericEntityData)careerJobCredits.Result[0];
                    return (int)data["J_Credits"];
                }
            } 
            set
            {
                if (bool.Parse(ConfigurationManager.AppSettings["DevelopmentMode"]))
                {
                    _developmentModePostingCredits = value;
                    return;
                }
                if (!IsAuthenticated) throw new Exception("Career Posting credits cannot be set unless user is authenticated");
                EntityManager entityManager = CareersEntityManager;
                //Querying Name Table as Party Data contract
                QueryData careerJobCreditsQuery = new QueryData("CareerJobCredits");
                careerJobCreditsQuery.AddCriteria(CriteriaData.Equal("PartyId", CurrentiMISID));
                FindResultsData careerJobCredits = entityManager.Find(careerJobCreditsQuery);
                if (careerJobCredits.Result == null || careerJobCredits.Result.Count <= 0)
                {
                    GenericEntityData data = new GenericEntityData("CareerJobCredits")
                    {
                        Properties =
                        {
                        new GenericPropertyData("PartyId", CurrentiMISID),
                        new GenericPropertyData("J_Credits", value)
                        }
                    };
                    ValidateResultsData result = entityManager.Add(data);
                }
                else
                {
                    GenericEntityData data = (GenericEntityData)careerJobCredits.Result[0];
                    data["J_Credits"] = value;
                    ValidateResultsData result = entityManager.Update(data);
                }
            }
        }
        public string CurrentiMISID
        {
            get
            {
                string _id = "";
                try
                {
                    if (IsAuthenticated && Asi.Security.AppPrincipal.CurrentIdentity.LoginIdentity != "")
                    {
                        _id = Asi.Security.AppPrincipal.CurrentIdentity.LoginIdentity;
                    }
                }
                catch { }
                return _id;
            }
        }
        public bool HasRole(List<string> roles)
        {
            if (!IsAuthenticated || Asi.Security.AppPrincipal.CurrentIdentity.LoginIdentity == "") return false;
            bool rtn =false;
            Asi.iBO.ContentManagement.CWebUser currentUser = Asi.iBO.ContentManagement.CWebUser.LoginByPrincipal(HttpContext.Current.User);
            foreach (var role in roles)
	        {
                if (currentUser != null && currentUser.IsInRole(role)) rtn = true;
	        }
            return rtn;
        }
        public bool IsStaffUser {
            get
            {
                if (bool.Parse(ConfigurationManager.AppSettings["DevelopmentMode"])) return false;
                return HasRole(new List<string>(){"sysadmin"});
            }
        }
        public bool CanViewResumes
        {
            get
            {
                if (bool.Parse(ConfigurationManager.AppSettings["DevelopmentMode"])) return true;
                var roles = new List<string>() { "IM", "ASSOC", "STAFF", "sysadmin" };
                return HasRole(roles);
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