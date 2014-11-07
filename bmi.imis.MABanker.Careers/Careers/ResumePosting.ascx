<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ResumePosting.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.ResumePosting" %>
<%@ Register tagprefix="tagprefix"
   namespace="Asi.Web"
   assembly="Asi.Web" %>
<script src="../Scripts/jquery-1.5.min.js"></script>
<script src="../Scripts/jquery.maskedinput-1.3.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>


<div id="Resume" >
   <asp:FormView ID="fvResume" runat="server" ItemType="bmi.imis.MABanker.Careers.Models.Resume" SelectMethod="fvResume_GetItem" UpdateMethod="fvResume_UpdateItem" >
      <EditItemTemplate>
         <span>
                         <div class="row">
               <div class="col-sm-6">
                  <label>ResumeId</label>
               </div>
               <div class="col-sm-6">
                  <asp:Label runat="server" ID="lblResumeID" Text="<%#BindItem.ResumeID %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>First Name</label>
               </div>
               <div class="col-sm-6">
                  <asp:TextBox runat="server" ID="tbFirstName" Text="<%#BindItem.FirstName %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>Last Name</label>
               </div>
               <div class="col-sm-6">
                  <asp:TextBox ID="tbLastName" runat="server" Text="<%#BindItem.LastName %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>Address</label>
               </div>
               <div class="col-sm-6">
                  <asp:TextBox ID="tbAddress" runat="server" Text="<%#BindItem.Address %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>City</label>
               </div>
               <div class="col-sm-6">
                  <asp:TextBox ID="tbCity" runat="server" Text="<%#BindItem.City %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>State</label>
               </div>
               <div class="col-sm-6">
                  <asp:DropDownList ID="ddlState" AppendDataBoundItems="true" runat="server" DataSource="<%# States %>" DataTextField="Name" DataValueField="Code" SelectedValue="<%# BindItem.State %>" >
                     <asp:ListItem Selected="True" Value="">Select a State...						
                     </asp:ListItem>
                  </asp:DropDownList>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>
                  Zip
                  </label>
               </div>
               <div class="col-sm-6">
                  <asp:TextBox ID="tbZip" runat="server" Text ="<%#BindItem.Zip %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>
                  Telephone Number
                  </label>
               </div>
               <div class="col-sm-6">
                  <asp:TextBox ID="tbTelephone" runat="server" TextMode="Phone" Text="<%# BindItem.Telephone %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>
                  Fax
                  </label>
               </div>
               <div class="col-sm-6">
                  <asp:TextBox ID="tbFax" runat="server" Text="<%# BindItem.Fax %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>
                  E-Mail Address
                  </label>
               </div>
               <div class="col-sm-6">
                  <asp:TextBox ID="tbEmailAddress" runat="server" TextMode="Phone" Text ="<%#BindItem.Email %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>
                  Category
                  </label>
               </div>
               <div class="col-sm-6">
                  <asp:DropDownList ID="ddCategory" runat="server" AppendDataBoundItems="true" DataSource="<%# Categories %>" DataTextField="Name" DataValueField="Id" selectedValue="<%#BindItem.Category %>"  >
                     <asp:ListItem Text="Select a Category..." Value="0" Selected="True"></asp:ListItem>
                  </asp:DropDownList>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>
                      Resume (text):
                  </label>
               </div>
               <div class="col-sm-6">
                   <asp:TextBox ID="tbResume" CssClass="tinymce" runat="server" TextMode="MultiLine" text="<%#BindItem.ResumeText %>" />
               </div>
            </div>
         </span>
          <asp:LinkButton ID="lnkDownload" runat="server" Text="<%# Item.ResumeBinary != null ? Item.ResumeBinary.FileName : string.Empty %>" OnClick="lnkDownload_Click" CommandArgument='<%# Item.ResumeID %>' Visible="<%# Item.ResumeBinary != null && Item.ResumeBinary.FileName != string.Empty ? true : false %>"/>
          <asp:LinkButton ID="lbFileDelete" runat="server" Text="Delete" OnClick="lbFileDelete_Click" CommandArgument='<%# Item.ResumeID %>'    Visible="<%# Item.ResumeBinary != null && Item.ResumeBinary.FileName != string.Empty ? true : false %>"/>
          <asp:FileUpload ID="fuResume" runat="server" Visible="<%# Item.ResumeBinary == null && Item.ResumeBinary.FileName == string.Empty ? true : false %>" />
          <asp:Button Text="Save" ID="btnSave" runat="server" CommandName="Update" />    
          <asp:LinkButton ID="lbView" runat="server" Text="View Resume" OnClick="lbView_Click" Visible="<%#fvResume.CurrentMode == FormViewMode.Edit %>" OnClientClick="return CheckFormDirty()"/>
      </EditItemTemplate>
       <ItemTemplate>
         <span>
            <div class="row">
               <div class="col-sm-6">
                  <label>First Name</label>
               </div>
               <div class="col-sm-6">
                  <asp:Label runat="server" ID="lbFirstName" Text="<%#Item.FirstName %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>Last Name</label>
               </div>
               <div class="col-sm-6">
                  <asp:Label ID="lbLastName" runat="server" Text="<%#Item.LastName %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>Address</label>
               </div>
               <div class="col-sm-6">
                  <asp:Label ID="lbAddress" runat="server" Text="<%#Item.Address %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>City</label>
               </div>
               <div class="col-sm-6">
                  <asp:Label id="lbCity" runat="server" Text="<%#Item.City %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>State</label>
               </div>
               <div class="col-sm-6">
                  <asp:Label ID="lbState" runat="server" text="<%# Item.State %>" >
                  </asp:Label>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>
                  Zip
                  </label>
               </div>
               <div class="col-sm-6">
                  <asp:Label id="lbZip" runat="server" Text ="<%#Item.Zip %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>
                  Telephone Number
                  </label>
               </div>
               <div class="col-sm-6">
                  <asp:Label id="lbTelephone" runat="server" Text="<%# Item.Telephone %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>
                  Fax
                  </label>
               </div>
               <div class="col-sm-6">
                  <asp:Label id="lbFax" runat="server" Text="<%# Item.Fax %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>
                  E-Mail Address
                  </label>
               </div>
               <div class="col-sm-6">
                  <asp:Label id="lbEmailAddress" runat="server" TextMode="Phone" Text ="<%#Item.Email %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>
                  Category
                  </label>
               </div>
               <div class="col-sm-6">
                   <asp:Label ID="lbCategory" runat="server" Text="<%#Item.CategoryName %>" />
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                  <label>
                      Resume (text):
                  </label>
               </div>
               <div class="col-sm-6">
                   <asp:Label id="lbResume" CssClass="tinymce" runat="server" TextMode="MultiLine" text="<%#Item.ResumeText %>" />
               </div>
            </div>
         </span>
                           <asp:LinkButton ID="lnkDownload" runat="server" Text="<%# Item.ResumeBinary != null ? Item.ResumeBinary.FileName : string.Empty %>" OnClick="lnkDownload_Click"
                    CommandArgument='<%# Item.ResumeID %>' Visible="<%# Item.ResumeBinary != null ? true : false %>"></asp:LinkButton>

       </ItemTemplate>
   </asp:FormView>
</div>
	<script type="text/javascript">
        //Script is responsible for notifying user before leaving page if changes have been made.
		var initialdata = "nothing";

		$(document).ready(function () {
			initialdata = $('#Posting *').serialize();
		});

		function CheckFormDirty() {			
			var frmData = $('#Posting *').serialize();

			var continuePostback =  !(WarnIfDirty(frmData)) ;
			return continuePostback;
		}

		function WarnIfDirty(frmData) {
			if (initialdata != frmData) {
				return !confirm("There is unsaved data on this page. Do you wish to continue?");
			}
			else {
				return false;
			}
		}          
	</script>