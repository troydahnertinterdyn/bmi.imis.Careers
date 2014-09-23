using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using bmi.imis.MABanker.Careers.Models;

namespace bmi.imis.MABanker.Careers.Careers
{
    public class CareersBase : System.Web.UI.UserControl
    {
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