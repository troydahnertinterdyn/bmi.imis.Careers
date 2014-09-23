namespace bmi.imis.MABanker.Careers.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class SeedDataAdded2 : DbMigration
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
            
            AddColumn("dbo.Postings", "Category_Id", c => c.Int());
            CreateIndex("dbo.Postings", "Category_Id");
            AddForeignKey("dbo.Postings", "Category_Id", "dbo.CareerCategories", "Id");
            DropColumn("dbo.Postings", "Category");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Postings", "Category", c => c.Int(nullable: false));
            DropForeignKey("dbo.Postings", "Category_Id", "dbo.CareerCategories");
            DropIndex("dbo.Postings", new[] { "Category_Id" });
            DropColumn("dbo.Postings", "Category_Id");
            DropTable("dbo.CareerCategories");
        }
    }
}
