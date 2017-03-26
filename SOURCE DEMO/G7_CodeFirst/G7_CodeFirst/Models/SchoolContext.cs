using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace G7_CodeFirst.Models
{
    public class SchoolContext : DbContext
    {
        public SchoolContext()
            : base("name=SchoolContext")
        {
        }

        public DbSet<Student> Students { get; set; }
 
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            // khai báo Id sẽ là khóa chính
            modelBuilder.Entity<Student>().HasKey(b => b.Id);
 
            // khai báo Id sẽ tự động tăng
            modelBuilder.Entity<Student>().Property(b => b.Id)
            .HasDatabaseGeneratedOption(DatabaseGeneratedOption.Identity);
            base.OnModelCreating(modelBuilder);
        }
    }
}