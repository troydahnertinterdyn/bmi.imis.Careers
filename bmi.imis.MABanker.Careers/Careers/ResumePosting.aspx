<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResumePosting.aspx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.ResumePosting1" %>

<%@ Register Src="~/Careers/ResumePosting.ascx" TagPrefix="uc1" TagName="ResumePosting" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:ResumePosting runat="server" ID="ResumePosting" />
    </div>
    </form>
</body>
</html>
