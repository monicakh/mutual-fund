<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetPrescriptionGridView.aspx.cs" Inherits="FinalProject.GetPrescription1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title></title>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css"/>
    <style type="text/css">
        .auto-style3 {
            width: 1291px;
            height: 278px;
        }
        .hiddencol { display: none; }
        
    </style>
</head>
<body>
    <form id="form1" runat="server" class="auto-style3">
        <div>

            <div class="topnav">
                <a href="Login.aspx">الخروج</a>
                <a href="AccountInfo.aspx"><asp:Label ID="Label40" runat="server" Text="Label"></asp:Label></a>
                 <a href="Home.aspx">الصفحة الرئيسة</a>
                <a href="index.aspx" class="active" style="position:absolute;right:8px;">الصندوق التعاضدي</a>
            </div>

        
           </div>
        <center  style="position:absolute;margin-top:100px;margin-left:300px;">
        <div>
        <asp:GridView ID="GridView1" runat="server" Width="800px" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="idPresc">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="idPresc" HeaderText="idPresc" InsertVisible="False" ReadOnly="True"  HeaderStyle-CssClass="hiddencol" ItemStyle-CssClass="hiddencol" SortExpression="idPresc" >
<HeaderStyle CssClass="hiddencol"></HeaderStyle>

<ItemStyle CssClass="hiddencol"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="prNB" HeaderText="prNB" ItemStyle-HorizontalAlign="Center" SortExpression="prNB" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="PrFilledDate" ItemStyle-HorizontalAlign="Center" HeaderText="PrFilledDate" SortExpression="PrFilledDate" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="PrIssuedDate" ItemStyle-HorizontalAlign="Center" HeaderText="PrIssuedDate" SortExpression="PrIssuedDate" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:CheckBoxField DataField="fundApproval" ItemStyle-HorizontalAlign="Center" HeaderText="fundApproval" SortExpression="fundApproval" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:CheckBoxField>
                <asp:CheckBoxField DataField="SecApproval" HeaderText="SecApproval" SortExpression="SecApproval" Visible="False" />
                <asp:BoundField DataField="receiptNB" ItemStyle-HorizontalAlign="Center" HeaderText="receiptNB" SortExpression="receiptNB" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:CheckBoxField DataField="LabNotification" HeaderText="LabNotification" SortExpression="LabNotification" Visible="False" />
                <asp:CheckBoxField DataField="ComSecNotification" HeaderText="ComSecNotification" SortExpression="ComSecNotification" Visible="False" />
                <asp:CheckBoxField DataField="ComNotification" HeaderText="ComNotification" SortExpression="ComNotification" Visible="False" />
                <asp:BoundField DataField="idUser" HeaderText="idUser" SortExpression="idUser" Visible="False" />
                <asp:BoundField DataField="idDoc" HeaderText="idDoc" SortExpression="idDoc" Visible="False" />
                <asp:BoundField DataField="ssn" HeaderText="ssn" SortExpression="ssn" Visible="False" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbCon %>" ProviderName="<%$ ConnectionStrings:DbCon.ProviderName %>" SelectCommand="SELECT * FROM [Prescription] WHERE ([ssn] = @ssn)">
            <SelectParameters>
                <asp:SessionParameter Name="ssn" SessionField="ssn" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
           </div>
            </center>
    </form>
</body>
</html>
