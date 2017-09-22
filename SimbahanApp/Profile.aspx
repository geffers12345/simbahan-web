<%@ Page Title="User Profile Page" Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SimbahanApp.Account.Profile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<link href="../Content/profile.css" rel="stylesheet"/>
<link href="Content/bootstrap.css" rel="stylesheet"/>
<link href="Content/SimbahanStyle.css" rel="stylesheet"/>
    
<div id="dailySaintReflectionModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Saint Reflection</h4>
            </div>
            <div class="modal-body">
                <h2 id="saintReflectionTitle"></h2>
                <p class="text-muted lead" id="saintReflectionDate"></p>
                <p style="white-space: pre-line;" id="saintReflectionContent"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="btnRedirectUserToSaintReflection" type="button" class="btn btn-primary">View More</button>
            </div>
        </div>
    </div>
</div>

<div id="dailyGospelReflectionModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Gospel Reflection</h4>
            </div>
            <div class="modal-body">
                <h2 id="gospelReflectionTitle"></h2>
                <p class="text-muted lead" id="gospelReflectionDate"></p>
                <p style="white-space: pre-line;" id="gospelReflectionContent"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="btnRedirectUserToGospelReflection" type="button" class="btn btn-primary">View More</button>
            </div>
        </div>
    </div>
</div>

<div id="dailyReflectionReflectionModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Reflection</h4>
            </div>
            <div class="modal-body">
                <h2 id="reflectionReflectionTitle"></h2>
                <p class="text-muted lead" id="reflectionReflectionDate"></p>
                <p style="white-space: pre-line;" id="reflectionReflectionContent"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="btnRedirectUserToReflectionReflection" type="button" class="btn btn-primary">View More</button>
            </div>
        </div>

    </div>
</div>

<div>
<div class="col-lg-12 col-sm-12">
<div class="card hovercard">
    <div class="card-background">
        <img class="card-bk-img" alt="" src="http://lorempixel.com/100/100/people/9/">
    </div>
    <%--<div class="useravatar">
                    <img alt="" src="http://lorempixel.com/100/100/people/9/">
                </div>--%>
    <div class="card-info">
        <span class="card-title" runat="server" id="Name"></span>
    </div>
</div>
<div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="...">
    <div class="btn-group" role="group">
        <a type="button" id="following" class="btn btn-default" href="#tab3" data-toggle="tab">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <div class="hidden-xs">Account</div>
        </a>
    </div>
    <div class="btn-group" role="group">
        <a type="button" id="stars" class="btn btn-default" href="#tab1" data-toggle="tab">
            <span class="glyphicon glyphicon-star" aria-hidden="true"></span>
            <div class="hidden-xs">Favorites</div>
        </a>
    </div>
    <div class="btn-group" role="group">
        <a type="button" id="favorites" class="btn btn-default" href="#tab2" data-toggle="tab">
            <span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
            <div class="hidden-xs">Reflections</div>
        </a>
    </div>
    <div class="btn-group" role="group">
        <a type="button" id="visitaIglesia" class="btn btn-default" href="#tab4" data-toggle="tab">
            <span class="fa fa-map" aria-hidden="true"></span>
            <div class="hidden-xs">Visita Iglesia</div>
        </a>
    </div>
    <div class="btn-group" role="group">
        <a type="button" runat="server" id="manage" class="btn btn-default" href="#tab5" data-toggle="tab">
            <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
            <div class="hidden-xs">Manage Church</div>
        </a>
    </div>
</div>

<div class="well">
<div class="tab-content">
<!-- Tab for Favorites -->
<div class="tab-pane fade in" id="tab1">
<section>
<div class="container">
<div class="rows">
<div class="board">
<div class="board-inner">
<!-- Favorites Tab Header -->
<ul class="nav nav-tabs" id="myTab">
    <li class="active">
        <a href="#church" data-toggle="tab" title="Churches">
            <span class="round-tabs one">
                <i class="fa fa-university"></i>
            </span>
        </a>
    </li>
    <li>
        <a href="#profile" data-toggle="tab" title="Organizations">
            <span class="round-tabs two">
                <i class="fa fa-group"></i>
            </span>
        </a>
    </li>
    <li>
        <a href="#saints" data-toggle="tab" title="Saints">
            <span class="round-tabs seven">
                <i class="fa fa-male"></i>
            </span>
        </a>
    </li>
    <li>
        <a href="#basicCatholicPrayers" data-toggle="tab" title="Prayers & Devotions">
            <span class="round-tabs six">
                <i class="fa fa-heart"></i>
            </span>
        </a>
    </li>
    <li>
        <a href="#bibleVerses" data-toggle="tab" title="Bible Verses">
            <span class="round-tabs three">
                <i class="fa fa-book"></i>
            </span>
        </a>
    </li>

    <li>
        <a href="#religiousQuotes" data-toggle="tab" title="Religious Quotes">
            <span class="round-tabs four">
                <i class="fa fa-quote-left"></i>
            </span>
        </a>
    </li>

    <li>
        <a href="#musicalInspirations" data-toggle="tab" title="Musical Inspirations">
            <span class="round-tabs five">
                <i class="fa fa-music"></i>
            </span>
        </a>
    </li>
</ul>
<!-- Favorites Tab Contents -->
<div class="tab-content">
    <!-- Organizations -->
    <div class="tab-pane fade" id="profile">
        <h3 class="moods">Organizations</h3>
        
        <h3 id="favoriteOrganizations" runat="server">

        </h3>
    </div>

    <!-- Bible Verses -->
    <div class="tab-pane fade" id="bibleVerses">
        <h3 class="moods">Bible Verses</h3>

        <h3 id="favoriteBibleVerses" class="quote" runat="server">

        </h3>
    </div>

    <!-- Religious Quotes -->
    <div class="tab-pane fade" id="religiousQuotes">
        <h3 class="moods">Religious Quotes</h3>

        <h3 id="favoriteReligiousQuotes" class="quote" runat="server">

        </h3>
    </div>

    <!-- Churches -->
    <div class="tab-pane fade in active" id="church">
        <h3 class="moods">Churches</h3>

        <h3 id="favoriteChurches" runat="server">

        </h3>
    </div>

     <!-- Churches -->
    <div class="tab-pane fade" id="saints">
        <h3 class="moods">Saints</h3>

        <h3 id="favoriteSaints" runat="server">

        </h3>
    </div>

    <!-- Musical Inspirations -->
    <div class="tab-pane fade" id="musicalInspirations">
        <i class="img-intro text-center icon-checkmark-circle"></i>
        <h3 class="moods">Musical Inspiration</h3>

        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <h1 id="npTitle" style="text-align: center; font-family: 'Roboto';"></h1>

                    <!-- Button container for View Lyrics -->
                    <center><div class="eltd-listing-search-submit-holder">
                        <div class="eltd-listing-search-submit-holder">
                            <button type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chor" data-toggle="modal" data-target="#myModal" data-hover-color="#000" data-hover-border-color="#000">
                                <span class="eltd-btn-text">VIEW LYRICS</span><span aria-hidden="true"></span>
                            </button>
                            <!-- Modal for Lyrics -->
                            <div id="myModal" class="modal fade" role="dialog">
                                <div class="modal-dialog">

                                    <!-- Modal content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            <h4 class="modal-title">LYRICS</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="scrolling-div">
                                                <ul class="scrolling-div-content">
                                                    <li>
                                                        <h1 id="MusicTitle"></h1>
                                                    </li>
                                                    <li>
                                                        <h3 id="MusicArtist"></h3>
                                                    </li>
                                                </ul>
                                                <br/>
                                                <section id="MusicLyrics" style="text-align: left; white-space: pre-line;"></section>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div></center>
                </div>
                <hr/>
                <div class="row">
                    <!--Insert Music Player Here-->
                    <center>
                        <!-- Player Controls -->
                        <div class="column add-bottom">
                            <div id="mainwrap">

                                <div id="audiowrap">
                                    <div id="audio0">
                                        <audio preload="auto" id="audio1" controls="controls">Your browser does not support HTML5 Audio!</audio>
                                    </div>
                                    <div id="tracks">
                                        <a id="btnPrev">&laquo;</a>
                                        <a id="btnNext">&raquo;</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Playing track info -->
                        <div id="datacontentAngry" class="row-music">
                            <div class="table-responsive ">
                                <table id="plwrap" class="table table-fixed table-bordered">
                                    <thead>
                                    <tr class="bg-aqua-active color-palette">
                                        <th class="CenterTable">SONG</th>
                                        <th class="CenterTable">ARTIST</th>
                                        <th class="CenterTable">
                                            <i class="fa fa-star" aria-hidden="true"></i>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody id="plList" class="CenterTable">

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </center>
                </div>
            </div>
        </div>
    </div>

    <!-- Prayers -->
    <div class="tab-pane fade in" id="basicCatholicPrayers">
        <h3 class="moods">Prayers & Devotions</h3>


        <ul class="nav nav-tabs widthpd" id="myTab">
            <!-- Basic Catholic Prayer Tab -->
            <center>
                <li>
                    <button class="button2" data-toggle="modal" data-hover-color="#000" data-hover-border-color="#000">
                        <a href="#basicPrayers" data-toggle="tab" title="Basic Catholic Prayers!"> Basic Prayers </a>
                    </button>


                    <!-- Other Catholic Prayer Tab -->

                    <button class="button2" data-toggle="modal" data-hover-color="#000" data-hover-border-color="#000">
                        <a href="#otherPrayers" data-toggle="tab" title="Other Catholic Prayers!"> Other Prayers </a>
                    </button>


                    <!-- Devotion Tab -->

                    <button class="button2" data-toggle="modal" data-hover-color="#000" data-hover-border-color="#000">
                        <a href="#devotionPrayers" data-toggle="tab" title="Devotion!"> Devotions </a>
                    </button>

                </li>

            </center>

        </ul>


        <!-- Prayers Tab Contents -->
        <div class="tab-content">
            <!-- Basic Catholic Prayers -->
            <div class="tab-pane fade active" id="basicPrayers">
                <h3 class="head text-center">Basic Catholic Prayer</h3>

                <h3 id="favoriteBasicCatholicPrayers" class="quote" runat="server"></h3>
            </div>

            <!-- Other Catholic Prayers -->
            <div class="tab-pane fade" id="otherPrayers">
                <h3 class="head text-center">Other Catholic Prayer</h3>

                <h3 id="favoriteOtherCatholicPrayers" class="quote" runat="server"></h3>
            </div>

            <!-- Devotions -->
            <div class="tab-pane fade" id="devotionPrayers">
                <h3 class="head text-center">Devotion</h3>

                <h3 id="favoriteDevotions" class="quote" runat="server"></h3>
            </div>
        </div>
    </div>

</div>
</div>
</div>
</div>
</div>
</section>
</div>


<!-- Tab for Reflections -->
<div class="tab-pane fade in" id="tab2">
    <section style="background: #efefe9;">
        <div class="container">
            <div class="row">
                <div class="board">
                    <div class="board-inner">
                        <!-- Reflection tab header -->
                        <ul class="nav nav-tabs" id="myTab">
                            <div class="liner"></div>
                            <li class="active">
                                <a href="#gospelReflection" data-toggle="tab" title="gospel">
                                    <span class="round-tabs nine">
                                        <i class="fa fa-book fa-pencil" aria-hidden="true"></i>
                                    </span>
                                </a>
                            </li>

                            <li>
                                <a href="#reflectionReflection" data-toggle="tab" title="reflection">
                                    <span class="round-tabs eight">
                                        <i class="fa fa-book fa-pencil" aria-hidden="true"></i>
                                    </span>
                                </a>
                            </li>
                            
                            <li>
                                <a href="#saintReflection" data-toggle="tab" title="saint">
                                    <span class="round-tabs seven">
                                        <i class="fa fa-male fa-pencil" aria-hidden="true"></i>
                                    </span>
                                </a>
                            </li>
                        </ul>

                        <!-- Reflection tab content -->
                        <div class="tab-content">
                            <!-- Gospel's Reflections. -->
                            <div class="tab-pane fade in active" id="gospelReflection">

                                <h3 class="moods">Your Reflections about the Daily Gospels</h3>
                                <div id="gospelReflectionList" class="gospel-reflection-list">

                                </div>
                            </div>

                            <!-- Reflection's Reflections. wut? -->
                            <div class="tab-pane fade" id="reflectionReflection">
                                <h3 class="moods">Your Reflections about the Daily Reflections</h3>
                                <div id="reflectionReflectionList" class="reflection-reflection-list">

                                </div>

                            </div>
                            
                            <!-- Saint's Reflection. -->
                            <div class="tab-pane fade" id="saintReflection">
                                <h3 class="moods">Your Reflections about the Saint Reflections</h3>
                                <div id="saintReflectionList" class="saint-reflection-list">

                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Tab for Visita Iglesia -->
<div class="tab-pane fade in" id="tab4">
    <section style="background: #efefe9;">
        <div class="container">
            <div class="row  tab-bg" style="min-height: 600px;">
                <div class="col-sm-5">
                    <div style="width: 100%;">
                        <div id="mapContainer" style="height: 610px;"></div>
                    </div>
                </div>
                <div class="col-sm-7 tab-bg" style="padding: 10px">
                    <div class="row">
                        <h2>Churches Near You</h2>
                
                    </div>
                    <div id="church-container" class="row" style="padding: 10px;">
                        <ul class="list">

                        </ul>
                    </div>
                    <div class="row">
                        <div class="col-md-6">

                        </div>
                        <div class="col-md-6">
                    
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Tab for Account -->
<div class="tab-pane fade in active" id="tab3">
    <div class="container">
        <a href="#" class="btn btn-default" id="btnToggleEdit"><i class="fa fa-edit"></i> Edit</a>

        <!-- First Name -->
        <div class="row">
            <div class="col-md-4">
                <label for="firstName">First Name</label>
            </div>
            <div class="col-md-8">
                <label runat="server" id="firstName" ></label>
                <input type="text" id="firstNameTxt" class="form-control hidden" />
            </div>
        </div>

        <!-- Last Name -->
        <div class="row">
            <div class="col-md-4">
                <label for="lastName">Last Name</label>
            </div>
            <div class="col-md-8">
                <label runat="server" id="lastName"></label>
                <input type="text" id="lastNameTxt" class="form-control hidden" />
            </div>
        </div>

        <!-- Email -->
        <div class="row">
            <div class="col-md-4">
                <label for="email">Email</label>
            </div>
            <div class="col-md-8">
                <label runat="server" id="email"></label>
                <input type="text" id="emailTxt" class="form-control hidden" />
            </div>
        </div>

        <!-- Gender -->
        <div class="row">
            <div class="col-md-4">
                <label for="gender">Gender</label>
            </div>
            <div id="" class="col-md-8">
                <label runat="server" id="gender"></label>
                <div id="genderTxt" class="hidden">
                    <input type="radio" name="gender" value="1">Male</input>
                    <input type="radio" name="gender" value="0">Female</input>
                </div>
            </div>
        </div>

        <!-- Birthday -->
        <div class="row">
            <div class="col-md-4">
                <label for="birthday">Birthday</label>
            </div>
            <div class="col-md-8">
                <label runat="server" id="birthday"></label>
                <input type="date" id="birthdayTxt" class="form-control hidden" />
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-4">
                <button id="btnSaveUserInfo" class="btn btn-primary btn-block hidden">Save Changes</button>
            </div>
        </div>
    </div>
</div>
<div class="tab-pane fade in" runat="server" id="tab5">
    <div class="container">
        <div class="row">
            <ul id="ManageableChurch" runat="server">

            </ul>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>

</asp:Content>

<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">

<%--<script src="Scripts/bootstrap.js"></script>--%>

<script>
    var Walkman = {
        state: '',
        playingTrack: {
            title: '',
            artist: '',
            album: '',
            lyrics: '',
            isFavorite: false,
            url: '',
            id: 0,
            index: -1
        },
        tracks: [
            {
                title: 'No Promises',
                artist: 'Shayne Ward',
                album: 'Closer',
                lyrics: 'This is the lyrics for No Promises',
                isFavorite: false,
                url: 'https://1drv.ms/u/s!AmiDZoW7KgGrtx41-5LufL3Zerf8'
            },
            {
                title: 'Take a Chance',
                artist: 'Marion Aunor',
                album: 'Marion',
                lyrics: 'This lyrics is for Take A Chance',
                isFavorite: false,
                url: 'https://gdasz.yt-downloader.org/download.php?id=2f86bec8f702cff457877f0f66ddf4d2&v=lsN-UlJhLt8'
            },
            {
                title: 'Amazed',
                artist: 'Lonestar',
                album: 'The Greatest Hits',
                lyrics: 'Brought to you by someone',
                isFavorite: false,
                url: 'https://fzaqn.yt-downloader.org/download.php?id=398a71257c899ad4c73bf61047d7e444&v=x-skFgrV59A'
            }
        ],

        play: function(index) {
            if (index)
                var track = this.tracks[index];
            else
                var track = this.tracks[0];

            this.playingTrack.index = index;
            this.playingTrack.title = track.title;
            this.playingTrack.artist = track.artist;
            this.playingTrack.album = track.album;
            this.playingTrack.lyrics = track.lyrics;
            this.playingTrack.isFavorite = track.isFavorite;
            this.playingTrack.url = track.url;
            this.playingTrack.id = track.id;

            this.setState('playing');
        },

        pause: function() {
            this.setState('paused');
        },

        next: function() {
            if (this.playingTrack.index < this.tracks.length - 1) {
                this.play(this.playingTrack.index + 1);
            }

            this.setState('playing');
        },

        previous: function() {
            if (this.playingTrack.index > 0) {
                this.play(this.playingTrack.index - 1);
            }

            this.setState('playing');
        },

        setState: function(state) {
            this.state = state;

            walkmanVM.render();
        }
    };


    var walkmanVM = {
        control: {
            audio: $("#audio1"),
            title: $("#npTitle"),
            table: $("#plList"),
            lyrics: $("#MusicLyrics"),
            modalTitle: $("#MusicTitle"),
            modalArtist: $("#MusicArtist")
        },
        btnPrev: function() {
            Walkman.previous();
        },
        btnNext: function() {
            Walkman.next();
        },
        rowClicked: function() {
            Walkman.play($(this).data('id'));
        },
        render: function() {
            var _this = this;

            _this.control.table.empty();

            $.each(Walkman.tracks,
                function(index, track) {
                    _this.control.table.append('<tr data-id="' +
                        index +
                        '" class="plItem"><td>' +
                        track.title +
                        '</td><td>' +
                        track.artist +
                        '</td><td><i class="fa fa-star' +
                        (track.isFavorite ? "" : "-o") +
                        '" aria-hidden="true"></i></td></tr>'); 
                });

            $('.plSel').removeClass('plSel');

            if (Walkman.state == 'playing') {
                // Display track details
                _this.control.title.text(Walkman.playingTrack.title + ' - ' + Walkman.playingTrack.artist);

                _this.control.modalTitle.text(Walkman.playingTrack.title);
                _this.control.modalArtist.text(Walkman.playingTrack.artist);

                // Add styling to currently playing item
                $("tr.plItem[data-id=" + Walkman.playingTrack.index + "]").addClass('plSel');

                // Play the audio
                _this.control.audio.attr('src', Walkman.playingTrack.url);
                _this.control.audio.trigger('play');

                // Update the favorites button
                $("#buttonAddToFavorite>i").attr('class',
                    Walkman.playingTrack.isFavorite ? 'fa fa-star fa-2x' : 'fa fa-star-o fa-2x');
            }

            _this.control.lyrics.text(Walkman.playingTrack.lyrics);
        }
    };

    $(document).on("click",
       "#btnShareSocialTwet",
       function (e) {
           e.preventDefault();

           var verse = verses.get($(this).data("id"));
           var message = song + " - " + verse.ChapterTitle;

           window.open("https://twitter.com/intent/tweet?text=" + encodeURI(message),
               "Share to Twitter",
               "width=500,height=300");

       });


    $(document).on("click",
        "#btnShareSocialFB",
        function (e) {
            e.preventDefault();

            var verse = verses.get($(this).data("id"));
            var message = verse.BibleVerseContent + " - " + verse.ChapterTitle;

            window.open(
                "https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/MusicalInspirations/" +
                song.Id +
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

    $(document).on('click', '#btnPrev', walkmanVM.btnPrev);
    $(document).on('click', '#btnNext', walkmanVM.btnNext);
    $(document).on('click', 'tr.plItem', walkmanVM.rowClicked);

    $(document).ready(function() {

        walkmanVM.render();

        (new http).post('Profile.aspx/GetMusicalInspirations')
            .then(function(response) {
                var data = response.d;

                Walkman.tracks = [];

                $.each(data,
                    function(key, track) {
                        Walkman.tracks.push(
                            {
                                id: track.ID,
                                title: track.SongTitle,
                                artist: track.Artist,
                                lyrics: track.Lyrics,
                                isFavorite: track.IsFavorite,
                                url: track.Source
                            });
                    });

                walkmanVM.render();

            }).run();
    });
</script>

<script>
    $(document).on('click',
        '#btnViewChurchDetail',
        function(e) {
            e.preventDefault();

            window.open('Churches.aspx?id=' + $(this).data('id'), '_blank');
        });

    $(document).on('click',
        '#btnViewSaintDetail',
        function (e) {
            e.preventDefault();

            window.open('Saintlisting.aspx?id=' + $(this).data('id'), '_blank');
        });
    
    $(document).on('click',
        '#btnViewOrganizationDetail',
        function (e) {
            e.preventDefault();

            window.open('Organizations.aspx?id=' + $(this).data('id'), '_blank');
        });

    var gospelReflectionMap;
    var reflectionReflectionMap;
    var saintReflectionMap;

    $(document).ready(function () {

        (new http).post('Profile.aspx/GetSaintReflections')
            .then(function (response) {
                var data = response.d;
                saintReflectionMap = new Map();

                $.each(data,
                    function (key, saint) {
                        saintReflectionMap.set(saint.Id, saint);

                        $("#saintReflectionList").append(
                            '<div class="row">' +
                            '<div class="text-center">' +
                            '<h4>' +
                            saint.Title +
                            '</h4>' +
                            '<p class="text-muted">' +
                            saint.FormattedCreatedDate +
                            '</p>' +
                            '<button id="btnShowSaintReflection" data-id="' +
                            saint.Id +
                            '" class="btn btn-primary"><i class="fa fa-search"></i> View More Detail</button>' +
                            '</div>' +
                            '</div>'
                        );
                    });
            }).run();

        (new http).post('Profile.aspx/GetReflectionReflections')
            .then(function(response) {
                var data = response.d;
                reflectionReflectionMap = new Map();

                $.each(data,
                    function(key, reflection) {
                        reflectionReflectionMap.set(reflection.Id, reflection);

                        $("#reflectionReflectionList").append(
                            '<div class="row">' +
                            '<div class="text-center">' +
                            '<h4>' +
                            reflection.Title +
                            '</h4>' +
                            '<p class="text-muted">' +
                            reflection.FormattedDate +
                            '</p>' +
                            '<button id="btnShowReflectionReflection" data-id="' +
                            reflection.Id +
                            '" class="btn btn-primary"><i class="fa fa-search"></i> View More Detail</button>' +
                            '</div>' +
                            '</div>'
                        );
                    });
            }).run();

        (new http).post('Profile.aspx/GetGospelReflections')
            .then(function(response) {
                var data = response.d;
                gospelReflectionMap = new Map();

                $.each(data,
                    function(key, reflection) {
                        gospelReflectionMap.set(reflection.Id, reflection);

                        $("#gospelReflectionList").append(
                            '<div class="row">' +
                            '<div class="text-center">' +
                            '<h4>' +
                            reflection.Title +
                            '</h4>' +
                            '<p class="text-muted">' +
                            reflection.FormattedDate +
                            '</p>' +
                            '<button id="btnShowGospelReflection" data-id="' +
                            reflection.Id +
                            '" class="btn btn-primary"><i class="fa fa-search"></i> View More Detail</button>' +
                            '</div>' +
                            '</div>'
                        );
                    });
            }).run();

        $(document).on('click',
            '#btnShowGospelReflection',
            function(e) {
                e.preventDefault();

                var reflection = gospelReflectionMap.get($(this).data('id'));

                $("#gospelReflectionTitle").text(reflection.Title);
                $("#gospelReflectionContent").text(reflection.ReflectionContent);
                $("#gospelReflectionDate").text(reflection.FormattedDate);
                $("#btnRedirectUserToGospelReflection").attr('data-date', reflection.FormattedGospelDate);

                $("#dailyGospelReflectionModal").modal('show');
            });

        $(document).on('click',
            '#btnShowSaintReflection',
            function (e) {
                e.preventDefault();

                var saint = saintReflectionMap.get($(this).data('id'));

                $("#saintReflectionTitle").text(saint.Title);
                $("#saintReflectionContent").text(saint.ReflectionContent);
                $("#saintReflectionDate").text(saint.FormattedCreatedDate);
                $("#btnRedirectUserToSaintReflection").attr('id', saint.Id);

                $("#dailySaintReflectionModal").modal('show');
            });

        $(document).on('click',
            '#btnShowReflectionReflection',
            function(e) {
                e.preventDefault();

                var reflection = reflectionReflectionMap.get($(this).data('id'));

                $("#reflectionReflectionTitle").text(reflection.Title);
                $("#reflectionReflectionContent").text(reflection.ReflectionContent);
                $("#reflectionReflectionDate").text(reflection.FormattedDate);
                $("#btnRedirectUserToReflectionReflection").attr('data-date', reflection.FormattedReflectionDate);

                $("#dailyReflectionReflectionModal").modal('show');
            });

        $(document).on('click',
            '#btnRedirectUserToSaintReflection',
            function (e) {
                e.preventDefault();

                window.open('Saintlisting.aspx?id=' + $(this).data('id'), '_blank');
            });

        $(document).on('click',
            '#btnRedirectUserToGospelReflection',
            function(e) {
                e.preventDefault();

                window.open('DailyGospel.aspx?date=' + $(this).data('date'), '_blank');
            });

        $(document).on('click',
            '#btnRedirectUserToReflectionReflection',
            function(e) {
                e.preventDefault();

                window.open('DailyReflection.aspx?date=' + $(this).data('date'), '_blank');
            });

        $("#btnSaveUserInfo").click(function(e) {
            e.preventDefault();

            (new http).post('Profile.aspx/UpdateUserInformation', {
                firstName: $("#firstNameTxt").val(),
                lastName: $("#lastNameTxt").val(),
                gender: $("input[name='gender']:checked").val() == 1 || $("input[name='gender']:checked").val() == '1',
                birthday: $("#birthdayTxt").val()
            }).then(function (response) {
                toggleEditProfile('firstNameTxt');
                toggleEditProfile('lastNameTxt');
                toggleEditProfile('emailTxt');
                toggleEditProfile('genderTxt');
                toggleEditProfile('birthdayTxt');

                $("#btnSaveUserInfo").attr('class', 'btn btn-primary btn-block hidden');
                $("#btnToggleEdit").attr('class', 'btn btn-default');

                swal('Profile Updated!', 'Your personal information has been updated.');
            }).run();
        });

        $('#btnToggleEdit').click(function (e) {
            e.stopPropagation();
            e.preventDefault();

            $("#btnSaveUserInfo").attr('class', 'btn btn-primary btn-block');
            $("#btnToggleEdit").attr('class', 'btn btn-default hidden');

            toggleEditProfile('firstNameTxt');
            toggleEditProfile('lastNameTxt');
            toggleEditProfile('emailTxt');
            toggleEditProfile('genderTxt');
            toggleEditProfile('birthdayTxt');
        });
    });

    var profileFieldDictionary = new Map();
    profileFieldDictionary.set("firstNameTxt", "<%= firstName.ClientID %>");
    profileFieldDictionary.set("lastNameTxt", "<%= lastName.ClientID %>");
    profileFieldDictionary.set("emailTxt", "<%= email.ClientID %>");
    profileFieldDictionary.set("genderTxt", "<%= gender.ClientID %>");
    profileFieldDictionary.set("birthdayTxt", "<%= birthday.ClientID %>");

    var isProfileEdit = false;

    function toggleEditProfile(control) {
        var textblock = $("#" + profileFieldDictionary.get(control));
        var textbox = $("#" + control);

        if (textblock.attr('class')) {
            textblock.attr('class', '');
            textbox.attr('class', 'hidden');
            
            if (control == "genderTxt") {
                var gender = $("input[name='gender']:checked").val() == "1" ? 'Male' : 'Female';

                textblock.text(gender);
            } else {
                textblock.text(textbox.val());
            }

            isProfileEdit =  true;
        } else {
            textblock.attr('class', 'hidden');
            textbox.attr('class', 'form-control');

            var genderIndex = (textblock.text() == "Male") ? "1" : "0";

            if (control == "genderTxt") {
                $("input[name='gender'][value='" + genderIndex + "']").prop('checked', true);
            } else {
                textbox.val(textblock.text());
            }

            isProfileEdit = false;
        }
    }
</script>
    
<!-- For Visita Iglesia -->
<script type="text/javascript">

    var map;
    var churches = [];
    function initialize() {
        map = new GMap(document.getElementById("mapContainer"), {
            center: new google.maps.LatLng(14.5995124, 120.9842195),
            zoom: 14,
            scrollwheel: false,
            mapTypeId: google.maps.MapTypeId.TERRAIN
        });

        map.Create();

        GetChurchesAndRender();
    }

    setTimeout(initialize, 2500);

    function GetChurchesAndRender() {
        map.ClearMarker();
        churches = [];
        try {
            churchList.clear();
        } catch (ex) {
        }
            
        try {
            $.each(churchUserData, function (key, visitaIglesia) {
                map.AddMarker(visitaIglesia.Church.SimbahanID.toString(), {
                    position: new google.maps.LatLng(visitaIglesia.Church.Latitude, visitaIglesia.Church.Longitude),
                    title: visitaIglesia.Church.Parish
                });

                var description = '';

                if (visitaIglesia.StatusID == 2) {
                    map.SetMarkerUnvisited(visitaIglesia.Church.SimbahanID.toString());
                    description = '<span class="badge badge-info">Visited</span>';
                } else if (visitaIglesia.StatusID == 1) {
                    description = '<span class="badge badge-info">Visited</span>';
                    map.SetMarkerVisited(visitaIglesia.Church.SimbahanID.toString());
                } else {
                    description = '<span class="badge badge-warning">Currently Here</span>';
                    map.SetMarkerCurrentlyHere(visitaIglesia.Church.SimbahanID.toString());
                }

                churches.push({
                    'church-name': visitaIglesia.Church.Parish,
                    'church-location': visitaIglesia.Church.CompleteAddress,
                    'id': visitaIglesia.Church.SimbahanID,
                    'img-responsive': visitaIglesia.Church.ChurchPhotos[0]["ChurchPhotos"],
                    'description': description
                });
            });

            renderPlainChurchItem();

            $(".btnVisited").css('display', 'none');
            $(".btnUnvisited").css('display', 'none');
            $(".btnHere").css('display', 'none');
        } catch (err) {
            (new http).post('VisitaIglesiaProgress.aspx/GetChurches')
                .then(function (data) {
                    $.each(data.d, function (id, visitaIglesia) {
                        map.AddMarker(visitaIglesia.Church.SimbahanID.toString(), {
                            position: new google.maps.LatLng(visitaIglesia.Church.Latitude, visitaIglesia.Church.Longitude),
                            title: visitaIglesia.Church.Parish
                        });

                        if (visitaIglesia.StatusId == 2) {
                            map.SetMarkerUnvisited(visitaIglesia.Church.SimbahanID.toString());
                        } else if (visitaIglesia.StatusId == 1) {
                            map.SetMarkerVisited(visitaIglesia.Church.SimbahanID.toString());
                        } else {
                            map.SetMarkerCurrentlyHere(visitaIglesia.Church.SimbahanID.toString());
                        }

                        churches.push({
                            'church-name': visitaIglesia.Church.Parish,
                            'church-location': visitaIglesia.Church.CompleteAddress,
                            'id': visitaIglesia.Church.SimbahanID,
                            'img-responsive': visitaIglesia.Church.ChurchPhotos[0]["ChurchPhotos"],
                            'btnVisited': visitaIglesia.Church.SimbahanID,
                            'btnUnvisited': visitaIglesia.Church.SimbahanID,
                            'btnHere': visitaIglesia.Church.SimbahanID,
                            'btnVisitedEnabled': visitaIglesia.StatusId == 1 ? 'display:none' : '',
                            'btnUnvisitedEnabled': visitaIglesia.StatusId == 2 ? 'display:none' : '',
                            'btnCurrentlyHereEnabled': visitaIglesia.StatusId == 3 ? 'display:none' : '',
                            'badge': visitaIglesia.Status
                        });
                    });

                    renderChurchItem();
                }).run();
        }
    }

    function parseDate(data) {
        var regex = /-?\d+/;
        var result = regex.exec(data);

        return new Date(parseInt(result[0]));
    }

    function renderChurchItem() {
        var options = {
            valueNames: [
                'church-name',
                'church-location',
                { data: ['id'] },
                { name: 'img-responsive', attr: 'src' },
                { name: 'btnVisited', attr: 'data-id' },
                { name: 'btnUnvisited', attr: 'data-id' },
                { name: 'btnHere', attr: 'data-id' },
                { name: 'btnVisitedEnabled', attr: 'style' },
                { name: 'btnUnvisitedEnabled', attr: 'style' },
                { name: 'btnCurrentlyHereEnabled', attr: 'style' },
                'badge'
            ],
            item:
                '<a href="#" target="_blank" id="churchItem" data-id="" class="churchItem">' +
                    '<div class="row church-result">' +
                    '<div class="col-md-4">' +
                    '<img class="img-responsive" src="">' +
                    '</div>' +
                    '<div class="col-md-8">' +
                    '<div class="row">' +
                    '<div class="col-md-9 col-md-offset-3 btn-group">' +
                    '<button id="btnVisited" class="btn btn-info btnVisited btnVisitedEnabled" style="display: none;">Visited</button>' +
                    '<button id="btnUnvisited" class="btn btn-info btnUnvisited btnUnvisitedEnabled" style="display: none;">Unvisited</button>' +
                    '<button id="btnHere" class="btn btn-info btnHere btnCurrentlyHereEnabled" style="display: none;">Currently Here</button>' +
                    '</div>' +
                    '</div>' +
                    '<div class="row">' +
                    '<span style="font-style: 16px;" class="badge badge-info"></span>' +
                    '<h4 class="church-name text-danger"></h4>' +
                    '</div>' +
                    '<p class="church-location text-muted"></p>' +
                    '</div>' +
                    '</div>' +
                    '</a>'
        }
        churchList = new List('church-container', options, churches);
    }

    function renderPlainChurchItem() {
        var options = {
            valueNames: [
                'church-name',
                'church-location',
                { data: ['id'] },
                { name: 'img-responsive', attr: 'src' },
                'description'
            ],
            item:
                '<a href="#" target="_blank" id="churchItem" data-id="" class="churchItem">' +
                    '<div class="row church-result">' +
                    '<div class="col-md-4">' +
                    '<img class="img-responsive" src="">' +
                    '</div>' +
                    '<div class="col-md-8">' +
                    '<div class="row">' +
                    '<h4 class="description"></h4>' +
                    '</div>' +
                    '<div class="row">' +
                    '<h4 class="church-name text-danger"></h4>' +
                    '</div>' +
                    '<p class="church-location text-muted"></p>' +
                    '</div>' +
                    '</div>' +
                    '</a>'
        }
        churchList = new List('church-container', options, churches);
    }

    $(document).on('mouseenter', '.churchItem', function (e) {
        map.AnimateMarker($(this).data('id').toString());
        map.centerMapIfMarkerOutOfBounds($(this).data('id').toString());
    });

    $(document).on('mouseleave', '.churchItem', function (e) {
        map.RemoveMarkerAnimation($(this).data('id').toString());
    });

    $(document).on('click', '.churchItem', function (e) {
        e.preventDefault();

        window.open('Churches.aspx?id=' + $(this).data('id'), '_blank');
    });

    $(document).on('click', '#btnVisited', function(e) {
        e.preventDefault();
        e.stopPropagation();

        map.SetMarkerVisited($(this).data('id').toString());

        UpdateChurchStatus.run({
            churchId: $(this).data('id'),
            statusId: 1
        });

        Control.hide('btnVisited[data-id="' + $(this).data('id') + '"]');
        Control.show('btnUnvisited[data-id="' + $(this).data('id') + '"]');
    });

    $(document).on('click', '#btnUnvisited', function(e) {
        e.preventDefault();
        e.stopPropagation();

        map.SetMarkerUnvisited($(this).data('id').toString());

        UpdateChurchStatus.run({
            churchId: $(this).data('id'),
            statusId: 2
        });

        Control.show('btnVisited[data-id="' + $(this).data('id') + '"]');
        Control.hide('btnUnvisited[data-id="' + $(this).data('id') + '"]');
    });

    $(document).on('click', '#btnHere', function(e) {
        e.preventDefault();
        e.stopPropagation();

        map.SetMarkerCurrentlyHere($(this).data('id').toString());

        UpdateChurchStatus.run({
            churchId: $(this).data('id'),
            statusId: 3
        });
    });

    var UpdateChurchStatus = (new http).post('VisitaIglesiaProgress.aspx/UpdateStatus')
        .then(function (data) {
            GetChurchesAndRender();
            swal('Status Updated!',
                'Status has been updated successfully!',
                'success');
        });
</script>
</asp:Content>