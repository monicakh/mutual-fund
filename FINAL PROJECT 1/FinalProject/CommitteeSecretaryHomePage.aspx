<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommitteeSecretaryHomePage.aspx.cs" Inherits="FinalProject.CommitteeSecretaryHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css"/>
</head>
<body>
    <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
        <div>
            <div class="topnav">
                <a href="Login.aspx">الخروج</a>
                <a href="AccountInfo.aspx"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></a>
                 <a href="CommitteeSecretaryHomePage.aspx">الصفحة الرئيسة</a>
                <a href="index.aspx" class="active" style="position:absolute;right:8px;">الصندوق التعاضدي</a>
                 <a href="CommitteeSecretaryNotification.aspx"><asp:ImageButton ID="ImageButton1" runat="server" Width="25px" OnClick="ImageButton1_Click" /></a>
                <a><asp:Label ID="counter" runat="server" Text="0"></asp:Label></a>
            </div>
            <asp:Image ID="Image1" runat="server" Height="456px" ImageUrl="~/img/logo.png" Width="100%" />
             <center style="margin-top:50px">
        </center>
        </div>
             <asp:Timer ID="Timer1" runat="server" Interval="6000" OnTick="Timer1_Tick"></asp:Timer>
    </form>
</body>
</html>
