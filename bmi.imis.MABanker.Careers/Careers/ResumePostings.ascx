<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ResumePostings.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.ResumePostings" %>

<asp:Panel ID="pnlUnathorized" runat="server" Visible="<%# !CanViewResumes %>" >
    You do not have permission to search Resumes
</asp:Panel>
<asp:Panel ID="pnlResumeSearch" runat="server" Visible="<%# CanViewResumes %>" >
    <table>
        <tr>
            <td ><div class="PanelField Left"><label>Category</label></div></td>
            <td><div class="PanelFieldValueBMI">
                <asp:DropDownList ID ="ddlCategory" DataSource="<%# Categories %>" DataValueField="Id" DataTextField="Name" runat="server" AutoPostBack="true" AppendDataBoundItems="true" >
                    <asp:ListItem Value="" Text="Select a category..." />
                    </asp:DropDownList></div></td>
        </tr>
        <tr>
            <td><div class="PanelField Left"><label>State</label></div></td>
            <td><div class="PanelFieldValueBMI">
                <asp:DropDownList ID="ddlState" DataSource="<%# States %>" DataValueField="Code" DataTextField="Name" runat="server" AutoPostBack="true" AppendDataBoundItems="true">
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


<asp:GridView ID="gvResumes" runat="server" ItemType="bmi.imis.MABanker.Careers.Models.Resume" DataKeyNames="ResumeID" AutoGenerateColumns="false" AllowSorting="true" SelectMethod="gvResumes_GetData" DeleteMethod="gvResumes_DeleteItem" Visible="false" CellPadding="5" CellSpacing="5" >
    <Columns>
               <asp:TemplateField HeaderText="Approved" >                    
                    <ItemTemplate>
                        <asp:CheckBox ID="cbResumeID" Enabled="false" Checked="<%# Item.Approved %>" runat="server" Visible="<%# IsStaffUser %>" />
                    </ItemTemplate>                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="ResumeID" >                    
                    <ItemTemplate>
                        <asp:Label ID="lblResumeID" text="<%# Item.ResumeID %>" runat="server" />
                    </ItemTemplate>                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Category" >                    
                    <ItemTemplate>
                        <asp:Label ID="lblCategory" Enabled="false" Text="<%# Item.CategoryName %>" runat="server" />
                    </ItemTemplate>                   
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name" >                    
                    <ItemTemplate>
                        <asp:Label ID="lblName" Enabled="false" Text="<%# Item.FirstName + " " + Item.LastName %>" runat="server" />
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
