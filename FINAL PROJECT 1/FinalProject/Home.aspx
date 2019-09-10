<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FinalProject.Home" %>

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
                <a href="Home.aspx">الصفحة الرئيسة</a>
                <a href="index.aspx" class="active" style="position:absolute;right:8px;">الصندوق التعاضدي</a>
                <a href="HomeNotification.aspx"><asp:ImageButton ID="ImageButton1" runat="server" Width="25px" OnClick="ImageButton1_Click"  /></a>
                <a><asp:Label ID="counter" runat="server" Text="0"></asp:Label></a>
            </div>
           
        </div>
    
        <asp:Image ID="Image1" runat="server" Height="400px" ImageUrl="~/img/logo.png" Width="100%" />
          <center style="margin-top:50px">
        <asp:Button ID="Button1" class="butn" runat="server" OnClick="Button1_Click" Text="اضافة وصفات جديدة"/>
        <asp:Button ID="Button2" class="butn" runat="server" Text="استرداد الوصفات الطبية" style="margin-left:100px;" OnClick="Button2_Click"/>
        </center>
            <asp:Timer ID="Timer1" runat="server" Interval="6000" OnTick="Timer1_Tick"></asp:Timer>
    </form>
</body>
</html>
