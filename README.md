## Overview
This project, named "ExaminationSystem," is a comprehensive application developed as part of the ITI Schooler Ship 9-month program, focusing on the professional web and business intelligence (BI) track. The system is designed to manage various aspects of an examination system, including data storage, desktop application functionalities, and reporting features. The technologies used in this project include SQL Server, C#, LINQ, Entity Framework 8, and Report Builder.

## Project Structure
The project consists of two main components: a database backend and a desktop application frontend. The database plays a crucial role in storing and managing the data required for the examination system. The desktop application provides a user-friendly interface for interacting with the system.

### Database
The database is designed to efficiently store and manage data related to students, courses, exams, questions, instructors, and various administrative functions. The database schema is organized into several tables, and stored procedures have been implemented to perform complex operations. Some of the key stored procedures include:

- `dbo.CalculateStudentGrade`: Calculates the grade for a student based on the exam results.
- `dbo.Delete_*`: Procedures to delete various entities such as branches, choices, courses, exams, instructors, questions, students, and more.
- `dbo.DisplayExam`: Retrieves exam details for display purposes.
- `dbo.ExamCorrection`: Corrects the exam, updating the results.
- `dbo.Generate_Exam`: Generates an exam for students.
- `dbo.Insert_*`: Procedures to insert new entities into the system, including branches, courses, exams, instructors, questions, and students.
- `dbo.Select_*`: Procedures to retrieve information about various entities, such as courses, exams, questions, students, and more.
- `dbo.Update_*`: Procedures to update information for various entities, including branches, courses, exams, instructors, questions, students, and more.

### Desktop Application
The desktop application serves as the frontend for the examination system, providing a user-friendly interface for administrators, instructors, and students. It interacts with the database to perform operations such as creating exams, managing courses, viewing student grades, and more.

## Technologies Used
- **Database**: SQL Server
- **Backend**: C#, LINQ, Entity Framework 8
- **Frontend**: Desktop application
- **Reporting**: Report Builder

## Setup Instructions
To set up and run the Examination System, follow these general steps:

1. **Database Setup**:
   - Ensure SQL Server is installed.
   - Execute the SQL scripts provided to create the database schema, tables, and stored procedures.

2. **Desktop Application Setup**:
   - Install the necessary dependencies, including .NET Core.
   - Build and run the desktop application using your preferred development environment.

3. **Usage**:
   - Access the application through the desktop interface.
   - Perform various operations, such as creating exams, managing courses, and viewing student grades.

## Reporting
- The system includes reporting features powered by Report Builder, allowing users to generate custom reports based on exam results, student performance, and other relevant metrics.
- RDLC for Report Viewer
## Additional Notes
- Ensure that proper security measures are implemented to protect sensitive data.
- Regularly back up the database to prevent data loss.

## Contributors
- [Ahmed Allam]
- [shadi1711]
- [IslamMosaad]
- [FatmaSaeed29]
- [Gehad Nabel]

## Acknowledgments
We would like to express our gratitude to the ITI Schooler Ship program for providing the opportunity to work on this project and gain valuable insights into professional web and business intelligence development.

Feel free to update this README with specific details, installation instructions, and any additional information based on your project's requirements and features.

## Acknowledgments
We would like to express our gratitude to the ITI Schooler Ship program for providing the opportunity to work on this project and gain valuable insights into professional web and business intelligence development.
