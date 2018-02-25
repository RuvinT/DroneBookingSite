<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testconnection.aspx.cs" Inherits="WebApplication16drone.testconnection" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dronerentConnectionString %>" SelectCommand="SELECT * FROM [Testone]"></asp:SqlDataSource>
    </form>
</body>
</html>
