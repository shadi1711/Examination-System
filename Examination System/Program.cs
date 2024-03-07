using Examination_System.ReportsForms;

namespace Examination_System
{
    internal static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            ApplicationConfiguration.Initialize();
            Application.Run(new LogIn());
            //Application.Run(new Report());
            //Application.Run(new GetStudentGradeFrm(1));
            //Application.Run(new CrsTopicsFrm());
            //Application.Run(new StudentCountFrm());
            //Application.Run(new DisplayExamFrm());
            //Application.Run(new ExamCorrectionFrm());
            //Application.Run(new Timerfrm());

        }
    }
}