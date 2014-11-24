<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResumePosting.aspx.cs" Inherits="bmi.imis.MABanker.Careers.Careers.ResumePosting1" %>

<%@ Register Src="~/Careers/ResumePosting.ascx" TagPrefix="uc1" TagName="ResumePosting" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="../Custom/Scripts/jquery-1.5.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:ResumePosting runat="server" ID="ResumePosting" />
    </div>
    </form>
</body>
</html>
