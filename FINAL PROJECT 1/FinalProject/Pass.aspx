<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pass.aspx.cs" Inherits="FinalProject.Pass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
             <div class="topnav">
                <a href="Login.aspx">الخروج</a>
                <a href="AccountInfo.aspx"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></a>
             
                <a href="index.aspx" class="active" style="position:absolute;right:8px;">الصندوق التعاضدي</a>
            </div>
        </div>
        <div style="direction:rtl;padding-right:40px;padding-left:40px;"><br />
            <asp:Label ID="Label1" runat="server" Text="Label" style="font-size:50px;font-weight:700;">تغيير كلمه المرور</asp:Label> <br /><br />
            <hr style="width:100%" />
            <br />
            <table>
                <tr>
                    <td><asp:Label ID="Label3" runat="server" Text="Label" style="font-size:30px;text-align:left;">كلمه المرور الحالية</asp:Label></td>
                    <td><asp:TextBox ID="TextBox1" runat="server" Width="200px" Height="20px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label5" runat="server" Text="Label" style="font-size:30px;text-align:left;" >كلمه المرور الجديدة</asp:Label></td>
                    <td><asp:TextBox ID="TextBox2" runat="server" Width="200px" Height="20px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Label ID="Label4" runat="server" Text="Label" style="font-size:30px;text-align:left;">تاكيد كلمه المرور الجديدة</asp:Label></td>
                    <td><asp:TextBox ID="TextBox3" runat="server" Width="200px" Height="20px"></asp:TextBox></td>
                    <td><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="غير مطابق " ControlToCompare="TextBox2" ControlToValidate="TextBox3"></asp:CompareValidator>
        </td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="Button1" runat="server" CssClass="butn2" Text="Change Password" OnClick="Button1_Click" /></td>
                </tr>
            </table>
          
            <br />
            
        </div>
        </div>
    </form>
</body>
</html>
