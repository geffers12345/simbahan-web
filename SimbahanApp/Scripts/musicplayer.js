

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

    ],

    play: function (index) {
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

    next: function () {
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
    render: function () {
        var _this = this;

        _this.control.table.empty();

        $.each(Walkman.tracks,
            function(index, track) {
                _this.control.table.append('<tr data-id="' + index + '" class="plItem"><td>' + track.title + '</td><td>' + track.artist + '</td><td><i class="fa fa-star' + (track.isFavorite ? "" : "-o") + '" aria-hidden="true"></i></td></tr>');
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
            $("#buttonAddToFavorite>i").attr('class', Walkman.playingTrack.isFavorite ? 'fa fa-star fa-2x' : 'fa fa-star-o fa-2x');
        }

        _this.control.lyrics.text(Walkman.playingTrack.lyrics);
    }
};

$(document).on('click', '#btnPrev', walkmanVM.btnPrev);
$(document).on('click', '#btnNext', walkmanVM.btnNext);
$(document).on('click', 'tr.plItem', walkmanVM.rowClicked);

$(document).ready(function () {
    $(document).on('click',
        '.navbar-toggler',
        function (e) {
            e.preventDefault();

            $(this).closest('.navbar-minimal').toggleClass('open');
        });


    walkmanVM.render();
    //var mood = localStorage.getItem("moodContainer");

    (new http).post('MusicalInspirations.aspx/GetMusic', { moods: mood })
        .then(function (response) {
            var data = response.d;

            Walkman.tracks = [];

            $.each(data,
                function (key, track) {
                    Walkman.tracks.push(
                        {
                            id: track.Id,
                            title: track.SongTitle,
                            artist: track.Artist,
                            lyrics: track.Lyrics,
                            isFavorite: track.IsFavorite,
                            url: 'Assets/Audio/Inspirations/' + track.Path
                        });
                });

            walkmanVM.render();

        }).run();
});

$(document).on('click', '#buttonAddToFavorite', function (e) {
    e.preventDefault();

    if (!isAuth) {
        document.cookie = "intendedRedirect=" + currentPage + ";";
        window.location.href = "Login.aspx";
        return;
    }

    if ($(this).children()[0].attributes[0].value === 'fa fa-star-o fa-2x') {
        $(this).children()[0].attributes[0].value = 'fa fa-star fa-2x';
        // Favorite
    } else {
        $(this).children()[0].attributes[0].value = 'fa fa-star-o fa-2x';
        // Unfavorite
    }

    (new http).post('MusicalInspirations.aspx/OnFavoriteMusicalInspiration', { musicalInspirationId: Walkman.playingTrack.id })
        .then(function(response) {
            Walkman.tracks[Walkman.playingTrack.index].isFavorite =
                !Walkman.tracks[Walkman.playingTrack.index].isFavorite;

            if (Walkman.tracks[Walkman.playingTrack.index].isFavorite)
                swal('Success!', 'Music has been added to your Favorites!');
            else
                swal('Success!', 'Music has been removed to your Favorites!');

            Walkman.setState('playing');
        }).run();
});

$("#btnShareTwitter").click(function (e) {
    e.preventDefault();

    var song = Walkman.playingTrack;

    var message = song.title + " by " + song.artist + " http://www.mycatholicportal.org" + currentPage + " @SimbahanApp";

    window.open("https://twitter.com/intent/tweet?text=" + encodeURI(message),
        "Share to Twitter",
        "width=500,height=300");

});

$("#btnShareFacebok").click(function (e) {
    e.preventDefault();

    var song = Walkman.playingTrack;

    var message = song.title + " by " + song.artist + " http://www.mycatholicportal.org" + currentPage;

    window.open(
        "https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/MusicalInspiration/" +
        song.id +
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