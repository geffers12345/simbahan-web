<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BasicCatholicPrayer.aspx.cs" Inherits="SimbahanApp.BasicCatholicPrayer" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href='<%= ResolveUrl("Content/Site.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/calendar-blue.css") %>' rel="stylesheet"/>

    <div class="box-body">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 runat="server" class="moods" id="PrayerTitle"></h1>

                <br/><br/>

                <div class="row">
                    <div class="col-md-2">
                        <img runat="server" src="" class="imagepath img-responsive" id="ImagePath"/>
                    </div>
                    <div class="col-md-8">
                        <h6 runat="server" class="church-paragraph" id="PrayerContent"></h6>
                    </div>
                    <div class="col-md-2" style="margin-left:11%; margin-top:-4%;">
                        <center>
                            <br/> <br/>
                            <input type="Image" id="btnAddToFav" runat="server" title="Add to Favorites!" width="45" height="45"/>
                            <a><img class="img-responsive" id="btnShareSocialTwit" src='<%= ResolveUrl("Images/Twitter.png") %>' title="Share on Twitter" width="45" height="45" style="margin-left:52%; margin-top:-23%; width:17%;"/></a>
                            <a><img class="img-responsive" id="btnShareSocialFB" src='<%= ResolveUrl("Images/Facebook.png") %>' title="Share on Facebook" width="45" height="45" style="margin-left:93%; margin-top:-17%; width:17%;"/></a>
                        </center>
                    </div>

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
                    " mycatholicportal.org" + '<%= ResolveUrl("BasicCatholicPrayer.aspx?id=") %>' +
                    id +
                    " via ";

                window.open("https://twitter.com/intent/tweet?text=" + encodeURI(message)  + encodeURI('@SimbahanApp'),
                    "mywindow",
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
                    'https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/Prayer/' +
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
            '#<%= btnAddToFav.ClientID %>',
            function(e) {
                e.preventDefault();

                if ($("#<%= btnAddToFav.ClientID %>").attr('src') == '/Images/star.png') {
                    $("#<%= btnAddToFav.ClientID %>").attr('src', '/Images/starcolored.png');
                } else {
                    $("#<%= btnAddToFav.ClientID %>").attr('src', '/Images/star.png');
                }

                var id = window.location.href.includes('?')
                    ? window.location.href.split('=')[1]
                    : window.location.href.split('/')[window.location.href.split('/').length - 1];

                (new http).post('<%= ResolveUrl("BasicCatholicPrayer.aspx/OnFavoriteBasicCatholicPrayer") %>',
                    {
                        basicCatholicPrayerId: id
                    }).then(function() {
                    if ($("#<%= btnAddToFav.ClientID %>").attr('src') != '/Images/star.png') {
                        swal(
                            'Added to favorites!',
                            'Basic Catholic Prayer has been added to your favorites list!',
                            'success'
                        );
                    } else {
                        swal(
                            'Removed from favorites!',
                            'Basic Catholic Prayer has been removed from your favorites list!',
                            'success'
                        );
                    }
                }).run();

            });

    </script>
</asp:Content>