using Student.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Student.Controllers
{
    public class StudentController : Controller
    {
        private StudentProjectEntities _context = new StudentProjectEntities();

        public ActionResult Index()
        {
            return View();
        }
        public JsonResult List()
        {
            return Json(_context.vwStudentInformations.ToList(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(StudentInformation studentInformation)
        {

            _context.StudentInformations.Add(studentInformation);
            _context.SaveChanges();
            return Json(JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetbyID(int ID)
        {
            return Json(_context.StudentInformations.FirstOrDefault(x => x.ID == ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(StudentInformation studentInformation)
        {
            var data = _context.StudentInformations.FirstOrDefault(x => x.ID == studentInformation.ID);
            if (data != null)
            {
                data.Name = studentInformation.Name;
                data.DOB = studentInformation.DOB;
                data.ContactNo = studentInformation.ContactNo;
                data.MailingAddress = studentInformation.MailingAddress;
                data.FatherName = studentInformation.FatherName;
                data.FatherOccupation = studentInformation.FatherOccupation;
                data.FatherContactNo = studentInformation.FatherContactNo;
                data.MotherName = studentInformation.MotherName;
                data.MotherOccupation = studentInformation.MotherOccupation;
                data.MotherContactNo = studentInformation.MotherContactNo;
                data.UpdateDate = DateTime.Now;
                _context.SaveChanges();
            }
            return Json(JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(int ID)
        {
            var data = _context.StudentInformations.FirstOrDefault(x => x.ID == ID);
            _context.StudentInformations.Remove(data);
            _context.SaveChanges();
            return Json(JsonRequestBehavior.AllowGet);
        }
    }
}
