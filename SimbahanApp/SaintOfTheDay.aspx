<%@ Page Title="Daily Saints Page" Language="C#" AutoEventWireup="true" CodeBehind="SaintOfTheDay.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SimbahanApp.SaintOfTheDay" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<link href="Content/Site.css" rel="stylesheet"/>
<link href="Content/SimbahanStyle.css" rel="stylesheet"/>
<link href="Content/calendar-blue.css" rel="stylesheet"/>
<link href="Content/Breadcrumbs.css" rel="stylesheet"/>
<link href="Content/custom.css" rel="stylesheet" />

<div class="box-body" style="background-image: url(Images/Background.jpg)">

    <input type="hidden" value="" id="SaintsID" runat="server"/>
    <div class="row">
        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
         <div class="btn-group btn-breadcrumb">
            <a href="default.aspx" class="btn btn-info"><i class="glyphicon glyphicon-home"></i></a>
            <a href="#" class="btn btn-info">Daily Readings</a>
            <a href="#" class="btn btn-info"><strong>Saint Of The Day</strong></a>
        </div>
</div>
            <br /><br />
                       <h2>Saint of the Day &nbsp;<asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox>
                        <button id="MapPicker" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                            <i class="fa fa-calendar fa-2x"></i>
                            <span aria-hidden="true"></span>
                        </button>
                    </h2>
                      </div>
                </div>
                <div class="row">
                    <div runat="server" id="SaintDate" class="text-dated"></div>
                </div>
          
            <br/>
            <br />
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <center><img runat="server" class="img-responsive imagepath" id="ImagePath"/></center>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 clear-padding">
                    <div class="saint-pane">
                        <div class="saint-name-pane">
                            <h3 runat="server" id="FeaturedSaint" class="church-subtitle">
                                <strong><%--St. Francis of Assisi--%></strong>
                            </h3>
                        </div>
                        <div class="saint-info-pane">
                            <p runat="server" id="FeastDay">
                                Feast Day: <span class="text-orange">
                                    <strong><%--October 5--%></strong>
                                </span>
                            </p>
                            <p runat="server" id="PatronOf">
                                Patron of: <span class="text-orange">
                                    <strong><%--Animals, Mechants & Ecology--%></strong>
                                </span>
                            </p>
                            <p runat="server" id="BirthDate">
                                Birth: <span class="text-orange">
                                    <strong><%--1181--%></strong>
                                </span>
                            </p>
                            <p runat="server" id="DeathDate">
                                Death: <span class="text-orange">
                                    <strong><%--1226--%></strong>
                                </span>
                            </p>
                            <p runat="server" id="CanonizedDate">
                                Cannonization: <span class="text-orange">
                                    <strong><%--1226--%></strong>
                                </span>
                            </p>
                        </div>
                    </div>
                    <br/>
                    <%--<div class="row">
                       <div class="eltd-listing-search-submit-holder">
                       <a href="#" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000"><span class="eltd-btn-text">RELATED CHURCHES IN THE COUNTRY</span><span aria-hidden="true"></span></a>               
                    </div>
                </div>--%>
                </div>
                <br/>
                
            </div>
            <br/>
            <div class="row">
                <p class="church-subtitle">
                    <strong>BIOGRAPHY: </strong>
                </p>

                <p runat="server" id="SaintBio" class="church-paragraph">
                    <%--Founder of the Franciscan Order, born at Assisi in Umbria, in 1181.
                <br />
                <br />
                In 1182, Pietro Bernardone returned from a trip to France to find out his wife had given birth to a son. Far from being excited or apologetic because he'd been gone, Pietro was furious because she'd had his new son baptized Giovanni after John the Baptist. The last thing Pietro...--%>
                </p>
                <br/>

            </div>

            <br/>
            <div class="row">
                <div class="col-lg-6 col-md-3 col-sm-12 col-xs-12 mgatf2">
                    <div class="eltd-listing-search-submit-holder">
                        <a href="Saintslisting.aspx" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg pads" data-hover-color="#000" data-hover-border-color="#000">
                            <span class="eltd-btn-text">SEE LIFE OF OTHER SAINTS</span><span aria-hidden="true"></span>
                        </a>
                    </div>
                </div>
                <div class="col-lg-1  col-md-1 col-sm-6 col-xs-6 pull-right mgst2">
                    <div class="eltd-listing-search-submit-holder">
                        <button id="ShareTw" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                            <i class="fa fa-twitter-square fa-2x" aria-hidden="true"></i>
                            <span aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
                <div class="col-lg-1  col-md-1 col-sm-6 col-xs-6 pull-right mgfb2">
                    <div class="eltd-listing-search-submit-holder">
                        <button id="ShareFb" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                            <i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i>
                            <span aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-1 col-md-1 col-sm-12 col-xs-12"></div>
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
            <div class="row-body-pane">
                <h4 class="text-center">
                    <strong>Bible Verse of the Day</strong>
                </h4>

                <div>
                    <p></p>
                    <div runat="server" id="BibleQuote" class="tqquote"></div>
                </div>

                <h4 runat="server" id="BibleVerse" class="tqauthor">
                    <a href="#">
                        <i class="fa fa-facebook-square quote fa-lg"></i>
                    </a>&nbsp;
                    <a href="#">
                        <i class="fa fa-twitter-square quote fa-lg"></i>
                    </a>
                </h4>


                <div class="">
                    <center>
                        <a href="BibleVerses.aspx" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon verse" data-hover-color="#000" data-hover-border-color="#000">
                            <span class="eltd-btn-text">SEE MORE BIBLE VERSES</span><span aria-hidden="true"></span>
                        </a>
                    </center>
                </div>
                <br/>
                <br/>
                <br/>
                <h4 class="text-center">
                    <strong>Inspirational Quote of the Day</strong>
                </h4>
                <div>
                    <p></p>
                    <div runat="server" id="RelQuote" class="tqquote"></div>
                </div>

                <h4 runat="server" id="Author" class="tqauthor">
                    <a href="#">
                        <i class="fa fa-facebook-square quote fa-lg"></i>
                    </a>&nbsp;
                    <a href="#">
                        <i class="fa fa-twitter-square quote fa-lg"></i>
                    </a>
                </h4>
                <div class="">
                    <center>
                        <a href="ReligiousQuotes.aspx" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon verse" data-hover-color="#000" data-hover-border-color="#000">
                            <span class="eltd-btn-text">SEE MORE INSPIRATIONAL QUOTE</span><span aria-hidden="true"></span>
                        </a>
                    </center>
                </div>
            </div>
            <br/>
            <br/>
            <br/>
            <div class="row">
                <div class="row reflection" id="reflection" style="background-image: url(<%= ResolveUrl("Images/ReflectionBackground1.png") %>);">
                    <div class="row">
                        <input id="GReflectTitle" runat="server" class="text-reflect" type="text" placeholder="MY REFLECTION"/>
                    </div>
                    <hr style="border-color: black;"/>
                    <textarea id="GReflectContent" runat="server" class="form-group text-reflection" style="resize: none;" placeholder="I am writing my reflection about the daily gospel here.  I can save this or share this to social media."></textarea>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                            <div class="eltd-listing-search-submit-holder">
                                <button id="btnSaveReflection" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                                    <span class="eltd-btn-text">SAVE</span><span aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">
                            <div class="eltd-listing-search-submit-holder">
                                <button id="btnClearReflection" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                                    <span class="eltd-btn-text">CLEAR</span><span aria-hidden="true"></span>
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>

<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
   <script src="Scripts/jquery.dynDateTime.min.js" type="text/javascript"></script>
<script src="Scripts/calendar-en.min.js" type="text/javascript"></script>
    <script type="text/javascript">


        $(document).ready(function () {

            if ($("#<%= SaintsID.ClientID %>").val() == 0){
                $('#reflection').hide();
            } else {
                $('#reflection').show();
            }

            $("#<%= TextBox1.ClientID %>").dynDateTime({
                showsTime: true,
                ifFormat: "%Y/%m/%d %H:%M",
                daFormat: "%l;%M %p, %e %m, %Y",
                align: "BR",
                electric: false,
                singleClick: true,
                displayArea: ".siblings('.dtcDisplayArea')",
                button: ".next()",
                onUpdate: function() {
                    $("#<%= TextBox1.ClientID %>").trigger('change');
                }
            });


            $("#<%= TextBox1.ClientID %>").change(function (e) {
                $.ajax({
                    type: "POST",
                    url: "SaintOfTheDay.aspx/getSaints",
                    data: JSON.stringify({ date: $("#<%= TextBox1.ClientID %>").val() }),
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        var data = response.d;
                        console.log(data.Id);
                        var hasID = data.Id;

                        if (hasID == 0) {
                            swal("No Saints for this Day", "", "error").then(function () {

                                window.location.reload();
                            });
                        } else {
                            $("#<%= SaintsID.ClientID %>").val(data.Id);

                            //getUserReflection(data.Id);
                            //var dates = $("#<%=TextBox1.ClientID %>").val();
                            $("#<%= SaintDate.ClientID %>").text(data.FormattedDate);
                            $("#<%= FeaturedSaint.ClientID %>").text(data.Name);
                            $("#<%= FeastDay.ClientID %>").text('Feast Day: ' + data.FeastDay);
                            $("#<%= PatronOf.ClientID %>").text('Patron of: ' + data.Patron);
                            $("#<%= BirthDate.ClientID %>").text('Birth: ' + data.BirthDate);
                            $("#<%= DeathDate.ClientID %>").text('Death: ' + data.DeathDate);
                            $("#<%= SaintBio.ClientID %>").text(data.Biography);
                            $("#<%= CanonizedDate.ClientID %>").text('Canonized Date: ' + data.CanonizeDate);
                            $("#<%= ImagePath.ClientID %>").attr('src', data.ImagePath);

                            <%-- if (data.SecondReadingTitle == "") {
                            Control.hide('<%= SaintBio.ClientId %>');
                        } else {
                            Control.show('<%= SaintBio.ClientId %>');
                        }--%>
                            if ($("#<%= SaintsID.ClientID %>").val() == 0){
                                $('#reflection').hide();
                            } else {
                                $('#reflection').show();
                            }
                        }
                    }
                });

                $.ajax({
                    type: "POST",
                    url: "SaintOfTheDay.aspx/GetVerse",
                    data: JSON.stringify({ date: $("#<%= TextBox1.ClientID %>").val() }),
                    contentType: "application/json; charset=utf-8",
                    success: function(response) {
                        var data = response.d;

                        $("#<%= BibleQuote.ClientID %>").text(data.BibleVerseContent);
                        $("#<%= BibleVerse.ClientID %>").text(data.ChapterTitle);

                    }
                });

                $.ajax({
                    type: "POST",
                    url: "SaintOfTheDay.aspx/GetQuote",
                    data: JSON.stringify({ date: $("#<%= TextBox1.ClientID %>").val() }),
                    contentType: "application/json; charset=utf-8",
                    success: function(response) {
                        var data = response.d;

                        $("#<%= RelQuote.ClientID %>").text(data.Quote);
                        $("#<%= Author.ClientID %>").text(data.Author);

                    }
                });
            });


        });


        <%--function getUserReflection(gospelId) {
                (new http).post('DailyGospel.aspx/GetUserReflection', {
                    gospelId: gospelId
                }).then(function (response) {
                    var reflection = response.d;

                    console.log(reflection.Title);

                    $("#<%= GReflectTitle.ClientId%>").val(reflection.Title);
                    $("#<%= GReflectContent.ClientId%>").val(reflection.ReflectionContent);
                }).run();
            }
        })--%>

        $("#ShareTw").click(function(e) {
            e.preventDefault();

            var message = "Saint of the day (" + $("#<%= SaintDate.ClientID %>").text() + ")\n" + $("#<%= FeaturedSaint.ClientID %>").text() + "\n\n http://www.mycatholicportal.org/Saint/" + $("#<%= SaintsID.ClientID %>").val() + " @SimbahanApp";

            window.open("https://twitter.com/intent/tweet?text=" + encodeURI(message),
                "Share to Twitter",
                "width=500,height=300");
        });

        $("#ShareFb").click(function(e) {
            e.preventDefault();
            var message = "";

            window.open(
                "https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/Saint/" +
                $("#<%= SaintsID.ClientID %>").val() +
                "&caption=" +
                encodeURI(message) +
                "&description=" +
                encodeURI(message) +
                "&properties={text" +
                encodeURI(message),
                "}",
                "Share To Facebook",
                "width=500,height=300");
        });

        $("#btnClearReflection").click(function(e) {
            e.preventDefault();

            if ($("#<%= GReflectContent.ClientID %>").val() != '' ||
                $("#<%= GReflectTitle.ClientID %>").val() != '') {

                swal({
                    title: 'Are you sure you want to discard what you wrote?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes',
                    cancelButtonText: 'No'
                }).then(function() {
                    swal(
                        'Changes Discarded!',
                        'We have reset your reflection.',
                        'success'
                    );

                    $("#<%= GReflectContent.ClientID %>").val('');
                    $("#<%= GReflectTitle.ClientID %>").val('');
                });
            }
        });

        $("#btnSaveReflection").click(function(e) {
            e.preventDefault();

            if (!isAuth) {
                document.cookie = "intendedRedirect=" + currentPage + ";";
                window.location.href = "Login.aspx";
                return;
            }

            if ($("#<%= SaintsID.ClientID %>").val() == 0) {
                alert('No Saint Available!');
                return;
            }

            swal({
                title: 'Are you sure you want to save your changes?',
                text: "This may discard your previously written reflection.",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes',
                cancelButtonText: 'No',
                showLoaderOnConfirm: true,
                preConfirm: function() {
                    return new Promise(function(resolve, reject) {
                        (new http).post('<%= ResolveUrl("SaintOfTheDay.aspx/SaveSaintReflection") %>',
                            {
                                saintId: $("#<%= SaintsID.ClientID %>").val(),
                                title: $("#<%= GReflectTitle.ClientID %>").val(),
                                content: $("#<%= GReflectContent.ClientID %>").val()
                            }).then(function(data) {
                            resolve();
                        }).whenError(function() {
                            reject('Something went wrong.');
                        }).run();
                    });
                }
            }).then(function() {
                swal(
                    'Saved!',
                    'Your reflection has been saved.',
                    'success'
                );

            });
        });
    </script>
</asp:Content>