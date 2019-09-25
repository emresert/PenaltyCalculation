using PenaltyCalculation.Models.EntityFramework;
using PenaltyCalculation.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PenaltyCalculation.Controllers
{
    public class FormUIController : Controller
    {
        
        PenaltyCalculateDBEntities1 db = new PenaltyCalculateDBEntities1();
        

        public int findingHoliday(string dateFirst,string dateLast,int fkCountry)
        {
           // Absoulute value of Holiday coming from precedure
           int result = db.spFindingHoliday(dateFirst, dateLast, fkCountry).ToList().Count();

          return result;
        }
       
        /**** [Route("FormUI/Index")] ****/
        public ActionResult Index()
        {
        
            ViewData["CountrySelectList"] = new SelectList(db.Country, "countryId", "countryName");
            ViewBag.Show = TempData["doc"];

            return View();
        }
        [HttpPost]
        public ActionResult Index(CountryViewModel cvModel,string timeForCheckedOut,string timeForReturn)
        {
            try
            {
                /* ******** Converting Form Input Object ********** */
                DateTime _timeForCheckedOut    = Convert.ToDateTime(timeForCheckedOut);
                DateTime _timeForCheckedOutOld = Convert.ToDateTime(timeForCheckedOut);
                DateTime _timeForReturn        = Convert.ToDateTime(timeForReturn);

                /* ******** Error Possibility During Value Entry ********** */
                if (_timeForCheckedOut > _timeForReturn)
                {
                    TempData["doc"] = "There was a problem while chosing date interval. Please check it and try again.";
                    return RedirectToAction("Index", "FormUI");
                }
                else if (_timeForCheckedOut == _timeForReturn)
                {
                    TempData["doc"] = "There is no need to pay any price due to same day delivery.";
                    return RedirectToAction("Index", "FormUI");
                }

                /* ******** Variables For Calculation Process ********** */
                    int     counter    = 0;
                    var     _country   = db.Country.FirstOrDefault(f => f.countryId == cvModel.Country.countryId);
                    int     holiday    = findingHoliday(timeForCheckedOut, timeForReturn, _country.countryId);
                    double  amount     = 0;


                if (_country.countryName == "Istanbul")
                    {
                        do
                        {
                            if (_timeForCheckedOut.DayOfWeek == DayOfWeek.Saturday || _timeForCheckedOut.DayOfWeek == DayOfWeek.Sunday)
                            {
                                counter++;
                            }
                            _timeForCheckedOut = _timeForCheckedOut.AddDays(1);
                        } while (_timeForCheckedOut <= _timeForReturn.Date); // Go back if it is smaller than _timeForReturn

                        int TotalDayCount = Convert.ToInt32(Math.Abs(counter - Math.Abs((_timeForCheckedOutOld - _timeForReturn).TotalDays)) - holiday);
                         
                        if (TotalDayCount > 10)
                        {
                            amount = (TotalDayCount-10) * 5.00; // TL
                            var version = String.Format("{0:C}", amount);
                            TempData["doc"] = "You must pay " + version + " for " + TotalDayCount + " days.";         
                        }
                        else
                        {
                        TempData["doc"] = "There is no need to pay any price due to early delivery.";
                        }
                    } // -> end of 'if' for Istanbul 
               
                else if (_country.countryName == "Paris")
                    {
                        do
                        {
                            if (_timeForCheckedOut.DayOfWeek == DayOfWeek.Sunday)
                            {
                                counter++;
                            }
                            _timeForCheckedOut = _timeForCheckedOut.AddDays(1);
                        } while (_timeForCheckedOut <= _timeForReturn.Date);

                        int TotalDayCount = Convert.ToInt32(Math.Abs(counter - Math.Abs((_timeForCheckedOutOld - _timeForReturn).TotalDays)) - holiday);

                        if (TotalDayCount > 10)
                        {
                            amount = (TotalDayCount-10) * 0.80; // EURO    
                            var version = string.Format("€{0:N2}", amount);
                            TempData["doc"] = "You must pay " + version + " for " + TotalDayCount + " days.";
                        }
                       else
                        {
                        TempData["doc"] = "There is no need to pay any price due to early delivery.";
                        }
                     }  // -> end of 'if' for Paris 

                else if (_country.countryName == "Dubai")
                    {
                        do
                        {
                            if (_timeForCheckedOut.DayOfWeek == DayOfWeek.Friday || _timeForCheckedOut.DayOfWeek == DayOfWeek.Saturday)
                            {
                                counter++;
                            }
                            _timeForCheckedOut = _timeForCheckedOut.AddDays(1);
                        } while (_timeForCheckedOut <= _timeForReturn.Date);

                        int TotalDayCount = Convert.ToInt32(Math.Abs(counter - Math.Abs((_timeForCheckedOutOld - _timeForReturn).TotalDays)) - holiday);

                        if (TotalDayCount > 10)
                        {
                            amount = (TotalDayCount-10) * 3.22; // AED      
                            var version = string.Format("{0:N2}فلس", amount);
                        TempData["doc"] = "You must pay " + version + " for " + TotalDayCount + " days.";
                        }
                    else
                       {
                        TempData["doc"] = "There is no need to pay any price due to early delivery.";
                       }
                    } // -> end of 'if' for Istanbul 

            } // -> end of 'try' 
            catch 
            {
                TempData["doc"] = "There was a problem. Please try again.";
                return RedirectToAction("Index", "FormUI");
            } // -> end of 'catch' 

            return RedirectToAction("Index","FormUI");

        }// -> end of 'Index' ActionResult
    }// -> end of controller
}// -> end of namespace