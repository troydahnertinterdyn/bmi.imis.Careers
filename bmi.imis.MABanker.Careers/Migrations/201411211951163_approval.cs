namespace bmi.imis.MABanker.Careers.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class approval : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.Resumes", "PostAnnonymously");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Resumes", "PostAnnonymously", c => c.Boolean(nullable: false));
        }
    }
}
