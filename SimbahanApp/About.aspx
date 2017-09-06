<%@ Page Title="About My CatholicPortal.Org" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SimbahanApp.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <link href='<%= ResolveUrl("Content/Site.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet"/>

    <div class="box-body" style="background-image: url(Images/Background.jpg)">
      
          <h3 class="moods">ABOUT MYCATHOLICPORTAL.ORG</h3>
            <br />
              <center><img src="Images/Banner.jpg" /></center>

        <div class="row">
            <br />      
            <h4 class="church-paragraph">Simbahan App is the first locally –developed mobile app designed for Catholic Churches in the Philippines. It aims to use technology to UNIFY the Catholics bring them closer to God through Masses, Confessions and even church activities. It also aims to help the Catholic Church slowly use and adapt to technology to reach more in the community.</h4>
            <br />
            <br />
            </div>
        <div class="row">
            <h3 class="moods">ABOUT US</h3>
            <br />
            <center><img src="Images/Scriptsmart.PNG" /></center>
        </div>
        <br />
        <br />
        <div class="row">
            <h3>Our Company</h3>
            <h4 class="church-paragraph">ScriptSmart Technologies, Inc. (ScriptSmart) is a technology Company that offers end-to-end software and IT solutions, from conceptualization and design, to development, implementation and support. We partner with our clients to create innovative solutions that would bring value and improvement, helping businesses and professionals achieve success in their industry. ScriptSmart specializes in designing and developing custom software and web application systems to clients and also provides off-the-shelf campaign management and accounting tools.</h4>
            <br />
            <h3>Our Vision</h3>
            <h4 class="church-paragraph">To be among the preferred and trusted IT Solutions provider in the country</h4>
            <br />
            <h3>Our Mission</h3>
            <h4 class="church-paragraph">To deliver maximum business value to our clients by providing high-quality, cost-effective and secure end-to-end Software and IT solutions aligned with their most essential business needs</h4>
        </div>
    </div>

</asp:Content> 
