<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ResumePostings.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.ResumePostings" %>
<label>Category</label><asp:DropDownList ID ="ddlCategory" DataValueField="Id" DataTextField="Name" runat="server" AutoPostBack="true" AppendDataBoundItems="true" >
    <asp:ListItem Value="" Text="Select a category..." />
                       </asp:DropDownList><br />
<label>State</label><asp:DropDownList ID="ddlState" DataValueField="Code" DataTextField="Name" runat="server" AutoPostBack="true" AppendDataBoundItems="true">
    <asp:ListItem Text="Select a state..." Value="" />
                    </asp:DropDownList><br />
<label>Keyword</label><asp:TextBox ID="tbKeyword" runat="server" /><br />
<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
<asp:GridView ID="gvResumes" runat="server" ItemType="bmi.imis.MABanker.Careers.Models.Resume" DataKeyNames="ResumeID" AutoGenerateColumns="false" AllowSorting="true" SelectMethod="gvResumes_GetData" DeleteMethod="gvResumes_DeleteItem" Visible="false" OnPreRender="gvResumes_PreRender" OnDataBound="gvResumes_DataBound" >
    <Columns>
        <asp:TemplateField HeaderText="Approved" >
            <ItemTemplate>
                <asp:CheckBox ID="cbApproved" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
                <asp:TemplateField runat="server" >
            <ItemTemplate>
                 <asp:LinkButton ID="lbtJResume" runat="server" Text='Edit' PostBackUrl='<%#"JobPosting.aspx?PostingId=" + Item.JobID %>'></asp:LinkButton>
                    <asp:linkButton runat="server" ID="lbtDelete" Text="Delete" CommandName="Delete" Visible="<%# IsStaffUser %>"
OnClientClick="if ( !confirm('Are you sure you want to delete this Posting?  This will not refund a credit.')) return false;"  />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>