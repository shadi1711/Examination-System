USE [master]
GO
/****** Object:  Database [ExaminationSystem]    Script Date: 3/9/2024 11:04:07 PM ******/
CREATE DATABASE [ExaminationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExaminationSystem', FILENAME = N'D:\iti\9m\db\sqlserver\MSSQL16.MSSQLSERVER01\MSSQL\DATA\ExaminationSystem.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ExaminationSystem_log', FILENAME = N'D:\iti\9m\db\sqlserver\MSSQL16.MSSQLSERVER01\MSSQL\DATA\ExaminationSystem_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ExaminationSystem] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExaminationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExaminationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExaminationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExaminationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExaminationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExaminationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExaminationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExaminationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExaminationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExaminationSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [ExaminationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ExaminationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExaminationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExaminationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExaminationSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExaminationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExaminationSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExaminationSystem', N'ON'
GO
ALTER DATABASE [ExaminationSystem] SET QUERY_STORE = ON
GO
ALTER DATABASE [ExaminationSystem] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ExaminationSystem]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[location] [varchar](50) NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Duration] [int] NOT NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Inst]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Inst](
	[Course_Id] [int] NOT NULL,
	[Inst_Id] [int] NOT NULL,
 CONSTRAINT [PK_Course_Inst] PRIMARY KEY CLUSTERED 
(
	[Course_Id] ASC,
	[Inst_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Topic]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Topic](
	[Course_id] [int] NOT NULL,
	[Topic] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Course_Topic] PRIMARY KEY CLUSTERED 
(
	[Course_id] ASC,
	[Topic] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Branch_Id] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dept_Inst]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dept_Inst](
	[Dept_id] [int] NOT NULL,
	[Inst_id] [int] NOT NULL,
	[Hiring_Date] [date] NULL,
 CONSTRAINT [PK_Dept_Inst] PRIMARY KEY CLUSTERED 
(
	[Dept_id] ASC,
	[Inst_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[Num_TF] [int] NOT NULL,
	[Num_MCQ] [int] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam_St_Q]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_St_Q](
	[Exam_id] [int] NOT NULL,
	[Student_id] [int] NOT NULL,
	[Q_id] [int] NOT NULL,
	[Answer] [varchar](500) NULL,
 CONSTRAINT [PK_Exam_St_Q] PRIMARY KEY CLUSTERED 
(
	[Exam_id] ASC,
	[Student_id] ASC,
	[Q_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[salary] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Course_id] [int] NULL,
	[Title] [varchar](500) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question_choice]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question_choice](
	[Q_id] [int] NOT NULL,
	[Choice] [varchar](500) NOT NULL,
	[IsCorrect] [bit] NOT NULL,
 CONSTRAINT [PK_Question_choice] PRIMARY KEY CLUSTERED 
(
	[Q_id] ASC,
	[Choice] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Dept_id] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [unique_email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Course]    Script Date: 3/9/2024 11:04:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Course](
	[Course_id] [int] NOT NULL,
	[Student_id] [int] NOT NULL,
 CONSTRAINT [PK_Course_student] PRIMARY KEY CLUSTERED 
(
	[Course_id] ASC,
	[Student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uniqueName]    Script Date: 3/9/2024 11:04:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [uniqueName] ON [dbo].[Branch]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Email]    Script Date: 3/9/2024 11:04:08 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [Email] ON [dbo].[Instructor]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Question_choice] ADD  CONSTRAINT [DF_Question_choice_IsCorrect]  DEFAULT ((0)) FOR [IsCorrect]
GO
ALTER TABLE [dbo].[Course_Inst]  WITH CHECK ADD  CONSTRAINT [FK_Course_Inst_Course] FOREIGN KEY([Course_Id])
REFERENCES [dbo].[Course] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course_Inst] CHECK CONSTRAINT [FK_Course_Inst_Course]
GO
ALTER TABLE [dbo].[Course_Inst]  WITH CHECK ADD  CONSTRAINT [FK_Course_Inst_Instructor] FOREIGN KEY([Inst_Id])
REFERENCES [dbo].[Instructor] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course_Inst] CHECK CONSTRAINT [FK_Course_Inst_Instructor]
GO
ALTER TABLE [dbo].[Course_Topic]  WITH CHECK ADD  CONSTRAINT [FK_Course_Topic_Course] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Course] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course_Topic] CHECK CONSTRAINT [FK_Course_Topic_Course]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Branch] FOREIGN KEY([Branch_Id])
REFERENCES [dbo].[Branch] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Branch]
GO
ALTER TABLE [dbo].[Dept_Inst]  WITH CHECK ADD  CONSTRAINT [FK_Dept_Inst_Department] FOREIGN KEY([Dept_id])
REFERENCES [dbo].[Department] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dept_Inst] CHECK CONSTRAINT [FK_Dept_Inst_Department]
GO
ALTER TABLE [dbo].[Dept_Inst]  WITH CHECK ADD  CONSTRAINT [FK_Dept_Inst_Instructor] FOREIGN KEY([Inst_id])
REFERENCES [dbo].[Instructor] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Dept_Inst] CHECK CONSTRAINT [FK_Dept_Inst_Instructor]
GO
ALTER TABLE [dbo].[Exam_St_Q]  WITH CHECK ADD  CONSTRAINT [FK_Exam_St_Q_Exam] FOREIGN KEY([Exam_id])
REFERENCES [dbo].[Exam] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam_St_Q] CHECK CONSTRAINT [FK_Exam_St_Q_Exam]
GO
ALTER TABLE [dbo].[Exam_St_Q]  WITH CHECK ADD  CONSTRAINT [FK_Exam_St_Q_Question] FOREIGN KEY([Q_id])
REFERENCES [dbo].[Question] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam_St_Q] CHECK CONSTRAINT [FK_Exam_St_Q_Question]
GO
ALTER TABLE [dbo].[Exam_St_Q]  WITH CHECK ADD  CONSTRAINT [FK_Exam_St_Q_Student] FOREIGN KEY([Student_id])
REFERENCES [dbo].[Student] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam_St_Q] CHECK CONSTRAINT [FK_Exam_St_Q_Student]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_Course] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Course] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_Course]
GO
ALTER TABLE [dbo].[Question_choice]  WITH CHECK ADD  CONSTRAINT [FK_Question_choice_Question] FOREIGN KEY([Q_id])
REFERENCES [dbo].[Question] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Question_choice] CHECK CONSTRAINT [FK_Question_choice_Question]
GO
ALTER TABLE [dbo].[Student_Course]  WITH CHECK ADD  CONSTRAINT [FK_Student_Course_Course] FOREIGN KEY([Course_id])
REFERENCES [dbo].[Course] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student_Course] CHECK CONSTRAINT [FK_Student_Course_Course]
GO
ALTER TABLE [dbo].[Student_Course]  WITH CHECK ADD  CONSTRAINT [FK_Student_Course_Student] FOREIGN KEY([Student_id])
REFERENCES [dbo].[Student] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student_Course] CHECK CONSTRAINT [FK_Student_Course_Student]
GO
/****** Object:  StoredProcedure [dbo].[CalculateStudentGrade]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CalculateStudentGrade] @student_id int
as 
begin
	declare @course_id int
	declare @courseTable table (id int)
	declare @resultTable table (FinalMark money, CourseName varchar(50))

	insert into @courseTable  exec GetCoursesIDsThatStudentTook @student_id
	declare course_cursor cursor for select id from @courseTable

	open course_cursor
	fetch next from course_cursor into @course_id

		while @@FETCH_STATUS = 0
		begin
			declare @FinalMark money, @CourseName varchar(50)

			insert into @resultTable
			exec StudentFinalMarkAndCourse @student_id, @course_id

			fetch next from course_cursor into @course_id
		end

	close course_cursor
	deallocate course_cursor

	select * from @resultTable
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_AllChoicesOfQuestion]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Delete_AllChoicesOfQuestion] @Q_id int
as
	begin try
		delete from Question_choice where Q_id=@Q_id
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[Delete_Branch]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Delete_Branch]
@BranchID INT
AS 
BEGIN 

	SET NOCOUNT ON;
		BEGIN TRY
			BEGIN TRANSACTION;
			--	DELETE FROM [dbo].[Dept_Inst] 
			--	WHERE [Dept_id] IN (SELECT [id] FROM [dbo].[Department] WHERE [Branch_Id] = @BranchID);
			--	DELETE FROM [dbo].[Department] WHERE [Branch_Id] = @BranchID;
				DELETE FROM [dbo].[Branch] WHERE [id] = @BranchID;
			COMMIT;
		END TRY
		BEGIN CATCH
			ROLLBACK;
			PRINT ERROR_MESSAGE();
		END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[Delete_Choice]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Delete_Choice] @Q_id int,@Choice varchar(50)
as
	begin try
		delete from Question_choice where Q_id=@Q_id and Choice=@Choice
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[Delete_CorrectChoice]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Delete_CorrectChoice] @Q_id int
as
	begin try
		delete from Question_choice where Q_id=@Q_id and IsCorrect=1
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[Delete_Course]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--delete
create Proc [dbo].[Delete_Course] @Id int
as
	begin 
	begin try
		if exists(select Course_Id from Course_Inst where Course_Id=@Id) 
			delete from Course_Inst where Course_Id=@Id
		if exists(select * from Course_Topic where Course_Id=@Id)
			delete from Course_Topic where Course_Id=@Id
		delete from Course where Id = @Id
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end
GO
/****** Object:  StoredProcedure [dbo].[Delete_Course_Inst]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Delete
create Proc [dbo].[Delete_Course_Inst] @CourseId int, @InstructorId int
as
	begin begin try
		delete from Course_Inst where Course_Id=@CourseId and Inst_Id=@InstructorId
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end
GO
/****** Object:  StoredProcedure [dbo].[Delete_Course_Topic]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Delete
create Proc [dbo].[Delete_Course_Topic] @CId int,@topic varchar(50)
as
	begin begin try
		delete from Course_Topic where Course_id=@CId and Topic=@topic
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end 
GO
/****** Object:  StoredProcedure [dbo].[Delete_Department]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------delete Department
CREATE PROCEDURE [dbo].[Delete_Department]
    @DeptID INT
AS 
BEGIN 
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
       IF EXISTS (SELECT 1 FROM [dbo].[Dept_Inst] WHERE [Dept_id] = @DeptID)
        BEGIN
            DELETE FROM [dbo].[Dept_Inst] WHERE [Dept_id] = @DeptID;
        END
        DELETE FROM [dbo].[Department] WHERE [id] = @DeptID;
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[Delete_Dept_Ins]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------Delete Dept_ins
CREATE proc [dbo].[Delete_Dept_Ins]
@Dept_ID int,
@Ins_ID int
as 
begin
delete from [dbo].[Dept_Inst]
where [Dept_id]=@Dept_ID And [Inst_id]=@Ins_ID
end;
GO
/****** Object:  StoredProcedure [dbo].[Delete_Exam]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- __________________________________________________________

CREATE procedure [dbo].[Delete_Exam]
    @examId int
as
begin
    begin try
        if not exists (select 1 from Exam where id = @examId)
        begin
            print 'There is No Exam with Provided Id';
        end
        else
        begin
            /*if exists (select 1 from Exam_St_Q where Exam_id = @examId)
            begin
				delete from Exam_St_Q where Exam_id = @examId;
                select 'delete Related Rows in Exam_St_Q.';
            end*/

            -- Delete the exam
            delete from Exam where id = @examId;
            print 'Exam Deleted Successfully!';
        end;
    end try
    begin catch
        declare @errorMessage varchar(4000);
        select @errorMessage = ERROR_MESSAGE();
        print 'An Error Occurred: ' + @errorMessage;
    end catch;
end;

GO
/****** Object:  StoredProcedure [dbo].[delete_exam_st_q]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- __________________________________________________________

-- Exam_St_Q Table -> delete data 
CREATE proc [dbo].[delete_exam_st_q]
	@examId int,
	@std_id int,
	@q_id int
as
Begin
	Begin Try
		if exists (select 1 from Exam_St_Q where Exam_id = @examId and Student_id = @std_id and Q_id = @q_id)
		Begin
			if not exists (select 1 from Exam where id = @examId)
			Begin
				print 'Referenced Exam not found'
			End

			if not exists (select 1 from Student where id = @std_id)
			Begin
				print 'Referenced Student not found'
			End

			if not exists (select 1 from Question where id = @q_id)
			Begin
				print 'Referenced Question not found'
			End

			delete from Exam_St_Q where Exam_id = @examId and Student_id = @std_id and Q_id = @q_id;
			print 'Data Deleted Successfully from Exam_St_Q.';
		End
		else
		Begin
            print 'No Matching Data Found in Exam_St_Q.';
        end;
	End Try
	Begin Catch
		declare @errorMessage varchar(100);
		select @errorMessage = ERROR_MESSAGE();
		print @errorMessage;
	End Catch
End;
GO
/****** Object:  StoredProcedure [dbo].[delete_exam_st_q_ForStudent]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[delete_exam_st_q_ForStudent]
	@examId int,
	@std_id int
as
Begin
	Begin Try
		if exists (select 1 from Exam_St_Q where Exam_id = @examId and Student_id = @std_id )
		Begin
			if not exists (select 1 from Exam where id = @examId)
			Begin
				print 'Referenced Exam not found'
			End

			if not exists (select 1 from Student where id = @std_id)
			Begin
				print 'Referenced Student not found'
			End

			delete from Exam_St_Q where Exam_id = @examId and Student_id = @std_id ;
			print 'Data Deleted Successfully from Exam_St_Q.';
		End
		else
		Begin
            print 'No Matching Data Found in Exam_St_Q.';
        end;
	End Try
	Begin Catch
		declare @errorMessage varchar(100);
		select @errorMessage = ERROR_MESSAGE();
		print @errorMessage;
	End Catch
End;
GO
/****** Object:  StoredProcedure [dbo].[Delete_Instructor]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--delete
create Proc [dbo].[Delete_Instructor] @Id int
as
	begin begin try
		if exists(select Inst_id from Dept_Inst where Inst_id=@Id) 
			delete from Dept_Inst where Inst_id=@Id
		if exists (select Inst_id from Course_Inst where Inst_id=@Id)
			delete from Course_Inst where Inst_id=@Id
		delete from Instructor where Id = @Id
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end 
GO
/****** Object:  StoredProcedure [dbo].[Delete_Question]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Delete_Question] @id int
as
	begin try
		delete from Question where id=@id
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudent]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStudent]
    @Student_id INT
AS
BEGIN

    BEGIN TRY
        -- Check if the student with the given ID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Student WHERE id = @Student_id)
        BEGIN
            -- If student doesn't exist, raise an error
            RAISERROR('Student with the provided ID does not exist.', 16, 1);
            RETURN;
        END

        -- Delete related records in the Student_Course table
        DELETE FROM dbo.Student_Course
        WHERE Student_id = @Student_id;

        -- Delete the student record
        DELETE FROM dbo.Student
        WHERE id = @Student_id;
    END TRY
    BEGIN CATCH
        -- Handle the error here
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Customizing error message to make it more user-friendly
        SET @ErrorMessage = 'An error occurred while deleting the student record. ' + @ErrorMessage;

        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteStudentCourse]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteStudentCourse]
    @Student_id INT,
    @Course_id INT
AS
BEGIN
    BEGIN TRY
        -- Check if the student exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Student WHERE id = @Student_id)
        BEGIN
            RAISERROR('Student with the provided ID does not exist.', 16, 1);
            RETURN;
        END

        -- Check if the course exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Course WHERE id = @Course_id)
        BEGIN
            RAISERROR('Course with the provided ID does not exist with .', 16, 1);
            RETURN;
        END

        -- Check if the student-course relationship exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Student_Course WHERE Student_id = @Student_id AND Course_id = @Course_id)
        BEGIN
            RAISERROR('Student-Course relationship with provided IDs does not exist.', 16, 1);
            RETURN;
        END

        -- Delete the student-course relationship
        DELETE FROM dbo.Student_Course
        WHERE Student_id = @Student_id AND Course_id = @Course_id;
    END TRY
    BEGIN CATCH
        -- Handle the error here
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR('An error occurred while deleting the student-course relationship. %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[DisplayExam]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------for reporting
CREATE proc [dbo].[DisplayExam] @examID int , @StudentID int
as 
select 
    q.id AS Question_ID,
    q.Title,
    qc.choice
FROM
    question q
LEFT JOIN
    Question_choice qc ON qc.Q_id = q.id
INNER JOIN
    Exam_St_Q esq ON esq.Q_id = q.id
WHERE
    esq.Exam_id = @examID
    AND esq.Student_id = @StudentID
ORDER BY q.id;

GO
/****** Object:  StoredProcedure [dbo].[ExamCorrection]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----fro reporting
CREATE proc [dbo].[ExamCorrection] @examID int , @StudentID int
as 
select 
    q.id AS Question_ID,
    q.Title,
    qc.choice,
    esq.answer,
    CASE
        WHEN q.type = 1 THEN 'MCQ'
        ELSE 'T&F'
    END AS Question_type,
    q.Grade AS QuestionFullMark,
    CASE
        WHEN qc.choice = esq.answer and qc.IsCorrect=1 THEN q.Grade
        ELSE 0
    END AS StudentMarks
FROM
    question q
LEFT JOIN
    Question_choice qc ON qc.Q_id = q.id
INNER JOIN
    Exam_St_Q esq ON esq.Q_id = q.id
WHERE
    esq.Exam_id = @examID
    AND esq.Student_id = @StudentID
ORDER BY q.id;


GO
/****** Object:  StoredProcedure [dbo].[Generate_Exam]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Generate_Exam] @title varchar(50),@Course_id int,@StudID int,@Num_TF int=3,@Num_Mcq int=7
as
	begin

		if exists (
					SELECT  distinct  Question.Course_id
					FROM  Exam_St_Q INNER JOIN
					  Question ON Exam_St_Q.Q_id = Question.id
					  where Student_id=@StudID and Course_id=@Course_id
					)
		begin
			select -1 As Id,'you have already done an exam on the same course'As Msg
			return;
		end
		if(@Num_TF> (select count(*) from Question where Type=0 and Course_id=@Course_id))
		begin
			select -1 As Id,'Exam is not allowed now'As Msg
			return;
		end
		else if(@Num_Mcq> (select count(*) from Question where Type=1 and Course_id=@Course_id))
		begin
			select -1 As Id,'Exam is not allowed now' As Msg
			return;
		end
		else
			begin
				declare @examID int
				exec insert_Exam 'Exam1',@Num_TF,@Num_Mcq, @examID output

				declare cursor_for_TF cursor for select id from Question 
					where Type=0 and Course_id=@Course_id
					order by newid()
				declare cursor_for_MCQ cursor for select id from Question 
					where Type=1 and Course_id=@Course_id
					order by newid()

				declare @QID int
				open cursor_for_TF
				fetch cursor_for_TF into @QID
				while(@@FETCH_STATUS=0 and @Num_TF>0)
					begin
						exec insert_Exam_St_Q @examID,@StudID,@QID,null
						set @Num_TF=@Num_TF-1
						fetch cursor_for_TF into @QID
					end
				close cursor_for_TF
				deallocate cursor_for_TF

				open cursor_for_MCQ
				fetch cursor_for_MCQ into @QID
				while(@@FETCH_STATUS=0 and @Num_Mcq>0)
					begin
						exec insert_Exam_St_Q @examID,@StudID,@QID,null
						set @Num_Mcq=@Num_Mcq-1
						fetch cursor_for_MCQ into @QID
					end
				close cursor_for_MCQ
				deallocate cursor_for_MCQ

				select @examID as Id,'Done'as Msg
			end
	end
GO
/****** Object:  StoredProcedure [dbo].[GetCoursesIDsThatStudentTook]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetCoursesIDsThatStudentTook] @student_id int
as 
	begin
		select Distinct  c.id
		from course c
		inner join Question q on q.Course_id=c.id
		inner join Exam_St_Q esq on esq.Q_id=q.id
		where esq.Student_id=@student_id
	end
GO
/****** Object:  StoredProcedure [dbo].[GetCourseTopics]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCourseTopics]
    @CourseId INT
AS
BEGIN
    -- Select the topics for the given course
    SELECT
        [Topic] AS CourseTopic
    FROM
        [dbo].[Course_Topic]
    WHERE
        [Course_id] = @CourseId
END
GO
/****** Object:  StoredProcedure [dbo].[GetInstructorCoursesAndStudents]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetInstructorCoursesAndStudents]
    @InstructorId INT
AS
BEGIN
    -- Select the courses and their names for the given instructor
    SELECT
        C.[Name] AS CourseName,
        COUNT(SC.[Student_id]) AS NumberOfStudents
    FROM
        [dbo].[Course_Inst] CI
    INNER JOIN
        [dbo].[Course] C ON CI.[Course_Id] = C.[id]
    LEFT JOIN
        [dbo].[Student_Course] SC ON CI.[Course_Id] = SC.[Course_id]
    WHERE
        CI.[Inst_Id] = @InstructorId
    GROUP BY
        C.[Name]
END

GO
/****** Object:  StoredProcedure [dbo].[GetStudentCoursesByCourseId]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE proc [dbo].[GetStudentCoursesByCourseId] @Cid int
as
begin
    select Student.id, Student.Name,  Student.Email,Student.Dept_id, Student_Course.Course_id from Student
    inner join Student_Course on Student.id = Student_Course.Student_id
    where Student_Course.Course_id = @Cid;
end


GO
/****** Object:  StoredProcedure [dbo].[Insert_Branch]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---- insert branch
CREATE proc [dbo].[Insert_Branch]
@Name varchar(50),
@Location varchar (50)
as 
begin
insert into [dbo].[Branch]([Name],[location])
values (@Name,@Location)
end ;
GO
/****** Object:  StoredProcedure [dbo].[Insert_Course]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--insert
create Proc [dbo].[Insert_Course] @Name varchar(50),@Duration INT,@Grade INT
as
	begin 
	begin try
		insert into Course (Name, Duration, Grade) values (@Name, @Duration, @Grade)
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end 
GO
/****** Object:  StoredProcedure [dbo].[Insert_Course_Inst]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Insert
create Proc [dbo].[Insert_Course_Inst] @CourseId int, @InstructorId int
as
	begin 
	begin try
		insert into Course_Inst (Course_Id, Inst_Id) values (@CourseId, @InstructorId)
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end
GO
/****** Object:  StoredProcedure [dbo].[Insert_Course_Topic]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Insert
create Proc [dbo].[Insert_Course_Topic] @CId int,@topic varchar(50)
as
	begin begin try
		insert into Course_Topic (Course_id, Topic) values (@CId, @Topic)
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end
GO
/****** Object:  StoredProcedure [dbo].[Insert_Department]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------- inset Department
CREATE proc [dbo].[Insert_Department]
@Name varchar(50),
@BranchId int
as
begin 
insert into [dbo].[Department]([Name],[Branch_Id])
values (@Name,@BranchId)
end;
GO
/****** Object:  StoredProcedure [dbo].[Insert_Dept_Ins]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------- insert dept_ins
CREATE proc [dbo].[Insert_Dept_Ins]
@Dept_ID int,
@Ins_ID int,
@Hiring_Date date
as 
begin 
insert into [dbo].[Dept_Inst]([Dept_id],[Inst_id],[Hiring_Date])
values (@Dept_ID,@Ins_ID,@Hiring_Date)
end;
GO
/****** Object:  StoredProcedure [dbo].[insert_Exam]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[insert_Exam]
	@examTitle varchar(50),
	@examNum_TF int,
	@examNum_MCQ int,
	@examid int output
as
Begin
	Begin Try
		insert into Exam( title, Num_TF, Num_MCQ)
		values (@examTitle, @examNum_TF, @examNum_MCQ);
		set @examid = SCOPE_IDENTITY()
	End Try
	Begin Catch
		select 'An error occurred while inserting data into the Exam.';
		select 'Error Description: ' + ERROR_MESSAGE();
	End Catch;
End;
GO
/****** Object:  StoredProcedure [dbo].[insert_Exam_St_Q]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- __________________________ Exam_St_Q ________________________________

-- Exam_St_Q Table -> Insert data
CREATE proc [dbo].[insert_Exam_St_Q]
	@examId int,
	@Std_Id int,
	@Q_id int,
	@answer nchar(10)
as
Begin
	Begin Try
		if not exists(select 1 from Exam where id = @examId)
		Begin
			print 'There is No Exam with Provided id';
		End

		if not exists(select 1 from Student where id = @Std_Id)
		Begin
			print 'There is No Student with Provided id';
		End

		if not exists(select 1 from Question where id = @Q_id)
		Begin
			print 'There is No Question with Provided id';
		End

		insert into Exam_St_Q (Exam_id, Student_id, Q_id, Answer)
        values (@examId, @Std_Id, @Q_id, @answer);
		PRINT 'Data inserted successfully into Exam_St_Q.';
	End Try

	Begin Catch
		declare @errorMessage varchar(100);
		select @errorMessage = ERROR_MESSAGE();
		print @errorMessage;
	End Catch;
End;

GO
/****** Object:  StoredProcedure [dbo].[Insert_Instructor]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--insert
create Proc [dbo].[Insert_Instructor] @Name varchar(50),@Salary int,@Email varchar(50),@Password varchar(50)
as
	begin begin try
		if not exists(select Email from Instructor where Email=@Email)
			insert into Instructor (Name, Salary, Email, Password) values (@Name, @Salary, @Email, @Password)
		else select 'Use other Email '
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end
GO
/****** Object:  StoredProcedure [dbo].[Insert_Question]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Insert_Question] @course_id int,@title varchar(50),@type tinyint,@grade int
as
	begin try
		insert into Question (course_id, title, type, grade) values (@course_id, @title, @type, @grade)
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[Insert_Question_choices]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Insert_Question_choices] @Q_id INT, @choice VARCHAR(50), @isCorrect BIT=0
AS
	begin try
		IF exists  (select IsCorrect from Question_choice where Q_id=@Q_id and IsCorrect=1)and (@isCorrect=1)
		SELECT 'The question has a correct answer already!!'
		ELSE
		INSERT INTO Question_choice (Q_id, choice, isCorrect) VALUES (@Q_id, @choice, @isCorrect)
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[InsertStudent]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertStudent]
    @Name VARCHAR(50),
    @Email VARCHAR(50),
    @Password VARCHAR(50),
    @Dept_id INT
AS
BEGIN

    BEGIN TRY
        -- Check if the email already exists in the Student table
        IF EXISTS (SELECT 1 FROM dbo.Student WHERE Email = @Email)
        BEGIN
            -- If email already exists, raise an error
            RAISERROR('A student with the provided email already exists.', 16, 1);
        END
        ELSE
        BEGIN
            -- Insert the student record
            INSERT INTO dbo.Student (Name, Email, Password, Dept_id)
            VALUES (@Name, @Email, @Password, @Dept_id);
        END
    END TRY
    BEGIN CATCH
        -- Handle the error here
        DECLARE @ErrorMessage NVARCHAR(4000);
        -- Customizing error message to make it more user-friendly
        SET @ErrorMessage = 'Error occurred while inserting the student record. ' + ERROR_MESSAGE();

        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertStudentCourse]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertStudentCourse]
    @Student_id INT,
    @Course_id INT
AS
BEGIN

    BEGIN TRY
        -- Check if the student exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Student WHERE id = @Student_id)
        BEGIN
            RAISERROR('Student with the provided ID does not exist.', 16, 1);
            RETURN;
        END

        -- Check if the course exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Course WHERE id = @Course_id)
        BEGIN
            RAISERROR('Course with the provided ID does not exist.', 16, 1);
            RETURN;
        END

        -- Check if the student-course relationship already exists
        IF EXISTS (SELECT 1 FROM dbo.Student_Course WHERE Student_id = @Student_id AND Course_id = @Course_id)
        BEGIN
            RAISERROR('Course  already exists in these student .', 16, 1);
            RETURN;
        END

        -- Insert the student-course relationship
        INSERT INTO dbo.Student_Course (Student_id, Course_id)
        VALUES (@Student_id, @Course_id);
    END TRY
    BEGIN CATCH
        -- Handle the error here
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR('An error occurred while inserting the student-course relationship. %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[select_Branch]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[select_Branch]
as 
begin
select * from [dbo].[Branch];
end ;
GO
/****** Object:  StoredProcedure [dbo].[select_BranchByID]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[select_BranchByID] @Id int
as 
begin
select * from [dbo].[Branch] where id=@Id;
end ;
GO
/****** Object:  StoredProcedure [dbo].[Select_CorrectChoice]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Select_CorrectChoice] @id int
as
	begin try
		select * from Question_choice where Q_id=@id and IsCorrect=1
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[Select_Course]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------Course-----------------------------
--Select
create Proc [dbo].[Select_Course] @Id int
as
	begin 
	begin try
		select * from Course  where id=@Id
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end 
GO
/****** Object:  StoredProcedure [dbo].[Select_Course_Inst]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Select_Course_Inst] @InstructorId int
as 
	begin try
		select c.id, c.Name, c.Grade, c.Duration from Course c inner join Course_Inst ci ON c.id = ci.Course_Id and ci.Inst_Id=@InstructorId
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[Select_Course_Topic]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Select_Course_Topic] @CId int
as
	begin try
		select Course_Id , Topic  from Course_Topic  where Course_id=@CId
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[Select_Courses]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 create Proc [dbo].[Select_Courses]
as
	begin 
	begin try
		select * from Course  
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end 
GO
/****** Object:  StoredProcedure [dbo].[Select_Department]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------select Department
CREATE proc [dbo].[Select_Department]
as
begin
select * from [dbo].[Department]
end;
GO
/****** Object:  StoredProcedure [dbo].[Select_DepartmentByid]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_DepartmentByid] @id int
as
begin
select * from [dbo].[Department] where id=@id
end;
GO
/****** Object:  StoredProcedure [dbo].[Select_Dept_Ins]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------select Dept_ins
CREATE proc [dbo].[Select_Dept_Ins]
as
begin
select * from [dbo].[Dept_Inst]
end;
GO
/****** Object:  StoredProcedure [dbo].[Select_Dept_InsByDept_Id]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Select_Dept_InsByDept_Id] @dept_Id int
as
begin
select * from [dbo].[Dept_Inst] where Dept_id=@dept_Id
end;
GO
/****** Object:  StoredProcedure [dbo].[select_exam]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- __________________________________________________________

-- Exam Table -> select data
CREATE proc [dbo].[select_exam]
	@examId int
as
Begin
	If Exists (select 1 from Exam where id = @examId )
	Begin 
		select * From Exam
		where id = @examId
	End;
	else
	Begin
		select 'There is No exam with this Id '; 
	End;
End;

GO
/****** Object:  StoredProcedure [dbo].[select_Exam_st_Q]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- __________________________________________________________

-- Exam_St_Q Table -> Select data 
CREATE proc [dbo].[select_Exam_st_Q]
	@examId int,
    @Std_Id int,
    @Q_id int
as
Begin
	Begin Try
		if not exists(select 1 from Exam where id = @examId)
		Begin
			print 'There is No Exam with Provided id';
			return;
		End

		if not exists(select 1 from Student where id = @Std_Id)
		Begin
			print 'There is No Student with Provided id';
			return;
		End

		if not exists(select 1 from Question where id = @Q_id)
		Begin
			print 'There is No Question with Provided id';
			return;
		End

		select * 
		from Exam_St_Q 
		where Exam_id = @examId and Student_id = @Std_Id and Q_id = @Q_id

	End Try
	Begin Catch
		declare @errorMessage varchar(100);
		select @errorMessage = ERROR_MESSAGE();
		print @errorMessage;
	End Catch
End

GO
/****** Object:  StoredProcedure [dbo].[Select_Exam_st_Q_For_Exam]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Select_Exam_st_Q_For_Exam] @examId int,@studId int
as
	select * from Exam_St_Q where Exam_id=@examId and Student_id=@studId
GO
/****** Object:  StoredProcedure [dbo].[Select_Instructor_Email]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[Select_Instructor_Email] @email varchar(50)
as
	begin begin try
		select * from Instructor where Email=@email
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end 
GO
/****** Object:  StoredProcedure [dbo].[Select_Instructor_Id]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Proc [dbo].[Select_Instructor_Id] @id int
as
	begin begin try
		select * from Instructor where id=@id
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end
GO
/****** Object:  StoredProcedure [dbo].[Select_Question_ById]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Select_Question_ById] @id int
as
	begin try
		select * from Question where id=@id
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[Select_Question_choices_ById]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Select_Question_choices_ById] @id int
as
	begin try
		select * from Question_choice where Q_id=@id
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[Select_Questions_ByCourseID]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Select_Questions_ByCourseID] @CourseID int
as
	begin try
		select * from Question where Course_id=@CourseID
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[Select_Questions_ByCourseID_and_Type]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Select_Questions_ByCourseID_and_Type] @CourseID int ,@type tinyint
as
	begin try
		select * from Question where Course_id=@CourseID and Type=@type
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[Select_Student_Email]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[Select_Student_Email] @email varchar(50)
as
	select * from Student where Email=@email
GO
/****** Object:  StoredProcedure [dbo].[SelectAllStudentCourses]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllStudentCourses]
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Select all records from the Student_Course table
        SELECT *
        FROM dbo.Student_Course;
    END TRY
    BEGIN CATCH      

        SELECT('An error occurred while selecting all student courses.');
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectAllStudents]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllStudents]
AS
BEGIN

    BEGIN TRY
        -- Select all students
        SELECT *
        FROM dbo.Student;
    END TRY
    BEGIN CATCH
       
        SELECT('An error occurred while selecting all students. ');
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectStudentByID]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectStudentByID]
    @Student_id INT
AS
BEGIN

    BEGIN TRY
        -- Check if the student exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Student WHERE id = @Student_id)
        BEGIN
            RAISERROR('Student with the provided ID does not exist.', 16, 1);
            RETURN;
        END

        -- Select student information by ID
        SELECT *
        FROM dbo.Student
        WHERE id = @Student_id;
    END TRY
    BEGIN CATCH
        -- Handle the error here
        DECLARE @ErrorMessage NVARCHAR(400);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR('An error occurred while selecting student information. %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectStudentCourses]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectStudentCourses]
    @Student_id INT
AS
BEGIN
    BEGIN TRY
        -- Check if the student exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Student WHERE id = @Student_id)
        BEGIN
            RAISERROR('Student with the provided ID does not exist.', 16, 1);
            RETURN;
        END

        -- Select courses for the given student
        SELECT c.*
        FROM dbo.Course c
        INNER JOIN dbo.Student_Course sc ON c.id = sc.Course_id
        WHERE sc.Student_id = @Student_id;
    END TRY
    BEGIN CATCH
        -- Handle the error here
        DECLARE @ErrorMessage NVARCHAR(400);
        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR('An error occurred while selecting student courses. %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[StudentFinalMark]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[StudentFinalMark] @student_Id int , @course_id int
as
	begin
		declare @StudentMark money,@TotalMark money
		select @StudentMark= sum(q.Grade)  from Exam_St_Q esq
				inner join Question q on esq.Q_id=q.id
				inner join Question_choice qc on q.id=qc.Q_id and esq.Answer=qc.Choice and qc.IsCorrect=1
				where esq.Student_id=@student_Id and q.Course_id=@course_id
	
		select @TotalMark= sum(q.Grade)  from Exam_St_Q esq
				inner join Question q on esq.Q_id=q.id
				inner join Question_choice qc on q.id=qc.Q_id and esq.Answer=qc.Choice 
				where esq.Student_id=@student_Id and q.Course_id=@course_id

		SELECT (ISNULL(@StudentMark, 0) / NULLIF(@TotalMark, 0))*100  AS FinalMark
	end


GO
/****** Object:  StoredProcedure [dbo].[StudentFinalMarkAndCourse]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[StudentFinalMarkAndCourse] @student_Id int , @course_id int
as
	begin
		declare @StudentMark money,@TotalMark money ,@courseName varchar(50)
		select @StudentMark= sum(q.Grade)  from Exam_St_Q esq
				inner join Question q on esq.Q_id=q.id
				inner join Question_choice qc on q.id=qc.Q_id and esq.Answer=qc.Choice and qc.IsCorrect=1
				where esq.Student_id=@student_Id and q.Course_id=@course_id
	
		select @TotalMark= sum(q.Grade)  from Exam_St_Q esq
				inner join Question q on esq.Q_id=q.id
				inner join Question_choice qc on q.id=qc.Q_id and esq.Answer=qc.Choice 
				where esq.Student_id=@student_Id and q.Course_id=@course_id

		select @courseName=c.Name from course c where c.id=@course_id
				

		SELECT (ISNULL(@StudentMark, 0) / NULLIF(@TotalMark, 0))*100  AS FinalMark ,@courseName as CourseName
	end
GO
/****** Object:  StoredProcedure [dbo].[Update_Branch]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----------update branch
CREATE proc [dbo].[Update_Branch]
@Id int,
@Name varchar(50),
@Location varchar(50)
as 
begin
update [dbo].[Branch]
set [Name]=@Name ,[location]=@Location
where [id]=@Id
end;
GO
/****** Object:  StoredProcedure [dbo].[Update_Course]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--update
create Proc [dbo].[Update_Course] @Id int,@Name varchar(50),@Duration INT,@Grade INT
as
	begin
	begin try
		update Course set Name = @Name, Duration = @Duration, Grade = @Grade where Id = @Id
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end
GO
/****** Object:  StoredProcedure [dbo].[Update_Course_Inst]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Update
create Proc [dbo].[Update_Course_Inst] @CourseId int, @InstructorId int,@NewCourseId int, @NewInstructorId int
as
	begin
	begin try
		update Course_Inst set Inst_Id=@NewInstructorId, @CourseId=@NewCourseId where Course_Id=@CourseId and Inst_Id=@InstructorId
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end 
GO
/****** Object:  StoredProcedure [dbo].[Update_Course_Topic]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Update
create Proc [dbo].[Update_Course_Topic] @CId int,@topic varchar(50),@NewTopic varchar(50)
as
	begin begin try
		update Course_Topic set Topic=@NewTopic where Course_id=@CId and Topic=@topic
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end 
GO
/****** Object:  StoredProcedure [dbo].[Update_Department]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------Update Department
CREATE PROCEDURE [dbo].[Update_Department]
    @Id INT,
    @Name VARCHAR(50),
    @Branch_ID INT
AS 
BEGIN 
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
        UPDATE [dbo].[Department]
        SET [Name] = @Name, [Branch_Id] = @Branch_ID
        WHERE [id] = @Id;
        
        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT ERROR_MESSAGE();
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[Update_Dept_Ins]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Update_Dept_Ins]
@Old_Dept_ID int,
@Old_Ins_ID int ,
@Dept_ID int,
@Ins_ID int
as 
begin
update [dbo].[Dept_Inst]
set [Dept_id]=@Dept_ID , [Inst_id]=@Ins_ID 
where [Dept_id]=@Old_Dept_ID and [Inst_id]=@Old_Ins_ID
end;
GO
/****** Object:  StoredProcedure [dbo].[Update_Dept_Ins_HiringDate]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Update_Dept_Ins_HiringDate]
@Old_Dept_ID int,
@Old_Ins_ID int ,
@Hiring_Date date
as 
begin
update [dbo].[Dept_Inst]
set Hiring_Date=@Hiring_Date
where [Dept_id]=@Old_Dept_ID and [Inst_id]=@Old_Ins_ID
end;
GO
/****** Object:  StoredProcedure [dbo].[update_exam]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- __________________________________________________________

-- Exam Table -> Update data
CREATE proc [dbo].[update_exam]
	@examId int,
    @newTitle varchar(50),
    @newNum_TF int,
    @newNum_MCQ int
as
Begin
	Begin Try
		if Not Exists ( select 1 from Exam where id = @examId )
			Begin
				select 'There is No Exam with Provided id'; 
			End;
		else if @newNum_TF < 0 or @newNum_MCQ < 0
			Begin
				select 'Invalid Data, Number of Questions Can Not Be Negative!';
			End;
		else
		Begin
			update Exam 
			set title = @newTitle ,
				Num_TF = @newNum_TF,
				Num_MCQ = @newNum_MCQ
			where id = @examId;

			select 'Exam updated successfully.';
		End;
	End Try

	Begin Catch
		Declare @ErrorMessage varchar(400);
        select @ErrorMessage = ERROR_MESSAGE();
		select @ErrorMessage;
	End Catch;
End;

GO
/****** Object:  StoredProcedure [dbo].[update_Exam_St_Q]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[update_Exam_St_Q]
	@examId int,
    @std_id int,
    @q_id int,
    @newAnswer varchar(500)
as
Begin
	Begin Try
		Begin
			update Exam_St_Q 
			set Answer = @newAnswer
			where Exam_id = @examId and Student_id = @std_id and Q_id = @q_id

			print 'Exam_st_q updated successfully.';
		End;
	End Try

	Begin Catch
		Declare @ErrorMessage varchar(400);
        select @ErrorMessage = ERROR_MESSAGE();
		select @ErrorMessage;
	End Catch;
End;
GO
/****** Object:  StoredProcedure [dbo].[Update_Instructor]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--update
create Proc [dbo].[Update_Instructor] @Id int,@Name varchar(50),@Salary int,@Email varchar(50),@Password varchar(50)
as
	begin begin try
		if not exists(select Email from Instructor where Email=@Email)
			update Instructor set Name = @Name, Salary = @Salary, Email = @Email, Password = @Password where Id = @Id
		else select 'Use other Email '
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	 end catch end
GO
/****** Object:  StoredProcedure [dbo].[Update_Question]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Update_Question] @id int, @course_id int,@title varchar(50),@type tinyint,@grade int
as
	begin try
		update Question set Course_id= @course_id,title= @title,Type= @type,Grade= @grade where id=@id
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[Update_Question_choices]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Update_Question_choices] @Q_id INT, @choice VARCHAR(50), @isCorrect BIT
as
	begin try
			IF exists  (select IsCorrect from Question_choice where Q_id=@Q_id and IsCorrect=1)and (@isCorrect=1)
			SELECT 'The question has a correct answer already!!'
			ELSE
			update Question_choice set isCorrect=@isCorrect where Q_id=@Q_id and choice=@choice
	end try
	begin catch
		select 'An error occurred '+ ERROR_MESSAGE()
	end catch
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudent]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStudent]
    @Student_id INT,
    @Name VARCHAR(50),
    @Email VARCHAR(50),
    @Password VARCHAR(50),
    @Dept_id INT
AS
BEGIN

    BEGIN TRY
        -- Check if the student with the given ID exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Student WHERE id = @Student_id)
        BEGIN
            -- If student doesn't exist, raise an error
            RAISERROR('Student with the provided ID does not exist.', 16, 1);
            RETURN;
        END

        -- Check if the provided email already exists in the Student table (excluding the current student)
        IF EXISTS (SELECT 1 FROM dbo.Student WHERE Email = @Email AND id != @Student_id)
        BEGIN
            -- If email already exists for another student, raise an error
            RAISERROR('A student with the provided email already exists.', 16, 1);
            RETURN;
        END

        -- Check if the provided Dept_id matches with a department in the Department table
        IF NOT EXISTS (SELECT 1 FROM dbo.Department WHERE id = @Dept_id)
        BEGIN
            -- If Dept_id doesn't match with any department, raise an error
            RAISERROR('Department with the provided ID does not exist.', 16, 1);
            RETURN;
        END

        -- Update the student record
        UPDATE dbo.Student
        SET Name = @Name,
            Email = @Email,
            Password = @Password,
            Dept_id = @Dept_id
        WHERE id = @Student_id;
    END TRY
    BEGIN CATCH
        -- Handle the error here
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Customizing error message to make it more user-friendly
        SET @ErrorMessage = 'An error occurred while updating the student record. ' + @ErrorMessage;

        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateStudentCourse]    Script Date: 3/9/2024 11:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStudentCourse]
    @Student_id INT,
    @Course_id INT
AS
BEGIN

    BEGIN TRY
        -- Check if the student exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Student WHERE id = @Student_id)
        BEGIN
            RAISERROR('Student with the provided ID does not exist.', 16, 1);
            RETURN;
        END

        -- Check if the course exists
        IF NOT EXISTS (SELECT 1 FROM dbo.Course WHERE id = @Course_id)
        BEGIN
            RAISERROR('Course with the provided ID does not exist.', 16, 1);
            RETURN;
        END

        -- Update the student-course relationship
        UPDATE dbo.Student_Course
        SET Course_id = @Course_id
        WHERE Student_id = @Student_id;
    END TRY
    BEGIN CATCH
        -- Handle the error here
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();

        RAISERROR('An error occurred while updating the student-course relationship. %s', 16, 1, @ErrorMessage);
    END CATCH
END;
GO
USE [master]
GO
ALTER DATABASE [ExaminationSystem] SET  READ_WRITE 
GO
