namespace bmi.imis.MABanker.Careers.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class SeedDataAdded6 : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.CareerCategories", "Posting_JobID", "dbo.Postings");
            DropForeignKey("dbo.Postings", "Category_Id", "dbo.CareerCategories");
            DropForeignKey("dbo.CareerStates", "Posting_JobID", "dbo.Postings");
            DropIndex("dbo.CareerCategories", new[] { "Posting_JobID" });
            DropIndex("dbo.Postings", new[] { "Category_Id" });
            DropIndex("dbo.CareerStates", new[] { "Posting_JobID" });
            AddColumn("dbo.Postings", "Category", c => c.Int(nullable: false));
            DropColumn("dbo.CareerCategories", "Posting_JobID");
            DropColumn("dbo.Postings", "Category_Id");
            DropColumn("dbo.CareerStates", "Posting_JobID");
        }
        
        public override void Down()
        {
            AddColumn("dbo.CareerStates", "Posting_JobID", c => c.Int());
            AddColumn("dbo.Postings", "Category_Id", c => c.Int());
            AddColumn("dbo.CareerCategories", "Posting_JobID", c => c.Int());
            DropColumn("dbo.Postings", "Category");
            CreateIndex("dbo.CareerStates", "Posting_JobID");
            CreateIndex("dbo.Postings", "Category_Id");
            CreateIndex("dbo.CareerCategories", "Posting_JobID");
            AddForeignKey("dbo.CareerStates", "Posting_JobID", "dbo.Postings", "JobID");
            AddForeignKey("dbo.Postings", "Category_Id", "dbo.CareerCategories", "Id");
            AddForeignKey("dbo.CareerCategories", "Posting_JobID", "dbo.Postings", "JobID");
        }
    }
}
