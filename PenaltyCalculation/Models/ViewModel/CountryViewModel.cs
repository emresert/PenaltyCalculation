using PenaltyCalculation.Models.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PenaltyCalculation.Models.ViewModel
{
    public class CountryViewModel
    {
        public IEnumerable<Country> CountryList { get; set; }
        public Country Country { get; set; }
    }
}