using Student.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Student.Controllers
{
    public class CourseAssignController : Controller
    {
        // GET: Course
        private StudentProjectEntities _context = new StudentProjectEntities();

        // GET: CourseAssign
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult List()
        {
            return Json(_context.CourseLists.ToList(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult StudentList()
        {
            var productsList = (from vwStudentList in _context.vwStudentLists
                                select new SelectListItem()
                                {
                                    Text = vwStudentList.Name,
                                    Value = vwStudentList.ID.ToString(),
                                }).ToList();

            productsList.Insert(0, new SelectListItem()
            {
                Text = "--Select one--",
                Value = "0"
            });

            return Json(productsList, JsonRequestBehavior.AllowGet);

            /// return Json(_context.vwStudentLists.ToList(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(StudentCourse studentCourse)
        {
            _context.StudentCourses.Add(studentCourse);
            this.TempData["StudentID"] = studentCourse.StudentID;
            this.TempData["SemisterCode"] = studentCourse.SemisterCode;
            return Json(JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult InsertData(List<StudentCourse> studentCourse)
        {
            using (StudentProjectEntities db = new StudentProjectEntities())
            {
                foreach (StudentCourse crs in studentCourse)
                {
                    StudentCourse studentCourse1 = new StudentCourse();
                    studentCourse1.StudentID =Convert.ToInt32(TempData["StudentID"]);
                    studentCourse1.SemisterCode = TempData["SemisterCode"].ToString();
                    studentCourse1.CourseID = crs.ID;
                    studentCourse1.EntryDate = DateTime.Now;
                    db.StudentCourses.Add(studentCourse1);
                }
                db.SaveChanges();
            }

            bool Result = true;
            return Json(Result);
        }
    }
}