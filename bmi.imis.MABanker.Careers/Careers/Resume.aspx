<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resume.aspx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.Resume1" %>

<%@ Register Src="ResumePosting.ascx" TagPrefix="uc1" TagName="ResumePosting" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:ResumePosting runat="server" id="ResumePosting" />
    </div>
    </form>
</body>
</html>
