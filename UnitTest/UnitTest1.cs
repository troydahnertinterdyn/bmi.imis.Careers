using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Net.Mail;
using Asi.Soa.ClientServices;
using Asi.Soa.Core.DataContracts;

namespace UnitTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
        //    MailMessage mailMessage = new MailMessage();
        //    mailMessage.To.Add("Sandy.westman@interdynbmi.com");
        //    mailMessage.From = new MailAddress("TheCoolestGuyAtBMI@interdynbmi.com");
        //    mailMessage.Subject = "What time are you thinking for lunch?";
        //    //mailMessage.Subject = "Job Posting" + posting.JobID ?? string.Empty + "Needs to be approved";
        //    //mailMessage.Body = "Job Posting" + posting.JobID ?? string.Empty + "Needs to be approved <br /> "  + HttpContext.Current.Request.RawUrl;
        //    SmtpClient smtpClient = new SmtpClient("mail.interdynbmi.com");
        //    smtpClient.Send(mailMessage);


        }
        [TestMethod]
        public void TestUpdate()
        {
            var entityManager = new EntityManager("Manager", "#37!eert");
            QueryData careerJobCreditsQuery = new QueryData("CareerJobCredits");
            careerJobCreditsQuery.AddCriteria(CriteriaData.Equal("PartyId", "77755"));
            FindResultsData careerJobCredits = entityManager.Find(careerJobCreditsQuery);
            GenericEntityData data = (GenericEntityData)careerJobCredits.Result[0];
            data["J_Credits"] = 0;
            ValidateResultsData result = entityManager.Update(data);

        }
    }
}
