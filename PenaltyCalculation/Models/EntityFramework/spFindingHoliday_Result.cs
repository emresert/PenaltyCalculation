//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PenaltyCalculation.Models.EntityFramework
{
    using System;
    
    public partial class spFindingHoliday_Result
    {
        public int countryId { get; set; }
        public string countryName { get; set; }
        public int holidayId { get; set; }
        public string holidayName { get; set; }
        public Nullable<System.DateTime> holidayDate { get; set; }
        public Nullable<int> fkCountry { get; set; }
    }
}
