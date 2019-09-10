<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FinalProject.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div align="center">
            <asp:Image ID="Image1" runat="server" Height="112px" ImageUrl="~/img/logo.png" Width="50%" style="margin-top:100px"/><br />
            <asp:Label ID="Label1" runat="server" Text="Label" style="font-weight:600;font-size:40px;margin-top:20px">Please sign in</asp:Label><br />
            <asp:TextBox ID="TextBox1" runat="server" placeholder="username" Width="300px" Height="30px" style="margin-top:20px;font-size:15px" ></asp:TextBox><br />
            <asp:TextBox ID="TextBox2" runat="server" placeholder="password" Width="300px" Height="30px" style="margin-top:20px;font-size:15px" TextMode="Password"></asp:TextBox><br />
            <asp:Button ID="Button1" runat="server" Text="Log In" style="margin-top:20px" class="butn" OnClick="Button1_Click"/>
            </div>
                 <asp:Button ID="Button2" runat="server" class="butn3" Text="Go Back" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
