namespace bmi.imis.MABanker.Careers.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Careers : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CareerCategories",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Postings",
                c => new
                    {
                        JobID = c.Int(nullable: false, identity: true),
                        Approved = c.Boolean(nullable: false),
                        FirstName = c.String(),
                        LastName = c.String(),
                        Company = c.String(),
                        WorkPhone = c.String(),
                        Email = c.String(),
                        AnnonymousPost = c.Boolean(nullable: false),
                        Title = c.String(),
                        Category = c.Int(nullable: false),
                        Description = c.String(),
                        Requirements = c.String(),
                        City = c.String(),
                        State = c.String(),
                        ContactInformation = c.String(),
                        WebSiteURL = c.String(),
                        Comments = c.String(),
                        PostDate = c.DateTime(nullable: false),
                    })
                .PrimaryKey(t => t.JobID);
            
            CreateTable(
                "dbo.Resumes",
                c => new
                    {
                        ResumeID = c.Int(nullable: false, identity: true),
                        FirstName = c.String(),
                        LastName = c.String(),
                        Address = c.String(),
                        City = c.String(),
                        State = c.String(),
                        Zip = c.String(),
                        Telephone = c.String(),
                        Fax = c.String(),
                        Email = c.String(),
                        PostDate = c.DateTime(nullable: false),
                        Category = c.Int(nullable: false),
                        ResumeText = c.String(),
                    })
                .PrimaryKey(t => t.ResumeID);
            
            CreateTable(
                "dbo.ResumeBinaries",
                c => new
                    {
                        ResumeID = c.Int(nullable: false),
                        ResumeBytes = c.Binary(),
                    })
                .PrimaryKey(t => t.ResumeID)
                .ForeignKey("dbo.Resumes", t => t.ResumeID)
                .Index(t => t.ResumeID);
            
            CreateTable(
                "dbo.CareerStates",
                c => new
                    {
                        Code = c.String(nullable: false, maxLength: 128),
                        Name = c.String(),
                    })
                .PrimaryKey(t => t.Code);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.ResumeBinaries", "ResumeID", "dbo.Resumes");
            DropIndex("dbo.ResumeBinaries", new[] { "ResumeID" });
            DropTable("dbo.CareerStates");
            DropTable("dbo.ResumeBinaries");
            DropTable("dbo.Resumes");
            DropTable("dbo.Postings");
            DropTable("dbo.CareerCategories");
        }
    }
}
