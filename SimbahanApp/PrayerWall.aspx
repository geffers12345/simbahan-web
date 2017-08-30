<%@ Page Title="Prayer Wall" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="PrayerWall.aspx.cs" Inherits="SimbahanApp.PrayerWall" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <link href="Content/prayerwall.css" rel="stylesheet" />
    <link href='<%= ResolveUrl("Content/Site.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet"/>
    
    <div class="PrayerWall-banner">
        <img src="Images/prayerwallbanner.jpg" />
    </div>
    <div class="box-body">
    <div class="typewriter">
       <h1>Post a Prayer</h1>
    </div>
    <div class="row">
        <div class="panel with-nav-tabs panel-primary prayer">
            <div class="panel-heading">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#personal" data-toggle="tab">MY DEVOTION</a>
                    </li>
                    <li>
                        <a href="#community" data-toggle="tab">LET OTHER'S PRAY FOR YOU</a>
                    </li>
                </ul>
            </div>
        
        <div class="panel-body bg">
            <div class="tab-content bg">
                <div class="tab-pane fade in active" id="personal">                                      
                    <form class="form-inline" role="form">
                        <div class="row">
                            <h5 class="normalize-h5">PERSONAL REFLECTION</h5>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                <div class="form-group">
                                    <p>Topic:</p>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <select class="form-control" id="selectPersonalTopic">
                                    <option value="">- PRAYER FOR? -</option>
                                    <option value="8">Salvation</option>
                                    <option value="9">Restoration</option>
                                    <option value="1">Guidance / Wisdom</option>
                                    <option value="2">Healing</option>
                                    <option value="3">Protection</option>
                                    <option value="4">Reconciliation</option>
                                    <option value="5">Family</option>
                                    <option value="6">Adoration</option>
                                    <option value="7">Thanksgiving</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                <div class="form-group">
                                    <p>Title:</p>
                                </div>
                            </div>
                            <div class="col-md-11">
                                <input class="form-control input-md" id="PersonalTitle" data-name="Optional" runat="server" placeholder="Optional" type="text" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <p>Blessings of the Day / Week:</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <textarea class="form-control input-md" style="resize:none;" id="PersonalBlessings" runat="server"></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <p>Message to God:</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <textarea class="form-control input-md" style="resize:none;" id="PersonalMessage" runat="server"></textarea>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                    <div class="eltd-listing-search-submit-holder">
                        <button id="btnSavePersonal" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                            <span class="eltd-btn-text">SAVE</span><span aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 prayer">
                    <div class="eltd-listing-search-submit-holder">
                        <button id="btnClearePersonal" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                            <span class="eltd-btn-text">CLEAR</span><span aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
            </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="community">
                    <form class="form-inline" role="form">
                        <div class="row">
                            <h5 class="normalize-h5">PRAYER REQUEST</h5>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                <div class="form-group">
                                    <p>Topic:</p>
                                </div>
                            </div>
                            <div class="col-md-5">
                                <select class="form-control" id="selectCommunityTopic">
                                    <option value="">- PRAYER FOR? -</option>
                                    <option value="8">Salvation</option>
                                    <option value="9">Restoration</option>
                                    <option value="1">Guidance / Wisdom</option>
                                    <option value="2">Healing</option>
                                    <option value="3">Protection</option>
                                    <option value="4">Reconciliation</option>
                                    <option value="5">Family</option>
                                    <option value="6">Adoration</option>
                                    <option value="7">Thanksgiving</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-1">
                                <div class="form-group">
                                    <p>Title:</p>
                                </div>
                            </div>
                            <div class="col-md-11">
                                <input class="form-control input-md" id="CommunityTitle" data-name="Optional" runat="server" placeholder="Optional" type="text" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <p>Prayer Intention:</p>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <textarea class="form-control input-md" style="resize:none;" id="CommunityMessage" runat="server"></textarea>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                    <div class="eltd-listing-search-submit-holder">
                        <button id="btnSaveCommunity" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                            <span class="eltd-btn-text">SAVE</span><span aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6 prayer">
                    <div class="eltd-listing-search-submit-holder">
                        <button id="btnCleareCommunity" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                            <span class="eltd-btn-text">CLEAR</span><span aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
            </div>
                    </form>
                </div>
    </div></div></div></div>
        <br />
    <div class="row">
        <h1 class="moods">PRAY WITH US! ♥</h1>
    </div>
        <br />
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-3">
                <div class="row">
                        <h4 class="church-subtitle">TOPIC</h4>
                        <h6>Date | Name</h6>
                </div>
                <div class="row">
                    <h5 class="messagePrayer">Appa, Thanks for being my strength, thanks for upholding me, Thnks for being with me even when I deny u, U r my Immanuel. Amen</h5>
                </div>
                <div class="row">
                        <center><a><img src="Images/amen-hov.png" alt="AMEN" /></a></center>
                    </div>
                <h6 class="quote-amen">7 Amens</h6>
          </div>
            <div class="col-md-2"></div>
                <div class="col-md-3">
                <div class="row">
                        <h4 class="church-subtitle">TOPIC</h4>
                        <h6>Date | Name</h6>
                </div>
                <div class="row">
                    <h5 class="messagePrayer">Appa, Thanks for being my strength, thanks for upholding me, Thnks for being with me even when I deny u, U r my Immanuel. Amen</h5>
                </div>
                <div class="row">
                        <center><a><img src="Images/amen-hov.png" alt="AMEN" /></a></center>
                    </div>
                <h6 class="quote-amen">7 Amens</h6>
          </div>
            <div class="col-md-2"></div>
        </div>
</div>
</asp:Content>
