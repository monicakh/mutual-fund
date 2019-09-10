<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountInfo.aspx.cs" Inherits="FinalProject.AccountInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css"/>
    <style type="text/css">
        .auto-style1 {
            height: 147px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <div class="topnav">
                <a href="Login.aspx">الخروج</a>
                <a><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></a>
                <a href="index.aspx" class="active" style="position:absolute;right:8px;">الصندوق التعاضدي</a>
            </div>
        </div>
        <div style="direction:rtl;padding-right:40px;padding-left:40px;"><br />
            <asp:Label ID="Label1" runat="server" Text="Label" style="font-size:50px;font-weight:700;">تغيير إعدادات حسابك</asp:Label> <br /><br />
            <hr style="width:100%" />
            <br />
            <table>
                <tr>
                    <td><asp:Label ID="Label3" runat="server" Text="Label" style="font-size:30px;text-align:right;">كلمه المرور</asp:Label></td>
                    <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pass.aspx" style="font-size:30px">[تغيير كلمه المرور]</asp:HyperLink></td>
                </tr>
                <tr>
                    <td> <asp:Label ID="Label4" runat="server" Text="Label" style="font-size:30px;text-align:right">المستخدم</asp:Label> </td>
                    <td><asp:Label ID="Label7" runat="server" Text="Label" Font-Size="Larger"></asp:Label></td>
                </tr>
               <tr>
                   <td> <asp:Label ID="Label5" runat="server" Text="Label" style="font-size:30px;text-align:right">الشخصيه</asp:Label></td>
                   <td><asp:Label ID="Label8" runat="server" Text="Label" Font-Size="Larger"></asp:Label></td>
               </tr>
               <tr>
                   <td><asp:Label ID="Label6" runat="server" Text="Label" style="font-size:30px;text-align:right">المصدر</asp:Label> </td>
                   <td><asp:Label ID="Label9" runat="server" Text="Label" Font-Size="Larger"></asp:Label></td>
               </tr>
                
            </table>
            <br />
            
        </div>
    </form>
</body>
</html>
