<%@ Page Title="Church Announcements" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChurchAnnouncements.aspx.cs" Inherits="SimbahanApp.ChurchAnnouncements" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <link href='<%= ResolveUrl("Content/Site.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/contact.css") %>' rel="stylesheet" />

    <div class="box-body-main" style="background-image: url(Images/Background.jpg); background-repeat: round">
        <div class="row">
            <h2 class="contact-header">CHURCH ANNOUNCEMENTS</h2>
           </div>
        <br />
        <br />
        <div class="row">
            <div class="col-md-7">
                <div class="cognito">
                <script src="https://services.cognitoforms.com/s/bU1OLTQBz06YtwBj7PSYAg"></script>
                <script>Cognito.load("forms", { id: "1" });</script>
                </div>
            </div>
            <div class="col-md-1"></div>
            <div class="col-md-3">
                <br />
                <br />
                <br />
                 <center>
                     <div class="box">
                            <div class="icon">
                                <div class="image"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                                <div class="info">
                                    <br />
                                    <h3 class="title">EMAIL US</h3>
                                    <p>
                                        For more info, comments, feedback or suggestions, 
                                        </p>
                                    <p>
                                        Don't hesitate to contact us at
                                        </p>
                                    <p>
                                        <i class="fa fa-envelope" aria-hidden="true"></i>&nbsp churchinfo@mycatholicportal.org
                                    </p>

                                </div>
                            </div>
                            <div class="space"></div>
                         </div>
                 </center>
                        
        </div>
            </div>
    </div>
    </asp:Content>