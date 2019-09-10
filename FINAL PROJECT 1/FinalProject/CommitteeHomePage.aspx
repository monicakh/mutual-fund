<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommitteeHomePage.aspx.cs" Inherits="FinalProject.CommitteeHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link rel="stylesheet" type="text/css" href="StyleSheet1.css"/>
    <style type="text/css">
        .auto-style1 {
            height: 580px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
              <asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
        <div class="auto-style1">
             <div class="topnav">
                <a href="Login.aspx">الخروج</a>
                <a href="AccountInfo.aspx"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></a>
                <a href="CommitteeHomePage.aspx">الصفحة الرئيسة</a>
                <a href="index.aspx" class="active" style="position:absolute;right:8px;">الصندوق التعاضدي</a>
                <a href="CommitteeNotification.aspx"><asp:ImageButton ID="ImageButton1" runat="server" Width="25px" OnClick="ImageButton1_Click"  /></a>
                <a><asp:Label ID="counter" runat="server" Text="0"></asp:Label></a>
            </div>
              <asp:Image ID="Image1" runat="server" Height="400px" ImageUrl="~/img/logo.png" Width="100%" />
            
       
            </div>
             <asp:Timer ID="Timer1" runat="server" Interval="6000" OnTick="Timer1_Tick"></asp:Timer>
    </form>
</body>
</html>
