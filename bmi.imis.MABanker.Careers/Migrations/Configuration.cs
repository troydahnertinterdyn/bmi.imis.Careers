namespace bmi.imis.MABanker.Careers.Migrations
{
    using bmi.imis.MABanker.Careers.Models;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;

    internal sealed class Configuration : DbMigrationsConfiguration<bmi.imis.MABanker.Careers.Models.CareersContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
            ContextKey = "bmi.imis.MABanker.Careers.Models.CareersContext";
        }

        protected override void Seed(bmi.imis.MABanker.Careers.Models.CareersContext context)
        {

            var category = new CareerCategory() { Name = "TestCategory" };
            context.Categories.AddOrUpdate(x => x.Name, category);
            context.Postings.AddOrUpdate(x => x.Title,
                new Posting()
                {
                    Title = "AssistantOfficeManager",
                    PostDate = DateTime.Now,
                    Category = category.Id,
                    State = "MN"
                });



            context.States.AddOrUpdate(x => x.Code,
                new CareerState() { Code = "AL", Name = "Alabama" },
                new CareerState() { Code = "AK", Name = "Alaska" },
                new CareerState() { Code = "AZ", Name = "Arizona" },
                new CareerState() { Code = "AR", Name = "Arkansas" },
                new CareerState() { Code = "CA", Name = "California" },
                new CareerState() { Code = "CO", Name = "Colorado" },
                new CareerState() { Code = "CT", Name = "Connecticut" },
                new CareerState() { Code = "DE", Name = "Delaware" },
                new CareerState() { Code = "DC", Name = "DistrictofColumbia" },
                new CareerState() { Code = "FL", Name = "Florida" },
                new CareerState() { Code = "GA", Name = "Georgia" },
                new CareerState() { Code = "HI", Name = "Hawaii" },
                new CareerState() { Code = "ID", Name = "Idaho" },
                new CareerState() { Code = "IL", Name = "Illinois" },
                new CareerState() { Code = "IN", Name = "Indiana" },
                new CareerState() { Code = "IA", Name = "Iowa" },
                new CareerState() { Code = "KS", Name = "Kansas" },
                new CareerState() { Code = "KY", Name = "Kentucky" },
                new CareerState() { Code = "LA", Name = "Louisiana" },
                new CareerState() { Code = "ME", Name = "Maine" },
                new CareerState() { Code = "MD", Name = "Maryland" },
                new CareerState() { Code = "MA", Name = "Massachusetts" },
                new CareerState() { Code = "MI", Name = "Michigan" },
                new CareerState() { Code = "MN", Name = "Minnesota" },
                new CareerState() { Code = "MS", Name = "Mississippi" },
                new CareerState() { Code = "MO", Name = "Missouri" },
                new CareerState() { Code = "MT", Name = "Montana" },
                new CareerState() { Code = "NE", Name = "Nebraska" },
                new CareerState() { Code = "NV", Name = "Nevada" },
                new CareerState() { Code = "NH", Name = "NewHampshire" },
                new CareerState() { Code = "NJ", Name = "NewJersey" },
                new CareerState() { Code = "NM", Name = "NewMexico" },
                new CareerState() { Code = "NY", Name = "NewYork" },
                new CareerState() { Code = "NC", Name = "NorthCarolina" },
                new CareerState() { Code = "ND", Name = "NorthDakota" },
                new CareerState() { Code = "OH", Name = "Ohio" },
                new CareerState() { Code = "OK", Name = "Oklahoma" },
                new CareerState() { Code = "OR", Name = "Oregon" },
                new CareerState() { Code = "PA", Name = "Pennsylvania" },
                new CareerState() { Code = "RI", Name = "RhodeIsland" },
                new CareerState() { Code = "SC", Name = "SouthCarolina" },
                new CareerState() { Code = "SD", Name = "SouthDakota" },
                new CareerState() { Code = "TN", Name = "Tennessee" },
                new CareerState() { Code = "TX", Name = "Texas" },
                new CareerState() { Code = "UT", Name = "Utah" },
                new CareerState() { Code = "VT", Name = "Vermont" },
                new CareerState() { Code = "VA", Name = "Virginia" },
                new CareerState() { Code = "WA", Name = "Washington" },
                new CareerState() { Code = "WV", Name = "WestVirginia" },
                new CareerState() { Code = "WI", Name = "Wisconsin" },
                new CareerState() { Code = "WY", Name = "Wyoming" }
            );
        }
    }
}
