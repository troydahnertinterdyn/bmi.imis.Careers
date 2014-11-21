﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CareerCategories.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.CareerCategories" %>

<asp:Label ID="lblAuthorizationError" runat="server" visible="<%# !IsStaffUser %>" Text="You are not authorized to view this page" />
<asp:Panel ID="pnlCategories" runat="server" Visible="<%# IsStaffUser %>">
<asp:ValidationSummary runat="server" ShowModelStateErrors="true" />
<asp:GridView ID="gvCareerCategories" runat="server" ItemType="bmi.imis.MABanker.Careers.Models.CareerCategory" DataKeyNames="Id" AutoGenerateColumns="true" AutoGenerateDeleteButton="true" AutoGenerateEditButton="true" AllowSorting="true" SelectMethod="dgCareerCategories_GetData" DeleteMethod="dgCareerCategories_DeleteItem" UpdateMethod="gvCareerCategories_UpdateItem"  >
<Columns>
</Columns>    
</asp:GridView>
<asp:Button ID="btnNew" runat="server" OnClick="btnNew_Click" Text="New" />
<asp:FormView runat="server" ID="fvCareerCategory" DataKeyNames="Id"
    ItemType="bmi.imis.MABanker.Careers.Models.CareerCategory" 
    InsertMethod="fvCareerCategory_InsertItem"
    SelectMethod="fvCareerCategory_GetItem"
    RenderOuterTable="false" OnItemInserted="fvCareerCategory_ItemInserted" DefaultMode="Insert" Visible="false">
    <InsertItemTemplate>
<label>
    Name
</label>
        <asp:TextBox ID="tbName" runat="server" Text="<%#BindItem.Name %>" />
        </br>
        <asp:Button ID="btnInsert" runat="server" Text="Insert" CommandName="Insert" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CausesValidation="false" OnClick="btnCancel_Click" />
    </InsertItemTemplate>
</asp:FormView>
    </asp:Panel>