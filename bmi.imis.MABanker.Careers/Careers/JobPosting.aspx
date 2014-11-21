<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobPosting.aspx.cs" Inherits="bmi.imis.MABanker.Careers.JobPosting" %>

<%@ Register src="JobPosting.ascx" tagname="JobPosting" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <script src="../Custom/Scripts/jquery-1.5.min.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" class="" runat="server">
        <uc1:JobPosting ID="JobPosting1" runat="server" />
    <div>
    </div>
    </form>
</body>
</html>
