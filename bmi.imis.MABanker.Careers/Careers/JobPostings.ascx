<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JobPostings.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.JobPostings" %>
<label>Category</label><asp:DropDownList ID ="ddlCategory" DataValueField="Id" DataTextField="Name" runat="server" AutoPostBack="true" AppendDataBoundItems="true" >
    <asp:ListItem Value="" Text="Select a category..." />
                       </asp:DropDownList>
<br />
<label>State</label><asp:DropDownList ID="ddlState" DataValueField="Code" DataTextField="Name" runat="server" AutoPostBack="true" AppendDataBoundItems="true">
    <asp:ListItem Text="Select a state..." Value="" />
                    </asp:DropDownList><br />
<label>Keyword</label><asp:TextBox ID="tbKeyword" runat="server" /><br />
<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
<asp:GridView  ID="gvJobPostings" runat="server" ItemType="bmi.imis.MABanker.Careers.Models.Posting" DataKeyNames="JobID" AutoGenerateColumns="false" AllowSorting="true" SelectMethod="gvJobPostings_GetData" DeleteMethod="gvJobPostings_DeleteItem" Visible="false" OnPreRender="gvJobPostings_PreRender" OnRowDataBound="gvJobPostings_RowDataBound" >
    <Columns>
        <asp:TemplateField HeaderText="Approved">
            <ItemTemplate>
                <asp:CheckBox ID="cbApproved" runat="server" Checked="<%# Item.Approved %>" Enabled="false" Visible="<%#  IsStaffUser %>" />
            </ItemTemplate>
        </asp:TemplateField>
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
        <asp:TemplateField runat="server" >
            <ItemTemplate>
                 <asp:LinkButton ID="lbtJobPosting" runat="server" Text='Edit' PostBackUrl='<%# PageRootPath + "JobPosting.aspx?PostingId=" + Item.JobID %>'></asp:LinkButton>
                    <asp:linkButton runat="server" ID="lbtDelete" Text="Delete" CommandName="Delete" Visible="<%# IsStaffUser %>"
OnClientClick="if ( !confirm('Are you sure you want to delete this Posting?  This will not refund a credit.')) return false;"  />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView><%--  --%>
<asp:Button ID="btnNew" runat="server" Text="New" PostBackUrl="JobPosting.aspx" />