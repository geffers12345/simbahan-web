<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Saintlisting.aspx.cs" Inherits="SimbahanApp.Saintlisting" MasterPageFile="Site.Master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Site.css" rel="stylesheet"/>
    <link href="Content/SimbahanStyle.css" rel="stylesheet"/>
    <link href="Content/calendar-blue.css" rel="stylesheet"/>
    <input type="hidden" runat="server" id="SaintID" />
    <input type="hidden" runat="server" id="simbahanID"/>
    <div id="related-churches-modal" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">Related Churches</h4>
                </div>
                <div class="modal-body">
                    <div id="church-container">
                     
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div class="box-body-saints" style="background-image: url(Images/Background.jpg)">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <h1 runat="server" class="moods" id="Title"></h1>

                <br/><br/>

                <div class="row">
                    <div class="col-md-5">
                        <center><img runat="server" class="img-responsive imagepath" id="ImagePath"/></center>
                    </div>
                    <div class="col-md-7 col-sm-12 col-xs-12 clear-padding">
                        <h1 runat="server" class="moods" id="FeaturedSaint"></h1>
                        <div class="saint-pane">

                            <div class="saint-info-pane">


                                <p>
                                    Feast Day: <span class="text-orange">
                                        <strong runat="server" id="FeastDay"></strong>
                                    </span>
                                </p>
                                <p>
                                    Patron of: <span class="text-orange">
                                        <strong runat="server" id="PatronOf"><%--Animals, Mechants & Ecology--%></strong>
                                    </span>
                                </p>
                                <p>
                                    Birth: <span class="text-orange">
                                        <strong runat="server" id="BirthDate"><%--1181--%></strong>
                                    </span>
                                </p>
                                <p>
                                    Death: <span class="text-orange">
                                        <strong runat="server" id="DeathDate"><%--1226--%></strong>
                                    </span>
                                </p>
                                <p>
                                    Canonization: <span class="text-orange">
                                        <strong runat="server" id="CanonizedDate"><%--1226--%></strong>
                                    </span>
                                </p>
                            </div>
                        </div>
                        <br/>
                        <div class="row">
                            <div class="eltd-listing-search-submit-holder">
                                <a href="#" data-toggle="modal" data-target="#related-churches-modal" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000" style="padding: 10px 41px !important;">
                                    <span class="eltd-btn-text">RELATED CHURCHES IN THE COUNTRY</span><span aria-hidden="true"></span>
                                </a>
                                     <div class="col-lg-1  col-md-1 col-sm-6 col-xs-12 pull-right mgst2">
                                    <div class="eltd-listing-search-submit-holder">

                                        <button id="ShareTw" type="submit" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                                            <i class="fa fa-twitter-square fa-2x" aria-hidden="true"></i>
                                            <span aria-hidden="true"></span>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-lg-1  col-md-1 col-sm-6 col-xs-12 pull-right mgfb2">
                                    <div class="eltd-listing-search-submit-holder">
                                        <button id="ShareFb" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                                            <i class="fa fa-facebook-square fa-2x" aria-hidden="true"></i>
                                            <span aria-hidden="true"></span>
                                        </button>
                                    </div>
                                </div>
                                
                
                                <button id="AddFav" runat="server" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000" style="padding: 10px 15px !important; margin-top: 1% !important;">
                                    <span class="eltd-btn-text">ADD TO FAVORITES</span><span aria-hidden="true"></span>
                                </button>
                                <button id="RemoveFav" runat="server" class="eltd-btn eltd-btn-large eltd-btn-solid eltd-btn-custom-border-hover eltd-btn-custom-hover-color eltd-btn-icon chorg" data-hover-color="#000" data-hover-border-color="#000">
                                    <span class="eltd-btn-text">REMOVE FROM FAVORITES</span><span aria-hidden="true"></span>
                                </button>
                  
                
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br/>
               
                    <p class="church-subtitle">
                        <strong>BIOGRAPHY: </strong>
                    </p>

                    <p runat="server" id="SaintBio" class="church-paragraph">
                        <%--Founder of the Franciscan Order, born at Assisi in Umbria, in 1181.
                <br />
                <br />
                In 1182, Pietro Bernardone returned from a trip to France to find out his wife had given birth to a son. Far from being excited or apologetic because he'd been gone, Pietro was furious because she'd had his new son baptized Giovanni after John the Baptist. The last thing Pietro...--%>
                    </p>
                    <br/>

                </div>
            
   </div>
           
    <script>

        function StripSaintPrefix(name) {
            return name.match('St.') ? name.split('.')[1].substr(1, name.split('.')[1].length) : name;
        }
        $(document).on('click',
        '#ShareTw',
        function(e) {
            e.preventDefault();
            var featuredsaint = $('#<%= FeaturedSaint.ClientID %>').text();
            var message = featuredsaint +
                '\n' +
            'Know more about ' + featuredsaint +  ' via @SimbahanApp' + 
                ' http://www.mycatholicportal.org/Saint/' + $('#<%= SaintID.ClientID %>').val();

            window.open("https://twitter.com/intent/tweet?text=" + encodeURI(message),
                "Share to Twitter",
                "width=500,height=300");

        });

    $(document).on('click',
        '#ShareFb',
        function(e) {
            e.preventDefault();

            window.open(
                'https://www.facebook.com/dialog/feed?app_id=431222653910082&redirect_uri=http://www.mycatholicportal.org&link=http://www.mycatholicportal.org/Saint/' +
                $('#<%= SaintID.ClientID %>').val(),
                'Share To Facebook',
                'width=500,height=300');

        });

        $(document).on('click',
            '#<%= AddFav.ClientID %>',
            function(e) {
                e.preventDefault();

                if (!isAuth) {
                    document.cookie = "intendedRedirect=" + currentPage + ";";
                    window.location.href = "Login.aspx";
                    return;
                }

                (new http).post('Saintlisting.aspx/AddSaintToFavorite',
                    {
                        saintId: $("#<%= SaintID.ClientID %>").val()
                    }).then(function(data) {
                    if (data.d) {
                        Control.hide('<%= AddFav.ClientID %>');
                        Control.show('<%= RemoveFav.ClientID %>');

                        swal('Success!',
                            'Saint has been added to your favorites!',
                            'success');
                    } else {
                        Control.show('<%= AddFav.ClientID %>');
                        Control.hide('<%= RemoveFav.ClientID %>');
                        swal('Oops!',
                            'This saint is already in your favorite list',
                            'error');
                    }
                }).run();
            });
        $(document).on('click',
            '#<%= RemoveFav.ClientID %>',
            function(e) {
                e.preventDefault();

                if (!isAuth) {
                    document.cookie = "intendedRedirect=" + currentPage + ";";
                    window.location.href = "Login.aspx";
                    return;
                }

                (new http).post('Saintlisting.aspx/RemoveSaintFromFavorite',
                    {
                        saintId: $("#<%= SaintID.ClientID %>").val()
                    }).then(function(data) {
                    if (data.d) {
                        Control.show('<%= AddFav.ClientID %>');
                        Control.hide('<%= RemoveFav.ClientID %>');

                        swal('Success!',
                            'Saint has been removed from your favorites!',
                            'success');
                    } else {
                        Control.hide('<%= AddFav.ClientID %>');
                        Control.show('<%= RemoveFav.ClientID %>');
                        swal('Oops!',
                            'This Saint is already in your favorite list',
                            'error');
                    }
                }).run();
            });

        $(document).ready(function() {
            (new http).post('church_organization.aspx/GetChurches',
                {
                    churchKeyword:  StripSaintPrefix($("#<%= FeaturedSaint.ClientID %>").text()),
                    churchLocation: '',
                    selectChurchSchedule: '',
                    selectChurchMassTime: '',
                    selectChurchLanguage: '',
                    selectChurchConfessionDay: '',
                    selectChurchConfessionTime: '',
                    churchHasAirConditioned: false,
                    churchHasCeilingFan: false,
                    churchHasOrdinaryFan: false,
                    churchType: '',
                    churchLocationId: '',
                    churchHasStreetParking: false,
                    churchHasMallParking: false,
                    churchHasPrivateParking: false,
                    latitude: 0,
                    longitude: 0,
                    limit: 999999,
                    page: 1
                }).then(function (data) {
                    if (data.d.length > 0) {
                        $.each(data.d,
                            function(value, church) {
                                var ventilations = [];

                                $.each(church.Ventilations,
                                    function(key, ventilation) {
                                        if (ventilation["VentType"] == "")
                                            return;

                                        ventilations.push(ventilation["VentType"]);
                                    });

                                var comment = '';
                                if (church.ChurchReviews.length > 0) {
                                    if (church.ChurchReviews[0]["Comment"].length > 80) {
                                        comment = church.ChurchReviews[0]["Comment"].substr(0, 80) + '...';
                                    } else {
                                        comment = church.ChurchReviews[0]["Comment"];
                                    }

                                } else {
                                    comment = 'No reviews found.';
                                }

                                var mass = (church.MassSchedules.length > 0)
                                    ? church.MassSchedules[0].Days +
                                    " " +
                                    church.MassSchedules.map(function(value, key) { return value.Time; }).join(", ")
                                    : '';

                                $("#church-container").append(
                                    '<a href="Churches.aspx?id=' + church.SimbahanID + '" target="_blank" id="churchItem" data-id="' +
                                    church.SimbahanID +
                                    '" class="churchItem">' +
                                    '<div class="row church-result">' +
                                    '<div class="col-md-4">' +
                                    '<img class="img-responsive" src="' +
                                    church.ChurchThumbnails[0]["ChurchPhotos"] +
                                    '">' +
                                    '</div>' +
                                    '<div class="col-md-8">' +
                                    '<h4 class="church-name text-danger">' +
                                    church.Parish +
                                    '</h4>' +
                                    '<p class="church-location text-muted">' +
                                    church.CompleteAddress +
                                    '</p>' +
                                    '<div class="church-details">' +
                                    '<p>Mass Schedule: <strong class="mass">' +
                                    mass +
                                    '</strong></p>' +
                                    '<p>Ventilation: <strong class="ventilations">' +
                                    ventilations.join(", ") +
                                    '</strong></p>' +
                                    '</div>' +
                                    '<p class="text-comment">Comments: <em class="comments">' +
                                    comment +
                                    '</em></p>' +
                                    '</div>' +
                                    '</div>' +
                                    '</a>'
                                );
                            });
                    } else
                        $("#church-container").append('<p class="lead text-danger text-center">No Results found</p>');
            }).run();
        });
        <%--    $("#church-container").click(function (e) {
               var data = response.d;

                    console.log(data.Id);
                    var hasID = data.Id;

                    if (hasID == 0) {
                        alert("No Gospel for this Day")
                        window.location.reload();
                    } else {
                        $("#<%= SaintID.ClientID %>").val(data.Id);
                    
                    };--%>
     
        //if ("#church-container")== null
        if ($('#church-container').val() == '') {
           $("#church-container").text("No church available for the selected saint")
        } else {

        }
        

    </script>
</asp:Content>