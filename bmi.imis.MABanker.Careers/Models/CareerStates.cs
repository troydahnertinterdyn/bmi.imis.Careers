﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace bmi.imis.MABanker.Careers.Models
{
    public class CareerState
    {
    [Key]
        public string Code { get; set; }
        public string Name { get; set; }
    }
}