<%@ Page Title="Daily Reflection Page" Language="C#" AutoEventWireup="true" CodeBehind="DailyReflection.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SimbahanApp.DailyReflection" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet"/>
<link href='<%= ResolveUrl("Content/calendar-blue.css") %>' rel="stylesheet"/>

<div class="box-body" style="background-image: url(<%= ResolveUrl("Images/Background.jpg") %>)">
<input type="hidden" id="ReflectionID" runat="server"/>
<div class="row">
<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
    <div class="row">
        <div class="col-md-12">
            <h2>
                Daily Reflection &nbsp;<asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox>
                <button id="MapPicker" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                    <i class="fa fa-calendar fa-2x"></i>
                    <span aria-hidden="true"></span>
                </button>
            </h2>
        </div>

    </div>
    <div class="row">
        <div runat="server" id="ReflectionDate" class="text-dated"><%--Sunday, December 11, 2016--%></div>
    </div>

    <br/>
    <section id="FirstContent">
        <h3 class="church-subtitle">
            <strong>MEDITATION:</strong>
        </h3>
        <h3 runat="server" id="FirstTitle"></h3>
        <br/>
        <p runat="server" id="FContent" class="church-paragraph">

        </p>
    </section>
    <br/>
    <section runat="server" id="SecondContent">
        <h3 runat="server" id="SCTitle"></h3>

        <br/>

        <p runat="server" id="SContent" class="church-paragraph">

        </p>
    </section>

    <br/>
    <section runat="server" id="ThirdContent">
        <h3 runat="server" id="TCTitle"></h3>

        <br/>

        <p runat="server" id="TContent" class="church-paragraph">

        </p>
    </section>
    <br/>

    <section runat="server" id="FourthContent">
        <h3 runat="server" id="FTitle"><%--Luke 8:15--%></h3>

        <br/>
        <p runat="server" id="FTContent" class="church-paragraph">

        </p>
    </section>
    <br/>

    <section runat="server" id="FifthContent">
        <h3 runat="server" id="FiveTitle"><%--Luke 8:15--%></h3>

        <br/>
        <p runat="server" id="FiveContent" class="church-paragraph">

        </p>
    </section>
    <br/>

    <section runat="server" id="SixthContent">
        <h3 runat="server" id="SixTitle"><%--Luke 8:15--%></h3>

        <br/>
        <p runat="server" id="SixContent" class="church-paragraph">

        </p>
    </section>
    <br/>

    <section id="ReflectionPrayer">
        <p runat="server" id="PContent" class="church-paragraph">

        </p>
    </section>

    <br/>
    <div class="row">
        <div runat="server" id="SourceContent" class="text-muted">
            <strong><%--http://dailyscripture.servantsoftheword.org/readings/--%></strong>
        </div>
    </div>
    <br/>
    <div class="row">
        <div class="col-lg-6 col-md-3 col-sm-2 col-xs-2">
            <div class="eltd-listing-search-submit-holder">
                <a href='<%= ResolveUrl("DailyGospel.aspx") %>' type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                    <span class="eltd-btn-text">SEE THIS DAY'S GOSPEL</span><span aria-hidden="true"></span>
                </a>
            </div>
        </div>
        <div class="col-lg-1  col-md-1 col-sm-6 col-xs-12 pull-right">
            <div class="eltd-listing-search-submit-holder">
                <button id="ShareTw" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                    <i class="fa fa-twitter-square fa-2x" aria-hidden="true"></i>
                    <span aria-hidden="true"></span>
                </button>
            </div>
        </div>
        <div class="col-lg-1  col-md-1 col-sm-6 col-xs-12 pull-right">
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
    <div class="row">
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
                <a href='<%= ResolveUrl("BibleVerses.aspx") %>' type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon verse" data-hover-color="#000" data-hover-border-color="#000">
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
                <a href='<%= ResolveUrl("ReligiousQuotes.aspx") %>' type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon verse" data-hover-color="#000" data-hover-border-color="#000">
                    <span class="eltd-btn-text">SEE MORE INSPIRATIONAL QUOTE</span><span aria-hidden="true"></span>
                </a>
            </center>
        </div>
    </div>
    <br/>
    <br/>
    <br/>
    <div class="row">
        <div class="row reflection" style="background-image: url(Images/ReflectionBackground1.png);">
            <div class="row">
                <input id="DReflectTitle" runat="server" class="text-reflect" type="text" placeholder="MY REFLECTION"/>
            </div>
            <hr style="border-color: black;"/>
            <textarea id="DReflectContent" runat="server" class="form-group text-reflection" style="resize: none;" placeholder="I am writing my reflection about the daily gospel here.  I can save this or share this to social media."></textarea>
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
                        <button id="btnClearReflection" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                            <span class="eltd-btn-text">CLEAR</span><span aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
                <%--<div class="col-lg-2  col-md-2 col-sm-6 col-xs-6">
                    <div class="eltd-listing-search-submit-holder">
                        <button id="ShareFaceb" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                            <i class="fa fa-facebook-square" aria-hidden="true"></i>
                            <span aria-hidden="true"></span>
                        </button>
                    </div>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-6 col-xs-6">
                    <div class="eltd-listing-search-submit-holder">
                        <button id="ShareTwit" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                            <i class="fa fa-twitter-square" aria-hidden="true"></i>
                            <span aria-hidden="true"></span>
                        </button>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</asp:Content>

<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
<script src='<%= ResolveUrl("Scripts/jquery.dynDateTime.min.js") %>' type="text/javascript"></script>
<script src='<%= ResolveUrl("Scripts/calendar-en.min.js") %>' type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {

        $('#btnClearReflection').click(function(e) {
            e.preventDefault();

            if ($("#<%= DReflectTitle.ClientID %>").val() != '' ||
                $("#<%= DReflectContent.ClientID %>").val() != '') {

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

                    $("#<%= DReflectTitle.ClientID %>").val('');
                    $("#<%= DReflectContent.ClientID %>").val('');
                });
            }
        });

        $('#btnSaveReflection').click(function(e) {
            e.preventDefault();

            if (!isAuth) {
                document.cookie = "intendedRedirect=" + currentPage + ";";
                window.location.href = "Login.aspx";
                return;
            }

            <%--if ($("#<%= DReflectTitle.ClientID %>").val() == "" && $("#<%= DReflectContent.ClientID %>").val() == "")            return;--%>

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
                        (new http()).post('<%= ResolveUrl("DailyReflection.aspx/SaveDailyReflectionReflection") %>',
                            {
                                reflectionId: $("#<%= ReflectionID.ClientID %>").val(),
                                title: $("#<%= DReflectTitle.ClientID %>").val(),
                                content: $("#<%= DReflectContent.ClientID %>").val()
                            }).then(function(response) {
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
       $(document).on('click',
            '#ShareTw',
            function(e) {
                e.preventDefault();

                var date = '(' +
                    $("#<%= ReflectionDate.ClientID %>").text().split(',')[1] +
                    ',' +
                    $("#<%= ReflectionDate.ClientID %>").text().split(',')[2] +
                    ')';
                var tweet = 'DAILY REFLECTION ' +
                    date +
                    '\nMEDITATION: ' +
                    $('#<%= FirstTitle.ClientID %>').text().substr(0, 40) +
                    '... ' +
                    '\n' +
                    'http://www.mycatholicportal.org/DailyReflection/' +
                    $("#<%= ReflectionID.ClientID %>").val();

                Share.toTwitter(tweet);

            });

        $(document).on('click',
            '#ShareFb',
            function(e) {
                e.preventDefault();

                var reflectionId = $("#<%= ReflectionID.ClientID %>").val();

                Share.toFacebook('http://www.mycatholicportal.org/DailyReflection/' + reflectionId);
            });


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

        $("#<%= TextBox1.ClientID %>").change(function(e) {
            $.ajax({
                type: "POST",
                url: '<%= ResolveUrl("DailyReflection.aspx/GetReflection") %>',
                data: JSON.stringify({ date: $("#<%= TextBox1.ClientID %>").val() }),
                contentType: "application/json; charset=utf-8",
                success: function(response) {
                    var data = response.d;

                    $("#<%= ReflectionID.ClientID %>").val(data.Id);

                    getUserReflection(data.Id);

                    $("#<%= ReflectionDate.ClientID %>").text(data.FormattedDate);

                    $("#<%= FirstTitle.ClientID %>").text(data.FirstContentTitle);
                    $("#<%= FContent.ClientID %>").text(data.FirstContent);
                    $("#<%= SCTitle.ClientID %>").text(data.SecondContentTitle);
                    $("#<%= SContent.ClientID %>").text(data.SecondContent);
                    $("#<%= TCTitle.ClientID %>").text(data.ThirdContentTitle);
                    $("#<%= TContent.ClientID %>").text(data.ThirdContent);
                    $("#<%= FTitle.ClientID %>").text(data.FourthContentTitle);
                    $("#<%= FTContent.ClientID %>").text(data.FourthContent);
                    $("#<%= FiveTitle.ClientID %>").text(data.FifthContentTitle);
                    $("#<%= FiveContent.ClientID %>").text(data.FifthContent);
                    $("#<%= SixTitle.ClientID %>").text(data.SixthContentTitle);
                    $("#<%= SixContent.ClientID %>").text(data.SixthContent);
                    $("#<%= PContent.ClientID %>").text(data.Prayer);
                    $("#<%= BibleQuote.ClientID %>").text(data.BibleVerseContent);
                    $("#<%= BibleVerse.ClientID %>").text(data.ChapterTitle);

                    if (data.SecondContent == "") {
                        Control.hide('<%= SCTitle.ClientID %>');
                        Control.hide('<%= SContent.ClientID %>');
                    } else {
                        Control.show('<%= SCTitle.ClientID %>');
                        Control.show('<%= SContent.ClientID %>');
                    }

                    if (data.ThirdContent == "") {
                        Control.hide('<%= TCTitle.ClientID %>');
                        Control.hide('<%= TContent.ClientID %>');
                    } else {
                        Control.show('<%= TCTitle.ClientID %>');
                        Control.show('<%= TContent.ClientID %>');
                    }

                    if (data.FourthContent == "") {
                        Control.hide('<%= FTitle.ClientID %>');
                        Control.hide('<%= FTContent.ClientID %>');
                    } else {
                        Control.show('<%= FTitle.ClientID %>');
                        Control.show('<%= FTContent.ClientID %>');
                    }

                    if (data.FifthContent == "") {
                        Control.hide('<%= FiveTitle.ClientID %>');
                        Control.hide('<%= FiveContent.ClientID %>');
                    } else {
                        Control.show('<%= FiveTitle.ClientID %>');
                        Control.show('<%= FiveContent.ClientID %>');
                    }

                    if (data.SixthContent == "") {
                        Control.hide('<%= SixTitle.ClientID %>');
                        Control.hide('<%= SixContent.ClientID %>');
                    } else {
                        Control.show('<%= SixTitle.ClientID %>');
                        Control.show('<%= SixContent.ClientID %>');
                    }
                }
            });

            $.ajax({
                type: "POST",
                url: '<%= ResolveUrl("DailyReflection.aspx/GetVerse") %>',
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
                url: '<%= ResolveUrl("DailyReflection.aspx/GetQuote") %>',
                data: JSON.stringify({ date: $("#<%= TextBox1.ClientID %>").val() }),
                contentType: "application/json; charset=utf-8",
                success: function(response) {
                    var data = response.d;

                    $("#<%= RelQuote.ClientID %>").text(data.Quote);
                    $("#<%= Author.ClientID %>").text(data.Author);

                }
            });
        });

        function getUserReflection(reflectionId) {
            (new http).post('<%= ResolveUrl("DailyReflection.aspx/GetUserReflection") %>',
                {
                    reflectionId: reflectionId
                }).then(function(response) {
                var reflection = response.d;

                console.log(reflection.Title);

                $("#<%= DReflectTitle.ClientID %>").val(reflection.Title);
                $("#<%= DReflectContent.ClientID %>").val(reflection.ReflectionContent);
            }).run();
        }
    });
</script>
</asp:Content>