<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CareersOrderSummary.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.CareersOrderSummary" %>
<asp:label ID="lblErrorMessages" runat="server" />
<asp:Label ID="lblCreditsPurchased" runat="server" text=' <%# "Thank you for purchasing Job Posting Credits.  Your current Job Posting Credits balance is " + NewCredits + " credits."  %>' Visible='<%# NewCredits > 0 %>' />
<asp:HyperLink ID="hlPostJob" runat="server" NavigateUrl="~/MBRD/Careers/JobPosting.aspx" Visible="<%# NewCredits > 0 %>" />
