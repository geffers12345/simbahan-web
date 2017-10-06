<%@ Page Title="Daily Gospel Page" Language="C#" AutoEventWireup="true" CodeBehind="DailyGospel.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SimbahanApp.DailyGospel" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<link href='<%= ResolveUrl("Content/Site.css") %>' rel="stylesheet"/>
<link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet"/>
<link href='<%= ResolveUrl("Content/calendar-blue.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/Breadcrumbs.css") %>' rel="stylesheet"/>
  
<div class="box-body" style="background-image: url(<%= ResolveUrl("Images/Background.jpg") %>)">

<input type="hidden" value="" id="GospelID" runat="server"/>
<div class="row">
<h3 id="samplex"></h3>
<div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
    <div class="row">
        <div class="col-md-12">
        <div class="container">
    <ol class="breadcrumb breadcrumb-arrow">
		<li><a href="#">Daily Readings</a></li>
		<%--<li class="active"><a href="#">Daily Gospel</a></li>--%>
		<li class="active"><span>Daily Gospel</span></li>
	</ol>
</div>
             
            <h2 >Gospel Reading <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox>
                <button id="MapPicker" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                    <i class="fa fa-calendar fa-2x"></i>
                    <span aria-hidden="true"></span>
                </button>
            </h2>
        </div>
    </div>

    <div class="row">
        <div runat="server" id="GospelDate" class="text-dated"></div>
    </div>

    <br/>
    <section id="FirstReading">
        <p class="church-subtitle">
            <strong>FIRST READING:</strong>
        </p>
        <h3 runat="server" id="FRTitle"></h3>

        <br/>

        <p runat="server" id="FRContent" class="church-gos">
            
        </p>
    </section>
    <br/>

    <section id="ResponsorialPsalm">
        <p class="church-subtitle">
            <strong>RESPONSORIAL PSALM:</strong>
        </p>
        <h3 runat="server" id="RPTitle"></h3>
        <br/>

        <p runat="server" id="RPContent" class="church-paragraph">
            
        </p>
    </section>

    <br/>
    <section runat="server" id="SecondReading">
        <p class="church-subtitle">
            <strong>SECOND READING:</strong>
        </p>
        <h3 runat="server" id="SRTitle"></h3>

        <br/>

        <p runat="server" id="SRContent" class="church-gos">
            
        </p>
    </section>
    <br/>

    <section runat="server" id="VerseBeforeGospel">
        <p class="church-subtitle">
            <strong>VERSE BEFORE GOSPEL:</strong>
        </p>
        <h3 runat="server" id="VBGTitle"></h3>

        <br/>
        <p runat="server" id="VBGContent" class="church-gos">
            
        </p>
    </section>
    <br/>

    <section id="GospelContent">
        <p class="church-subtitle">
            <strong>GOSPEL:</strong>
        </p>
        <h3 runat="server" id="DGospelTitle"></h3>

        <br/>
        <p runat="server" id="DGospelContent" class="church-gos">
            
        </p>
    </section>

    <br/>
    <div class="row">
        <div runat="server" id="SourceContent" class="text-muted">
            <strong>http://dailyscripture.servantsoftheword.org/readings/</strong>
        </div>
    </div>
    <br/>
    <div class="row">
        <div class="col-lg-6 col-md-3 col-sm-2 col-xs-2">
            <div class="eltd-listing-search-submit-holder">
                <a href='<%= ResolveUrl("DailyReflection.aspx") %>' type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                    <span class="eltd-btn-text">SEE THIS DAY'S REFLECTION</span><span aria-hidden="true"></span>
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
                <button id="ShareFb" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
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
                <a href='<%= ResolveUrl("ReligiousQuotes.aspx") %>' class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon verse" data-hover-color="#000" data-hover-border-color="#000">
                    <span class="eltd-btn-text">SEE MORE INSPIRATIONAL QUOTE</span><span aria-hidden="true"></span>
                </a>
            </center>
        </div>
    </div>
    <br/>
    <br/>
    <br/>
    <div class="row">
        <div class="row reflection" style="background-image: url(<%= ResolveUrl("Images/ReflectionBackground1.png") %>);">
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
<script src='<%= ResolveUrl("Scripts/jquery.dynDateTime.min.js") %>' type="text/javascript"></script>
<script src='<%= ResolveUrl("Scripts/calendar-en.min.js") %>' type="text/javascript"></script>
<script type="text/javascript">

   $(document).on('click',
        '#ShareTw',
        function(e) {
            e.preventDefault();
            
            var day = $("#<%= GospelDate.ClientID %>").text().split(',')[1];
            var gospelDate = $("#<%= GospelDate.ClientID %>").text().split(',')[2];

            var date = '(' + day + ',' + gospelDate + ')';
            var tweet = 'Daily Gospel ' + date + '\n' +
                $('#<%= DGospelTitle.ClientID %>').text().substr(0, 50) +
                '\n' +
                'http://www.mycatholicportal.org/Gospel/' +
                $("#<%= GospelID.ClientID %>").val();

            Share.toTwitter(tweet);
        });

    $(document).on('click',
        '#ShareFb',
        function(e) {
            e.preventDefault();

            var gospelId = $("#<%= GospelID.ClientID %>").val();

            Share.toFacebook('http://www.mycatholicportal.org/Gospel/' + gospelId);

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

       <%-- if ($("#<%= GReflectTitle.ClientID %>").val() == "" && $("#<%= GReflectContent.ClientID %>").val() == "")
            return;--%>

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
                    (new http).post('<%= ResolveUrl("DailyGospel.aspx/SaveDailyGospelReflection") %>',
                        {
                            gospelId: $("#<%= GospelID.ClientID %>").val(),
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

    $(document).ready(function() {
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
                url: '<%= ResolveUrl("DailyGospel.aspx/GetReading") %>',
                data: JSON.stringify({ date: $("#<%= TextBox1.ClientID %>").val() }),
                contentType: "application/json; charset=utf-8",
                success: function(response) {
                    var data = response.d;

                    $("#<%= GospelID.ClientID %>").val(data.Id);

                    getUserReflection(data.Id);

                    $("#<%= GospelDate.ClientID %>").text(data.FormattedDate);

                    $("#<%= FRTitle.ClientID %>").text(data.FirstReadingTitle);
                    $("#<%= FRContent.ClientID %>").text(data.FirstReadingContent);
                    $("#<%= RPTitle.ClientID %>").text(data.ResponsorialPsalmTitle);
                    $("#<%= RPContent.ClientID %>").text(data.ResponsorialPsalmContent);
                    $("#<%= SRTitle.ClientID %>").text(data.SecondReadingTitle);
                    $("#<%= SRContent.ClientID %>").text(data.SecondReadingContent);
                    $("#<%= VBGTitle.ClientID %>").text(data.VerseBeforeGospelTitle);
                    $("#<%= VBGContent.ClientID %>").text(data.VerseBeforeGospelContent);
                    $("#<%= DGospelTitle.ClientID %>").text(data.GospelTitle);
                    $("#<%= DGospelContent.ClientID %>").text(data.GospelContent);

                    if (data.SecondReadingTitle == "") {
                        Control.hide('<%= SecondReading.ClientID %>');
                    } else {
                        Control.show('<%= SecondReading.ClientID %>');
                    }

                    if (data.SecondReadingContent == "") {
                        Control.hide('<%= SecondReading.ClientID %>');
                    } else {
                        Control.show('<%= SecondReading.ClientID %>');
                    }

                    if (data.VerseBeforeGospelTitle == "") {
                        Control.hide('<%= VerseBeforeGospel.ClientID %>');
                    } else {
                        Control.show('<%= VerseBeforeGospel.ClientID %>');
                    }

                    if (data.VerseBeforeGospelContent == "") {
                        Control.hide('<%= VerseBeforeGospel.ClientID %>');
                    } else {
                        Control.show('<%= VerseBeforeGospel.ClientID %>');
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

        function getUserReflection(gospelId) {
            (new http).post('<%= ResolveUrl("DailyGospel.aspx/GetUserReflection") %>',
                {
                    gospelId: gospelId
                }).then(function(response) {
                var reflection = response.d;

                $("#<%= GReflectTitle.ClientID %>").val(reflection.Title);
                $("#<%= GReflectContent.ClientID %>").val(reflection.ReflectionContent);
            }).run();
        }
    });
</script>

</asp:Content>