<%@ Page Title="Your Progress" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VisitaIglesiaProgress.aspx.cs" Inherits="SimbahanApp.VisitaIglesiaProgress" %>


<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    
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
                <h3>Churches Near You</h3>
                
            </div>
            <div id="church-container" class="row" style="padding: 60px;">
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
</asp:Content>

<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
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
