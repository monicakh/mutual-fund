<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminProfs.aspx.cs" Inherits="FinalProject.AdminProfs" %>

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
            <td class="td">SSN:</td>
            <td>
                <asp:TextBox ID="txtssn" runat="server" ></asp:TextBox></td>
             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="txtssn" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
                  <td>
                <asp:Label ID="lblssn" runat="server" Visible="false"></asp:Label>&nbsp;</td>
         
        </tr>
         <tr>
            <td class="td">Name:</td>
            <td>
                <asp:TextBox ID="txtName" runat="server" ></asp:TextBox></td>
              <td><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                ControlToValidate="txtName" ErrorMessage="Please Fill out this field"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
           </tr>
  
        <tr>
            <td class="td">Mobile:</td>
            <td>
                <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ControlToValidate="txtBirth" ErrorMessage="Please Fill out this field"></asp:RequiredFieldValidator>
                </td>
             <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="td">Email :</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></td>
               <td> <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Wrong Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
                

            <td>&nbsp</td>
        </tr>
               <tr>
            <td class="td">DateOfBirth:</td>
            <td>
                <asp:TextBox ID="txtBirth" runat="server"></asp:TextBox></td>
                    <td><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                ControlToValidate="txtBirth" ErrorMessage="Please Fill out this field"></asp:RequiredFieldValidator>
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
            Total Profs:<asp:Label ID="lbltotalcount" runat="server" Font-Bold="true"></asp:Label>
        </p>
           <center>
           <asp:GridView ID="GridViewProfs" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ssn"  ForeColor="#333333" GridLines="None" OnRowDeleting="GridViewProfs_RowDeleting" OnSelectedIndexChanged="GridViewProfs_SelectedIndexChanged">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
                   <asp:TemplateField HeaderText="Delete">
                       <ItemTemplate>
                           <asp:LinkButton ID="LinkButton2" OnClientClick="return confirm('Are you sure to Delete');" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Update">
                       <ItemTemplate>
                           <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('Are you sure to Update');" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="ssn" HeaderText="ssn" ReadOnly="True" SortExpression="ssn" />
                   <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                   <asp:BoundField DataField="tel" HeaderText="tel" SortExpression="tel" />
                   <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                   <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
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
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DbCon %>" DeleteCommand="DELETE FROM [Profs] WHERE [ssn] = @original_ssn AND [name] = @original_name AND [tel] = @original_tel AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [DateOfBirth] = @original_DateOfBirth" InsertCommand="INSERT INTO [Profs] ([ssn], [name], [tel], [email], [DateOfBirth]) VALUES (@ssn, @name, @tel, @email, @DateOfBirth)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:DbCon.ProviderName %>" SelectCommand="SELECT * FROM [Profs]" UpdateCommand="UPDATE [Profs] SET [name] = @name, [tel] = @tel, [email] = @email, [DateOfBirth] = @DateOfBirth WHERE [ssn] = @original_ssn AND [name] = @original_name AND [tel] = @original_tel AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL)) AND [DateOfBirth] = @original_DateOfBirth">
               <DeleteParameters>
                   <asp:Parameter Name="original_ssn" Type="Int32" />
                   <asp:Parameter Name="original_name" Type="String" />
                   <asp:Parameter Name="original_tel" Type="Int32" />
                   <asp:Parameter Name="original_email" Type="String" />
                   <asp:Parameter Name="original_DateOfBirth" Type="String" />
               </DeleteParameters>
               <InsertParameters>
                   <asp:Parameter Name="ssn" Type="Int32" />
                   <asp:Parameter Name="name" Type="String" />
                   <asp:Parameter Name="tel" Type="Int32" />
                   <asp:Parameter Name="email" Type="String" />
                   <asp:Parameter Name="DateOfBirth" Type="String" />
               </InsertParameters>
               <UpdateParameters>
                   <asp:Parameter Name="name" Type="String" />
                   <asp:Parameter Name="tel" Type="Int32" />
                   <asp:Parameter Name="email" Type="String" />
                   <asp:Parameter Name="DateOfBirth" Type="String" />
                   <asp:Parameter Name="original_ssn" Type="Int32" />
                   <asp:Parameter Name="original_name" Type="String" />
                   <asp:Parameter Name="original_tel" Type="Int32" />
                   <asp:Parameter Name="original_email" Type="String" />
                   <asp:Parameter Name="original_DateOfBirth" Type="String" />
               </UpdateParameters>
           </asp:SqlDataSource>
               </center>
           <asp:Button ID="Button1" runat="server" class="butn3" Text="Go Back" OnClick="Button2_Click" CausesValidation="False" ValidateRequestMode="Disabled"/>
    </div>
      
    </form>
</body>
</html>
