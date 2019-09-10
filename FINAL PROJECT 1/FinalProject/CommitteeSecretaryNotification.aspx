<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommitteeSecretaryNotification.aspx.cs" Inherits="FinalProject.CommitteeSecretaryNotification" %>

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
                <a href="CommitteeSecretaryHomePage.aspx">الصفحة الرئيسة</a>
                <a href="index.aspx" class="active" style="position:absolute;right:8px;">الصندوق التعاضدي</a>
                <a href="CommitteeSecretaryNotification.aspx"><asp:ImageButton ID="ImageButton1" runat="server" Width="25px"  /></a>
                <a><asp:Label ID="counter" runat="server" Text="0"></asp:Label></a>
             </div>
        </div>
        
        <center style="position:absolute;margin-top:100px;margin-left:500px;">
        <asp:GridView ID="GridView1" runat="server" Width="400px" AutoGenerateColumns="False" DataKeyNames="idPresc" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="idPresc" HeaderText="idPresc" ItemStyle-HorizontalAlign="Center" InsertVisible="False" ReadOnly="True" SortExpression="idPresc" />
                <asp:BoundField DataField="prNB" HeaderText="prNB" SortExpression="prNB" />
                <asp:BoundField DataField="PrFilledDate" HeaderText="PrFilledDate" SortExpression="PrFilledDate" />
                <asp:BoundField DataField="PrIssuedDate" HeaderText="PrIssuedDate" SortExpression="PrIssuedDate" />
                <asp:CheckBoxField DataField="fundApproval" HeaderText="fundApproval" SortExpression="fundApproval" Visible="False" />
                <asp:CheckBoxField DataField="SecApproval" HeaderText="SecApproval" SortExpression="SecApproval" Visible="False" />
                <asp:BoundField DataField="receiptNB" HeaderText="receiptNB" SortExpression="receiptNB" Visible="False" />
                <asp:CheckBoxField DataField="LabNotification" HeaderText="LabNotification" SortExpression="LabNotification" Visible="False" />
                <asp:CheckBoxField DataField="ComSecNotification" HeaderText="ComSecNotification" SortExpression="ComSecNotification" Visible="False" />
                <asp:CheckBoxField DataField="ComNotification" HeaderText="ComNotification" SortExpression="ComNotification" Visible="False" />
                <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" Visible="False" />
                <asp:BoundField DataField="idDoc" HeaderText="idDoc" SortExpression="idDoc" Visible="False" />
                <asp:BoundField DataField="ssn" HeaderText="ssn" SortExpression="ssn" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbCon %>" ProviderName="<%$ ConnectionStrings:DbCon.ProviderName %>" SelectCommand="SELECT * FROM [Prescription] WHERE (([ComNotification] = @ComNotification) AND ([ComSecNotification] = @ComSecNotification) AND ([LabNotification] = @LabNotification))">
            <SelectParameters>
                <asp:Parameter DefaultValue="False" Name="ComNotification" Type="Boolean" />
                <asp:Parameter DefaultValue="false" Name="ComSecNotification" Type="Boolean" />
                <asp:Parameter DefaultValue="false" Name="LabNotification" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
            </center>
        <asp:Timer ID="Timer1" runat="server" Interval="6000" OnTick="Timer1_Tick"></asp:Timer>
    </form>
</body>
</html>
