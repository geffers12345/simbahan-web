$(document).ready(function() {
    $(document).on("click",
        ".navbar-toggler",
        function(e) {
            e.preventDefault();

            $(this).closest(".navbar-minimal").toggleClass("open");
        });
    var quotes;

    (new http).post("ReligiousQuotes.aspx/GetQuotes",
        {
            moods: mood
        }).then(function(response) {
        quotes = new Map();

        $.each(response.d,
            function(key, quote) {
                quotes.set(quote.Id, quote);

                var classActive = quote.IsFavorite ? "active" : "";
                $("#toppage").append('<div><p></p><ol><li class="tqquote">' +
                    quote.Quote +
                    '</li></ol></div><br /><div class="authors"><div class="pull-left"><a id="btnRelFavorite" class="' +
                    classActive +
                    '" data-id="' +
                    quote.Id +
                    '"><div class="click"><span class="fa fa-star-o"></span><div class="ring"></div><div class="ring2"></div><p class="info">Added to favourites!</p></div></a></div><p id="BibleVerse" class="tqauthor"> - ' +
                    quote.Author +
                    '</p>&nbsp<input type ="Image" id="btnShareSocialTwet" src="Images/Twitter.png" title="Share on Twitter" width="25" height="25" data-id="' +
                    quote.Id +
                    '">&nbsp<input type ="Image" id="btnShareSocialFB" src="Images/Facebook.png" title="Share on Facebook" width="25" height="25" data-id="' +
                    quote.Id +
                    '"></div>');
            });
    }).run();


    $(document).on("click",
        "#btnShareSocialTwet",
        function(e) {
            e.preventDefault();

            var quote = quotes.get($(this).data("id"));
            var message = "\"" + quote.Quote.substr(0, 50) + "...\"" + " - " + quote.Author +
          '  via @SimbahanApp';

            window.open("https://twitter.com/intent/tweet?text=" + encodeURI(message),
                "Share to Twitter",
                "width=500,height=300");

        });


    $(document).on("click",
        "#btnShareSocialFB",
        function(e) {
            e.preventDefault();

            var quote = quotes.get($(this).data("id"));
            var message = quote.Quote + " - " + quote.Author;
            var rq = ".aspx?id="
            window.open(
                "https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org/ReligiousQuotes.aspx&link=http://www.mycatholicportal.org/ReligiousQuotes" +
                rq +
                quote.Id +
                "&caption=" +
                encodeURI(message) +
                "&description=" +
                encodeURI(message),
                "Share to Facebook",
                "width=500,height=300");

        });

    $(document).on("click",
        "#btnRelFavorite",
        function(e) {
            e.preventDefault();

            if (!isAuth) {
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

            (new http).post("ReligiousQuotes.aspx/OnFavoriteBibleVerse",
                {
                    religiousQuoteId: $(this).data("id")
                }).then(function(response) {
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

$(".click").click(function() {
    if ($("span").hasClass("fa-star")) {
        $(".click").removeClass("active");
        setTimeout(function() {
                $(".click").removeClass("active-2");
            },
            30);
        $(".click").removeClass("active-3");
        setTimeout(function() {
                $("span").removeClass("fa-star");
                $("span").addClass("fa-star-o");
            },
            15);
    } else {
        $(".click").addClass("active");
        $(".click").addClass("active-2");
        setTimeout(function() {
                $("span").addClass("fa-star");
                $("span").removeClass("fa-star-o");
            },
            150);
        setTimeout(function() {
                $(".click").addClass("active-3");
            },
            150);
        $(".info").addClass("info-tog");
        setTimeout(function() {
                $(".info").removeClass("info-tog");
            },
            1000);
    }
});