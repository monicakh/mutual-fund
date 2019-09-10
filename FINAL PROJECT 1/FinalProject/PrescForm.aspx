<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeBehind="PrescForm.aspx.cs" Inherits="FinalProject.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" type="text/css" href="StyleSheet1.css"/>
    <style type="text/css">
        .auto-style1 {
            width: 3038px;
            height: 93px;
        }
        .auto-style2 {
            width: 1073px;
            height: 93px;
        }
        .auto-style7 {
            width: 836px;
            height: -12px;
        }
        .auto-style8 {
            width: 99px;
        }
        .auto-style10 {
            width: 96px;
        }
        .auto-style11 {
            width: 237px;
        }
        .auto-style12 {
            width: 1124px;
            height: 235px;
        }
        .auto-style13 {
            position: absolute;
            right: 22px;
            top: 717px;
        }
        .auto-style14 {
            position: absolute;
            right: 20px;
            top: 780px;
            height: 27px;
        }
         .auto-style60 {
            position: absolute;
            right: 20px;
            top: 810px;
            height: 27px;
        }
        </style>
     <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript">
  $( function() {
    $( "#datepicker" ).datepicker();
  } );
  </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="topnav">
                <a href="Login.aspx">الخروج</a>
                <a href="AccountInfo.aspx"><asp:Label ID="Label40" runat="server" Text="Label"></asp:Label></a>
                 <a href="Home.aspx">الصفحة الرئيسة</a>
                <a href="index.aspx" class="active" style="position:absolute;right:8px;">الصندوق التعاضدي</a>
            </div>
            <table border="1">
               <tr>
                   <td class="auto-style1">
                       <asp:Label ID="Label1" runat="server" Text="&nbsp;&nbsp;&nbsp;Prescription  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;وصفة طبية" Width="513px" Style="text-align:center; font-weight:bold ;font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-size:x-large" Height="57px"></asp:Label></td>
                   <td class="auto-style2"><asp:Image ID="Image1" runat="server" ImageUrl="~/img/logo.png"  Width="800px" Height="118px" /></td>
               </tr> 
                </table>
            <table>
                <tr>
                    <td><asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="272px" placeholder="Prescription NB" ReadOnly="True"></asp:TextBox></td>
                    <td style="position:absolute;margin-left:18%;"><asp:TextBox ID="TextBox44" runat="server" Height="21px" Width="272px" placeholder="Receipt NB" ReadOnly="true"></asp:TextBox></td>
                    <td align="right" width="100%"><asp:TextBox ID="TextBox2" runat="server" Height="21px" Width="272px"  ReadOnly="True" placeholder="Source Name"  ></asp:TextBox></td>
                </tr>
            </table>
            <br />
      
            <table  >
                <tr>
                    <td >
                    <fieldset >
                        <legend align="right">Field Dedicated to the Treating Physician &nbsp;  حقل مخصص للطبيب المعالج  </legend>
                    <table class="auto-style12">
                        <tr>
                            <td><asp:Label ID="Label23" runat="server" Text="Label" Style="font-size:x-large; font:100;">Patient Personal Information</asp:Label></td>
                            <td><asp:Label ID="Label24" runat="server" Text="Label" Style="font-size:x-large;position:absolute; right:20px"> معلومات عن المريض</asp:Label></td>
                 
                        </tr>
                        <tr><!--  -->
                        <td><asp:Label ID="Label2" runat="server" Text="Label" Style="font-size:x-large;">Ssn:</asp:Label></td>
                        <td style="position:absolute; right:400px;"><asp:TextBox ID="TextBox3" runat="server" width="500px" OnTextChanged="TextBox3_TextChanged" OnClick="Fill" AutoPostBack="true" Font-Size="Larger" ></asp:TextBox>
                         <span style="color:red"><asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server"  ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator></span></td>
                        <td class="auto-style11" ><asp:Label ID="Label3" runat="server" Text="Label" Style="font-size:x-large; position:absolute; right:20px" >:رقم الضمان</asp:Label></td>
                      </tr>

                      <tr><!--  -->
                        <td><asp:Label ID="Label4" runat="server" Text="Label" Style="font-size:x-large;">Full Name:</asp:Label></td>
                        <td style="position:absolute; right:400px;"><asp:TextBox ID="TextBox4" runat="server" width="500px" AutoCompleteType="Enabled" ReadOnly="True" Font-Size="Larger" ></asp:TextBox>
                        <span style="color:red"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator></span></td>
                        <td class="auto-style11" ><asp:Label ID="Label5" runat="server" Text="Label" Style="font-size:x-large;position:absolute; right:20px;">:اسم المريض وشهرته </asp:Label></td>
                      </tr>

                      <tr><!--  -->
                        <td><asp:Label ID="Label6" runat="server" Text="Label" Style="font-size:x-large;">Date of Birth:</asp:Label></td>
                        <td style="position:absolute; right:400px;"><asp:TextBox ID="TextBox5" runat="server" width="500px" AutoCompleteType="Enabled" ReadOnly="True" Font-Size="Larger" ></asp:TextBox>
                         <span style="color:red"> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ControlToValidate="TextBox3" ErrorMessage="*"></asp:RequiredFieldValidator></span></td>
                         <td class="auto-style11" ><asp:Label ID="Label7" runat="server" Text="Label" Style="font-size:x-large;position:absolute; right:20px;">:تاريخ ولادته </asp:Label></td>
                      </tr>
                     
                       
                    </table>
                        <br />
                        <br />
                         <hr />
                        <asp:Label ID="Label12" runat="server" Text="Label" Style="font-size:x-large; font:100;">Date</asp:Label>
                        <asp:Label ID="Label13" runat="server" Text="Label" Style="font-size:x-large;position:absolute; right:20px;font:100;">التاريخ</asp:Label>
                        
                        <table>
                              <tr><!-- Filled Date -->
                                <td><asp:Label ID="Label14" runat="server" Text="Label" Style="font-size:x-large;">Filled Date:</asp:Label></td>
                                  <td style="position:absolute; right:400px;"><asp:TextBox ID="TextBox7" runat="server" width="500px" ReadOnly="True" Font-Size="Larger" ></asp:TextBox>
                                  <span><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"  ControlToValidate="datepicker"  ErrorMessage=""></asp:RequiredFieldValidator></span></td>
                                  <td ><asp:Label ID="Label15" runat="server" Text=":تاريخ الحالي  " Style="font-size:x-large;position:absolute; right:20px;"></asp:Label></td>
                            </tr>

                            <tr><!-- Issued Date -->
                                <td><asp:Label ID="Label8" runat="server" Text="Label" Style="font-size:x-large;">Issued Date:</asp:Label></td>
                                <td style="position:absolute; right:388px;"><asp:TextBox ID="datepicker" runat="server"  width="500px" Font-Size="Larger"></asp:TextBox>
                                  <span style="color:red"><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"  ControlToValidate="datepicker" ErrorMessage="*"></asp:RequiredFieldValidator></span></td>
                                <td ><asp:Label ID="Label9" runat="server" Text=":تاريخ الوصفة " Style="font-size:x-large;position:absolute; right:20px;"></asp:Label></td>
                               
                             </tr>
                           </table>
                            <br />
                           <br />
                          <hr />
                        
                        <asp:Label ID="Label21" runat="server" Text="Label" Style="font-size:x-large; font:100;">Doctor Information</asp:Label>
                        <asp:Label ID="Label22" runat="server" Text="Label" Style="font-size:x-large;margin-bottom:50px" CssClass="auto-style13">معلومات عن دكتور</asp:Label>
                       
                        <table>
                            

                      <tr>
                        <td><asp:Label ID="Label27" runat="server" Text="Label" Style="font-size:x-large;">Full Name:</asp:Label></td>
                        <td style="position:absolute; right:400px;"><asp:TextBox ID="TextBox8" runat="server" width="500px" Font-Size="Larger" OnTextChanged="TextBox8_TextChanged" OnClick="Fill2" AutoPostBack="true"></asp:TextBox>

                         <span style="color:red"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"  ControlToValidate="TextBox8" ErrorMessage="*"></asp:RequiredFieldValidator></span></td>
                        <td class="auto-style11" ><asp:Label ID="Label28" runat="server" Text="Label" Style="font-size:x-large;position:absolute; right:20px;">:اسم الطبيب وشهرته </asp:Label></td>
                      </tr>

                      <tr>
                        <td><asp:Label ID="Label29" runat="server" Text="Label" Style="font-size:x-large;">Doctor's Specialty</asp:Label></td>
                        <td style="position:absolute; right:400px;"><asp:TextBox ID="TextBox9" runat="server" width="500px" Font-Size="Larger" CausesValidation="True" OnTextChanged="TextBox9_TextChanged" ></asp:TextBox>
                          <span style="color:red">  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"  ControlToValidate="TextBox9" ErrorMessage="*"></asp:RequiredFieldValidator></span></td>
                        <td class="auto-style11" ><asp:Label ID="Label30" runat="server" Text="Label" Style="font-size:x-large;" CssClass="auto-style14">:اختصاص الطبيب </asp:Label></td>
                      </tr>
                      <tr>
                        <td><asp:Label ID="Label31" runat="server" Text="Label" Style="font-size:x-large;">Phone Number</asp:Label></td>
                        <td style="position:absolute; right:400px;"><asp:TextBox ID="TextBox10" runat="server" width="500px" Font-Size="Larger" OnTextChanged="TextBox10_TextChanged" ></asp:TextBox>
                           <span style="color:red"> <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"  ControlToValidate="TextBox10" ErrorMessage="*"></asp:RequiredFieldValidator></span></td
                        <td class="auto-style11" ><asp:Label ID="Label32" runat="server" Text="Label" Style="font-size:x-large;" CssClass="auto-style60">:رقم الخليوي </asp:Label></td>
                      </tr>                      
                         </table>
                         <br />
                        <br />
                         <hr />
                        <asp:Label ID="Label10" runat="server" Text="Label" Style="font-size:x-large; font:100; text-align:center; margin-left:500px"><b>الادوية والعلاجات والفحوص الموصوفة*</b></asp:Label></br>
                        <asp:Label ID="Label11" runat="server" Text="Label" Style="align-content:center;font:100;font-size:large;margin-left:480px"><b>*Medications,Treatments and Test Prescribed</b></asp:Label>
                        <table>
                            
                              <tr>
                                <td><asp:Button ID="Button1" runat="server" Text="Tests * الفحوصات * " Font-Bold="True" Width="250px" Style="font-size:x-large;margin-left:200px;margin-top:20px" Height="40px" OnClick="Button1_Click"  /></td>
                                <td><asp:Button ID="Button2" runat="server" Text="Radiology * صور الاشعة *" Font-Bold="True" Width="350px" Style="font-size:x-large;margin-left:400px;margin-top:20px" Height="40px" OnClick="Button2_Click"  /></td>
                              </tr>

                                                         
                         </table>
                         <br />
                        <br />
                         <hr class="auto-style7"/>
                     
                            <table >
                                <tr>
                                 <td> <asp:Label ID="Label18" runat="server" Text="Label" Style="font-size:x-large;font:100;">Radiology & Tests Required</asp:Label></td>
                                 <td><asp:Label ID="Label19" runat="server" Text="Label" Style="font-size:x-large;position:absolute; right:20px;font:100;">صور الاشعة والفحوصات المطلوبة </asp:Label></td>
                                </tr>
                                </table>
                        <center><table >
                                <tr>
                                 <td>
                                     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="idPrescTest" Width="400px" >
                                         <AlternatingRowStyle BackColor="White" />
                                         <Columns>
                                             <asp:TemplateField ShowHeader="False">
                                                 <ItemTemplate>
                                                     <asp:LinkButton OnClientClick="return confirm('Are you sure to Delete');" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:BoundField DataField="Test" HeaderText="Test" ItemStyle-HorizontalAlign="Center" SortExpression="Test" />
                                            <asp:BoundField DataField="idPrescTest" HeaderText="idPrescTest" InsertVisible="False" ReadOnly="True" SortExpression="idPrescTest" Visible="False" />
                                            
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
                                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DbCon %>" ProviderName="<%$ ConnectionStrings:DbCon.ProviderName %>" SelectCommand="select Test ,idPrescTest from PrescTest pt,Prescription p where pt.idPresc=p.idPresc and prNB=@prnb" DeleteCommand="delete from PrescTest where idPrescTest=@idPrescTest ">
                                         <SelectParameters>
                                             <asp:SessionParameter DefaultValue="" Name="prnb" SessionField="prnb" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>
                                     <br />
                                     <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="idPrescRadio" Width="400px">
                                         <AlternatingRowStyle BackColor="White" />
                                         <Columns>
                                             <asp:TemplateField ShowHeader="False">
                                                 <ItemTemplate>
                                                     <asp:LinkButton OnClientClick="return confirm('Are you sure to Delete');" ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                             <asp:BoundField DataField="Radio" ItemStyle-HorizontalAlign="Center" HeaderText="Radio" SortExpression="Radio" />
                                             <asp:BoundField DataField="idPrescRadio" HeaderText="idPrescRadio" InsertVisible="False" ReadOnly="True" SortExpression="idPrescRadio" Visible="False"/>
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
                                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DbCon %>" ProviderName="<%$ ConnectionStrings:DbCon.ProviderName %>" SelectCommand="select Radio,idPrescRadio from PrescRadio pr,Prescription p where pr.idPresc=p.idPresc and prNB=@prnb"   DeleteCommand="delete from PrescRadio where idPrescRadio=@idPrescRadio ">
                                         <SelectParameters>
                                             <asp:SessionParameter Name="prnb" SessionField="prnb" />
                                         </SelectParameters>
                                     </asp:SqlDataSource>
                                    
                                    </td>
                                </tr>
                            </table>
                      </center>
                        <br />
                        <br />
                         <hr />
                        <table>
                              <tr>
                                  <td class="auto-style8"><asp:Label ID="Label16" runat="server" Text="Doctor's&lt;br /&gt; Stamp and Signature" Font-Italic="True" Font-Size="Small" style="margin-left:1px;" ></asp:Label></td>
                                  <td>
                                      <asp:Button ID="Button3" runat="server" Text="Send" style="margin-left:100px;font-size:larger;" CausesValidation="False" OnClick="Button3_Click"/>
                                      <asp:CheckBox ID="CheckBox1" Enabled="False" runat="server" style="margin-left:650px; font-size:large;" Font-Bold="True" Text="موافقة" TextAlign="Left" Width="200px" Checked="True" />
                                      <asp:CheckBox ID="CheckBox2" checked="true" Text="ختم الصندوق" runat="server" Enabled="False" TextAlign="Left" Width="200px" />
                                      <asp:CheckBox ID="CheckBox3" checked="true" Text="حسب لائحة الضمان" runat="server" Enabled="False" TextAlign="Left" Width="200px"/>
                                  </td>
                                  <td class="auto-style10"><asp:Label ID="Label17" runat="server" Text="خاتم ورقم اتفاقية الطبيب مع الجهة الضامنة وتوقيعه" style="margin-left:160px; text-align:center" Width="102px" ></asp:Label></td>
                                  <td><asp:Image ID="Image2" runat="server" Width="94px" ImageUrl="~/img/PhotoGrid_1557232597679.jpg"  /></td>
                              </tr>                         
                         </table>
                    </fieldset>
                        </td>
                    </tr>
            </table>
             <table border="1">
                <tr>
                    <td width="3000"><asp:Label ID="Label20" runat="server" Text="Label" Style="margin-left:450px">  في المربع ،عملا بالمادة 47 من قانون مزاولة مهنة الصيادلة وبعد موافقة المريض (Non Susbstituable)-NS يسمح للصيدلي باستبدال الدواء ما عدا المؤشر عليه بحرفي <br />Allows the pharmacist to substitute the medicine except mark with the letters NS (Not Substitutable) in the cardre, in accordance with article 47 of practice of the profession of pharmacy in Lebanon after the patient agreement  </asp:Label></td>
                </tr>
            </table>
            <!-- idDoc invisible -->
            <asp:TextBox ID="idDoc" runat="server" Visible="False" ></asp:TextBox>
        </div>
    </form>
</body>
</html>
