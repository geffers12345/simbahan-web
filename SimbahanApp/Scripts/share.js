var Share = {
    toFacebook: function(url) {
        window.open(
            'https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=' + url,
            'Share To Facebook',
            'width=500,height=300');
    },
    toTwitter: function(tweet) {
        window.open("https://twitter.com/intent/tweet?text=" + encodeURI(tweet + ' via @SimbahanApp'),
            "Share to Twitter",
            "width=500,height=300");
    }
}