using Student.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Student.Controllers
{
    public class CourseController : Controller
    {
        // GET: Course
        private StudentProjectEntities _context = new StudentProjectEntities();

        public ActionResult Index()
        {
            return View();
        }
        public JsonResult List()
        {
            return Json(_context.CourseLists.ToList(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(CourseList courseList)
        {
            _context.CourseLists.Add(courseList);
            _context.SaveChanges();
            return Json(JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetbyID(int ID)
        {
            return Json(_context.CourseLists.FirstOrDefault(x => x.ID == ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(CourseList courseList)
        {
            var data = _context.CourseLists.FirstOrDefault(x => x.ID == courseList.ID);
            if (data != null)
            {
                data.CourseCode = courseList.CourseCode;
                data.CourceName = courseList.CourceName;
                data.CreditHour = courseList.CreditHour;
                data.ContactHour = courseList.ContactHour;
               _context.SaveChanges();
            }
            return Json(JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(int ID)
        {
            var data = _context.CourseLists.FirstOrDefault(x => x.ID == ID);
            _context.CourseLists.Remove(data);
            _context.SaveChanges();
            return Json(JsonRequestBehavior.AllowGet);
        }
    }
}