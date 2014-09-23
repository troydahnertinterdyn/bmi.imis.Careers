<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JobPostings.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.JobPostings" %>
<asp:GridView  ID="gvJobPostings" runat="server" ItemType="bmi.imis.MABanker.Careers.Models.Posting" AutoGenerateColumns="false" >
    <Columns>
        <asp:TemplateField HeaderText="Posting Date">
            <ItemTemplate>
                <asp:Label ID="lblPostDate" runat="server" Text="<%# Item.PostDate %>"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Title">
            <ItemTemplate>
                <asp:Label ID="lblTitle" runat="server" Text="<%# Item.Title %>"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Location">
            <ItemTemplate >
                <asp:Label ID="Location" runat="server" Text='<%# Item.City + ", " + Item.State  %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>