<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ResumePosting.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.ResumePosting" %>
<%@ Register tagprefix="tagprefix"
   namespace="Asi.Web"
   assembly="Asi.Web" %>
<script src="../Scripts/jquery-1.5.min.js"></script>
<script src="../Scripts/jquery.maskedinput-1.3.1.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>

<asp:Panel ID="pnlUnauthorized" runat="server"  Visible='<%# Request.QueryString["ResumeId"] != null && !CanViewResumes %>'>
    You are not authorized to view Resumes
</asp:Panel>
<div id="Resume" >
   <asp:FormView ID="fvResume" Visible='<%# Request.QueryString["ResumeId"] == null || CanViewResumes %>' DefaultMode='<%#  IsStaffUser || Request.QueryString["ResumeId"] == null ? FormViewMode.Edit : FormViewMode.ReadOnly %>' runat="server" ItemType="bmi.imis.MABanker.Careers.Models.Resume" SelectMethod="fvResume_GetItem" UpdateMethod="fvResume_UpdateItem" >
      <EditItemTemplate>
         <span>
            <div class="row">
               <div class="col-sm-3">
                   <div class="PanelField Left">
                  <label>ResumeId</label>
                   </div>
               </div>

               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:Label runat="server" ID="lblResumeID" Text="<%#BindItem.ResumeID %>" />
                   </div>
               </div>

                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                   <div class="PanelField Left">
                  <label>Approved</label>
                       </div>
               </div>

               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:CheckBox runat="server" ID="cbApproved" Checked="<%#BindItem.Approved %>" Enabled="<%# IsStaffUser %>"  />
                       </div>
               </div>

                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                   <div class="PanelField Left">
                  <label>Posted Date</label>
                       </div>
               </div>
               <div class="col-sm-6">
                <div class="PanelFieldValueBMI">
                  <asp:TextBox runat="server" ID="txtPostDate" Text="<%#BindItem.PostDate %>" Enabled="<%# IsStaffUser %>"  />
                 </div>
               </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                   <div class="PanelField Left">
                  <label>First Name</label>
                       </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:TextBox runat="server" ID="tbFirstName" Text="<%#BindItem.FirstName %>" />
                       </div>
               </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
             <div class="PanelField Left">
                  <label>Last Name</label>
                 </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:TextBox ID="tbLastName" runat="server" Text="<%#BindItem.LastName %>" />
                       </div>
               </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                   <div class="PanelField Left">
                  <label>Address</label>
                       </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:TextBox ID="tbAddress" runat="server" Text="<%#BindItem.Address %>" />
                       </div>
               </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                   <div class="PanelField Left">
                  <label>City</label>
                       </div>
               </div>
               <div class="col-sm-6">
                <div class="PanelFieldValueBMI">
                  <asp:TextBox ID="tbCity" runat="server" Text="<%#BindItem.City %>" />
                 </div>
               </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                   <div class="PanelField Left">
                  <label>State</label>
                       </div>
               </div>
               <div class="col-sm-6">
                    <div class="PanelFieldValueBMI">
                        <asp:DropDownList ID="ddlState" AppendDataBoundItems="true" runat="server" DataSource="<%# States %>" DataTextField="Name" DataValueField="Code" SelectedValue="<%# BindItem.State %>" >
                            <asp:ListItem Selected="True" Value="">Select a State...						
                            </asp:ListItem>
                        </asp:DropDownList>
                 </div>
               </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                   <div class="PanelField Left">
                  <label>Zip</label>
                       </div>
               </div>
               <div class="col-sm-6">
             <div class="PanelFieldValueBMI">
                  <asp:TextBox ID="tbZip" runat="server" Text ="<%#BindItem.Zip %>" />
                 </div>
               </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                  <div class="PanelField Left">
                  <label>Telephone Number</label>
                      </div>
               </div>
               <div class="col-sm-6">
             <div class="PanelFieldValueBMI">
                  <asp:TextBox ID="tbTelephone" runat="server" TextMode="Phone" Text="<%# BindItem.Telephone %>" />
                 </div>
               </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                   <div class="PanelField Left">
                  <label>Fax</label>
                       </div>
               </div>
               <div class="col-sm-6">
             <div class="PanelFieldValueBMI">
                  <asp:TextBox ID="tbFax" runat="server" Text="<%# BindItem.Fax %>" />
                 </div>
               </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                   <div class="PanelField Left">
                  <label>E-Mail Address</label>
                       </div>
               </div>
               <div class="col-sm-6">
             <div class="PanelFieldValueBMI">
                  <asp:TextBox ID="tbEmailAddress" runat="server" TextMode="Phone" Text ="<%#BindItem.Email %>" />
                 </div>
               </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                   <div class="PanelField Left">
                  <label>Category</label>
                       </div>
               </div>
               <div class="col-sm-6">
             <div class="PanelFieldValueBMI">
                  <asp:DropDownList ID="ddCategory" runat="server" AppendDataBoundItems="true" DataSource="<%# Categories %>" DataTextField="Name" DataValueField="Id" selectedValue="<%#BindItem.Category %>"  >
                     <asp:ListItem Text="Select a Category..." Value="0" Selected="True"></asp:ListItem>
                  </asp:DropDownList>
                   <asp:HyperLink ID="hlEditCategories" runat="server" NavigateUrl='<%# PageRootPath + "CareerCategories.aspx"  %>' Visible="<%# IsStaffUser %>" text="Edit Categories"/>
                 </div>
               </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
            <div class="row">
               <div class="col-sm-3">
                  <div class="PanelField Left">
                   <label>Resume (text):</label>
                      </div>
               </div>
               <div class="col-sm-6">
             <div class="PanelFieldValueBMI">
                   <asp:TextBox ID="tbResume" CssClass="tinymce" runat="server" TextMode="MultiLine" text="<%#BindItem.ResumeText %>" />
                 </div>
               </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
         </span>
          <asp:ValidationSummary ID="vsResumePostingValidationSummary" ShowModelStateErrors="true" runat="server" />
          <asp:LinkButton ID="lnkDownload" runat="server" Text="<%# Item.ResumeBinary != null ? Item.ResumeBinary.FileName : string.Empty %>" OnClick="lnkDownload_Click" CommandArgument='<%# Item.ResumeID %>' Visible="<%# Item.ResumeBinary != null && !string.IsNullOrEmpty( Item.ResumeBinary.FileName) ? true : false %>"/>
          <br/><asp:Button ID="btnFileDelete" CssClass="PrimaryButton" runat="server" Text="Delete Resume File" OnClick="btnFileDelete_Click" CommandArgument='<%# Item.ResumeID %>'    Visible="<%# Item.ResumeBinary != null && !string.IsNullOrEmpty( Item.ResumeBinary.FileName ) ? true : false %>"/>
          <br /><asp:FileUpload ID="fuResume" CssClass="PanelFieldValueBMI" runat="server" Visible="<%# Item.ResumeBinary == null ||  string.IsNullOrEmpty( Item.ResumeBinary.FileName) ? true : false %>" />
          <asp:CustomValidator ID="vafuResume" runat="server" Text="Only .pdf, .doc, .docx, and .rtf are allowed" ControlToValidate="fuResume" OnServerValidate="vafuResume_ServerValidate" />
          <br /><asp:Button Text="Save Resume" ID="btnSave" CssClass="PrimaryButton" runat="server" CommandName="Update" />    
          <br /><br /><asp:LinkButton ID="lbView" runat="server" Text="View Resume" OnClick="lbView_Click" OnClientClick="return CheckFormDirty()" Visible="<%# Item.ResumeID != 0 %>"/>
      </EditItemTemplate>
       <ItemTemplate>
         <span>

            <div class="row">
               <div class="col-sm-6">
                   <div class="PanelField Left">
                  <label>First Name</label>
                       </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:Label runat="server" ID="lbFirstName" Text="<%#Item.FirstName %>" />
                       </div>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                   <div class="PanelField Left">
                  <label>Last Name</label>
                       </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:Label ID="lbLastName" runat="server" Text="<%#Item.LastName %>" />
                       </div>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                   <div class="PanelField Left">
                  <label>Address</label>
                       </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:Label ID="lbAddress" runat="server" Text="<%#Item.Address %>" />
                       </div>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
             <div class="PanelField Left">
                  <label>City</label>
                 </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:Label id="lbCity" runat="server" Text="<%#Item.City %>" />
                       </div>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
             <div class="PanelField Left">
                  <label>State</label>
                 </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:Label ID="lbState" runat="server" text="<%# Item.State %>" ></asp:Label>
                       </div>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
             <div class="PanelField Left">
                  <label>Zip</label>
               </div>
                   </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:Label id="lbZip" runat="server" Text ="<%#Item.Zip %>" />
                       </div>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                   <div class="PanelField Left">
                  <label>Telephone Number</label>
                       </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:Label id="lbTelephone" runat="server" Text="<%# Item.Telephone %>" />
                       </div>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                   <div class="PanelField Left">
                  <label>Fax</label>
                       </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:Label id="lbFax" runat="server" Text="<%# Item.Fax %>" />
                       </div>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                   <div class="PanelField Left">
                  <label>E-Mail Address</label>
                       </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                  <asp:Label id="lbEmailAddress" runat="server" TextMode="Phone" Text ="<%#Item.Email %>" />
                       </div>
               </div>
            </div>
                 </asp:Panel>
            <div class="row">
               <div class="col-sm-6">
                   <div class="PanelField Left">
                  <label>Category</label>
                       </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                   <asp:Label ID="lbCategory" runat="server" Text="<%#Item.CategoryName %>" />
                       </div>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                   <div class="PanelField Left">
                  <label>Resume (text):</label>
                       </div>
               </div>
               <div class="col-sm-6">
                   <div class="PanelFieldValueBMI">
                   <asp:Label id="lbResume" CssClass="tinymce" runat="server" TextMode="MultiLine" text="<%#Item.ResumeText %>" />
                       </div>
               </div>
            </div>
            <div class="row">
               <div class="col-sm-6">
                   <div class="PanelField Left">
                  <label>Resume (download):</label>
                       </div>
               </div>
               <div class="col-sm-6">
                   <asp:LinkButton ID="lnkDownload" runat="server" Text="<%# Item.ResumeBinary != null ? Item.ResumeBinary.FileName : string.Empty %>" OnClick="lnkDownload_Click" CommandArgument='<%# Item.ResumeID %>' Visible="<%# Item.ResumeBinary != null && !string.IsNullOrEmpty( Item.ResumeBinary.FileName) ? true : false %>"/>
               </div>
            </div>
         </span>
           <br /><asp:LinkButton ID="lnkEdit" runat="server" Text="Edit Resume" Visible="<%#IsStaffUser %>" OnClick="lnkEdit_Click"/>

       </ItemTemplate>
   </asp:FormView>
</div>
	<script type="text/javascript">
	    //Script is responsible for notifying user before leaving page if changes have been made.
	    var initialdata = "nothing";

	    jQuery(document).ready(function () {
	        initialdata = jQuery('#Resume *').serialize();
	    });

	    function CheckFormDirty() {
	        debugger;
	        var frmData = jQuery('#Resume *').serialize();

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
    jQuery(document).ready(function () {
        if (<%= fvResume.FindControl("cbApproved") != null ? "true" : "false" %>)
        {
        var chkApproved  = '#<%= fvResume.FindControl("cbApproved") != null ? fvResume.FindControl("cbApproved").ClientID : string.Empty %>';
        var tbPostedDate = '#<%=fvResume.FindControl("txtPostDate") != null ? fvResume.FindControl("txtPostDate") .ClientID : string.Empty %>';
        var currentDate = '<%= DateTime.Now.ToShortDateString() %>';
        jQuery(chkApproved).click(function() {
            if (jQuery(chkApproved).attr('checked') && jQuery(tbPostedDate).val() == '') jQuery(tbPostedDate).val(currentDate);
        });
    }
    });
    
    </script>