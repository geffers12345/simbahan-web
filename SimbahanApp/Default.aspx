<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SimbahanApp._Default" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <script type='text/javascript' src='<%= ResolveUrl("Scripts/SearchCity.js") %>'></script>
    <link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet" />
    <link href='<%= ResolveUrl("Content/set1.css") %>' rel="stylesheet" />
    <link href='<%= ResolveUrl("Content/video.css") %>' rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <a id='eltd-back-to-top' href='#'>
        <span class="eltd-icon-stack">
            <span aria-hidden="true" class="eltd-icon-font-elegant arrow_carrot-up  "></span><span aria-hidden="true" class="eltd-icon-font-elegant arrow_carrot-up  "></span></span>
    </a>

    <div class="eltd-content" style="margin-top: 0">
        <div class="eltd-content-inner">
            <div class="eltd-full-width">
                <div class="eltd-full-width-inner">
                    <div data-eltd-parallax-speed="1" class="vc_row wpb_row vc_row-fluid eltd-section vc_custom_1486709029378 eltd-content-aligment-center eltd-parallax-section-holder eltd-parallax-section-holder-touch-disabled eltd-grid-section eltd-full-screen-height-parallax eltd-vertical-middle-align" style="/*background-image: url(Images/header.jpg);*/ height: 300px; background-position: 50% 0;">
                       
                        <div class="eltd-parallax-content-outer">
                             <video autoplay loop muted>
                            <source src='<%= ResolveUrl("Images/churchvid.mp4") %>' type="video/mp4">
                        </video>
                        <img src="Images/quaipochurch.jpg" id="imgBG"/>
                            <div class="clearfix eltd-section-inner">
                                <div class="eltd-section-inner-margin clearfix">
                                    <div class="wpb_column vc_column_container vc_col-sm-12 vc_col-xs-12 vc_col-md-12 vc_col-lg-12 ">
                                        <div class="vc_column-inner ">
                                            <div class="wpb_wrapper">
                                                <div class="eltd-custom-font-holder" style="font-family: Chaparral Pro Light; font-size: 72px; line-height: 95px; font-style: italic; font-weight: 500; letter-spacing: 0px; text-align: center; color: #ffffff" data-font-size="72" data-line-height="95">
                                                    My Catholic Portal
                                                </div>
                                                <div class="wpb_text_column wpb_content_element ">
                                                    <div class="wpb_wrapper">
                                                        <p style="text-align: center; color: #fff; font-family: Cambria; font-size: 25px;"><i>Your Single Access to All </i><i>Your </i><i>Catholic Needs</i></p>

                                                    </div>
                                                </div>
                                                <div class="vc_empty_space" style="height: 30px;"><span class="vc_empty_space_inner"></span></div>

                                                <div class="eltd-listing-search-field" style="text-align: left;">
                                                    <span style="color: snow;">Find Catholic Churches or Organizations</span>
                                                </div>

                                                <%--<form method="get" action="/">--%>
                                                    <div class="eltd-listing-search-holder">
                                                        <div class="clearfix">
                                                            <div class="eltd-listing-search-field keywords">
                                                                <input type="text" placeholder="Keywords" name="keywords" id="keywords">
                                                            </div>

                                                            <div class="eltd-listing-search-field location">
                                                                <input type="text" placeholder="Location" name="autocomplete" id="autocomplete">
                                                            </div>

                                                            <div class="eltd-listing-search-field category">
                                                                <select name="type" id="category">
                                                                    <option value="All">All Categories</option>
                                                                    <option value="Church">Catholic Churches</option>
                                                                    <option value="Organizations">Catholic Organizations</option>
                                                                    <option value="Adoration">Adoration Chapels	</option>
                                                                </select>
                                                            </div>

                                                            <div class="eltd-listing-search-field" style="width: 15px;">
                                                                <button id="btnSearch" type="submit" class="eltd-btn eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon search" data-hover-color="#fff" data-hover-border-color="#fff">
                                                                    <span class="icon-magnifier"></span>
                                                                    <span aria-hidden="true" class="eltd-icon-font-elegant"></span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <div class="eltd-listing-search-submit-holder">
                                                            <button id="btnAdvancedSearch" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon" data-hover-color="#fff" data-hover-border-color="#fff"><span class="eltd-btn-text">Advanced Search</span><span aria-hidden="true" class="eltd-icon-font-elegant arrow_carrot-right "></span></button>
                                                        </div>
                                                    </div>
                                                <%--</form>--%>
                                                <div class="vc_empty_space" style="height: 40px;"><span class="vc_empty_space_inner"></span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vc_empty_space" style="background-color: white; height: 100px;"><span class="vc_empty_space_inner"></span></div>
                    <div class="vc_row wpb_row vc_row-fluid eltd-section vc_custom_1459245285911 eltd-content-aligment-center eltd-grid-section" style="background-color: white;">
                        <div class="clearfix eltd-section-inner">
                            <div class="eltd-section-inner-margin clearfix">
                                <div class="wpb_column vc_column_container vc_col-sm-10 vc_col-lg-offset-3 vc_col-lg-6 vc_col-md-offset-1 vc_col-md-10 vc_col-sm-offset-1">
                                    <div class="vc_column-inner ">
                                        <div class="wpb_wrapper">
                                            <div class="wpb_text_column wpb_content_element ">
                                                <div class="wpb_wrapper">
                                                    <h2>Want to Talk to God Daily?</h2>

                                                </div>
                                            </div>
                                            <div class="eltd-separator-with-icon-holder clearfix  eltd-separator-center" style="margin-top: 8px">
                                                <div class="eltd-separator">
                                                    <span style="width: 85px; height: 1px"></span>
                                                </div>
                                                <div class="eltd-separator-icon">
                                                    <i class="eltd-icon-simple-line-icon icon-bubble "></i>
                                                </div>
                                                <div class="eltd-separator">
                                                    <span style="width: 85px; height: 1px"></span>
                                                </div>
                                            </div>
                                            <div class="wpb_text_column wpb_content_element ">
                                                <div class="wpb_wrapper">
                                                    <p>Visit our <a href="DailyGospel.aspx" style="color:skyblue">Daily Readings</a> page to hear God’s daily message for you</p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vc_empty_space" style="background-color: white; height: 30px"><span class="vc_empty_space_inner"></span></div>
                   
                    <div class="row" style="background-color: white; padding-left: 10px;"> 
                        <div class="col-md-1 col-sm-12 col-xs-12"></div>
                        <div class="col-md-3 col-sm-2 col-xs-12">
                            <div class="grid">
                                <figure class="effect-zoe">
                                    <a href='<%= ResolveUrl("DailyGospel.aspx") %>'><img src='<%= ResolveUrl("Images/DailyGospel.png") %>' />
                                    <figcaption>
                                        <h3>Daily <span>Gospel</span></h3>
                                        <p class="icon-links">
                                            <%--<a href="#"><span class="icon-heart"></span></a>
                                            <a href="#"><span class="icon-eye"></span></a>
                                            <a href="#"><span class="icon-paper-clip"></span></a>--%>
                                        </p>
                                        <%--<p class="description">Zoe never had the patience of her sisters. She deliberately punched the bear in his face.</p>--%>
                                    </figcaption></a>
                                </figure>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="grid">
                            <figure class="effect-zoe">
                                <a href='<%= ResolveUrl("DailyReflection.aspx") %>'><img src='<%= ResolveUrl("Images/DailyReflection.png") %>' />
                                <figcaption>
                                    <h3>Daily <span>Reflection</span></h3>
                                    <p class="icon-links">
                                       <%-- <a href="#"><span class="icon-heart"></span></a>
                                        <a href="#"><span class="icon-eye"></span></a>
                                        <a href="#"><span class="icon-paper-clip"></span></a>--%>
                                    </p>
                                    <%--<p class="description">Zoe never had the patience of her sisters. She deliberately punched the bear in his face.</p>--%>
                                </figcaption></a>
                            </figure>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="grid">
                            <figure class="effect-zoe">
                                <a href='<%= ResolveUrl("SaintOfTheDay.aspx") %>'><img src='<%= ResolveUrl("Images/SaintOfTheDay.png") %>' />
                                <figcaption>
                                    <h3><span>Saint of the Day</span></h3>
                                    <p class="icon-links">
                                       <%-- <a href="#"><span class="icon-heart"></span></a>
                                        <a href="#"><span class="icon-eye"></span></a>
                                        <a href="#"><span class="icon-paper-clip"></span></a>--%>
                                    </p>
                                    <%--<p class="description">Zoe never had the patience of her sisters. She deliberately punched the bear in his face.</p>--%>
                                </figcaption></a>
                            </figure>
                            </div>
                        </div>
                        <div class="col-md-1 col-sm-12 col-xs-12"></div>
                    </div>

                    <div class="vc_empty_space" style="height: 100px; background-color: white;"><span class="vc_empty_space_inner"></span></div>
                    <div class="vc_empty_space" style="height: 100px; background-color: #fafafa;"><span class="vc_empty_space_inner"></span></div>
                    <div class="vc_row wpb_row vc_row-fluid eltd-section vc_custom_1459246838864 eltd-content-aligment-center eltd-grid-section" style="background-color: #fafafa;">
                        <div class="clearfix eltd-section-inner">
                            <div class="eltd-section-inner-margin clearfix">
                                <div class="wpb_column vc_column_container vc_col-sm-10 vc_col-lg-offset-3 vc_col-lg-6 vc_col-md-offset-1 vc_col-md-10 vc_col-sm-offset-1">
                                    <div class="vc_column-inner ">
                                        <div class="wpb_wrapper">
                                            <div class="wpb_wrapper">
                                                <h2>Want to Connect to God on a Deeper Level?</h2>
                                            </div>
                                        </div>
                                        <div class="eltd-separator-with-icon-holder clearfix  eltd-separator-center" style="margin-top: 7px">
                                            <div class="eltd-separator">
                                                <span style="width: 85px; height: 1px"></span>
                                            </div>
                                            <div class="eltd-separator-icon">
                                                <i class="eltd-icon-simple-line-icon icon-trophy "></i>
                                            </div>
                                            <div class="eltd-separator">
                                                <span style="width: 85px; height: 1px"></span>
                                            </div>
                                        </div>
                                        <div class="wpb_text_column wpb_content_element ">
                                            <div class="wpb_wrapper">
                                                <p>Know More About the Prayers, Devotions &amp; Traditions Practiced by Catholics Around the World</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vc_empty_space" style="height: 30px; background-color: #fafafa;"><span class="vc_empty_space_inner"></span></div>
                  
                    <div class="row" style="background-color: #fafafa; padding-left: 10px;">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-1 col-sm-12 col-xs-12"></div>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="grid">
                                <figure class="effect-zoe">
                                    <a href='<%= ResolveUrl("BasicCatholicPrayers.aspx") %>'><img src='<%= ResolveUrl("Images/BCPrayers.png") %>' />
                                    <figcaption>
                                        <h4>Basic Catholic Prayers</h4>
                                        <p class="icon-links">
                                            <%--<a href="#"><span class="icon-heart"></span></a>
                                            <a href="#"><span class="icon-eye"></span></a>
                                            <a href="#"><span class="icon-paper-clip"></span></a>--%>
                                        </p>
                                        <p class="description mm" style="font-size: 20px; background-color: black;">Revisit the Traditional Prayers of our Catholic Religion.</p></figcaption></a>
                          </figure>
                                </div></div>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="grid">
                                <figure class="effect-zoe">
                                    <a href='<%= ResolveUrl("OtherCatholicPrayers.aspx") %>'><img src='<%= ResolveUrl("Images/OCPrayers.png") %>' />
                                    <figcaption>
                                        <h4>Other Catholic Prayers</h4>
                                        <p class="icon-links">
                                            <%--<a href="#"><span class="icon-heart"></span></a>
                                            <a href="#"><span class="icon-eye"></span></a>
                                            <a href="#"><span class="icon-paper-clip"></span></a>--%>
                                        </p>
                                        <p class="description mm" style="font-size: 20px; background-color: black;">Discover Other Prayers Listed per Intention and per Title to help you through each phase of your life.</p></figcaption></a>
                                </figure>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="grid">
                            <figure class="effect-zoe">
                               <a href='<%= ResolveUrl("Devotions.aspx") %>'><img src='<%= ResolveUrl("Images/DTraditions.png") %>' />
                                <figcaption>
                                    <h4>Devotions & Traditions</h4>
                                    <p class="icon-links">
                                       <%-- <a href="#"><span class="icon-heart"></span></a>
                                        <a href="#"><span class="icon-eye"></span></a>
                                        <a href="#"><span class="icon-paper-clip"></span></a>--%>
                                    </p> 
                                    <p class="description mm" style="font-size: 20px; background-color: black;">Discover the Traditional Prayers of our Catholic Religion.</p></figcaption></a>
                            </figure>
                            </div>
                        </div>
                            <div class="col-md-1 col-sm-12 col-xs-12"></div>
                    </div>
                   </div>

                    <div class="vc_empty_space" style="height: 100px; background-color: #fafafa;"><span class="vc_empty_space_inner"></span></div>
                    <div data-eltd-parallax-speed="1" class="vc_row wpb_row vc_row-fluid eltd-section eltd-content-aligment-center eltd-grid-section" style="background-image: url(<%= ResolveUrl("Images/PrayerWall.png") %>); min-height: 750px; height: auto;">
                        <div class="clearfix eltd-section-inner prayer">
                            <div class="eltd-section-inner-margin clearfix">
                                <div class="wpb_column vc_column_container vc_col-sm-10 vc_col-lg-offset-2 vc_col-lg-8 vc_col-md-offset-1 vc_col-md-10 vc_col-sm-offset-1">
                                    <div class="vc_column-inner ">
                                        <div class="wpb_wrapper">
                                            <div class="vc_empty_space" style="height: 10px;"><span class="vc_empty_space_inner"></span></div>

                                            <div class="wpb_text_column wpb_content_element ">
                                                <div class="wpb_wrapper">
                                                    <h2><span style="color: #ffffff; font-family: Helvetica; font-size: 115px; text-shadow: black;">Prayer Wall</span></h2>
                                                </div>
                                            </div>
                                            <div class="vc_empty_space" style="height: 15px;"><span class="vc_empty_space_inner"></span></div>

                                            <div class="wpb_text_column wpb_content_element ">
                                                <div class="wpb_wrapper">
                                                    <p style="text-align: center; color: #ffffff; font-family: Yu Gothic Light; font-size: 14px;"><b>Your online prayer wall where you can write your own prayer in your personal wall, and/or post a prayer in the community wall and join others in praying for specific prayer intentions.</b></p>

                                                </div>
                                            </div>
                                            <div class="vc_empty_space" style="height: 48px;"><span class="vc_empty_space_inner"></span></div>
                                           <%-- <a href="#" target="_self" style="color: #ff0000; border-color: #ff0000; font-weight: 100; margin: 0 12px 10px 18px" class="eltd-btn eltd-btn-medium eltd-btn-outline eltd-btn-custom-hover-bg eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon" data-hover-bg-color="#1ab5c1" data-hover-color="#ffffff" data-hover-border-color="#1ab5c1">--%>
                                                <span class="eltd-btn-text" style="color: #ff0000; font-weight: 900; font-size: 30px; background-color: black;"><%--CREATE A PRAYER--%>AVAILABLE SOON</span>
                                                <%--<span aria-hidden="true" class="eltd-icon-font-elegant arrow_carrot-right "></span></a>--%>
                                            <div class="vc_empty_space" style="height: 40px;"><span class="vc_empty_space_inner"></span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vc_empty_space" style="height: 100px; background-color: white;"><span class="vc_empty_space_inner"></span></div>
                    <div class="vc_row wpb_row vc_row-fluid eltd-section vc_custom_1459250987178 eltd-content-aligment-center eltd-grid-section" style="background-color: white;">
                        <div class="clearfix eltd-section-inner">
                            <div class="eltd-section-inner-margin clearfix">
                                <div class="wpb_column vc_column_container vc_col-sm-10 vc_col-lg-offset-3 vc_col-lg-6 vc_col-md-offset-1 vc_col-md-10 vc_col-sm-offset-1">
                                    <div class="vc_column-inner ">
                                        <div class="wpb_wrapper">
                                            <div class="wpb_text_column wpb_content_element ">
                                                <div class="wpb_wrapper">
                                                    <h2>Looking for the Right Motivations in Life?</h2>

                                                </div>
                                            </div>
                                            <div class="eltd-separator-with-icon-holder clearfix  eltd-separator-center" style="margin-top: 7px">
                                                <div class="eltd-separator">
                                                    <span style="width: 85px; height: 1px"></span>
                                                </div>
                                                <div class="eltd-separator-icon">
                                                    <i class="eltd-icon-simple-line-icon icon-present "></i>
                                                </div>
                                                <div class="eltd-separator">
                                                    <span style="width: 85px; height: 1px"></span>
                                                </div>
                                            </div>
                                            <div class="wpb_text_column wpb_content_element ">
                                                <div class="wpb_wrapper">
                                                    <p>Get your heavy dosage of inspiration for the soul through our Inspirations Page</p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vc_empty_space" style="height: 30px; background-color: white;"><span class="vc_empty_space_inner" style="background-color: white;"></span></div>
                   
                     <div class="row" style="background-color: white; padding-left: 10px;">
                        <div class="col-md-1 col-sm-12 col-xs-12"></div>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="grid">
                                <figure class="effect-zoe">
                                    <a href='<%= ResolveUrl("BibleVerses.aspx") %>'><img class="img-responsive" src='<%= ResolveUrl("Images/BibleVerses.png") %>' />
                                    <figcaption>
                                        <h4>Bible Verses</h4>
                                        <p class="icon-links">
                                            <%--<a href="#"><span class="icon-heart"></span></a>
                                            <a href="#"><span class="icon-eye"></span></a>
                                            <a href="#"><span class="icon-paper-clip"></span></a>--%>
                                        </p>
                                        <p class="description mm" style="font-size: 20px; background-color: black;">Verses from the Bible categorized according to your mood to inspire you.</p>
                                    </figcaption></a>
                                </figure>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="grid">
                                <figure class="effect-zoe">
                                    <a href='<%= ResolveUrl("ReligiousQuotes.aspx") %>'><img class="img-responsive" src='<%= ResolveUrl("Images/RelQuotes.png") %>' />
                                    <figcaption>
                                        <h4>Religious Quotes</h4>
                                        <p class="icon-links">
                                            <%--<a href="#"><span class="icon-heart"></span></a>
                                            <a href="#"><span class="icon-eye"></span></a>
                                            <a href="#"><span class="icon-paper-clip"></span></a>--%>
                                        </p>
                                        <p class="description mm" style="font-size: 20px; background-color: black;">Let religious quotes categorized per mood motivate you forward.</p>
                                    </figcaption></a>
                                </figure>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="grid">
                            <figure class="effect-zoe">
                               <a href='<%= ResolveUrl("MusicalInspirations.aspx") %>'><img class="img-responsive" src='<%= ResolveUrl("Images/Musical.png") %>' />
                                <figcaption>
                                    <h4>Musical Inspirations</h4>
                                    <p class="icon-links">
                                       <%-- <a href="#"><span class="icon-heart"></span></a>
                                        <a href="#"><span class="icon-eye"></span></a>
                                        <a href="#"><span class="icon-paper-clip"></span></a>--%>
                                    </p>
                                    <p class="description mm" style="font-size: 20px; background-color: black;">Listen and be inspired by Religious Songs organized just for you.</p>
                                </figcaption></a>
                            </figure>
                            </div>
                        </div>
                        <div class="col-md-1 col-sm-12 col-xs-12"></div>
                    </div>

                    <div class="vc_empty_space" style="height: 100px; background-color: white;"><span class="vc_empty_space_inner"></span></div>
                    <div class="vc_empty_space" style="height: 100px; background-color: #fafafa;"><span class="vc_empty_space_inner"></span></div>
                    <div class="vc_row wpb_row vc_row-fluid eltd-section vc_custom_1459250987178 eltd-content-aligment-center eltd-grid-section" style="background-color: #fafafa;">
                        <div class="clearfix eltd-section-inner">
                            <div class="eltd-section-inner-margin clearfix">
                                <div class="wpb_column vc_column_container vc_col-sm-10 vc_col-lg-offset-3 vc_col-lg-6 vc_col-md-offset-1 vc_col-md-10 vc_col-sm-offset-1">
                                    <div class="vc_column-inner ">
                                        <div class="wpb_wrapper">
                                            <div class="wpb_text_column wpb_content_element ">
                                                <div class="wpb_wrapper">
                                                    <h2>See How We Make Your Church Visits Easier</h2>
                                                </div>
                                            </div>
                                            <div class="eltd-separator-with-icon-holder clearfix  eltd-separator-center" style="margin-top: 7px">
                                                <div class="eltd-separator">
                                                    <span style="width: 85px; height: 1px"></span>
                                                </div>
                                                <div class="eltd-separator-icon">
                                                    <i class="eltd-icon-simple-line-icon icon-star "></i>
                                                </div>
                                                <div class="eltd-separator">
                                                    <span style="width: 85px; height: 1px"></span>
                                                </div>
                                            </div>
                                            <div class="wpb_text_column wpb_content_element ">
                                                <div class="wpb_wrapper">
                                                    <p>Discover How the Visita Iglesia Page Makes your Church Visits or Pilgrimage Easier</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="vc_empty_space" style="height: 30px; background-color: #fafafa;"><span class="vc_empty_space_inner"></span></div>
                    
                      <div class="row" style="background-color: #fafafa; padding-left: 10px;">
                        <div class="col-md-1 col-sm-12 col-xs-12"></div>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="grid">
                                
                                    <img src='<%= ResolveUrl("Images/InputDetails.png") %>' />
                           
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="grid">
                                
                                    <img src='<%= ResolveUrl("Images/FilterChurch.png") %>' />
                                
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="grid">
                           
                                <img src='<%= ResolveUrl("Images/TrackShareProgress.png") %>' />
                            
                            </div>
                        </div>
                        <div class="col-md-1 col-sm-12 col-xs-12"></div>
                    </div>
                    <div class="row" style="background-color: #fafafa;">
                          <center><div class="eltd-listing-search-submit-holder">
                              <a href="VisitaIglesia.aspx" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon" data-hover-color="#000" data-hover-border-color="#000"><span class="eltd-btn-text">Take a Visit </span><span aria-hidden="true" class="eltd-icon-font-elegant arrow_carrot-right"></span></a>
                          </div></center>
                    </div>

                    <div class="vc_empty_space" style="height: 100px; background-color: #fafafa;"><span class="vc_empty_space_inner"></span></div>
                </div>
            </div>
        </div>
        <!-- close div.content_inner -->
    </div>
</asp:Content>

<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <script type="text/javascript">
        
        $(document).on('click', '#btnSearch', function (e) {
            e.preventDefault();

            window.location.href = 'church_organization.aspx?keywords=' + $("#keywords").val() + '&location=' + $("#autocomplete").val() + '&category=' + $("#category").val() + '&redirect=default';
        });

        $(document).on('click', '#btnAdvancedSearch', function (e) {
            e.preventDefault();

            window.location.href = 'church_organization.aspx?keywords=' + $("#keywords").val() + '&location=' + $("#autocomplete").val() + '&category=' + $("#category").val() + '&redirect=default&type=advance';
        });
    </script>
</asp:Content>