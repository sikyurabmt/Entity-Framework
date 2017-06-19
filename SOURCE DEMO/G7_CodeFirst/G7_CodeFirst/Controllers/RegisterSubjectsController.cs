using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using G7_CodeFirst.Models;

namespace G7_CodeFirst.Controllers
{
    public class RegisterSubjectsController : Controller
    {
        private SchoolContext db = new SchoolContext();

        // GET: RegisterSubjects
        public ActionResult Index()
        {
            var registerSubjects = db.RegisterSubjects.Include(r => r.Student).Include(r => r.Subject);
            return View(registerSubjects.ToList());
        }

        // GET: RegisterSubjects/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RegisterSubject registerSubject = db.RegisterSubjects.Find(id);
            if (registerSubject == null)
            {
                return HttpNotFound();
            }
            return View(registerSubject);
        }

        // GET: RegisterSubjects/Create
        public ActionResult Create()
        {
            ViewBag.StudentID = new SelectList(db.Students, "StudentID", "StudentName");
            ViewBag.SubjectID = new SelectList(db.Subjects, "SubjectID", "SubjectName");
            return View();
        }

        // POST: RegisterSubjects/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "RegSubID,StudentID,SubjectID")] RegisterSubject registerSubject)
        {
            if (ModelState.IsValid)
            {
                db.RegisterSubjects.Add(registerSubject);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.StudentID = new SelectList(db.Students, "StudentID", "StudentName", registerSubject.StudentID);
            ViewBag.SubjectID = new SelectList(db.Subjects, "SubjectID", "SubjectName", registerSubject.SubjectID);
            return View(registerSubject);
        }

        // GET: RegisterSubjects/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RegisterSubject registerSubject = db.RegisterSubjects.Find(id);
            if (registerSubject == null)
            {
                return HttpNotFound();
            }
            ViewBag.StudentID = new SelectList(db.Students, "StudentID", "StudentName", registerSubject.StudentID);
            ViewBag.SubjectID = new SelectList(db.Subjects, "SubjectID", "SubjectName", registerSubject.SubjectID);
            return View(registerSubject);
        }

        // POST: RegisterSubjects/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "RegSubID,StudentID,SubjectID")] RegisterSubject registerSubject)
        {
            if (ModelState.IsValid)
            {
                db.Entry(registerSubject).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.StudentID = new SelectList(db.Students, "StudentID", "StudentName", registerSubject.StudentID);
            ViewBag.SubjectID = new SelectList(db.Subjects, "SubjectID", "SubjectName", registerSubject.SubjectID);
            return View(registerSubject);
        }

        // GET: RegisterSubjects/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            RegisterSubject registerSubject = db.RegisterSubjects.Find(id);
            if (registerSubject == null)
            {
                return HttpNotFound();
            }
            return View(registerSubject);
        }

        // POST: RegisterSubjects/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            RegisterSubject registerSubject = db.RegisterSubjects.Find(id);
            db.RegisterSubjects.Remove(registerSubject);
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
