$(document).ready(function() {

    // Hamburger Menu

    $(document).on("click",
        ".navbar-toggler",
        function(e) {
            e.preventDefault();

            $(this).closest(".navbar-minimal").toggleClass("open");
        });

    var verses;

    (new http).post("BibleVerses.aspx/GetVerse",
        {
            moods: mood
        }).then(function(response) {
        verses = new Map();

        $.each(response.d,
            function(key, bibleVerse) {
                verses.set(bibleVerse.Id, bibleVerse);
                var classActive = bibleVerse.IsFavorite ? "active" : "";
                $("#toppage").append('<div><p></p><div><div class="tqquote">' +
                    bibleVerse.BibleVerseContent.toString().replace(/[^a-z0-9\s]/gi, '').replace(/[_\s]/g, ' ') +
                    '</div></div></div><div class="authors"><div class="pull-left"><a id="btnBibleFavorite" class="' +
                    classActive +
                    '" data-id="' +
                    bibleVerse.Id +
                    '"><div class="click"><span class="fa fa-star-o"></span><div class="ring"></div><div class="ring2"></div><p class="info">Added to favourites!</p></div></a></div><p id="BibleVerse" class="tqauthor"> - ' +
                   bibleVerse.ChapterTitle +
                    '</p>&nbsp<input type ="Image" id="btnShareSocialTwet" src="Images/Twitter.png" title="Share on Twitter" width="25" height="25" data-id="' +
                    bibleVerse.Id +
                    '">&nbsp<input type ="Image" id="btnShareSocialFB" src="Images/Facebook.png" title="Share on Facebook" width="25" height="25" data-id="' +
                    bibleVerse.Id +
                    '"></div>');
            });
    }).run();

    $(document).on("click",
        "#btnShareSocialTwet",
        function(e) {
            e.preventDefault();

            var verse = verses.get($(this).data("id"));
            var message = verse.BibleVerseContent.substr(0, 50) + "...\"" + " - " + verse.ChapterTitle;

            window.open("https://twitter.com/intent/tweet?text=" + encodeURI(message),
                "Share to Twitter",
                "width=500,height=300");

        });


    $(document).on("click",
        "#btnShareSocialFB",
        function(e) {
            e.preventDefault();

            var verse = verses.get($(this).data("id"));
            var message = verse.BibleVerseContent + " - " + verse.ChapterTitle;

            var ae = ".aspx?id="

            window.open(
                "https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org/BibleVerses.aspx&link=http://www.mycatholicportal.org/BibleVerses" +
                ae +
                verse.Id +
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

    $(document).on("click",
        "#btnBibleFavorite",
        function(e) {
            e.preventDefault();

            if (! isAuth) {
                document.cookie = "intendedRedirect=" + currentPage + ";";
                window.location.href = "Login.aspx";
                return;
            }

            if (this.className == "active") {
                $(this).attr("class", "");
            } else {
                $(this).attr("class", "active");
            }

            var _this = this;

            (new http).post("BibleVerses.aspx/OnFavoriteBibleVerse",
                {
                    bibleVerseId: $(this).data("id")
                }).then(function() {
                if (_this.className != "active") {
                    swal(
                        "Removed from favorites!",
                        "Bible Verse has been removed from your favorites list!",
                        "success"
                    );
                } else {
                    swal(
                        "Added to favorites!",
                        "Bible Verse has been added to your favorites list!",
                        "success"
                    );
                }
            }).run();
        });
});

