using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace G7_CodeFirst.Models
{
    public class RegisterSubject
    {
        [Key]
        public int RegSubID { get; set; }

        public int? StudentID { get; set; }
        [ForeignKey("StudentID")]
        public virtual Student Student { get; set; }

        public int? SubjectID { get; set; }
        [ForeignKey("SubjectID")]
        public virtual Subject Subject { get; set; }
    }

}