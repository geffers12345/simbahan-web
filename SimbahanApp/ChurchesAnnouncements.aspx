<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ChurchesAnnouncements.aspx.cs"  Inherits="SimbahanApp.ChurchesAnnouncements" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet"/>
    <link rel="stylesheet" href='<%= ResolveUrl("Content/cssslider_files/csss_engine1/style.css") %>'>
    <link rel="stylesheet" type="text/css" href='<%= ResolveUrl("Content/engine1/style.css") %>'/>
    <script type="text/javascript" src='<%= ResolveUrl("Content/engine1/jquery.js") %>'></script>
    <link rel="stylesheet" href='<%= ResolveUrl("Content/contact.css") %>'  />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<!---------------------------
Author: Claud Montaril
Description: Churches Page
Date Created: 02/22/2017
Date Modified:
Modified by:
--------------------------->

<div id="create-announcement-modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">CHURCH ANNOUNCEMENT / EVENT</h4>
            </div>
            <div class="modal-body">
                <h3 class="text-danger">DETAILS: </h3>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementTitle">Announcement Title</label>
                    </div>
                    <div class="col-md-9">
                        <input type="text" class="form-control" id="announcementTitle" runat="server"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementVenue">Venue</label>
                    </div>
                    <div class="col-md-9">
                        <input type="text" class="form-control" id="announcementVenue" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementStartDate">Start Date: </label>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="date" id="announcementStartDate" runat="server" />
                    </div>
                    <div class="col-md-3">
                        <label for="announcementStartTime">Start Time: </label>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="time" id="announcementStartTime" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementEndDate">End Date: </label>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="date" id="announcementEndDate" runat="server" />
                    </div>
                    <div class="col-md-3">
                        <label for="announcementEndTime">End Time: </label>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="time" id="announcementEndTime" runat="server" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <asp:FileUpload runat="server" ID="AnnouncementImage" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementContent">Description</label>
                    </div>
                    <div class="col-md-9">
                        <textarea class="form-control" id="announcementContent" runat="server"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div id="view-announcement-modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <input type="hidden" id="viewAnnouncementId" />
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">CHURCH ANNOUNCEMENT / EVENT</h4>
            </div>
            <div class="modal-body">
                <img class="img-responsive" id="viewAnnouncementImage" />
                <h2 id="viewAnnouncementTitle"></h2>
                <p class="lead" id="viewAnnouncementVenue"></p>
                <p class="text-warning">
                    From 
                    <span id="viewAnnouncementStartDate"></span> 
                    <span id="announcementStartTime"></span>
                </p>
                <p class="text-warning">
                    To 
                    <span id="viewAnnouncementEndDate"></span> 
                    <span id="viewAnnouncementEndTime"></span>
                </p>
                <hr />
                <p id="viewAnnouncementContent"></p>
            </div>
            <div class="modal-footer">
                <div style="display:-webkit-inline-box;">
                    <div class="col-lg-3">
           width="45" height="45"/>--%>
                    </div>
                    <div class="col-lg-3">
                        <button id="btnShareSocialTwit" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000" data-dpmaxz-eid="2" style="color: rgb(255, 255, 255); border-color: rgb(26, 181, 193);">
                            <i class="fa fa-twitter-square" aria-hidden="true"></i>
                            <span aria-hidden="true"></span>

                        </button>
                           
                    </div>
                    <div class="col-lg-3">
                        <button id="btnShareSocialFB" data-show-count="false" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000" data-dpmaxz-eid="3">
                         <i class="fa fa-facebook-square" aria-hidden="true"></i>
                         <span aria-hidden="true"></span>
                    </button>
                    </div></div>
           
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div class="box-body-churches">
<input type="hidden" runat="server" id="latitude"/>
<input type="hidden" runat="server" id="longitude"/>
<input type="hidden" runat="server" id="simbahanID"/>
<div class="row">
    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
        <span class="church-header" runat="server" id="churchName"></span>
        



        <p class="church-address" runat="server" id="churchAddress">
            Address
        </p>
        <br/>
        <br/>
        <p class="church-label">
            Mass Schedule:
        </p>
        <br/>
        <span class="church-sublabel" id="massSchedules">
            <strong runat="server" id="churchMassDates"></strong>
        </span>
        <br/>
        <br/>
        <span class="church-label" id="massLanguage">
            Mass Languages: <strong runat="server" id="churchMassLanguages"></strong>
        </span>
        <br/>
        <br/>
        <span class="church-label" id="lastUpdate">
            Last Update: <strong runat="server" id="churchLastUpdate">Date</strong>
        </span>
        <br/>
        <br/>
        <div class="row">
            
            <div class="col-md-5">
                <div class="eltd-listing-search-submit-holder mgatf">
                    <button id="AddFav" runat="server" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">ADD TO FAVORITES</span><span aria-hidden="true"></span>
                    </button>
                    <button id="RemoveFav" runat="server" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">REMOVE FROM FAVORITES</span><span aria-hidden="true"></span>
                    </button>
                </div>
            </div>

          

    </div>


</div>








</asp:Content>