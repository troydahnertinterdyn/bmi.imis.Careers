namespace bmi.imis.MABanker.Careers.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class SeedDataAdded3 : DbMigration
    {
        public override void Up()
        {
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
            DropTable("dbo.CareerStates");
        }
    }
}
