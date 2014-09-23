<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobPostings.aspx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.JobPostings1" %>

<%@ Register Src="~/Careers/JobPostings.ascx" TagPrefix="uc1" TagName="JobPostings" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:JobPostings runat="server" id="JobPostings" />
    </div>
    </form>
</body>
</html>
