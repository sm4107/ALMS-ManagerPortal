using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AttendanceView.Controllers
{
    public class AttendanceViewController : Controller
    {
        // GET: AttendanceView
        Sprint2ALMSEntities sd = new Sprint2ALMSEntities();
        public ActionResult Index()
        {
            return View(sd.TRAttendanceDetails.ToList());
        }
        [HttpPost]
        public ActionResult Index(DateTime start, DateTime end)
        {
            return View(sd.GetFunctionAttendance(start, end));
        }
    }
}