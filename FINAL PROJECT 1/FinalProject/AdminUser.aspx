<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUser.aspx.cs" Inherits="FinalProject.AdminUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css"/>
  <style>
        body
{
    font-size: .80em;
    width: auto;
    font-family: "Helvetica Neue", "Lucida Grande", "Segoe UI", Arial, Helvetica, Verdana, sans-serif;
    background: #e8ffe6;
    height:auto;
}
 
    </style>
</head>
<body>
   <form id="form1" runat="server">
    <div class="topnav">
                <a href="Login.aspx">الخروج</a>
                <a href="AccountInfo.aspx"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></a>
                <a href="Admin.aspx">الصفحة الرئيسة</a>
                <a href="index.aspx" style="position:absolute;right:8px;" class="active">الصندوق التعاضدي</a>
            </div>
       
        <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl="~/img/logo.png" Width="100%" />
        <table style="margin-left:500px">
        
        <tr>
            <td class="td">User Name:</td>
            <td>
                <asp:TextBox ID="txtUser" runat="server" ></asp:TextBox></td>
             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="txtUser" ErrorMessage="Please fill out this field"></asp:RequiredFieldValidator>
                </td>
            <td>
                <asp:Label ID="lblidUser" runat="server" Visible="false"></asp:Label>&nbsp;</td>
        </tr>
        <tr>
            <td class="td">Password:</td>
            <td>
                <asp:TextBox ID="txtPass" runat="server" ></asp:TextBox></td>
             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="txtPass" ErrorMessage="**"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
         </tr>
         <tr>
             <td class="td">Name :</td>
            <td>
                <asp:TextBox ID="txtName" runat="server" ></asp:TextBox></td>
              <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ControlToValidate="txtName" ErrorMessage="Please fill out this field"></asp:RequiredFieldValidator>
                </td>   
             <td>&nbsp;</td>
         </tr>
         <tr>
            <td class="td">idLab :</td>
            <td>
                <asp:TextBox ID="TxtLab" runat="server" ></asp:TextBox></td>
              <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                ControlToValidate="TxtLab" ErrorMessage="Enter id Lab"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
         </tr>
         <tr>
            <td class="td">idProfile:</td>
            <td>
                <asp:TextBox ID="TxtProfile" runat="server" ></asp:TextBox></td>
              <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                ControlToValidate="TxtProfile" ErrorMessage="Enter id Profile"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
         </tr>

        
    
        
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit"  OnClick="btnSubmit_Click"/>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" Visible="false"  OnClick="btnUpdate_Click"/>
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /></td>
            <td></td>
        </tr>
    </table>
       <div style="padding: 10px; margin: 0px;">
        <p>
            Total Test:<asp:Label ID="lbltotalcount" runat="server" Font-Bold="true"></asp:Label>
        </p>
           <center>
           <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridViewUsers_RowDeleting" CellPadding="4" DataKeyNames="idUser" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewUsers_SelectedIndexChanged">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
                   <asp:TemplateField HeaderText="Delete">
                       <ItemTemplate>
                           <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Update">
                       <ItemTemplate>
                           <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="idUser" HeaderText="idUser" InsertVisible="False" ReadOnly="True" SortExpression="idUser" />
                   <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                   <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                   <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                   <asp:BoundField DataField="idLab" HeaderText="idLab" SortExpression="idLab" />
                   <asp:BoundField DataField="idProfile" HeaderText="idProfile" SortExpression="idProfile" />
               </Columns>
               <EditRowStyle BackColor="#7C6F57" />
               <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#E3EAEB" />
               <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#F8FAFA" />
               <SortedAscendingHeaderStyle BackColor="#246B61" />
               <SortedDescendingCellStyle BackColor="#D4DFE1" />
               <SortedDescendingHeaderStyle BackColor="#15524A" />
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DbCon %>" DeleteCommand="DELETE FROM [Users] WHERE [idUser] = @original_idUser AND [username] = @original_username AND [password] = @original_password AND [name] = @original_name AND [idLab] = @original_idLab AND [idProfile] = @original_idProfile" InsertCommand="INSERT INTO [Users] ([username], [password], [name], [idLab], [idProfile]) VALUES (@username, @password, @name, @idLab, @idProfile)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:DbCon.ProviderName %>" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [username] = @username, [password] = @password, [name] = @name, [idLab] = @idLab, [idProfile] = @idProfile WHERE [idUser] = @original_idUser AND [username] = @original_username AND [password] = @original_password AND [name] = @original_name AND [idLab] = @original_idLab AND [idProfile] = @original_idProfile">
               <DeleteParameters>
                   <asp:Parameter Name="original_idUser" Type="Int32" />
                   <asp:Parameter Name="original_username" Type="String" />
                   <asp:Parameter Name="original_password" Type="String" />
                   <asp:Parameter Name="original_name" Type="String" />
                   <asp:Parameter Name="original_idLab" Type="Int32" />
                   <asp:Parameter Name="original_idProfile" Type="Int32" />
               </DeleteParameters>
               <InsertParameters>
                   <asp:Parameter Name="username" Type="String" />
                   <asp:Parameter Name="password" Type="String" />
                   <asp:Parameter Name="name" Type="String" />
                   <asp:Parameter Name="idLab" Type="Int32" />
                   <asp:Parameter Name="idProfile" Type="Int32" />
               </InsertParameters>
               <UpdateParameters>
                   <asp:Parameter Name="username" Type="String" />
                   <asp:Parameter Name="password" Type="String" />
                   <asp:Parameter Name="name" Type="String" />
                   <asp:Parameter Name="idLab" Type="Int32" />
                   <asp:Parameter Name="idProfile" Type="Int32" />
                   <asp:Parameter Name="original_idUser" Type="Int32" />
                   <asp:Parameter Name="original_username" Type="String" />
                   <asp:Parameter Name="original_password" Type="String" />
                   <asp:Parameter Name="original_name" Type="String" />
                   <asp:Parameter Name="original_idLab" Type="Int32" />
                   <asp:Parameter Name="original_idProfile" Type="Int32" />
               </UpdateParameters>
           </asp:SqlDataSource>
               </center>
           <asp:Button ID="Button2" runat="server" class="butn3" Text="Go Back" OnClick="Button2_Click" CausesValidation="False" ValidateRequestMode="Disabled"/>
        </div> 
       
   </form>

</body>
</html>
