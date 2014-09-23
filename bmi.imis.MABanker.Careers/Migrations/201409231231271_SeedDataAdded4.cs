namespace bmi.imis.MABanker.Careers.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class SeedDataAdded4 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.CareerCategories", "Posting_JobID", c => c.Int());
            AddColumn("dbo.CareerStates", "Posting_JobID", c => c.Int());
            CreateIndex("dbo.CareerCategories", "Posting_JobID");
            CreateIndex("dbo.CareerStates", "Posting_JobID");
            AddForeignKey("dbo.CareerCategories", "Posting_JobID", "dbo.Postings", "JobID");
            AddForeignKey("dbo.CareerStates", "Posting_JobID", "dbo.Postings", "JobID");
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.CareerStates", "Posting_JobID", "dbo.Postings");
            DropForeignKey("dbo.CareerCategories", "Posting_JobID", "dbo.Postings");
            DropIndex("dbo.CareerStates", new[] { "Posting_JobID" });
            DropIndex("dbo.CareerCategories", new[] { "Posting_JobID" });
            DropColumn("dbo.CareerStates", "Posting_JobID");
            DropColumn("dbo.CareerCategories", "Posting_JobID");
        }
    }
}
