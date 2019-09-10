<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminTest.aspx.cs" Inherits="FinalProject.AdminTest" %>

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
            <td class="td">Test Name:</td>
            <td>
                <asp:TextBox ID="txtName" runat="server" ></asp:TextBox></td>
             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                ControlToValidate="txtName" ErrorMessage="Please fill out this field"></asp:RequiredFieldValidator>
                </td>
            <td>
                <asp:Label ID="lblidTest" runat="server" Visible="false"></asp:Label>&nbsp;</td>
        </tr>
        <tr>
            <td class="td">Test Reduction:</td>
            <td>
                <asp:TextBox ID="txtTest" runat="server" ></asp:TextBox></td>
             <td><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                ControlToValidate="txtTest" ErrorMessage="Please fill out this field"></asp:RequiredFieldValidator>
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
           <asp:GridView ID="GridViewTest" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="idTest" OnRowDeleting="GridViewTest_RowDeleting" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridViewTest_SelectedIndexChanged">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
                   <asp:TemplateField HeaderText="Delete">
                       <ItemTemplate>
                           <asp:LinkButton ID="LinkButton2" OnClientClick="return confirm('Are you sure to Delete');" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="Update">
                       <ItemTemplate>
                           <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Are you sure to Update');" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                       </ItemTemplate>
                   </asp:TemplateField>
                   <asp:BoundField DataField="idTest" HeaderText="idTest" InsertVisible="False" ReadOnly="True" SortExpression="idTest" />
                   <asp:BoundField DataField="nameTest" HeaderText="nameTest" SortExpression="nameTest" />
                   <asp:BoundField DataField="TestReduction" HeaderText="TestReduction" SortExpression="TestReduction" />
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
           <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DbCon %>" DeleteCommand="DELETE FROM [Tests] WHERE [idTest] = @original_idTest AND [nameTest] = @original_nameTest AND [TestReduction] = @original_TestReduction" InsertCommand="INSERT INTO [Tests] ([nameTest], [TestReduction]) VALUES (@nameTest, @TestReduction)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:DbCon.ProviderName %>" SelectCommand="SELECT * FROM [Tests]" UpdateCommand="UPDATE [Tests] SET [nameTest] = @nameTest, [TestReduction] = @TestReduction WHERE [idTest] = @original_idTest AND [nameTest] = @original_nameTest AND [TestReduction] = @original_TestReduction">
               <DeleteParameters>
                   <asp:Parameter Name="original_idTest" Type="Int32" />
                   <asp:Parameter Name="original_nameTest" Type="String" />
                   <asp:Parameter Name="original_TestReduction" Type="Int32" />
               </DeleteParameters>
               <InsertParameters>
                   <asp:Parameter Name="nameTest" Type="String" />
                   <asp:Parameter Name="TestReduction" Type="Int32" />
               </InsertParameters>
               <UpdateParameters>
                   <asp:Parameter Name="nameTest" Type="String" />
                   <asp:Parameter Name="TestReduction" Type="Int32" />
                   <asp:Parameter Name="original_idTest" Type="Int32" />
                   <asp:Parameter Name="original_nameTest" Type="String" />
                   <asp:Parameter Name="original_TestReduction" Type="Int32" />
               </UpdateParameters>
           </asp:SqlDataSource>
               </center>
           <asp:Button ID="Button1" runat="server" class="butn3" Text="Go Back" OnClick="Button2_Click" CausesValidation="False" ValidateRequestMode="Disabled" />
        </div>
      
    </form>
</body>
</html>
