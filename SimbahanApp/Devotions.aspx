<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Devotions.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SimbahanApp.Devotions" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Site.css" rel="stylesheet"/>
    <link href="Content/SimbahanStyle.css" rel="stylesheet"/>
    <link href="Content/calendar-blue.css" rel="stylesheet"/>
    <link href="Content/prayers.css" rel="stylesheet"/>
    <link href="Content/Breadcrumbs.css" rel="stylesheet"/>

    <div class="box-body" style="background-image: url(Images/Background.jpg); background-repeat: round">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="row">
                    <%-- <div class="container">
                    <ol class="breadcrumb breadcrumb-arrow">
		                <li><a href="#">Prayer & Devotions</a></li>--%>
		                <%--<li class="active"><a href="#">Daily Gospel</a></li>--%>
		              <%--  <li class="active"><span>Devotions</span></li>
	                </ol>
                </div>
                    <br/>--%>
                    <div class="btn-group btn-breadcrumb">
            <a href="default.aspx" class="btn btn-info"><i class="glyphicon glyphicon-home"></i></a>
            <a href="#" class="btn btn-info" style="width: 43%;">Prayer & Devotions</a>
            <a href="#" class="btn btn-info"><strong>Devotion</strong></a>
          
        </div>

            <br /><br />

                    <h1 class="moods">DEVOTIONS</h1>

                    <br/><br/>

                </div>
                <div id="container">
                    <div class="row">
                        <div class="col-md-3 col-md-offset-8">
                            <center><input type="text" class="fuzzy-search form-control" placeholder="Search . . ."/></center>
                        </div>
                    </div>

                    <div class="content">
                        <div id="tablex">
                            
                            <br/><br/><br/>

                            <div class="list">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:content>

<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <script>
      var prayers;

        (new http).post('Devotions.aspx/GetDevotions').then(function(response) {
            prayers = new Map();
            var items = [];

            $.each(response.d, function (key, prayer) {
                prayers.set(prayer.Id, prayer);

                items.push({
                    prayer: prayer.Title,
                    aLink: 'Devotion.aspx?id=' + prayer.Id
                });
            });

            var options = {
                valueNames: ['prayer', { name: 'aLink', attr: 'href' }],
                item: '<div class="col-md-3 prayers"><a class="aLink prayer" href=""></a></div>'
            }

            var list = new List('container', options, items);
        }).run();
        </script>
</asp:Content>