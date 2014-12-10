using Asi.Soa.Commerce.DataContracts;
using Asi.Soa.Events.DataContracts;
using Asi.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace bmi.imis.MABanker.Careers.Careers
{
    public partial class CareersOrderSummary : CareersBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Asi.Web.iParts.Commerce.OrderConfirmationDisplay.ComboOrder"] != null)
                {

                    List<Type> types = new List<Type>();
                    types.Add(typeof(ItemSetItemData));
                    types.Add(typeof(EventOrderLineData));
                    types.Add(typeof(EventFunctionOrderLineData));
                    this.comboOrder = (ComboOrderData)DataHelpers.DeserializeStringAndDecrypt(typeof(ComboOrderData), (string)base.Session["Asi.Web.iParts.Commerce.OrderConfirmationDisplay.ComboOrder"], types);
                    this.order = this.comboOrder.Order;
                                        var processedOrderId = Session["Bmi.Careers.ProcessedOrderId"];
                                        if (processedOrderId == null || (processedOrderId != null && processedOrderId != order.OrderId))
                                        {
                                            Session["Bmi.Careers.ProcessedOrderId"] = order.OrderId;
                                            var jobCreditLines = this.order.Lines.Where(l => l.Item.ItemCode == "JOB_CREDIT_1");
                                            if (jobCreditLines.Count() > 0)
                                            {
                                                PurchasedCredits = 0;
                                                var PreviousPostingCredits = PostingCredits;
                                                foreach (var line in jobCreditLines)
                                                {
                                                    int currentQuantity = 0;
                                                    if (line.QuantityOrdered != null && line.QuantityOrdered.Value != null)
                                                    {
                                                        currentQuantity = (int)Math.Truncate(line.QuantityOrdered.Value.Amount);
                                                    }
                                                    PurchasedCredits += currentQuantity;
                                                }
                                                PostingCredits = PurchasedCredits + PreviousPostingCredits;
                                                NewCredits = PurchasedCredits + PreviousPostingCredits;
                                            }
                                        }
                    this.DataBind();
                }
            }
            catch (Exception ex)
            {

                lblErrorMessages.Text = "There was an error with the careers control: " + ex.Message;
            }
        }
        public ComboOrderData comboOrder { get; set; }
        public OrderData order { get; set; }
        public int PreviousPostingCredits { get; set; }
        public int PurchasedCredits { get; set; }
        public int NewCredits { get; set; }
    }
}