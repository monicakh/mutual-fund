<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="FinalProject.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" type="text/css" href="StyleSheet1.css"/>
<style>
body {
  font-family: 'Lato', sans-serif;
}

.overlay {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 84px;
  left: 9px;
  background-color: rgb(0,0,0);
  background-color:#333;
  overflow-x: hidden;
  transition: 0.5s;
  
}

.overlay-content {
  position: relative;
  top: 10%;
  width: 100%;
  text-align: center;
  margin-top: 40px;
}

.overlay a {
  padding: 8px;
  text-decoration: none;
  font-size: 36px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.overlay a:hover, .overlay a:focus {
  color: #000;
}

.overlay .closebtn {
  position: absolute;
  top: 10px;
  left:10px;
  font-size: 60px;
}

@media screen and (max-height: 450px) {
  .overlay a {font-size: 20px}
  .overlay .closebtn {
  font-size: 40px;
  top: 5px;
  right: 35px;
 
  }
}
</style>
</head>
<body>
    <div>
     <div class="topnav">
                <a href="Login.aspx">الخروج</a>
                <a href="AccountInfo.aspx"><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></a>
                <a href="Admin.aspx">الصفحة الرئيسة</a>
                <a href="index.aspx" style="position:absolute;right:8px;" class="active">الصندوق التعاضدي</a>
                    <a> <span style="font-size:20px;cursor:pointer;" onclick="openNav()">&#9776; </span></a>
        </div>
        
     
     <div id="myNav" class="overlay" >
                    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                       <div class="overlay-content">
                            <a href="AdminDoctor.aspx">Doctors</a>
                            <a href="AdminLab.aspx">Labs</a>
                            <a href="AdminProfs.aspx">Profs</a>
                            <a href="AdminRadiology.aspx">Radiology</a>
                            <a href="AdminTest.aspx">Tests</a>
                           <a href="AdminUser.aspx">Users</a>
  
                        </div>
                </div> 
     <asp:Image ID="Image1" runat="server" Height="400px" ImageUrl="~/img/logo.png" Width="100%" />

    
     </div>  
<script>
function openNav() {
  document.getElementById("myNav").style.width = "19%";
}

function closeNav() {
  document.getElementById("myNav").style.width = "0%";
}
</script>
     
</body>
</html>
