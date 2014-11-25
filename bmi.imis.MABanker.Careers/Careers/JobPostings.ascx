<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JobPostings.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.JobPostings" %>

<table>
        <tr>
            <td ><div class="PanelField Left"><label>Category</label></div></td>
            <td><div class="PanelFieldValueBMI">
                <asp:DropDownList ID ="ddlCategory" DataValueField="Id" DataTextField="Name" runat="server" AutoPostBack="true" AppendDataBoundItems="true" >
                    <asp:ListItem Value="" Text="Select a category..." />
                       </asp:DropDownList></div></td>
        </tr>
        <tr>
            <td><div class="PanelField Left"><label>State</label></div></td>
            <td><div class="PanelFieldValueBMI">
                <asp:DropDownList ID="ddlState" DataValueField="Code" DataTextField="Name" runat="server" AutoPostBack="true" AppendDataBoundItems="true">
                    <asp:ListItem Text="Select a state..." Value="" />
                    </asp:DropDownList></div></td>
        </tr>
        <tr>
            <td><div class="PanelField Left"><label>Keyword</label></div></td>
            <td><div class="PanelFieldValueBMI">
                <asp:TextBox ID="tbKeyword" runat="server" /></div></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><asp:Button ID="btnSearch" CssClass="PrimaryButton" runat="server" OnClick="btnSearch_Click" Text="Search" /></td>
        </tr>
    </table>
<br />
<br />


<asp:GridView  ID="gvJobPostings" runat="server" ItemType="bmi.imis.MABanker.Careers.Models.Posting" DataKeyNames="JobID" AutoGenerateColumns="false" AllowSorting="true" SelectMethod="gvJobPostings_GetData" DeleteMethod="gvJobPostings_DeleteItem" Visible="false" OnPreRender="gvJobPostings_PreRender" OnRowDataBound="gvJobPostings_RowDataBound" CellPadding="5" CellSpacing="5" >
    <Columns>
        <asp:TemplateField HeaderText="Approved">
            <ItemTemplate>
                <asp:CheckBox ID="cbApproved" runat="server" Checked="<%# Item.Approved %>" Enabled="false" Visible="<%#  IsStaffUser %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Posting Date">
            <ItemTemplate>
                <asp:Label ID="lblPostDate" runat="server" Text="<%# Item.PostDate.HasValue ? Item.PostDate.Value.ToShortDateString() : string.Empty %>"></asp:Label>
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
                 <asp:LinkButton ID="lbtJobPosting" runat="server" Text='<%# IsStaffUser ? "Edit" : "View" %>' PostBackUrl='<%# PageRootPath + "JobPosting.aspx?PostingId=" + Item.JobID %>'></asp:LinkButton>
                    <asp:linkButton runat="server" ID="lbtDelete" Text="Delete" CommandName="Delete" Visible="<%# IsStaffUser %>"
OnClientClick="if ( !confirm('Are you sure you want to delete this Posting?  This will not refund a credit.')) return false;"  />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView><%--  --%>
<asp:Button ID="btnNew" CssClass="PrimaryButton" runat="server" Text="New" PostBackUrl="JobPosting.aspx" />