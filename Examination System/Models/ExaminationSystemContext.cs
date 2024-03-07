﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Examination_System.Models;

public partial class ExaminationSystemContext : DbContext
{
    public ExaminationSystemContext()
    {
    }

    public ExaminationSystemContext(DbContextOptions<ExaminationSystemContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Branch> Branches { get; set; }

    public virtual DbSet<Course> Courses { get; set; }

    public virtual DbSet<CourseTopic> CourseTopics { get; set; }

    public virtual DbSet<Department> Departments { get; set; }

    public virtual DbSet<DeptInst> DeptInsts { get; set; }

    public virtual DbSet<Exam> Exams { get; set; }

    public virtual DbSet<ExamStQ> ExamStQs { get; set; }

    public virtual DbSet<Instructor> Instructors { get; set; }

    public virtual DbSet<Question> Questions { get; set; }

    public virtual DbSet<QuestionChoice> QuestionChoices { get; set; }

    public virtual DbSet<Student> Students { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Data Source=AHMED\\MSSQLSERVER01;Initial Catalog=ExaminationSystem;Integrated Security=True;Encrypt=True;Trust Server Certificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.UseCollation("Arabic_CI_AI");

        modelBuilder.Entity<Branch>(entity =>
        {
            entity.ToTable("Branch");

            entity.HasIndex(e => e.Name, "uniqueName").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Location)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("location");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        modelBuilder.Entity<Course>(entity =>
        {
            entity.ToTable("Course");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasMany(d => d.Insts).WithMany(p => p.Courses)
                .UsingEntity<Dictionary<string, object>>(
                    "CourseInst",
                    r => r.HasOne<Instructor>().WithMany()
                        .HasForeignKey("InstId")
                        .HasConstraintName("FK_Course_Inst_Instructor"),
                    l => l.HasOne<Course>().WithMany()
                        .HasForeignKey("CourseId")
                        .HasConstraintName("FK_Course_Inst_Course"),
                    j =>
                    {
                        j.HasKey("CourseId", "InstId");
                        j.ToTable("Course_Inst");
                        j.IndexerProperty<int>("CourseId").HasColumnName("Course_Id");
                        j.IndexerProperty<int>("InstId").HasColumnName("Inst_Id");
                    });

            entity.HasMany(d => d.Students).WithMany(p => p.Courses)
                .UsingEntity<Dictionary<string, object>>(
                    "StudentCourse",
                    r => r.HasOne<Student>().WithMany()
                        .HasForeignKey("StudentId")
                        .HasConstraintName("FK_Student_Course_Student"),
                    l => l.HasOne<Course>().WithMany()
                        .HasForeignKey("CourseId")
                        .HasConstraintName("FK_Student_Course_Course"),
                    j =>
                    {
                        j.HasKey("CourseId", "StudentId").HasName("PK_Course_student");
                        j.ToTable("Student_Course");
                        j.IndexerProperty<int>("CourseId").HasColumnName("Course_id");
                        j.IndexerProperty<int>("StudentId").HasColumnName("Student_id");
                    });
        });

        modelBuilder.Entity<CourseTopic>(entity =>
        {
            entity.HasKey(e => new { e.CourseId, e.Topic });

            entity.ToTable("Course_Topic");

            entity.Property(e => e.CourseId).HasColumnName("Course_id");
            entity.Property(e => e.Topic)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Course).WithMany(p => p.CourseTopics)
                .HasForeignKey(d => d.CourseId)
                .HasConstraintName("FK_Course_Topic_Course");
        });

        modelBuilder.Entity<Department>(entity =>
        {
            entity.ToTable("Department");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.BranchId).HasColumnName("Branch_Id");
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Branch).WithMany(p => p.Departments)
                .HasForeignKey(d => d.BranchId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("FK_Department_Branch");
        });

        modelBuilder.Entity<DeptInst>(entity =>
        {
            entity.HasKey(e => new { e.DeptId, e.InstId });

            entity.ToTable("Dept_Inst");

            entity.Property(e => e.DeptId).HasColumnName("Dept_id");
            entity.Property(e => e.InstId).HasColumnName("Inst_id");
            entity.Property(e => e.HiringDate).HasColumnName("Hiring_Date");

            entity.HasOne(d => d.Dept).WithMany(p => p.DeptInsts)
                .HasForeignKey(d => d.DeptId)
                .HasConstraintName("FK_Dept_Inst_Department");

            entity.HasOne(d => d.Inst).WithMany(p => p.DeptInsts)
                .HasForeignKey(d => d.InstId)
                .HasConstraintName("FK_Dept_Inst_Instructor");
        });

        modelBuilder.Entity<Exam>(entity =>
        {
            entity.ToTable("Exam");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.NumMcq).HasColumnName("Num_MCQ");
            entity.Property(e => e.NumTf).HasColumnName("Num_TF");
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("title");
        });

        modelBuilder.Entity<ExamStQ>(entity =>
        {
            entity.HasKey(e => new { e.ExamId, e.StudentId, e.QId });

            entity.ToTable("Exam_St_Q");

            entity.Property(e => e.ExamId).HasColumnName("Exam_id");
            entity.Property(e => e.StudentId).HasColumnName("Student_id");
            entity.Property(e => e.QId).HasColumnName("Q_id");
            entity.Property(e => e.Answer)
                .HasMaxLength(500)
                .IsUnicode(false);

            entity.HasOne(d => d.Exam).WithMany(p => p.ExamStQs)
                .HasForeignKey(d => d.ExamId)
                .HasConstraintName("FK_Exam_St_Q_Exam");

            entity.HasOne(d => d.QIdNavigation).WithMany(p => p.ExamStQs)
                .HasForeignKey(d => d.QId)
                .HasConstraintName("FK_Exam_St_Q_Question");

            entity.HasOne(d => d.Student).WithMany(p => p.ExamStQs)
                .HasForeignKey(d => d.StudentId)
                .HasConstraintName("FK_Exam_St_Q_Student");
        });

        modelBuilder.Entity<Instructor>(entity =>
        {
            entity.ToTable("Instructor");

            entity.HasIndex(e => e.Email, "Email").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Salary).HasColumnName("salary");
        });

        modelBuilder.Entity<Question>(entity =>
        {
            entity.ToTable("Question");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CourseId).HasColumnName("Course_id");
            entity.Property(e => e.Title)
                .HasMaxLength(50)
                .IsUnicode(false);

            entity.HasOne(d => d.Course).WithMany(p => p.Questions)
                .HasForeignKey(d => d.CourseId)
                .HasConstraintName("FK_Question_Course");
        });

        modelBuilder.Entity<QuestionChoice>(entity =>
        {
            entity.HasKey(e => new { e.QId, e.Choice });

            entity.ToTable("Question_choice");

            entity.Property(e => e.QId).HasColumnName("Q_id");
            entity.Property(e => e.Choice)
                .HasMaxLength(500)
                .IsUnicode(false);

            entity.HasOne(d => d.QIdNavigation).WithMany(p => p.QuestionChoices)
                .HasForeignKey(d => d.QId)
                .HasConstraintName("FK_Question_choice_Question");
        });

        modelBuilder.Entity<Student>(entity =>
        {
            entity.ToTable("Student");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.DeptId).HasColumnName("Dept_id");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Name)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Password)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
