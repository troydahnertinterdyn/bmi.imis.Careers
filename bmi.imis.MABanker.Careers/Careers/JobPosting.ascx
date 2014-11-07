﻿<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="JobPosting.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.JobPosting" %>
<%@ Register tagprefix="tagprefix"
   namespace="Asi.Web"
   assembly="Asi.Web" %>
<style>
	.JobPosting {
		overflow: hidden;
		width: 100%;
	}

		.JobPosting label {
			clear: both;
			float: left;
			width: 40%;
		}
	.JobPosting {
		float: left;
	}
		.JobPosting select, .JobPosting input[type=text], .JobPosting textarea {
			float: left;
			width: 55%;
		}

		.JobPosting input[type=checkbox], .JobPosting .CheckboxLabel, .JobPosting .Heading {
			float: left;
		}

		.JobPosting .tbShort {
			height: 80px;
		}

		.JobPosting .tbMedium {
			height: 160px;
		}
</style>
<script src="../Scripts/jquery-1.5.min.js"></script>
<script src="../Scripts/jquery.maskedinput-1.3.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<div id="Posting">
<asp:FormView ID="fvJobPosting" CssClass="" runat="server"  ItemType="bmi.imis.MABanker.Careers.Models.Posting"  SelectMethod="GetPosting" UpdateMethod="fvJobPosting_UpdateItem" Width="816px" >
	<EditItemTemplate>
		<span class="JobPosting Container">
            <label>Approved</label><asp:CheckBox ID="cbApproved" runat="server" Checked="<%# BindItem.Approved %>" Enabled="<%# IsStaffUser %>" />
					<p>
						<label >First Name</label><asp:TextBox  runat="server" ID='txtFirstName' Text="<%# BindItem.FirstName%>" />
					</p>
					<p>
						<label>Last Name</label><asp:TextBox runat="server" ID="txtLastName" Text="<%# BindItem.LastName %>" />
					</p>
			<label>Job ID</label><asp:TextBox runat="server" ID="txtID" Text="<%# BindItem.JobID %>" Enabled="<%# false %>" />
			<label>Company</label><asp:TextBox runat="server" ID="txtCompany" Text="<%#BindItem.Company %>" />
			<label>Work Phone</label><asp:TextBox runat="server" ID="txtWorkPhone" Text="<%#BindItem.WorkPhone %>" />
			<label>Email</label><asp:TextBox runat="server" ID="txtEmail" Text="<%#BindItem.Email %>" />
			<label>&nbsp;</label><asp:CheckBox runat="server" ID="cbAnnonymousPost" Checked="<%# BindItem.AnnonymousPost %>" />
			<div class="CheckboxLabel">Anonymous Post? </div>
			<br>
			</br><div class="Heading">
				Information to be displayed in your listing:
			</div>
			<label>
				Title of Job/Position</label>
            
			<asp:TextBox ID="txtTitle" runat="server" Text="<%#BindItem.Title %>" />
			<label>
				Category</label>
			<asp:DropDownList ID="ddCategory" runat="server" AppendDataBoundItems="true" DataSource="<%# Categories %>" DataTextField="Name" DataValueField="Id" selectedValue="<%#BindItem.Category %>"  >
				<asp:ListItem Text="Select a Category..." Value="0" Selected="True"></asp:ListItem>
			</asp:DropDownList>
			<label>
				Description</label>
			<asp:TextBox TextMode="MultiLine" ID="txtDescription" runat="server" CssClass="tbMedium" Text="<%#BindItem.Description %>" />
			<label>
				Requirements</label>
			<asp:TextBox ID="txtRequirements" runat="server" TextMode="MultiLine" CssClass="tbShort" Text="<%#BindItem.Requirements %>" />
			<label>
				City/Location</label><asp:TextBox ID="City" runat="server" Text="<%#BindItem.City %>" />
			<label>
				State</label><asp:DropDownList ID="ddlState" AppendDataBoundItems="true" runat="server" DataSource="<%# States %>" DataTextField="Name" DataValueField="Code" SelectedValue="<%# BindItem.State %>" >
					<asp:ListItem Selected="True" Value="">Select a State...
						
					</asp:ListItem>
							 </asp:DropDownList>
		</span>
		<span class="JobPosting">
		<label>Contact Information: (Display with listing)</label>        
		<asp:TextBox ID="txtContactInformation" TextMode="MultiLine" CssClass="tbShort" runat="server" Text="<%#BindItem.ContactInformation %>" />
		<label>Web Site URL</label><asp:TextBox ID="txtWebSiteURL" runat="server" Text="<%#BindItem.WebSiteURL %>"  />
		<label>Additional Comments</label><asp:TextBox ID="txtAdditionalComments" runat="server" TextMode="MultiLine" CssClass="tbshort" Text="<%#BindItem.Comments %>" />
		<label>Post Date</label><asp:TextBox ID="txtPostDate" runat="server" Text="<%# Item.PostDate != null ? ((DateTime)Item.PostDate).ToShortDateString() : string.Empty %>" Enabled="<%# IsStaffUser %>"  />
			<asp:Button Text="Save" ID="btnSave" runat="server" CommandName="Update" />    
			<asp:Button Text="View" ID ="btnView" runat="server" Visible="<%# fvJobPosting.CurrentMode == FormViewMode.Edit %>" OnClick="btnView_Click" OnClientClick="return CheckFormDirty()" />
			</span>
	</EditItemTemplate>
	<ItemTemplate>
		<div class="row" >
				<div class="col-sm-6">
                    <div class="col-sm-6"><label> Title:</label></div>
                    <div class="col-sm-6"><asp:Label ID="lblTitle" runat="server" Text="<%# Item.Title %>" /></div>
				</div>
				<div class="col-sm-6">
                    <div class="col-sm-6"><label >Job Id:</label></div>
                    <div class="col-sm-6"><asp:label ID="lblJobId" runat="server" Text="<%#Item.JobID %>" /></div>
				</div>	
            </div>
        <div class="row" >
            <div class="col-sm-6">
                <div class="col-sm-6"> <label >Category</label></div>
                <div class="col-sm-6"><asp:Label ID="lblCategoryName"  runat="server" text="<%# Item.CategoryName %>" /></div>
            </div>
            <div class="col-sm-6">
                <div class="col-sm-6"><label>Location</label></div>
                <div class="col-sm-6"><asp:label runat="server" Text='<%#Item.City + "," + Item.State %>'></asp:label></div>
            </div>            
        </div>
        <div class="row">
            <div class="col-sm-6">
                <div class="col-sm-6" ><label>Salary</label></div>
                <div class="col-sm-6" >Salary isn't a possible input</div>
            </div>
            <div class="col-sm-6">
                <div class="col-sm-6" ><label>Posted</label></div>
                <div class="col-sm-6" ><asp:Label ID="lblPosted" runat="server" Text="<%# Item.PostDate != null ? ((DateTime)Item.PostDate).ToShortDateString() : string.Empty %>"></asp:Label></div>
            </div>            
        </div>
        <div class="row">
            <div class="col-sm-3">
                <div class="col-sm-12"><label>Description</label>
                </div>
            </div>
            <div class="col-sm-9">
                <div class="col-sm-12">
                    <asp:Label ID="lblDescription" runat="server" Text='<%# Item.Description == null ? string.Empty : Item.Description.Replace("\r\n", "<br>") %>'></asp:Label>
                </div>
            </div>
        </div>
		<asp:Button ID="btnEdit" Text="Edit" runat="server" CausesValidation="false" OnClick="btnEdit_Click" Visible="<%# IsStaffUser || IsOwner %>"/>
	</ItemTemplate>
</asp:FormView>
	</div>
<script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js" ></script>
<!-- Latest compiled and minified CSS -->
<style>
   span{
       border:thin;
       border-color:red;
   }
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script type="text/javascript">
    //Script for attaching masks to textboxes
	var editOrInsertMode = <%= this.fvJobPosting.CurrentMode == FormViewMode.Edit || this.fvJobPosting.CurrentMode == FormViewMode.Insert ? "true" : "false" %>;
	var txtPostDateClientID = "#" + '<%= this.fvJobPosting.FindControl("txtPostDate") != null ? this.fvJobPosting.FindControl("txtPostDate").ClientID : string.Empty %>';
    var txtWorkPhoneClientID = "#" + '<%=  this.fvJobPosting.FindControl("txtWorkPhone") != null ? this.fvJobPosting.FindControl("txtWorkPhone").ClientID : string.Empty %>';
	if (editOrInsertMode)
	{
		function AttachMask(clientID, mask) {
			var control = jQuery(clientID);
			if (jQuery.trim(control.val()).length === 0) (control.mask(mask));
			else {
				control.keyup(function () {
					if (!this.value) {
						control.mask(mask)
					}
				});
			}
		}
		jQuery(txtPostDateClientID).datepicker();
		AttachMask(txtPostDateClientID, "99/99/99");
		AttachMask(txtWorkPhoneClientID, "(999) 999-9999")
	}
</script>

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