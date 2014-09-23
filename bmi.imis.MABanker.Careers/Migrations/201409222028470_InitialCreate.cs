namespace bmi.imis.MABanker.Careers.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Postings",
                c => new
                    {
                        JobID = c.Int(nullable: false, identity: true),
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
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Postings");
        }
    }
}
