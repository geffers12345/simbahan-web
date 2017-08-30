<%@ Page Title="Main Inspirations Page" Language="C#" AutoEventWireup="true" CodeBehind="Inspirations.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SimbahanApp.Inspirations" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

       <!---------------------------
        Author: Claud Montaril
        Description: Bible Verse Inspiration Page
        Date Created: 03/8/2017
        Date Modified:
        Modified by:   
        --------------------------->

    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Content/set1.css" rel="stylesheet" />
    <link href="Content/set2.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/demo.css" rel="stylesheet" />

     <div class="bible" style="background-color: #eee;">
        <div class="categories">
         <div class="content">
         <div class="row">
            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
               <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Bible.jpg" />
						<figcaption>
							<h2 class="emotion"><span>BIBLE VERSES</span></h2>
                            <p>Seek God's message for You through His words!</p>
							<a href="BibleVerses.aspx">View more</a>
						</figcaption>			
					</figure>					
				</div>
            </div>
             <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Bible.jpg" />
						<figcaption>
							<h2 class="emotion"><span>RELIGIOUS QUOTES</span></h2>
                            <p>Seek God's message for You through famous people!</p>
							<a href="ReligiousQuotes.aspx">View more</a>
						</figcaption>			
					</figure>					
				</div> 
            </div>
             <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                  <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Bible.jpg" />
						<figcaption>
							<h2 class="emotion"><span>MUSICAL INSPIRATIONS</span></h2>
                            <p>Listen to God's message for You</p>
							<a href="MusicalInspirations.aspx">View more</a>
						</figcaption>			
					</figure>					
				</div>
            </div>
        </div>                  
  </div>   
  </div>
</div>
</asp:Content>