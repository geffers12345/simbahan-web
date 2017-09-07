<%@ Page Title="Catholic Organizations Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Organizations.aspx.cs" Inherits="SimbahanApp.Organizations" %>
<%@ Import Namespace="SimbahanApp.Models" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<!---------------------------
Author: Claud Montaril
Description: Organizations Page
Date Created: 02/22/2017
Date Modified: Claud
Modified by:
--------------------------->
<link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet"/>
<link rel="stylesheet" href='<%= ResolveUrl("Content/cssslider_files/csss_engine1/style.css") %>'>
    <link rel="stylesheet" href='<%= ResolveUrl("Content/contact.css") %>'  />

<input type="hidden" id="latitude" runat="server" />
<input type="hidden" id="longitude" runat="server" />
<input type="hidden" id="OrganizationId" runat="server" />
    
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
                <asp:Button ID="btnSaveAnnouncement" CssClass="btn btn-primary" runat="server" OnClick="btnAddAnnouncement_Click" Text="Save Announcement"></asp:Button>
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
<div class="row">
    <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
   
            <h1 class="church-header" id="OrganizationName" runat="server"></h1>
       
       
            <p class="church-address" id="OrganizationAddress" runat="server">
                Address
            </p>
      
        <br/>
            <p class="church-label">
                Organization Name: <strong id="ParentOrganization" runat="server"></strong>
            </p>
        <br/>
            <p class="church-label">
                Worship Schedule Today:
            </p>
        <br/>
            <p class="church-sublabel">
                <strong id="WorshipScheduleToday" runat="server">Dates</strong>
            </p>
        <br/>
            <p class="church-label">
                Last Updated: <strong id="LastUpdated" runat="server"></strong>
            </p>
        
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

            <div class="col-md-1 col-md-offset-3">
                <div class="eltd-listing-search-submit-holder">
                    <button id="ShareTw" type="submit" class="btn-Twitter-share eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                        <i class="fa fa-twitter-square fa-2x" aria-hidden="true"></i>
                        <span aria-hidden="true"></span>
                    </button>
                </div>
            </div>
            <div class="col-md-1">
                <div class="eltd-listing-search-submit-holder">
                    <button id="ShareFb" type="submit" class="btn-facebook-share eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                        <i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i>
                        <span aria-hidden="true"></span>
                    </button>
                </div>
            </div>
        </div>

    </div>
    <div class="col-lg-7">
        <br/>
        <!-- Start cssSlider.com -->

        <!--[if IE]><link rel="stylesheet" href="cssslider_files/csss_engine1/ie.css"><![endif]-->
        <!--[if lte IE 9]><script type="text/javascript" src="cssslider_files/csss_engine1/ie.js"></script><![endif]-->
        <div class="csslider1 autoplay " id="cssSlider" runat="server">

        </div>
    </div>
</div>
<br/>


<div class="panel with-nav-tabs panel-primary">
<div class="panel-heading">
    <ul class="nav nav-tabs">
        <li class="active">
            <a href="#history" data-toggle="tab">ABOUT THE ORG</a>
        </li>
        <li>
            <a href="#info" data-toggle="tab">GENERAL INFORMATION</a>
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
    <p class="church-subtitle">
        <strong>ABOUT THE ORG</strong>
    </p>
    <br/>
    <p class="church-paragraph" id="OrganizationAbout" runat="server">
        
    </p>
</div>
<div class="tab-pane fade" id="info">
    <div class="row">
        <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
            GENERAL INFO:
            <p>
                Branch / Location: <strong id="Location" runat="server"></strong>
            </p>
            <p>
                Organization Name: <strong id="InfoOrganizationName" runat="server"></strong>
            </p>
            <p>
                Parent Organization: <strong id="InfoParentOrganization" runat="server"></strong>
            </p>
            <p>
                Date Established: <strong id="DateEstablished" runat="server"></strong>
            </p>
            <br/>
            <p>CONTACT INFO:</p>
            <p>
                Telephone Number: <strong id="ContactNumber" runat="server"></strong>
            </p>
            <p>
                Email Address: <strong id="Email" runat="server"></strong>
            </p>
            <p>
                Website: <strong id="Website" runat="server"></strong>
            </p>
            <br/>
            <div class="eltd-listing-feature-list eltd-listing-part">
                <p>ORGANIZATION ACTIVITIES:</p>
                <p runat="server" id="Activities"></p>
                <p>ATTENDEES:</p>
                <p runat="server" id="Attendees"></p>

                <p>ORGANIZATION FACILITIES:</p>
                <p runat="server" id="Venues"></p>
                <p>Org Ventilation:</p>
                <p runat="server" id="Ventilations"></p>
                <p>Vehicle Parking:</p>
                <p runat="server" id="Parkings"></p>
                <p>AFFILIATED ORGANIZATIONS:</p>
                <p>
                    <span itemprop="additionalProperty">
                        <!-- Insert Data Here -->
                    </span>
                </p>
            </div>
        </div>
        <br/>
        <div class="col-lg-6 col-md-5 col-sm-12 col-sm-12 col-xs-12">
            <div class="box-body-churches">
                <div class="row">
                    <div class="vc_col-lg-12">
                        <div id="map" style="height: 400px;">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="vc_col-lg-12" id="OrgAddress" runat="server">
                        
                    </div>
                </div>
                <br/>
                <div id="btnGroupMoreFilter">
                    <div class="row">
                        <div class="vc_col-lg-12">
                            <div class="eltd-listing-search-submit-holder">
                                <button id="btnShowMoreFilter" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon navmap" data-hover-color="#000" data-hover-border-color="#000">
                                    <span class="eltd-btn-text">HELP ME NAVIGATE THERE &nbsp;</span><i class="fa fa-share" aria-hidden="true"></i><span aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="moreFiltersPane" style="display: none;">
                    <div class="row">
                        <h5 class="normalize-h5">STARTING LOCATION</h5>
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
                        <h5 class="normalize-h5">DESTINATION</h5>
                        <div class="col-md-12">
                            <input runat="server" id="organizationMapDestination" disabled class="form-control input-lg" type="text" placeholder="Destination"/>
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
            </div>
        </div>
    </div>
</div>
<div class="tab-pane fade" id="sched">
    <p class="church-subtitle">
        <strong>WORSHIP SCHEDULE:</strong>
    </p>
    <ul id="WorshipSchedule" runat="server"></ul>
    <hr/>
    <p class="church-subtitle">
        <strong>MASS SCHEDULE:</strong>
    </p>
    <ul id="MassSchedule" runat="server"></ul>
    <hr/>
    <p class="church-subtitle">
        <strong>BIBLE STUDY:</strong>
    </p>
    <ul id="BibleSchedule" runat="server"></ul>
    <hr/>
    <p class="church-subtitle">
        <strong>RETREAT:</strong>
    </p>
    <p id="RetreatSchedule" runat="server"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>RECOLLECTION:</strong>
    </p>
    <p id="RecollectionSchedule" runat="server"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>TALKS:</strong>
    </p>
    <p class="space-talk" id="TalkSchedule" runat="server"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>CAMPS:</strong>
    </p>
    <p id="CampSchedule" runat="server"></p>
    <hr/>
    <p class="church-subtitle">
        <strong>VOLUNTEER WORKS:</strong>
    </p>
    <p id="VolunteerSchedule" runat="server"></p>
</div>
<div class="tab-pane fade" id="announce">
    <p class="church-subtitle">
        <strong>ANNOUNCEMENTS:</strong>
    </p>
    <br/>
    <div id="resultContainer">
        
    </div>
    <br />
    <div class="eltd-listing-search-submit-holder">
        <div class="eltd-listing-search-submit-holder">
            <% if (Auth.Check()) { %>
                <% if (Auth.user().RoleID == 1 || Auth.user().RoleID == 3) { %>
                    <button type="submit" id="btnCreateAnnouncement" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">CREATE A NEW ANNOUNCEMENT</span><span aria-hidden="true"></span>
                    </button>
            <% } } %>
        </div>
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
                    <textarea id="comment" placeholder="Your Experience" name="comment" cols="45" rows="8" aria-required="true"></textarea>
                    <input id="reviewerName" name="author" placeholder="Your full name" type="text" value="" aria-required="true" <%= Auth.Check() ? @"style: ""display: none;""" : "" %> />
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

                <ul runat="server" id="organizationReviewsContainer" class="eltd-comment-list">
                    <!-- #comment-## -->
                </ul>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
<hr/>
<div class="row">
    <div class="col-lg-12">
       <center><strong>DISCLAIMER: Information above may not be accurate or updated.  Please help us update the information above by emailing us your update or corrections to <a class="contact" href="mailto:organizationinfo@mycatholicportal.org">organizationinfo@mycatholicportal.org</a> or directly message us in our Facebook Page: <a class="contact" href="https://www.facebook.com/SimbahanApp/">https://www.facebook.com/SimbahanApp/</a>.  Thank you in advance. God bless.</strong>
        <br/>
        <%--<div class="row">
            <div class="col-lg-5">
                <div class="eltd-listing-search-submit-holder">
                    <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">UPDATE AS GUEST</span><span aria-hidden="true"></span>
                    </button>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="eltd-listing-search-submit-holder">
                    <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">UPDATE AS ADMINISTRATOR</span><span aria-hidden="true"></span>
                    </button>
                </div>
            </div>
        </div>--%>
    </div>

    <%--<div class="col-lg-6">
        <p>Are you affiliated to the Church listed above? Help us help others. Apply to be an administrator of this Listing.</p>
        <br/>
        <div class="row">
            <div class="col-lg-6">
                <div class="eltd-listing-search-submit-holder">
                    <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">CREATE NEW ACCOUNT</span><span aria-hidden="true"></span>
                    </button>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="eltd-listing-search-submit-holder">
                    <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-hover-color="#000" data-hover-border-color="#000">
                        <span class="eltd-btn-text">USE MY EXISTING ACCOUNT</span><span aria-hidden="true"></span>
                    </button>
                </div>
            </div>

        </div>
    </div>
</div>
<hr/>
<p>
    <strong>MyCatholicPortal.org</strong> is a charity project and does not receive any financial support from any diocese. We thank you for your patience on the site ads, these help support the maintenance of the site. If you find value to the mission of this site donate to us or to our selected partner foundations by clicking the button below.
</p>
<br/>
<div class="row">
    <div class="col-lg-3">
        <div class="eltd-listing-search-submit-holder">
            <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                <span class="eltd-btn-text">HELP MY CATHOLIC PORTAL.ORG</span><span aria-hidden="true"></span>
            </button>
        </div>
    </div>

    <div class="eltd-listing-search-submit-holder">
        <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
            <span class="eltd-btn-text">HELP OUR PARTNER FOUNDATIONS</span><span aria-hidden="true"></span>
        </button>
    </div>


</div>--%>
<div class="row">
    <!-- Insert ADS Here -->
</div>
</div></div>
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
            map.DrawRoute(User.CurrentPosition(), $("#<%= organizationMapDestination.ClientID %>").val());

    }

    if (typeof google !== "undefined")
        google.maps.event.addDomListener(window, 'load', initialize);

    $(document).ready(function() {
        setTimeout(initialize, 4000);

        $(document).on('click', '#btnShowMoreFilter', function(e) {
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
                    map.DrawRoute($("#startPosition").val(), $("#<%= organizationMapDestination.ClientID %>").val());
            });

        $(document).on('click',
            '#ShareTw',
            function(e) {
                e.preventDefault();


                var message = $('#<%= OrganizationName.ClientID %>').text().substr(0, 80) +
                    '\n' +
                    'www.mycatholicportal.org/Organization/' +
                    $("#<%= OrganizationId.ClientID %>").val() +
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
                    'https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/Organization/' +
                    $("#<%= OrganizationId.ClientID %>").val(),
                    'Share To Facebook',
                    'width=500,height=300');

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

                (new http).post('Organizations.aspx/AddOrganizationToFavorite',
                    {
                        organizationId: $("#<%= OrganizationId.ClientID %>").val()
                    }).then(function(data) {
                    if (data.d) {
                        Control.hide('<%= AddFav.ClientID %>');
                        Control.show('<%= RemoveFav.ClientID %>');

                        swal('Success!',
                            'Organization has been added to your favorites!',
                            'success');
                    } else {
                        swal('Oops!',
                            'This organization is already in your favorite list',
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

                (new http).post('Organizations.aspx/RemoveChurchFromFavorite',
                    {
                        organizationId: $("#<%= OrganizationId.ClientID %>").val()
                    }).then(function(data) {
                    if (data.d) {
                        Control.show('<%= AddFav.ClientID %>');
                        Control.hide('<%= RemoveFav.ClientID %>');
                        swal('Success!',
                            'Organization has been removed from your favorites!',
                            'success');
                    } else {
                        swal('Oops!',
                            'We can\'t find this organization from your favorite list',
                            'error');
                    }
                }).run();
            });

        $(document).on('click',
            '#btnPublishReview',
            function(e) {
                e.preventDefault();

                var commentReviewPassed = $("#comment").validate(['required', 'min:3'])
                    .displayErrorOn('#errorComment');

                var starCount = $("#eltd-rating").val();

                if (titleReviewPassed && commentReviewPassed) {
                    (new http).post('Organizations.aspx/PublishReview',
                        {
                            organizationId: $("#<%= OrganizationId.ClientID %>").val(),
                            rate: starCount,
                            title: '',
                            content: $("#comment").val(),
                            name: $("#reviewerName").val()
                        }).then(function(data) {
                        var review = data.d;

                        var reviewControl = new OrganizationReview(review.StarCount,
                            review.Comment,
                            review.UserId == 0 ? review.Name : review.User.FullName,
                            review.FormattedDate);

                        $("#<%= organizationReviewsContainer.ClientID %>").append(reviewControl.render());

                        $("#comment").val('');

                        swal('Success!',
                            'Your review has been submitted!',
                            'success');
                    }).run();
                }
            });
    });

    function OrganizationReview(rate, title, comment, name, date) {
        this.rate = rate;
        this.comment = comment;
        this.name = name;
        this.date = date;
    }

    OrganizationReview.prototype.CalculateStarPercentage = function () {
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
    OrganizationReview.prototype.render = function () {
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
            "<a href=\"#\" data-toggle=\"tooltip\" data-placement=\"top\" title=\"Report as abusive\"><i class=\"fa fa-exclamation 5x\" style=\"color: red;\" aria-hidden=\"true\"></i></a>" +
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

    $(document).on('click', '#btnCreateAnnouncement', function(e) {
        e.preventDefault();

        $("#<%= announcementTitle.ClientID %>").val('');
        $("#<%= announcementContent.ClientID %>").val('');
        $("#<%= announcementVenue.ClientID %>").val('');
        $("#<%= AnnouncementImage.ClientID %>").val('');
        $("#<%= announcementStartDate.ClientID %>").val('');
        $("#<%= announcementStartTime.ClientID %>").val('');
        $("#<%= announcementEndDate.ClientID %>").val('');
        $("#<%= announcementEndTime.ClientID %>").val('');

        $("#create-announcement-modal").modal('show');
    });
</script>

</asp:Content>