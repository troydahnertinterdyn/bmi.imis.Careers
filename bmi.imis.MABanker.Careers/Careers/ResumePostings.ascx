<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ResumePostings.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.ResumePostings" %>
<asp:Panel ID="pnlUnathorized" runat="server" Visible="<%# !CanViewResumes %>" >
    You do not have permission to search Resumes
</asp:Panel>
<asp:Panel ID="pnlResumeSearch" runat="server" Visible="<%# CanViewResumes %>" >
<label>Category</label><asp:DropDownList ID ="ddlCategory" DataValueField="Id" DataTextField="Name" runat="server" AutoPostBack="true" AppendDataBoundItems="true" >
    <asp:ListItem Value="" Text="Select a category..." />
                       </asp:DropDownList><br />
<label>State</label><asp:DropDownList ID="ddlState" DataValueField="Code" DataTextField="Name" runat="server" AutoPostBack="true" AppendDataBoundItems="true">
    <asp:ListItem Text="Select a state..." Value="" />
                    </asp:DropDownList><br />
<label>Keyword</label><asp:TextBox ID="tbKeyword" runat="server" /><br />
<asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
<asp:GridView ID="gvResumes" runat="server" ItemType="bmi.imis.MABanker.Careers.Models.Resume" DataKeyNames="ResumeID" AutoGenerateColumns="false" AllowSorting="true" SelectMethod="gvResumes_GetData" DeleteMethod="gvResumes_DeleteItem" Visible="false" >
    <Columns>
        <asp:TemplateField HeaderText="ResumeID" >
            <ItemTemplate>
                <asp:Label ID="lblResumeID" text="<%# Item.ResumeID %>" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
                <asp:TemplateField HeaderText="State" >
            <ItemTemplate>
                <asp:Label ID="lblState" Text="<%# Item.State %>" runat="server" />
            </ItemTemplate>
        </asp:TemplateField>
                <asp:TemplateField runat="server" >
            <ItemTemplate>
                 <asp:LinkButton ID="lbtJResume" runat="server" Text='<%# IsStaffUser ? "Edit" : "View" %>' PostBackUrl='<%# PageRootPath + "ResumePosting.aspx?ResumeId=" + Item.ResumeID %>'></asp:LinkButton>
                    <asp:linkButton runat="server" ID="lbtDelete" Text="Delete" CommandName="Delete" Visible="<%# IsStaffUser %>"
OnClientClick="if ( !confirm('Are you sure you want to delete this Resume?  This information can not be recovered.')) return false;"  />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
    </asp:Panel>