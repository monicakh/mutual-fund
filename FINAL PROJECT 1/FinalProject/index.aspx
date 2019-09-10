<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FinalProject.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css"/>
    <style type="text/css">
        .auto-style1 {
            width: 330px;
        }
        
        .auto-style2 {
            position: absolute;
            left: 11px;
            top: 364px;
            height: 234px;
            width: 100%;
            margin-top: 0px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="topnav">
                <a href="Login.aspx">الدخول إلى الحساب</a>
                <a href="http://taadod.ul.edu.lb/web-01-10-2018/websiteDocs/sub2.htm">الادارة الحالية</a>
                <a href="http://taadod.ul.edu.lb/web-01-10-2018/websiteDocs/SUB1.htm">تعريف</a>
                <a class="active" style="position:absolute;right:8px;">الصندوق التعاضدي</a>
            </div>

            <asp:Image ID="Image1" runat="server" Height="400px" ImageUrl="~/img/logo.png" Width="100%" />
            <div align="center">
                <asp:Button ID="Button1" class="butn" runat="server" Text="خدمة الموقع" OnClick="Button1_Click"/>
            </div>
      
        </div>
    </form>
</body>
</html>
