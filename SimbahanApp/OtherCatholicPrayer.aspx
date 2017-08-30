<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OtherCatholicPrayer.aspx.cs" Inherits="SimbahanApp.OtherCatholicPrayer" MasterPageFile="Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href='<%= ResolveUrl("Content/Site.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/calendar-blue.css") %>' rel="stylesheet"/>

    <div class="box-body" style='background-image: url(<%= ResolveUrl("Images/Background.jpg") %>)'>
        <div class="row">
            <div class="col-md-12">
                <h1 runat="server" class="moods" id="Title"></h1>
                <div class="row">

                    <br/><br/>

                    <div class="col-md-2">
                        <img runat="server" class="img-responsive imagepath" id="ImagePath"/>
                    </div>
                    <div class="col-md-8">
                        <h6 runat="server" class="church-paragraph" id="prayer"></h6>
                    </div>
                    <div class="col-md-2">
                        <center>
                            <br/> <br/>
                            <a><input type="Image" id="btnAddToFave" runat="server" title="Add to Favorites!" width="45" height="45"/></a>
                            <a><input type="Image" id="btnShareSocialTwit" src='<%= ResolveUrl("Images/Twitter.png") %>' title="Share on Twitter" width="45" height="45"/></a>
                            <a><input type="Image" id="btnShareSocialFB" src='<%= ResolveUrl("Images/Facebook.png") %>' title="Share on Facebook" width="45" height="45"/></a>
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

                var message = $("#<%= Title.ClientID %>").text() +
                    ' <%= ResolveUrl("OtherCatholicPrayer.aspx?id=") %>' +
                    id +
                    " via ";

                window.open(
                    "https://twitter.com/intent/tweet?text=" +
                    encodeURI(message) +
                    " " +
                    encodeURI('@SimbahanApp'),
                    "Share to Twitter",
                    "width=500,height=300");

            });

        $(document).on('click',
            '#btnShareSocialFB',
            function(e) {
                e.preventDefault();

                var id = window.location.href.includes('?')
                    ? window.location.href.split('=')[1]
                    : window.location.href.split('/')[window.location.href.split('/').length - 1];

                var message = '';

                window.open(
                    'https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/OtherPrayer/' +
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
            '#<%= btnAddToFave.ClientID %>',
            function(e) {
                e.preventDefault();

                if ($("#<%= btnAddToFave.ClientID %>").attr('src') == '/Images/star.png') {
                    $("#<%= btnAddToFave.ClientID %>").attr('src', '/Images/starcolored.png');
                } else {
                    $("#<%= btnAddToFave.ClientID %>").attr('src', '/Images/star.png');
                }

                var id = window.location.href.includes('?')
                    ? window.location.href.split('=')[1]
                    : window.location.href.split('/')[window.location.href.split('/').length - 1];

                (new http).post('<%= ResolveUrl("OtherCatholicPrayer.aspx/OnFavoriteOtherCatholicPrayer") %>',
                    {
                        otherCatholicPrayerId: id
                    }).then(function() {
                    if ($("#<%= btnAddToFave.ClientID %>").attr('src') != '/Images/star.png') {
                        swal(
                            'Added to favorites!',
                            'Other Catholic Prayer has been added to your favorites list!',
                            'success'
                        );
                    } else {
                        swal(
                            'Removed from favorites!',
                            'Other Catholic Prayer has been removed from your favorites list!',
                            'success'
                        );
                    }
                }).run();

            });

    </script>
</asp:Content>