<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="JobPosting.ascx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.JobPosting" %>
<%@ Register tagprefix="tagprefix"
   namespace="Asi.Web"
   assembly="Asi.Web" %>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css" />
<script src='<%= Page.ResolveClientUrl("~/Custom/Scripts/jquery.maskedinput-1.3.1.min.js") %>'></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<div id="Posting" >

<asp:FormView ID="fvJobPosting" CssClass="" runat="server" DefaultMode='<%# (IsStaffUser) ||Request.QueryString["PostingId"] == null ? FormViewMode.Edit : FormViewMode.ReadOnly %>'  ItemType="bmi.imis.MABanker.Careers.Models.Posting"  SelectMethod="GetPosting" UpdateMethod="fvJobPosting_UpdateItem" >

	<EditItemTemplate>
           <asp:ValidationSummary ID="vsJobPosting" runat="server" />
    <asp:Panel runat="server" Visible="<%# PostingId == null && IsAuthenticated && !IsStaffUser && PostingCredits <= 0 %>">
        You must purchase Credits before you post a job.<br />
        <asp:Button ID="btnPurchaseCredits" CssClass="PrimaryButton" Text="Purchase Credits" runat="server" PostBackUrl="~/MBRD/MB_Store/MB_Job_Credits.aspx" />
    </asp:Panel>
	<asp:Panel ID="pnlJobForm" runat="server" Visible ="<%# PostingId != null || !(PostingId == null && !IsStaffUser && PostingCredits <=0) %>">
            <div class="row">             
                <div class="col-sm-3">
                   <div class="PanelField Left">
			        <asp:label runat="server" Visible="<%# IsStaffUser %>">Job ID</asp:label>
                   </div>
                </div>
                <div class="col-sm-6">
                    <div class="PanelFieldValueBMI">
                        <asp:TextBox runat="server" ID="txtID" Text="<%# BindItem.JobID %>" Enabled="<%# false %>" Visible="<%# IsStaffUser %>" />
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
                       <asp:Label runat="server" Visible="<%# IsStaffUser %>">Approved</asp:Label>
                   </div>
                </div>
                <div class="col-sm-6">
                    <div class="PanelFieldValueBMI">
                        <asp:CheckBox ID="cbApproved" runat="server" Checked="<%# BindItem.Approved %>" Enabled="<%# IsStaffUser %>" Visible="<%# IsStaffUser %>"  />
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
                    <asp:label runat="server" Visible="<%# IsStaffUser %>">Post Date</asp:label>
                   </div>
                </div>
                <div class="col-sm-6">
                    <div class="PanelFieldValueBMI">
                    <asp:TextBox ID="txtPostDate" runat="server"  Text="<%# Item.PostDate != null ? ((DateTime)Item.PostDate).ToShortDateString() : string.Empty %>" Enabled="<%# IsStaffUser %>" Visible="<%# IsStaffUser %>"  />
                    </div>
                </div>
                <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                   </div>
                </div>
            </div>
        <br />
        <br />
         <div class="row">  
                <div class="col-sm-12">
			        <div id="ste_container_ciAAAPageHeader">
				        <strong>Your Information:</strong>
			        </div>
                </div>
            </div>
        <br />  
            <div class="row">             
                <div class="col-sm-3">
                   <div class="PanelField Left">
			            <label >First Name</label>
                   </div>
                </div>
                <div class="col-sm-6">
                    <div class="PanelFieldValueBMI">
                        <asp:TextBox  runat="server" ValidationGroup="validation" ID='txtFirstName' Text="<%# BindItem.FirstName%>" />
                    </div>
                </div>
                <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                       <asp:RequiredFieldValidator ID="rfFirstName" runat="server" ControlToValidate="txtFirstName" EnableClientScript="true" Text="Required" ValidationGroup="validation"/>
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
                        <asp:TextBox runat="server" ID="txtLastName" Text="<%# BindItem.LastName %>" />
                    </div>
                </div>
                 <div class="col-sm-3">
                   <div class="PanelField Left">
                       <%--required field validation area--%>
                       <asp:RequiredFieldValidator ID="rfLastName" runat="server" ControlToValidate="txtLastName" EnableClientScript="true" Text="Required"  ValidationGroup="validation"/>
                   </div>
                </div>
		    </div>

             <div class="row">             
                <div class="col-sm-12">
                   <asp:Panel ID="pnlContactInformation" runat="server" Visible="<%# !Item.AnnonymousPost %>">
                    <div class="row">  
                        <div class="col-sm-3">
                            <div class="PanelField Left">
			                    <label>Company</label>
                            </div>
                        </div>
                         <div class="col-sm-6">
                            <div class="PanelFieldValueBMI">
                                <asp:TextBox runat="server" ID="txtCompany" Text="<%#BindItem.Company %>" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                           <div class="PanelField Left">
                               <%--required field validation area--%>
                               <asp:RequiredFieldValidator ID="rfCompany" runat="server" ControlToValidate="txtCompany" EnableClientScript="true" Text="Required"  ValidationGroup="validation"/>
                           </div>
                        </div>
                   </div>
                   </div>
                   <div class="row">     
                       <div class="col-sm-3">
                            <div class="PanelField Left">
            		            <label>Work Phone</label>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="PanelFieldValueBMI">
                                <asp:TextBox runat="server" ID="txtWorkPhone" Text="<%#BindItem.WorkPhone %>" />
                            </div>
                       </div>
                        <div class="col-sm-3">
                           <div class="PanelField Left">
                               <%--required field validation area--%>
                               <asp:RequiredFieldValidator ID="rfWorkPhone" runat="server" ControlToValidate="txtWorkPhone" EnableClientScript="true" Text="Required"  ValidationGroup="validation"/>
                           </div>
                        </div>
                 </div>
                    <div class="row">  
                        <div class="col-sm-3">
                            <div class="PanelField Left">
			                    <label>Email</label>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="PanelFieldValueBMI">
                                <asp:TextBox runat="server" ID="txtEmail" Text="<%#BindItem.Email %>" />
                            </div>
                        </div>
                         <div class="col-sm-3">
                           <div class="PanelField Left">
                               <%--required field validation area--%>
                               <asp:RequiredFieldValidator ID="rfEmail" runat="server" ControlToValidate="txtEmail" EnableClientScript="true" Text="Required"  ValidationGroup="validation"/>
                               <asp:RegularExpressionValidator runat="server" ID="revEmail" ControlToValidate="txtEmail" ValidationExpression="^((\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*)*([,])*)*$">Invalid.</asp:RegularExpressionValidator>
                           </div>
                        </div>
                    </div>
                </asp:Panel>
              </div>
            </div>
            <div class="row">  
                <div class="col-sm-3">
                    <div class="PanelFieldValueBMI">
			            
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="PanelField Left">
                        <asp:CheckBox runat="server" ID="cbAnnonymousPost" Checked="<%# BindItem.AnnonymousPost %>" />
			            <label>Anonymous Post?</label>
                    </div>
                </div>
                 <div class="col-sm-3">
                    <div class="PanelField Left">
                        <%--required field validation area--%>
                    </div>
                </div>
            </div>
        <br />
        <br />
			<div class="row">  
                <div class="col-sm-12">
			        <div id="ste_container_ciAAAPageHeader">
				        <strong>Information to be displayed in your listing:</strong>
			        </div>
                </div>
            </div>
        <br />
            <div class="row">  
                <div class="col-sm-3">
			        <div class="PanelField Left">
                        <label>Title of Job/Position</label>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="PanelFieldValueBMI">
			            <asp:TextBox ID="txtTitle" runat="server" Text="<%#BindItem.Title %>" />
                    </div>
                </div>
                 <div class="col-sm-3">
                    <div class="PanelField Left">
                        <%--required field validation area--%>
                        <asp:RequiredFieldValidator ID="rfTitle" runat="server" ControlToValidate="txtTitle" EnableClientScript="true" Text="Required"  ValidationGroup="validation"/>
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
                        <label>Description</label>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="PanelFieldValueBMI">
			            <asp:TextBox TextMode="MultiLine" ID="txtDescription" runat="server"  Text="<%#BindItem.Description %>" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="PanelField Left">
                        <%--required field validation area--%>
                        <asp:RequiredFieldValidator ID="rfDescription" runat="server" CssClass="tbMedium" ControlToValidate="txtDescription" EnableClientScript="true" Text="Required"  ValidationGroup="validation"/>
                    </div>
                </div>
            </div>
            <div class="row">  
                <div class="col-sm-3">
                    <div class="PanelField Left">			    
                        <label>Requirements</label>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="PanelFieldValueBMI">
			            <asp:TextBox ID="txtRequirements" runat="server" TextMode="MultiLine" CssClass="tbShort" Text="<%#BindItem.Requirements %>" />
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
                        <label>City/Location</label>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="PanelFieldValueBMI">
                        <asp:TextBox ID="City" runat="server" Text="<%#BindItem.City %>" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="PanelField Left">
                        <%--required field validation area--%>
                        <asp:RequiredFieldValidator ID="rfCity" runat="server" ControlToValidate="City" EnableClientScript="true" Text="Required"  ValidationGroup="validation"/>
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
					    <asp:ListItem Selected="True" Value="">Select a State...</asp:ListItem>
				        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="PanelField Left">
                        <%--required field validation area--%>
                        <asp:RequiredFieldValidator ID="rfState" runat="server" ControlToValidate="ddlState" EnableClientScript="true" Text="Required" ValidationGroup="validation"/>
                    </div>
                </div>
            </div>

               <%-- <span class="JobPosting">--%>
		   <%-- <div class="row">  
                <div class="col-sm-12">
                    <div class="PanelField Left">    
                        <label>Contact Information: (Display with listing)</label>
                    </div>
                </div>
            </div>--%>
            <div class="row">  
                <div class="col-sm-12">
                    <asp:Panel ID="pnlContactInformation2" runat="server" Visible="<%#!Item.AnnonymousPost %>" >
                    <div class="row">
                         <div class="col-sm-3">
                            <div class="PanelField Left">    
                                <label>Contact Information (Display with listing):</label>
                            </div>
                        </div> 
                        <div class="col-sm-6">
                            <div class="PanelFieldValueBMI">
                                <asp:TextBox ID="txtContactInformation" TextMode="MultiLine" CssClass="tbShort" runat="server" Text="<%#BindItem.ContactInformation %>" />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="PanelField Left">
                                <%--required field validation area--%>
                                <asp:RequiredFieldValidator ID="rfContact" runat="server" ControlToValidate="txtContactInformation" EnableClientScript="true" Text="Required"  ValidationGroup="validation"/>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-3">
                            <div class="PanelField Left">
		                        <label>Web Site URL</label>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="PanelFieldValueBMI">
                                <asp:TextBox ID="txtWebSiteURL" runat="server" Text="<%#BindItem.WebSiteURL %>"  />
                            </div>
                        </div>
                        <div class="col-sm-3">
                            <div class="PanelField Left">
                                <%--required field validation area--%>
                            </div>
                        </div>
                    </div>
                    </asp:Panel>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div class="PanelField Left">
		                <label>Additional Comments</label>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="PanelFieldValueBMI">
                        <asp:TextBox ID="txtAdditionalComments" runat="server" TextMode="MultiLine" CssClass="tbshort" Text="<%#BindItem.Comments %>" />
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="PanelField Left">
                        <%--required field validation area--%>
                    </div>
                </div>
		    </div>
            <div class="row">
                <div class="col-sm-12">
                <label>
                    <asp:Label lbl="lblRemainingCredits" Text=' <%# "You have " + PostingCredits + " Job Posting Credits Remaining." %>' runat="server" visible="<%# IsAuthenticated && !IsStaffUser && PostingId == null %>" />
                </label>
                </div>
            </div>
			
            <asp:Button Text="Save" ID="btnSave" CssClass="PrimaryButton" ValidationGroup="validation" CausesValidation="true" runat="server" CommandName="Update" />    
			<asp:Button Text="View" ID ="btnView" CssClass="PrimaryButton" runat="server" Visible="<%# fvJobPosting.CurrentMode == FormViewMode.Edit %>" OnClick="btnView_Click" OnClientClick="return CheckFormDirty()" />
			<%--</span>--%>
        </asp:Panel>
	</EditItemTemplate>
	<ItemTemplate>
        <asp:Panel Visible="<%#IsStaffUser %>" ID="pnlYourInformation" runat="server">
            <div class="row">  
                    <div class="col-sm-12">
			            <div id="ste_container_ciAAAPageHeader">
				            <strong>Your Information:</strong>
			            </div>
                    </div>
                </div>
            <br />
            <div class="row" >
                <div class="col-sm-4">
                    <div class="PanelField Left"><label >Job Id:</label></div>
                </div>
                <div class="col-sm-8">
                    <div class="PanelFieldValueBMI"><asp:label ID="lblJobId" runat="server" Text="<%#Item.JobID %>" /></div>
			    </div>	
            </div>
		    <div class="row" >
                <div class="col-sm-4">
                    <div class="PanelField Left"><label >Approved:</label></div>
                </div>
                <div class="col-sm-8">
                    <div class="PanelFieldValueBMI"><asp:label ID="lblApproved" runat="server" Text="<%#Item.Approved %>" /></div>
			    </div>	
            </div>
            <div class="row" >
                <div class="col-sm-4">
                    <div class="PanelField Left"><label >First Name:</label></div>
                </div>
                <div class="col-sm-8">
                    <div class="PanelFieldValueBMI"><asp:label ID="lblFirstName" runat="server" Text="<%#Item.FirstName %>" /></div>
			    </div>	
            </div>
            <div class="row" >
                <div class="col-sm-4">
                    <div class="PanelField Left"><label >Last Name:</label></div>
                </div>
                <div class="col-sm-8">
                    <div class="PanelFieldValueBMI"><asp:label ID="lblLastName" runat="server" Text="<%#Item.LastName %>" /></div>
			    </div>	
            </div>
            <div class="row" >
                <div class="col-sm-4">
                    <div class="PanelField Left"><label >Company:</label></div>
                </div>
                <div class="col-sm-8">
                    <div class="PanelFieldValueBMI"><asp:label ID="Label2" runat="server" Text="<%#Item.Company %>" /></div>
			    </div>	
            </div>

            <div class="row" >
                <div class="col-sm-4">
                    <div class="PanelField Left"><label >Work Phone:</label></div>
                </div>
                <div class="col-sm-8">
                    <div class="PanelFieldValueBMI"><asp:label ID="Label3" runat="server" Text="<%#Item.WorkPhone %>" /></div>
			    </div>	
            </div>

            <div class="row" >
                <div class="col-sm-4">
                    <div class="PanelField Left"><label >Email Address:</label></div>
                </div>
                <div class="col-sm-8">
                    <div class="PanelFieldValueBMI"><asp:label ID="Label4" runat="server" Text="<%#Item.Email %>" /></div>
			    </div>	
            </div>
            </asp:Panel>
         <br />
        <div class="row" >
			<div class="col-sm-4">
                <div class="PanelField Left"><label> Title of Job/Position:</label></div>
            </div>
            <div class="col-sm-8">
                <div class="PanelFieldValueBMI"><asp:Label ID="lblTitle" runat="server" Text="<%# Item.Title %>" /></div>
			</div>
        </div>
        <div class="row" >
            <div class="col-sm-4">
                <div class="PanelField Left"> <label >Category:</label></div>
            </div>
            <div class="col-sm-8">
                <div class="PanelFieldValueBMI"><asp:Label ID="lblCategoryName"  runat="server" text="<%# Item.CategoryName %>" /></div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="PanelField Left"><label>Description:</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="PanelFieldValueBMI">
                    <asp:Label ID="lblDescription" runat="server" Text='<%# Item.Description == null ? string.Empty : Item.Description.Replace("\r\n", "<br>") %>'></asp:Label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="PanelField Left"><label>Requirements:</label>
                </div>
            </div>
            <div class="col-sm-8">
                <div class="PanelFieldValueBMI">
                    <asp:Label ID="Label1" runat="server" Text='<%# Item.Requirements == null ? string.Empty : Item.Requirements.Replace("\r\n", "<br>") %>'></asp:Label>
                </div>
            </div>
        </div>
        <div class="row" >
            <div class="col-sm-4">
                <div class="PanelField Left"><label>City/Location:</label></div>
            </div>
            <div class="col-sm-8">
                <div class="PanelFieldValueBMI"><asp:label runat="server" Text='<%#Item.City %>'></asp:label></div>
            </div>            
        </div>
        <div class="row" >
            <div class="col-sm-4">
                <div class="PanelField Left"><label>State:</label></div>
            </div>
            <div class="col-sm-8">
                <div class="PanelFieldValueBMI"><asp:label runat="server" Text='<%#Item.State %>'></asp:label></div>
            </div>            
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="PanelField Left" ><label>Contact Information (displayed with listing):</label></div>
            </div>
            <div class="col-sm-8">
                <div class="PanelFieldValueBMI" >                    
                    <asp:Label runat="server" Visible='<%# Item.AnnonymousPost %>'>Test</asp:Label>
                    <asp:label ID="lblContactInformation" runat="server" Text='<%#Item.ContactInformation %>' Visible='<%# !Item.AnnonymousPost %>' />

                    <asp:Panel ID="pnlAnnonymousContactInformation" runat="server" Visible='<%# Item.AnnonymousPost %>'>
                             Lynne V. Glancy<br />
                             Publications Manager<br />
                             Massachusetts Bankers Association<br />
                             One Washington Mall, 8th Floor<br />
                             Boston, MA 02108-2603<br />
                             Tel. 617.502-3811 Fax. 617.523.6373<br />
                             lglancy@massbankers.org<br />
                             www.massbankers.org<br />
                    </asp:Panel>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="PanelField Left" ><label>Website URL:</label></div>
            </div>
            <div class="col-sm-8">
                <div class="PanelFieldValueBMI" ><asp:label runat="server" Text='<%#Item.WebSiteURL %>'></asp:label></div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="PanelField Left" ><label>Additional Comments:</label></div>
            </div>
            <div class="col-sm-8">
                <div class="PanelFieldValueBMI" ><asp:label runat="server" Text='<%#Item.Comments %>'></asp:label></div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-4">
                <div class="PanelField Left" ><label>Post Date:</label></div>
            </div>
            <div class="col-sm-8">
                <div class="PanelFieldValueBMI" ><asp:Label ID="lblPosted" runat="server" Text="<%# Item.PostDate != null ? ((DateTime)Item.PostDate).ToShortDateString() : string.Empty %>"></asp:Label></div>
            </div>            
        </div>
        
		<asp:Button ID="btnEdit" CssClass="PrimaryButton" Text="Edit" runat="server" CausesValidation="false" OnClick="btnEdit_Click" Visible="<%# IsStaffUser  %>"/>
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