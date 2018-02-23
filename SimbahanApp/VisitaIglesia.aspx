<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VisitaIglesia.aspx.cs" Inherits="SimbahanApp.VisitaIglesia" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <script type='text/javascript' src="Scripts/SearchEstablishment.js"></script>
</asp:Content>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row  tab-bg" style="min-height: 600px;">
        <div class="col-sm-5">
            <div class="mapvisita">
                <div id="mapContainer" class="height"></div>
            </div>
        </div>
        <div class="col-sm-7 tab-bg" style="padding: 60px">
            <div class="row">
                <br />
                <h1 class="moods">VISITA IGLESIA</h1>
                <h6 class="visit">(Spanish for "Church Visit") is a Holy Week devotion among Filipino Roman Catholics of visiting seven or fourteen churches in order to pray and meditate on the Passion of Jesus Christ. It commences in the late afternoon or early evening of Holy Thursday after the Mass of the Last Supper when the Blessed Sacrament is already reserved at the Altar of Repose for adoration inside the Church until midnight when it is concluded without solemnity since liturgically, the day of the Lord's Passion has already begun.</h6>
                <br />
                <h5 class="visit"><strong>Steps on How To Use Visita Iglesia Module:</strong></h5>
                <h6 class="visit">1. Enter the location of the place that you want to start in the "From:" field.</h6> 
                <h6 class="visit">2. In the "Show" field, Enter the number of churches that you want the system to show.</h6> 
                <h6 class="visit">3. Click the "Find" button.</h6> 
                <h6 class="visit">4. The system will generate the list of churches that is near the place that you entered on the find button.</h6> 
                <br />
                <h3>Churches Near You</h3>
                <p></p>
                <div class="row">
                    <div class="col-md-1">
                        <label>From: </label>
                    </div>
                    <div class="col-md-5">
                        <input type="text" id="searchEstablishment" name="searchEstablishment" class="form-control" placeholder="Enter Establishment" />
                    </div>
                    <div class="col-md-1">
                        <label>Show </label>
                    </div>
                    <div class="col-md-3">
                        <input id="churchItemLimit" type="number" min="3" max="50" value="3" class="form-control" style="text-align: left;" />
                        <span class="text-muted"> churches</span>
                    </div>
                    <div class="col-md-2">
                        <button id="btnFind" class="btn vc_btn-primary">Find</button>
                    </div>
                </div>
            </div>
            <div id="church-container" class="row" style="padding: 60px;">
                <ul class="list">

                </ul>
            </div>
            <div class="row">
                <div class="col-md-6">

                </div>
                <div class="col-md-6">
                    <button class="btn btn-info form-control input-lg" style="display: none;" id="btnSaveChurches">Save</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <script type="text/javascript">

        $(document).on('click', '#btnFind', function (e) {
            e.preventDefault();

            GrabCoordinates($("#searchEstablishment").val(), OnSourceCoordinateChanged);
        });

        var currentScope = null;

        function OnSourceCoordinateChanged(coordinate)
        {
            currentScope = new google.maps.LatLng(coordinate.Latitude, coordinate.Longitude);

            mapx.ClearMarker();

            mapx.AddMarker("current", {
                position: currentScope,
                title: $("#searchEstablishment").val()
            }, true);

            mapx.centerMapIfMarkerOutOfBounds("current");

            GetCoordinates.run({ latitude: coordinate.Latitude, longitude: coordinate.Longitude });
        }

        function extractCoordinates(data)
        {
            return {
                'Latitude': data.results[0].geometry.location.lat,
                'Longitude': data.results[0].geometry.location.lng
            };
        }

        var mapx;
        function initialize() {
            mapx = new GMap(document.getElementById("mapContainer"), {
                center: new google.maps.LatLng(14.5995124, 120.9842195),
                zoom: 14,
                scrollwheel: false,
                mapTypeId: google.maps.MapTypeId.TERRAIN
            });

            mapx.Create();
        }

        var churchesNearby = [];
        var churchList;
        var churchMap;

        var GetCoordinates = (new http).post('<%= ResolveUrl("VisitaIglesia.aspx/GetChurchesNearby")%>')
                                       .prepare(function () {
                                           $("#church-container").empty();
                                        })
                                       .then(function (data) {
                                           $("#church-container").empty();
                                           $("#church-container").append('<ul class="list"></ul>');
                                           $("#church-container").append('<ul style="display: none;" class="pagination"></ul>');
                                           churchMap = new Map();
                                           churchesNearby = [];

                                           mapx.ClearMarker();
                                           mapx.markers = new Map();

                                           $.each(data.d, function (id, church) {

                                               churchMap.set(church.SimbahanID, church);

                                               var ventilations = [];

                                               $.each(church.Ventilations, function (key, ventilation) {
                                                   if (ventilation["VentType"] == "")
                                                       return;

                                                   ventilations.push(ventilation["VentType"]);
                                               });

                                               churchesNearby.push({
                                                   'church-name': church.Parish,
                                                   'church-location': church.CompleteAddress,
                                                   'mass': (church.MassSchedules.length > 0) ? church.MassSchedules[0].Days + " " + church.MassSchedules.map(function (value, key) { return value.Time; }).join(", ") : '',
                                                   'ventilations': ventilations.join(", "),
                                                   'comments': church.ChurchReviews[0]["Comment"].substr(0, 80) + '...',
                                                   'id': church.SimbahanID,
                                                   'img-responsive': church.ChurchPhotos[0]["ChurchPhotos"],
                                                   'btn': church.SimbahanID
                                               });
                                           });

                                           renderChurchItem();
                                           redrawMarkers();
                                       });

        setTimeout(initialize, 2500);

        function renderChurchItem() {
            var options = {
                valueNames: [
                    'church-name',
                    'church-location',
                    'mass',
                    'ventilations',
                    'comments',
                    { data: ['id'] },
                    { name: 'img-responsive', attr: 'src' },
                    { name: 'btn', attr: 'data-id'}
                ],
                pagination: true,
                page: $("#churchItemLimit").val(),
                item:
                    '<a href="#" target="_blank" id="churchItem" data-id="" class="churchItem">' +
                        '<div class="row church-result">' +
                            '<div class="col-md-4">' +
                                '<img class="img-responsive" src="">' +
                            '</div>' +
                            '<div class="col-md-8">' +
                                '<div class="row">' +
                                    '<div class="col-md-10">' +
                                        '<h4 class="church-name text-danger"></h4>' +
                                    '</div>' +
                                    '<div class="col-md-2">' +
                                        '<button id="btnRemoveChurchItem" class="btn btn-danger" data-id="" style="margin: 15px 0"><i class="fa fa-remove"></i></button>' +
                                    '</div>' +
                                '</div>' +
                                '<p class="church-location text-muted"></p>' +
                                '<div class="church-details">' +
                                    '<p>Mass Schedule: <strong class="mass"></strong></p>' +
                                    '<p>Ventilation: <strong class="ventilations"></strong></p>' +
                                '</div>' +
                                '<p class="text-comment">Comments: <em class="comments"></em></p>' +
                            '</div>' +
                        '</div>' +
                    '</a>'
            }

            churchList = new List('church-container', options, churchesNearby);
            hideOrShowSaveButton();
        }

        function hideOrShowSaveButton()
        {
            if (churchList.size() < $("#churchItemLimit").val()) {
                Control.hide('btnSaveChurches');
            } else {
                Control.show('btnSaveChurches');
            }
        }

        $(document).on('click', '#btnSaveChurches', function (e) {
            e.preventDefault();

            if (!isAuth) {
                document.cookie = "intendedRedirect=" + currentPage;
                window.location.href = "Login.aspx";
                return;
            }

            var userHasData = (new http).post('VisitaIglesia.aspx/CheckUserHasExistingData')
                                        .then(function (data) {
                                            if (data.d) {
                                                UserHasExistingData();
                                            } else {
                                                UserHasNoExistingData();
                                            }
                                        }).run();
        });

        $(document).on('mouseenter', '.churchItem', function (e) {
            mapx.setActiveMarker($(this).data('id').toString());
        });

        $(document).on('mouseleave', '.churchItem', function (e) {
            mapx.setInactiveMarker($(this).data('id').toString());
        });

        $(document).on('click', '.churchItem', function (e) {
            e.preventDefault();

            window.open('Churches.aspx?id=' + $(this).data('id'), '_blank');
        });

        $(document).on('click', '#btnRemoveChurchItem', function (e) {
            e.preventDefault();
            e.stopPropagation();

            mapx.RemoveMarker($(this).data('id').toString());
            churchList.remove('id', $(this).data('id'));
            redrawMarkers();
            hideOrShowSaveButton();
        });

        $('#searchEstablishment').keydown(function (e) {
            if (e.keyCode == 13) {
                e.preventDefault();

                $("#btnFind").trigger('click');
            }
        });

        function redrawMarkers() {
            var controls = $("a.churchItem").map(function () {
                return $(this).data('id');
            }).get();

            try {
                mapx.RemoveMarker(0);
                mapx.markers.remove(0);
            } catch (ex) {

            }

            $.each(controls, function (key, simbahanID) {
                var church = churchMap.get(simbahanID);

                var marker = mapx.markers.get(simbahanID.toString());

                if (marker !== undefined) {
                    
                } else {
                    mapx.AddMarker(simbahanID.toString(), {
                        position: new google.maps.LatLng(church.Latitude, church.Longitude),
                        title: church.Parish
                    });
                }
            });

            mapx.AddMarker(0, {
                position: currentScope,
                title: $("#searchEstablishment").val()
            }, true);
        }

        function UserHasExistingData() {
            swal({
                title: 'Are you sure?',
                text: "Are you sure you want to overwrite existing list?",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes',
                cancelButtonText: 'No'
            }).then(function() {
                swal(
                    'Overwritten!',
                    'Your previous church list has been overwritten.',
                    'success'
                ).then(function() {
                    var churchesID = $("a.churchItem").map(function () {
                        return $(this).data('id');
                    }).get();

                    (new http).post('VisitaIglesia.aspx/ShowVisitaIglesia', {
                        response: false,
                        churches: churchesID
                    }).then(function (data) {
                        window.location = 'VisitaIglesiaProgress.aspx';
                    }).run();
                });
            });
        }

        function UserHasNoExistingData() {
            var churchesID = $("a.churchItem").map(function () {
                return $(this).data('id');
            }).get();

            (new http).post('VisitaIglesia.aspx/ShowVisitaIglesia', {
                response: false,
                churches: churchesID
            }).then(function (data) {
                swal(
                    'Success!',
                    'Your Visita Iglesia list has successfully been saved.',
                    'success'
                ).then(function() {
                    window.location = 'VisitaIglesiaProgress.aspx';
                });
            }).run();
        }
    </script>
</asp:Content>
