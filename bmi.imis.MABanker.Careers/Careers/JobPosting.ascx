<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="JobPosting.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.JobPosting" %>
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
<script src='<%= Page.ResolveClientUrl("~/Custom/Scripts/jquery.maskedinput-1.3.1.min.js") %>'></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<div id="Posting" >

<asp:FormView ID="fvJobPosting" CssClass="" runat="server" DefaultMode='<%# (IsStaffUser) ||Request.QueryString["PostingId"] == null ? FormViewMode.Edit : FormViewMode.ReadOnly %>'  ItemType="bmi.imis.MABanker.Careers.Models.Posting"  SelectMethod="GetPosting" UpdateMethod="fvJobPosting_UpdateItem" Width="816px" >

	<EditItemTemplate>
           <asp:ValidationSummary ID="vsJobPosting" runat="server" />
    <asp:Panel runat="server" Visible="<%# PostingId == null && IsAuthenticated && !IsStaffUser && PostingCredits <= 0 %>">
        You must purchase Credits before you post a job.<br />
        <asp:Button ID="btnPurchaseCredits" Text="Purchase Credits" runat="server" PostBackUrl="~/MBRD/MB_Store/MB_Job_Credits.aspx" />
    </asp:Panel>
		<asp:Panel ID="pnlJobForm" runat="server"  CssClass="JobPosting Container" Visible ="<%# PostingId != null || !(PostingId == null && !IsStaffUser && PostingCredits <=0) %>">
            <label>Approved</label><asp:CheckBox ID="cbApproved" runat="server" Checked="<%# BindItem.Approved %>" Enabled="<%# IsStaffUser %>"  />
            <label>Post Date</label><asp:TextBox ID="txtPostDate" runat="server"  Text="<%# Item.PostDate != null ? ((DateTime)Item.PostDate).ToShortDateString() : string.Empty %>" Enabled="<%# IsStaffUser %>"  />
					<p>
						<label >First Name</label><asp:TextBox  runat="server" ValidationGroup="validation" ID='txtFirstName' Text="<%# BindItem.FirstName%>" />
                        <asp:RequiredFieldValidator ID="rfFirstName" runat="server" ControlToValidate="txtFirstName" EnableClientScript="true" Text="First name is required"/>
					</p>
					<p>
						<label>Last Name</label><asp:TextBox runat="server" ID="txtLastName" Text="<%# BindItem.LastName %>" />
					</p>
			<label>Job ID</label><asp:TextBox runat="server" ID="txtID" Text="<%# BindItem.JobID %>" Enabled="<%# false %>" />
            <asp:Panel ID="pnlContactInformation" runat="server" Visible="<%# !Item.AnnonymousPost %>">
			<label>Company</label><asp:TextBox runat="server" ID="txtCompany" Text="<%#BindItem.Company %>" />
			<label>Work Phone</label><asp:TextBox runat="server" ID="txtWorkPhone" Text="<%#BindItem.WorkPhone %>" />
			<label>Email</label><asp:TextBox runat="server" ID="txtEmail" Text="<%#BindItem.Email %>" />
                </asp:Panel>
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
            <asp:HyperLink ID="hlEditCategories" runat="server" NavigateUrl='<%# PageRootPath + "CareerCategories.aspx"  %>' Visible="<%# IsStaffUser %>" text="Edit Categories"/>
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

		<span class="JobPosting">
		<label>Contact Information: (Display with listing)</label>   
            <asp:Panel ID="pnlContactInformation2" runat="server" Visible="<%#!Item.AnnonymousPost %>"     >
		<asp:TextBox ID="txtContactInformation" TextMode="MultiLine" CssClass="tbShort" runat="server" Text="<%#BindItem.ContactInformation %>" />
		<label>Web Site URL</label><asp:TextBox ID="txtWebSiteURL" runat="server" Text="<%#BindItem.WebSiteURL %>"  />
                </asp:Panel>
		<label>Additional Comments</label><asp:TextBox ID="txtAdditionalComments" runat="server" TextMode="MultiLine" CssClass="tbshort" Text="<%#BindItem.Comments %>" />
		<br />
         <br />  
            <label> <asp:Label lbl="lblRemainingCredits" Text=' <%# "You have " + PostingCredits + " Job Posting Credits Remaining." %>' runat="server" visible="<%# IsAuthenticated && !IsStaffUser && PostingId == null %>" /> </label>
			<asp:Button Text="Save" ID="btnSave" ValidationGroup="validation" CausesValidation="true" runat="server" CommandName="Update" />    
			<asp:Button Text="View" ID ="btnView" runat="server" Visible="<%# fvJobPosting.CurrentMode == FormViewMode.Edit %>" OnClick="btnView_Click" OnClientClick="return CheckFormDirty()" />
			</span>
            		</asp:Panel>
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
		<asp:Button ID="btnEdit" Text="Edit" runat="server" CausesValidation="false" OnClick="btnEdit_Click" Visible="<%# IsStaffUser  %>"/>
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
    //Fills in posted date if it's not filled in when approved checkbox is checked.
    if (<%= fvJobPosting.FindControl("cbApproved") != null ? "true" : "false" %>)
        {
    var chkApproved  = '#<%= fvJobPosting.FindControl("cbApproved") != null ? fvJobPosting.FindControl("cbApproved").ClientID : string.Empty %>';
    var tbPostedDate = '#<%=fvJobPosting.FindControl("txtPostDate") != null ? fvJobPosting.FindControl("txtPostDate") .ClientID : string.Empty %>';
    var currentDate = '<%= DateTime.Now.ToShortDateString() %>';
    jQuery(chkApproved).click(function() {
        if (jQuery(chkApproved).attr('checked') && jQuery(tbPostedDate).val() == '') jQuery(tbPostedDate).val(currentDate);
    });
    }
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

		jQuery(document).ready(function () {
			initialdata = jQuery('#Posting *').serialize();
		});

		function CheckFormDirty() {			
			var frmData = jQuery('#Posting *').serialize();

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