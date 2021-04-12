using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ALMS.MANAGER;

namespace ALMS.MANAGER.Controllers
{
    public class LeaveRequestDetailsController : Controller
    {
        private Sprint2ALMSEntities db = new Sprint2ALMSEntities();

        // GET: LeaveRequestDetails
        public ActionResult Index()
        {
            return View(db.TRLeaveRequestDetails.ToList());
        }

        // GET: LeaveRequestDetails/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TRLeaveRequestDetail tRLeaveRequestDetail = db.TRLeaveRequestDetails.Find(id);
            if (tRLeaveRequestDetail == null)
            {
                return HttpNotFound();
            }
            return View(tRLeaveRequestDetail);
        }

        // GET: LeaveRequestDetails/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: LeaveRequestDetails/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LeaveRequestID,EmployeeID,LeaveDescription,LeavesRemaining,LeaveRequestFrom,LeaveRequestTo,LeaveStatus,LeaveRequestCreatedDate,LeaveStatusUpdateDate,LeaveStatusUpdatedBy")] TRLeaveRequestDetail tRLeaveRequestDetail)
        {
            if (ModelState.IsValid)
            {
                db.TRLeaveRequestDetails.Add(tRLeaveRequestDetail);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tRLeaveRequestDetail);
        }

        // GET: LeaveRequestDetails/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TRLeaveRequestDetail tRLeaveRequestDetail = db.TRLeaveRequestDetails.Find(id);
            if (tRLeaveRequestDetail == null)
            {
                return HttpNotFound();
            }
            return View(tRLeaveRequestDetail);
        }

        // POST: LeaveRequestDetails/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LeaveRequestID,EmployeeID,LeaveDescription,LeavesRemaining,LeaveRequestFrom,LeaveRequestTo,LeaveStatus,LeaveRequestCreatedDate,LeaveStatusUpdateDate,LeaveStatusUpdatedBy")] TRLeaveRequestDetail tRLeaveRequestDetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tRLeaveRequestDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tRLeaveRequestDetail);
        }

        // GET: LeaveRequestDetails/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TRLeaveRequestDetail tRLeaveRequestDetail = db.TRLeaveRequestDetails.Find(id);
            if (tRLeaveRequestDetail == null)
            {
                return HttpNotFound();
            }
            return View(tRLeaveRequestDetail);
        }

        // POST: LeaveRequestDetails/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TRLeaveRequestDetail tRLeaveRequestDetail = db.TRLeaveRequestDetails.Find(id);
            db.TRLeaveRequestDetails.Remove(tRLeaveRequestDetail);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
