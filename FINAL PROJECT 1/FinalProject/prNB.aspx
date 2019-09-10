<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="prNB.aspx.cs" Inherits="FinalProject.prNB" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="topnav">
                <a href="Login.aspx">الخروج</a>
                <a href="AccountInfo.aspx"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></a>
                <a href="Home.aspx">الصفحة الرئيسة</a>
                <a href="index.aspx" class="active" style="position:absolute;right:8px;">الصندوق التعاضدي</a>
            </div>
            <div>
             <center style="margin-top:200px;">
                <asp:TextBox ID="TextBox1" runat="server" Width="300px" Height="30px" style="margin-top:20px;font-size:15px" ></asp:TextBox>
                <asp:Label ID="Label1" runat="server" Text=":رقم الباركود" style="font-weight:600;font-size:40px;margin-top:20px"></asp:Label>
                
                 <br />
                <p style="padding-top:20px;"><asp:Button ID="Button1" class="butn" runat="server" Text="ادخل" OnClick="Button1_Click" /></p>
             </center>
                </div>
             
        </div>
    </form>
</body>
</html>
