<%@ Page Title="Catholic Church Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Churches.aspx.cs" Inherits="SimbahanApp.Churches" %>
<%@ Import Namespace="SimbahanApp.Models" %>
<%@ MasterType virtualpath="~/Site.Master" %>

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
                        <input type="text" class="form-control" id="announcementTitle"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementVenue">Venue</label>
                    </div>
                    <div class="col-md-9">
                        <input type="text" class="form-control" id="announcementVenue"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementStartDate">Start Date: </label>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="date" id="announcementStartDate"/>
                    </div>
                    <div class="col-md-3">
                        <label for="announcementStartTime">Start Time: </label>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="time" id="announcementStartTime"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementEndDate">End Date: </label>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="date" id="announcementEndDate"/>
                    </div>
                    <div class="col-md-3">
                        <label for="announcementEndTime">End Time: </label>
                    </div>
                    <div class="col-md-3">
                        <input class="form-control" type="time" id="announcementEndTime"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <label for="announcementContent">Description</label>
                    </div>
                    <div class="col-md-9">
                        <textarea class="form-control" id="announcementContent"></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btnSaveAnnouncement">Save changes</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<div id="view-announcement-modal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
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
                <div style="display:-webkit-inline-box; margin-right:100%;">
                    <div class="col-lg-3">
                    <input type="Image" id="btnAddToFav" runat="server" title="Add to Favorites!" width="45" height="45"/>
                            <%--<img class="img-responsive" id="btnShareSocialTwit" src='<%= ResolveUrl("Images/Twitter.png") %>' title="Share on Twitter" width="45" height="45"/>--%>
                    </div>
                    <div class="col-lg-3">
                        <button id="btnShareSocialTwit" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000" data-dpmaxz-eid="2" style="color: rgb(255, 255, 255); border-color: rgb(26, 181, 193);">
                            <i class="fa fa-twitter-square" aria-hidden="true"></i>
                            <span aria-hidden="true"></span>
                        </button>
                            <%--<img class="img-responsive" id="btnShareSocialFB" src='<%= ResolveUrl("Images/Facebook.png") %>' title="Share on Facebook" width="45" height="45"/>--%>
                    </div>
                    <div class="col-lg-3">
                        <button id="btnShareSocialFB" data-show-count="false" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000" data-dpmaxz-eid="3">
                         <i class="fa fa-facebook-square" aria-hidden="true"></i>
                         <span aria-hidden="true"></span>
                    </button>
                    </div></div>
                <%--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--%>
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
        

        <% if (Auth.Check()) { %>
            <% if (Auth.user().RoleID == 3) { %>
                <% if (Auth.user().HasPermission(Convert.ToInt32(simbahanID.Value))) { %>
                    <a href="ChurchAdminPageUpdate.aspx?id=<%= simbahanID.Value %>">
                        <i class="fa fa-edit" style="font-size: 24pt; color: #db0c0c;"></i>
                    </a>
                <% } %>
            <% } else if (Auth.user().RoleID == 1) { %>
                    <a href="ChurchAdminPageUpdate.aspx?id=<%= simbahanID.Value %>">
                        <i class="fa fa-edit" style="font-size: 24pt; color: #db0c0c;"></i>
                    </a>
            <% } %>
        <% } %>


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
                <div class="eltd-listing-search-submit-holder">
                    <button id="AddFav" runat="server" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">ADD TO FAVORITES</span><span aria-hidden="true"></span>
                    </button>
                    <button id="RemoveFav" runat="server" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">REMOVE FROM FAVORITES</span><span aria-hidden="true"></span>
                    </button>
                </div>
            </div>

            <div class="col-md-1 col-md-offset-3 col-xs-12">
                <div class="eltd-listing-search-submit-holder">
                    <button id="ShareTw" type="submit" class="btn-Twitter-share eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                        <i class="fa fa-twitter-square fa-2x" aria-hidden="true"></i>
                        <span aria-hidden="true"></span>
                    </button>
                </div>
            </div>
            <div class="col-md-1 col-xs-12">
                <div class="eltd-listing-search-submit-holder">
                    <button id="ShareFb" type="submit" class="btn-facebook-share eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                        <i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i>
                        <span aria-hidden="true"></span>
                    </button>
                </div>
            </div>
        </div>

    </div>
    <div class="col-lg-7 col-sm-7">
        <br/>
        <!-- Start cssSlider.com -->

        <!--[if IE]><link rel="stylesheet" href="cssslider_files/csss_engine1/ie.css"><![endif]-->
        <!--[if lte IE 9]><script type="text/javascript" src="cssslider_files/csss_engine1/ie.js"></script><![endif]-->
        <div class="csslider1 autoplay" id="cssSlider" runat="server">

        </div>
        <!-- Image size : 800x600 px -->
        <!-- End cssSlider.com -->


    </div>
</div>

<br/>

<p class="church-gospel">
    READ TODAY'S GOSPEL <a href='<%= ResolveUrl("DailyGospel.aspx") %>' class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon here" data-hover-color="#000" data-hover-border-color="#000">HERE</a>
</p>
<br/>


<div class="panel with-nav-tabs panel-primary">
<div class="panel-heading">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="#history" data-toggle="tab">HISTORY</a>
        </li>
        <li>
            <a href="#info" data-toggle="tab">CHURCH INFORMATION</a>
        </li>
        <li>
            <a href="#sched" data-toggle="tab">SCHEDULES</a>
        </li>
        <li>
            <a href="#announce" data-toggle="tab">ANNOUNCEMENTS</a>
        </li>
        <li>
            <a href="#review" data-toggle="tab">REVIEWS</a>
        </li>
    </ul>
</div>
<div class="panel-body">
<div class="tab-content">
<div class="tab-pane fade in active" id="history">
    <%--<img src="Images/Churches/mary.jpg" alt="Musical" class="img-history" />--%>
    <p class="church-subtitle">
        <strong>CHURCH HISTORY</strong>

         <% if (Auth.Check()) { %>
            <% if (Auth.user().RoleID == 3) { %>
                <% if (Auth.user().HasPermission(Convert.ToInt32(simbahanID.Value))) { %>
                    
                        <i class="fa fa-edit" id="editHistory" style="font-size: 18pt; color: #db0c0c;"></i>

                <% } %>
            <% } else if (Auth.user().RoleID == 1) { %>
                    
                        <i class="fa fa-edit" style="font-size: 18pt; color: #db0c0c;" data-toggle="modal" data-target="#add-event-modal"></i>
                    
            <% } %>
        <% } %>


    </p>
    <br/>
    <p class="church-paragraph" runat="server" id="churchHistory" style="white-space: pre-line">
        <strong>Church Name</strong><!-- Insert Paragraph Here -->
    </p>
</div>

    <div class="modal fade" id="add-event-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Edit Church History</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                         <div class="col-md-12">
                            <label class="control-label">Church History:</label>
                            <textarea type="textarea" rows='15' class="form-control" runat="server" id="editChurchHistory" value="" />
                        </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="btnTriggerEvent" style="display: none;" onclick="TriggerEvent()">Triggerme</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button id="btnUpdateHistory" Class="btn btn-primary">Update</button>
                    </div>
                </div>
            </div>
        </div>
<div class="tab-pane fade" id="info">
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <b>GENERAL INFO:</b>
            <p>Church Type: <strong runat="server" id="churchType">Type</strong>
            </p>
            <p>Date Established: <strong runat="server" id="churchEstablished">Type</strong>
            </p>
            <p>Feast Day: <strong runat="server" id="churchFeastDay">Type</strong>
            </p>
            <p>Assigned Priest: <strong runat="server" id="churchPriest">Type</strong>
            </p>
            <p>Vicariate: <strong runat="server" id="churchVicariate">Type</strong>
            </p>
            <p>Diocese: <strong runat="server" id="churchDiocese">Type</strong>
            </p>
            <br/>
            <b>CONTACT INFO:</b>
            <p>Telephone Number: <strong runat="server" id="churchContact">Type</strong>
            </p>
            <p runat="server" id="churchWebsite">
                Website: <%--<a href="/">Website</a>--%>
            </p>
            <p>Office Hours: <a href="#" id="seeScheduleTab">see Schedules</a>
            </p>
            <br/>
            <div class="eltd-listing-feature-list eltd-listing-part">
                <b>CHURCH FACILITIES:</b>
                <p>Church Location:</p>
                <p runat="server" id="churchLocation">
                </p>
                <p>Church Ventilation:</p>
                <p runat="server" id="churchVentilations">
                </p>
                <p>Church Parking:</p>
                <p runat="server" id="churchParking">
                </p>
                <br/>
                <b>ADORATION CHAPEL</b>
                <p>Adoration Chapel Schedule:</p>
                <p style="margin-left: 25px;">
                    <strong runat="server" id="adorationSchedule"></strong>
                </p>
                <p>Adoration Chapel Ventilation:</p>
                <p runat="server" id="adorationVentilations">
                </p>
            </div>
            <br/>
            <div class="eltd-listing-search-submit-holder">
                <div class="eltd-listing-search-submit-holder">
                    <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-toggle="modal" data-target="#myModal" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">VIEW CHAPEL PHOTOS</span><span aria-hidden="true"></span>
                    </button>
                    <div id="myModal" class="modal fade" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">ADORATION CHAPEL PHOTOS</h4>
                                </div>
                                <div class="modal-body">

                                    <!-- Start WOWSlider.com BODY section -->
                                    <div id="wowslider-container1">
                                        <div class="ws_images" id="adorationImageContainer" runat="server">
                                            <ul id="adorationImageList" runat="server">
                                                <%--<li>
                                                                            <img src="Content/cssslider_files/csss_images1/ador.jpg" alt="" title="" id="wows1_0" /></li>
                                                                        <li>
                                                                            <img src="Content/cssslider_files/csss_images1/adoration.jpg" alt="slider" title="" id="wows1_1" /></li>
                                                                        <li>
                                                                            <img src="Content/cssslider_files/csss_images1/chapel.jpg" alt="" title="" id="wows1_2" /></li>--%>
                                            </ul>
                                        </div>
                                        <div class="ws_bullets">
                                            <div id="adorationLinkList" runat="server">
                                                <%--<a href="#" title=""><span>
                                                                            <img src="Content/engine1/tooltips/ador.jpg" alt="" />1</span></a>
                                                                        <a href="#" title=""><span>
                                                                            <img src="Content/engine1/tooltips/adoration.jpg" alt="" />2</span></a>
                                                                        <a href="#" title=""><span>
                                                                            <img src="Content/engine1/tooltips/chapel.jpg" alt="" />3</span></a>--%>
                                            </div>
                                        </div>
                                        <div class="ws_script" style="position: absolute; left: -99%">
                                            <div class="ws_shadow"></div>
                                        </div>
                                    </div>
                                    <!-- End WOWSlider.com BODY section -->

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br/>
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            <div class="box-body-churches">
                <div class="row">
                    <div class="vc_col-lg-12">
                        <div id="map" style="height: 400px;">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="vc_col-lg-12" runat="server" id="churchMapAddress">
                        Address
                    </div>
                </div>
                <br/>

                <div id="btnGroupMoreFilter">
                    <div class="row padd">
                        <div class="vc_col-lg-12">

                            <div class="eltd-listing-search-submit-holder">
                                <button id="btnShowMoreFilter" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon navmap" data-hover-color="#000" data-hover-border-color="#000">
                                    <span class="eltd-btn-text">HELP ME NAVIGATE THERE &nbsp;</span><i class="fa fa-share" aria-hidden="true"></i><span aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                    </div>

                </div>
                <div id="moreFiltersPane" style="display: none;">
                    <div class="row">
                        <h5 class="normalize-h5 padd">STARTING LOCATION</h5>
                        <div class="col-md-12">
                            <div class="form-group">
                                <div class="input-group">
                                    <input id="startPosition" data-name="starting location" class="form-control input-lg" type="text" placeholder="Starting Location"/>
                                    <div id="getCurrentLocation" class="input-group-addon">
                                        <i class="fa fa-dot-circle-o"></i>
                                    </div>
                                </div>
                                <label id="errorStartingLocation" class="text-danger" style="display: none"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <h5 class="normalize-h5 padd">DESTINATION</h5>
                        <div class="col-md-12">
                            <input runat="server" id="churchMapDestination" disabled class="form-control input-lg" type="text" placeholder="Destination"/>
                        </div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="eltd-listing-search-submit-holder">
                                <button id="btnShowRoute" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon navmap" data-hover-color="#000" data-hover-border-color="#000">
                                    <span class="eltd-btn-text">NAVIGATE NOW &nbsp;</span><i class="fa fa-share" aria-hidden="true"></i><span aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <br/>
            </div>
        </div>
    </div>
</div>
<div class="tab-pane fade" id="sched">
    <p class="church-subtitle">
        <strong>MASS SCHEDULE:</strong>
    </p>
    <br/>
    <div class="table-responsive">
    <table runat="server" id="massScheduleTable" class="table table-striped table-bordered min-font-size">
        <thead>
        <tr class="bg-aqua-active color-palette">
            <th>Day / Time</th>
            <th>SUNDAY</th>
            <th>MONDAY</th>
            <th>TUESDAY</th>
            <th>WEDNESDAY</th>
            <th>THURSDAY</th>
            <th>FRIDAY</th>
            <th>SATURDAY</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
        </div>
    <p style="font-style: italic;">*Anticipated Mass</p>
    <hr/>
    <p class="church-subtitle">
        <strong>CONFESSION SCHEDULE:</strong>
    </p>
    <p runat="server" id="confessionSchedule"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>BAPTISM SCHEDULE:</strong>
    </p>
    <p runat="server" id="baptismSchedule"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>WEDDING SCHEDULE:</strong>
    </p>
    <p runat="server" id="weddingSchedule"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>ADORATION CHAPEL SCHEDULE:</strong>
    </p>
    <p runat="server" id="adorationChapelSchedule"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>OFFICE HOURS:</strong>
    </p>
    <p runat="server" id="officeHours"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>REGULAR DEVOTIONS SCHEDULE:</strong>
    </p>
    <p runat="server" id="devotionSchedule"></p>
</div>
<div class="tab-pane fade" id="announce">
    <p class="church-subtitle">
        <strong>CHURCH ANNOUNCEMENTS:</strong>
    </p>
    <br/>
    <div runat="server" id="churchAnnouncementContainer">
    </div>
</div>
<div class="tab-pane fade" id="review">
    <div class="eltd-listing-comments eltd-listing-part">
        <div class="eltd-comment-holder clearfix" id="comments">
            <div class="eltd-comment-form ">
                <div id="respond" class="comment-respond">
                    <h3 id="reply-title" class="comment-reply-title">Post a Comment <small>
                            <a rel="nofollow" id="cancel-comment-reply-link" href="index.html#respond" style="display: none;">Cancel Reply</a>
                        </small>
                    </h3>
                    <%--<form action="/" method="post" id="commentform" class="comment-form">--%>
                    <div class="eltd-rating-form-title-holder">
                        <div class="eltd-rating-form-title">
                            <h5>Write a Review</h5>
                        </div>
                        <div class="eltd-comment-form-rating">
                            <label>Rate Here<span class="required">*</span></label>
                            <span class="eltd-comment-rating-box">
                                <span class="eltd-star-rating" data-value="1"></span><span class="eltd-star-rating" data-value="2"></span><span class="eltd-star-rating" data-value="3"></span><span class="eltd-star-rating" data-value="4"></span><span class="eltd-star-rating" data-value="5"></span>
                                <input type="hidden" name="eltd_rating" id="eltd-rating" value="3"/>
                            </span>
                        </div>
                    </div>
                    <div class="eltd-comment-input-title">
                        <%--<input id="title" name="eltd_comment_title" class="eltd-input-field" type="text" placeholder="Title of your Review"/>--%>
                        <label id="errorTitle" class="text-danger" style="display: none"></label>
                    </div>
                    <textarea id="comment" placeholder="Your Experience" name="comment" cols="45" rows="8" aria-required="true"></textarea>
                    <input id="reviewerName" name="author" placeholder="Your name" type="text" value="" aria-required="true" <%= (!Auth.Check()) ? "" : @"style=""display: none""" %> />
                    <label id="errorComment" class="text-danger" style="display: none"></label>
                    <!---->
                    <%--<input id="email" name="email" placeholder="E-mail address" type="text" value="" aria-required='true' />--%>
                    <p class="form-submit">
                        <button id="btnPublishReview" type="submit" class="eltd-btn eltd-btn-medium eltd-btn-solid eltd-btn-icon submit" id="submit_comment">
                            <span class="eltd-btn-text">Publish</span> <span aria-hidden="true" class="eltd-icon-font-elegant arrow_carrot-right "></span>
                        </button>
                    </p>
                    <%--</form>--%>
                </div>
                <!-- #respond -->
            </div>

            <div class="eltd-comment-number">
                <div class="eltd-comment-number-inner">
                    <h5>Reviews</h5>
                </div>
            </div>
            <div class="eltd-comments">

                <ul runat="server" id="churchReviewsContainer" class="eltd-comment-list">
                    <!-- #comment-## -->
                </ul>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>

<hr />
        <div class="row">
            <div class="col-lg-12">
                <center><strong>DISCLAIMER: Information above may not be accurate or updated.  Please help us update the information above by emailing us your update or corrections to <a class="contact" href="mailto:churchinfo@mycatholicportal.org">churchinfo@mycatholicportal.org</a> or directly message us in our Facebook Page: <a class="contact" href="https://www.facebook.com/SimbahanApp/">https://www.facebook.com/SimbahanApp/</a>.  Thank you in advance. God bless.</strong>
                <%--<p><strong>Email your updates or corrections to <a class="contact" href="mailto:simbahan_info@mycatholicportal.org">info@mycatholicportal.org</a>.</strong></p>--%></center>
                <br />
               <%-- <div class="row">
                    <div class="col-lg-5">
                        <div class="eltd-listing-search-submit-holder">
                            <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000"><span class="eltd-btn-text">UPDATE AS GUEST</span><span aria-hidden="true"></span></button>
                        </div>
                    </div>
                    <div class="col-lg-7">
                        <div class="eltd-listing-search-submit-holder">
                            <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000"><span class="eltd-btn-text">UPDATE AS ADMINISTRATOR</span><span aria-hidden="true"></span></button>
                        </div>
                    </div>
                </div>--%>
            </div>

           <%-- <div class="col-lg-6">
                <p>Are you affiliated to the Church listed above? Help us help others.  Apply to be an administrator of this Listing.</p>
                <br />
                <div class="row">
                    <div class="col-lg-6">
                        <div class="eltd-listing-search-submit-holder">
                            <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000"><span class="eltd-btn-text">CREATE NEW ACCOUNT</span><span aria-hidden="true"></span></button>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="eltd-listing-search-submit-holder">
                            <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000"><span class="eltd-btn-text">USE MY EXISTING ACCOUNT</span><span aria-hidden="true"></span></button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <hr />
        <p><strong>MyCatholicPortal.org</strong> is a charity project and does not receive any financial support from any diocese. We thank you for your patience on the site ads, these help support the maintenance of the site.  If you find value to the mission of this site donate to us or to our selected partner foundations by clicking the button below.</p>
        <br />
        <div class="row">
            <div class="col-lg-3">
                <div class="eltd-listing-search-submit-holder">
                    <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000"><span class="eltd-btn-text">HELP MY CATHOLIC PORTAL.ORG</span><span aria-hidden="true"></span></button>
                </div>
            </div>

            <div class="eltd-listing-search-submit-holder">
                <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000"><span class="eltd-btn-text">HELP OUR PARTNER FOUNDATIONS</span><span aria-hidden="true"></span></button>
            </div>--%>


        </div>
<div class="row">
    <!-- Insert ADS Here -->
</div>
</div>
<script type="text/javascript">

    var map;

    function initialize() {
        map = new GMap(document.getElementById("map"),
            {
                center: new google.maps.LatLng($("#<%= latitude.ClientID %>").val(),
                    $("#<%= longitude.ClientID %>").val()),
                zoom: 14,
                scrollwheel: false,
                mapTypeId: google.maps.MapTypeId.TERRAIN
            });

        map.Create();

        map.SetUpDirectionService();

        map.AddMarker(0,
            {
                position: new google.maps.LatLng($("#<%= latitude.ClientID %>").val(),
                    $("#<%= longitude.ClientID %>").val()),
                title: ''
            });

        if (User.CurrentPosition() != null)
            map.DrawRoute(User.CurrentPosition(), $("#<%= churchMapDestination.ClientID %>").val());

    }

    if (typeof google !== "undefined")
        google.maps.event.addDomListener(window, 'load', initialize);

    $(document).ready(function () {

        SelectTab("info");

        $('#startPosition').keyup(function(e) {
            //e.preventDefault();

        });

        $('#startPosition').keydown(function(e) {
            //e.preventDefault();

            if (e.keyCode == 13) {
                e.preventDefault();

                $("#btnShowRoute").trigger('click');
            }
        });

        setTimeout(initialize, 4000);

        $("#startPosition").val();

        $(document).on('click',
            '#seeScheduleTab',
            function(e) {
                e.preventDefault();

                SelectTab('sched');
            });

        $(document).on('click',
            '#btnShowMoreFilter',
            function(e) {
                e.preventDefault();

                Control.show('moreFiltersPane');
                Control.hide('btnShowMoreFilter');
            });

        $(document).on('click',
            '#btnShowRoute',
            function(e) {
                e.preventDefault();

                var validationPassed = $("#startPosition").validate(['required', 'min:3'])
                    .displayErrorOn('#errorStartingLocation');

                if (validationPassed)
                    map.DrawRoute($("#startPosition").val(), $("#<%= churchMapDestination.ClientID %>").val());
            });
        $(document).on('click',
            '#ShareTw',
            function(e) {
                e.preventDefault();


                var message = $('#<%= churchName.ClientID %>').text().substr(0, 80) +
                    '\n' +
                    'www.mycatholicportal.org/Church/' +
                    $("#<%= simbahanID.ClientID %>").val() +
                    '   via @SimbahanApp';

                window.open("https://twitter.com/intent/tweet?text=" + encodeURI(message),
                    "Share to Twitter",
                    "width=500,height=300");

            });

        $(document).on('click',
            '#ShareFb',
            function(e) {
                e.preventDefault();

                window.open(
                    'https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/Church/' +
                    $("#<%= simbahanID.ClientID %>").val(),
                    'Share To Facebook',
                    'width=500,height=300');

            });

        $("#getCurrentLocation").click(function(e) {
            e.preventDefault();

            var position = User.CurrentPosition();

            if (position) {
                alert('thanks');
            } else {
                alert('Sorry not available yet!');
            }
        });

        $(document).on('click',
            '#btnSaveAnnouncement',
            function(e) {
                e.preventDefault();

                (new http).post('Churches.aspx/PublishAnnouncement',
                    {
                        simbahanId: $("#<%= simbahanID.ClientID %>").val(),
                        title: $("#announcementTitle").val(),
                        content: $("#announcementContent").val(),
                        venue: $("#announcementVenue").val(),
                        startDate: $("#announcementStartDate").val(),
                        startTime: $("#announcementStartTime").val(),
                        endDate: $("#announcementEndDate").val(),
                        endTime: $("#announcementEndTime").val()
                    }).then(function(data) {
                    swal('Announcement published!',
                        'Your announcement has been published!',
                        'success');
                }).run();
            });

        $(document).on('click',
            '#btnPublishReview',
            function(e) {
                e.preventDefault();

                //var titleReviewPassed = $("#title").validate(['required', 'min:3'])
                //    .displayErrorOn('#errorTitle');

                var commentReviewPassed = $("#comment").validate(['required', 'min:3'])
                    .displayErrorOn('#errorComment');

                var starCount = $("#eltd-rating").val();

                if (commentReviewPassed) {
                    (new http).post('Churches.aspx/PublishReview',
                        {
                            simbahanId: $("#<%= simbahanID.ClientID %>").val(),
                            rate: starCount,
                            title: $("#title").val(),
                            content: $("#comment").val(),
                            name: $("#reviewerName").val()
                        }).then(function(data) {
                        var review = data.d;

                        var reviewControl = new ChurchReview(review.StarCount,
                            review.Title,
                            review.Comment,
                            review.UserId == 0 ? review.Name : review.User.FullName,
                            review.FormattedDate);

                        $("#<%= churchReviewsContainer.ClientID %>").append(reviewControl.render());

                        $("#title").val('');
                        $("#comment").val('');

                        swal('Success!',
                            'Your review has been submitted!',
                            'success');
                    }).run();
                }
            });

        $(document).on('click',
            '#<%= AddFav.ClientID %>',
            function(e) {
                e.preventDefault();

                if (!isAuth) {
                    document.cookie = "intendedRedirect=" + currentPage + ";";
                    window.location.href = "Login.aspx";
                    return;
                }

                (new http).post('Churches.aspx/AddChurchToFavorite',
                    {
                        simbahanId: $("#<%= simbahanID.ClientID %>").val()
                    }).then(function(data) {
                    if (data.d) {
                        Control.hide('<%= AddFav.ClientID %>');
                        Control.show('<%= RemoveFav.ClientID %>');

                        swal('Success!',
                            'Church has been added to your favorites!',
                            'success');
                    } else {
                        swal('Oops!',
                            'This church is already in your favorite list',
                            'error');
                    }
                }).run();
            });

        $(document).on('click',
            '#<%= RemoveFav.ClientID %>',
            function(e) {
                e.preventDefault();

                if (!isAuth) {
                    document.cookie = "intendedRedirect=" + currentPage + ";";
                    window.location.href = "Login.aspx";
                    return;
                }

                (new http).post('Churches.aspx/RemoveChurchFromFavorite',
                    {
                        simbahanId: $("#<%= simbahanID.ClientID %>").val()
                    }).then(function(data) {
                    if (data.d) {
                        Control.show('<%= AddFav.ClientID %>');
                        Control.hide('<%= RemoveFav.ClientID %>');
                        swal('Success!',
                            'Church has been removed from your favorites!',
                            'success');
                    } else {
                        swal('Oops!',
                            'We can\'t find this church from your favorite list',
                            'error');
                    }
                }).run();
            });

    });

    $(document).on('click', '#reportSpam', function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        swal({
            title: 'Does this comment bothers you?',
            text: "Report this comment as spam?",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes',
            cancelButtonText: 'No',
            showLoaderOnConfirm: true,
            preConfirm: function () {
                return new Promise(function (resolve, reject) {
                    (new http).post('Churches.aspx/ReportAbusiveComment', {
                        commentId: id
                    }).then(function (response) {
                        resolve();
                    }).whenError(function (err) {
                        reject();
                    }).run();
                });
            }
        }).then(function () {
            swal(
                'Comment has been reported!',
                'Rest assured we will review this and help prevent further spamming.',
                'success'
            );
        }).catch(function () {
            swal(
                'Something went wrong!',
                'Please check your internet connection then try again',
                'danger'
            );
        });
    });

    function ChurchReview(id, rate, title, comment, name, date) {
        this.id = id;
        this.rate = rate;
        this.title = title;
        this.comment = comment;
        this.name = name;
        this.date = date;
    }

    ChurchReview.prototype.CalculateStarPercentage = function () {
        switch (this.rate) {
            case "0":
            case 0:
                return 0;

            case "1":
            case 1:
                return 18.2;

            case "2":
            case 2:
                return 36.4;

            case "3":
            case 3:
                return 54.6;

            case "4":
            case 4:
                return 72.8;

            case "5":
            case 5:
                return 91;

            default:
                return 0;
        }
    };
    ChurchReview.prototype.render = function () {
        return "<li itemprop=\"review\" itemtype=\"http://schema.org/Review\">" +
            "<div class=\"eltd-comment clearfix\">" +
            "<div class=\"eltd-comment-image\" itemprop=\"author\" itemtype=\"http://schema.org/Person\">" +
            "<img alt=\"\" src=\"Images\\default_avatar.png\" class=\"avatar avatar-98 photo\" height=\"98\" width=\"98\" />" +
            "</div>" +
            "<div class=\"eltd-comment-text\">" +
            "<div class=\"eltd-comment-info\">" +
            "<div class=\"eltd-review-rating\">" +
            "<span class=\"rating-inner\" style=\"width: " +
            this.CalculateStarPercentage() +
            "%;\"></span>" +
            "<a href=\"#\" id=\"reportSpam\" data-id=\"" + this.id + "\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Report as abusive\"><i class=\"fa fa-exclamation 5x\" style=\"color: red;\" aria-hidden=\"true\"></i></a>" +
            "</div>" +
            "<div class=\"eltd-review-title\">" +
            "<span>" +
            this.name +
            "</span>" +
            "</div>" +
            "<div class=\"eltd-review-title\">" +
            "<span>" +
            this.title +
            "</span>" +
            "</div>" +
            "</div>" +
            "<div class=\"eltd-text-holder\" id=\"comment-42\" itemprop=\"reviewBody\">" +
            "<p>" +
            this.comment +
            "</p>" +
            "</div>" +
            "<div class=\"eltd-comment-bottom-info\">" +
            "<span class=\"eltd-comment-date\" itemprop=\"datePublished\" content=\"2017 - 02 - 22T11: 36:00 + 0000\">" +
            this.date +
            "</span>" +
            "</div>" +
            "</div>" +
            "</div>" +
            "</li>";
    };

    $(document).on('click', '#annoucementItem', function (e) {
        e.preventDefault();

        $("#viewAnnouncementImage").attr('src', $(this).data('image'));
        $("#viewAnnouncementTitle").text($(this).data('title'));
        $("#viewAnnouncementVenue").text($(this).data('venue'));
        $("#viewAnnouncementStartDate").text($(this).data('start-date'));
        $("#viewAnnouncementStartTime").text($(this).data('start-time'));
        $("#viewAnnouncementEndDate").text($(this).data('end-date'));
        $("#viewAnnouncementEndTime").text($(this).data('end-time'));
        $("#viewAnnouncementContent").text($(this).data('content'));

        $("#view-announcement-modal").modal('show');
    });

    $(document).on('click', '#annoucementItem', function (e) {
        e.preventDefault();

        $("#viewAnnouncementImage").attr('src', $(this).data('image'));
        $("#viewAnnouncementTitle").text($(this).data('title'));
        $("#viewAnnouncementVenue").text($(this).data('venue'));
        $("#viewAnnouncementStartDate").text($(this).data('start-date'));
        $("#viewAnnouncementStartTime").text($(this).data('start-time'));
        $("#viewAnnouncementEndDate").text($(this).data('end-date'));
        $("#viewAnnouncementEndTime").text($(this).data('end-time'));
        $("#viewAnnouncementContent").text($(this).data('content'));

        $("#view-announcement-modal").modal('show');
    });

    $(document).on('click',
            '#<%= btnAddToFav.ClientID %>',
            function (e) {
                e.preventDefault();

                if ($("#<%= btnAddToFav.ClientID %>").attr('src') == '/Images/star.png') {
                    $("#<%= btnAddToFav.ClientID %>").attr('src', '/Images/starcolored.png');
                } else {
                    $("#<%= btnAddToFav.ClientID %>").attr('src', '/Images/star.png');
                }

                var id = window.location.href.includes('?')
                    ? window.location.href.split('=')[1]
                    : window.location.href.split('/')[window.location.href.split('/').length - 1];

                (new http).post('<%= ResolveUrl("Churches.aspx/OnFavoriteAnnouncements") %>',
                    {
                        announcementID: id
                    }).then(function (response) {
                        if (response.d) {
                            if ($("#<%= btnAddToFav.ClientID %>").attr('src') != '/Images/star.png') {
                                swal(
                                    'Added to favorites!',
                                    'Announcement has been added to your favorites list!',
                                    'success'
                                );
                            } else {
                                swal(
                                    'Removed from favorites!',
                                    'Announcement has been removed from your favorites list!',
                                    'success'
                                );
                            }
                        } else {
                            swal(
                                'You are not be able to add it to favorites!',
                                'You must Log-in first!',
                                'Warning'
                            );
                        }
                        
                    }).run();
            });

    $(document).on('click',
   '#btnShareSocialTwit',
   function (e) {
       e.preventDefault();

       var id = window.location.href.includes('?')
           ? window.location.href.split('=')[1]
           : window.location.href.split('/')[window.location.href.split('/').length - 1];

       var message = $("#viewAnnouncementTitle").text() +
                    'http://www.mycatholicportal.org/Churches.aspx?id=' +
                    id +
                    " via " ;

                window.open("https://twitter.com/intent/tweet?text=" + encodeURI(message) + encodeURI('@SimbahanApp'),
                    "mywindow",
                    "width=500,height=300");
            });

            $(document).on('click',
                '#btnShareSocialFB',
                function (e) {
                    e.preventDefault();

                    var message = '';
                    var id = window.location.href.includes('?')
                        ? window.location.href.split('=')[1]
                        : window.location.href.split('/')[window.location.href.split('/').length - 1];

                    window.open(
                        'https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/Announcement/' +
                        id +
                        '&caption=' +
                        encodeURI(message) +
                        '&description=' +
                        encodeURI(message) +
                        '&properties={text' +
                        encodeURI(message),
                        '}',
                        'Share To Facebook',
                        'width=500,height=300');

                });
    $(document).on('click', '#editHistory', function () {
        var history = $('#<%= churchHistory.ClientID%>').val();
        $('#<%= editChurchHistory.ClientID%>').val(history);
        //$(this).closest('p').clone().appendTo('#<%= editChurchHistory%>');
    });

    $(document).on('click', '#btnUpdateHistory', function () {
        (new http).post('Churches.aspx/UpdateHistory', {
            SimbahanID: $('#<%= simbahanID.ClientID%>').val(),
            churchHistory: $('#<%= editChurchHistory.ClientID%>').val()
        }).then(function (response){
            alert('Updated');
            window.location.reload();
        }).run();
    });
</script>
</asp:Content>
