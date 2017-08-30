<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Devotion.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SimbahanApp.Devotion" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href='<%= ResolveUrl("Content/Site.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/calendar-blue.css") %>' rel="stylesheet"/>


    <div class="box-body" style="background-image: url(<%= ResolveUrl("Images/Background.jpg") %>)">
        <div class="row">
            <div class="col-md-12">
                <h1 runat="server" class="moods" id="PrayerTitle"></h1>

                <br/><br/>

                <div class="row">
                    <div class="col-md-2">
                        <img src="" id="ImagePath" runat="server" class="img-responsive"/>
                    </div>
                    <div class="col-md-8">
                        <h6 runat="server" class="church-paragraph" id="PrayerContent"></h6>
                    </div>
                    <div class="col-md-2"></div>

                    <center>
                        <br/>
                        <br/>
                        <input type="Image" id="btnAddToFavo" runat="server" title="Add to Favorites!" width="45" height="45" data-id="6"/>

                        <a><img class="img-responsive" id="btnShareSocialTwit" src='<%= ResolveUrl("Images/Twitter.png") %>' title="Share on Twitter" width="45" height="45" data-id="6"/></a>

                        <a><img class="img-responsive" id="btnShareSocialFB" src='<%= ResolveUrl("Images/Facebook.png") %>' title="Share on Facebook" width="45" height="45" data-id="1"></a>
                    </center>

                    <br/><br/>

                </div>

                <br/><br/>

            </div>
        </div>
    </div>

    <script>
        $(document).on('click',
            '#btnShareSocialTwit',
            function(e) {
                e.preventDefault();

                var id = window.location.href.includes('?')
                    ? window.location.href.split('=')[1]
                    : window.location.href.split('/')[window.location.href.split('/').length - 1];

                var message = $("#<%= PrayerTitle.ClientID %>").text() +
                    ' <%= ResolveUrl("Devotion.aspx?id=") %>' +
                    id +
                    " via ";

                window.open("https://twitter.com/intent/tweet?text=" + encodeURI(message) + encodeURI('@SimbahanApp'),
                    "Share to Twitter",
                    "width=500,height=300");

            });

        $(document).on('click',
            '#btnShareSocialFB',
            function(e) {
                e.preventDefault();

                var message = '';
                var id = window.location.href.includes('?')
                    ? window.location.href.split('=')[1]
                    : window.location.href.split('/')[window.location.href.split('/').length - 1];

                window.open(
                    'https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/Dvote/' +
                    id +
                    '&caption=' +
                    encodeURI(message) +
                    '&description=' +
                    encodeURI(message) +
                    '&properties={text' +
                    encodeURI(message),
                    '}',
                    'Share To Facebook',
                    'width=500,height=300');

            });

        $(document).on('click',
            '#<%= btnAddToFavo.ClientID %>',
            function(e) {
                e.preventDefault();

                if ($("#<%= btnAddToFavo.ClientID %>").attr('src') == '/Images/star.png') {
                    $("#<%= btnAddToFavo.ClientID %>").attr('src', '/Images/starcolored.png');
                } else {
                    $("#<%= btnAddToFavo.ClientID %>").attr('src', '/Images/star.png');
                }

                var id = window.location.href.includes('?')
                    ? window.location.href.split('=')[1]
                    : window.location.href.split('/')[window.location.href.split('/').length - 1];

                (new http).post('<%= ResolveUrl("Devotion.aspx/OnFavoriteDevotion") %>',
                    {
                        devotionId: id
                    }).then(function() {
                    if ($("#<%= btnAddToFavo.ClientID %>").attr('src') != '/Images/star.png') {
                        swal(
                            'Added to favorites!',
                            'Devotion has been added to your favorites list!',
                            'success'
                        );
                    } else {
                        swal(
                            'Removed from favorites!',
                            'Devotion has been removed from your favorites list!',
                            'success'
                        );
                    }
                }).run();

            });

    </script>
</asp:Content>