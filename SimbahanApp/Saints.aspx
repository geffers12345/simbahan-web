<%@ Page Title="Saints List Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Saints.aspx.cs" Inherits="SimbahanApp.Saints" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <%--<link href="Content/carousel.css" rel="stylesheet" />--%>
    <link href="Content/slider.css" rel="stylesheet" />
    <link href="Content/demo2.css" rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
.mySlides {display:none;}
</style>



<div class="w3-content w3-section" style="max-width:1920px">
  <img class="mySlides" src="Images/Saints/mother_teresa.jpg" alt="sad" style="width:100%" > 

  
  <img class="mySlides" src="Images/Saints/padre_pio.jpg" style="width:100%">
  <img class="mySlides" src="Images/Saints/st_francis_xavier.jpg" style="width:100%">
  
   
</div>
     <header class="codrops-header">
						<nav class="codrops-demos">
							<a href="Saintslisting.aspx">Know More About Saints<span aria-hidden="true" class="eltd-icon-font-elegant arrow_carrot-right "></span></a>
						</nav>
					</header>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 5000); // Change image every 2 seconds
}
</script>

</asp:Content>