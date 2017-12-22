<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OtherCatholicPrayers.aspx.cs" Inherits="SimbahanApp.OtherCatholicPrayers" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!---------------------------
    Author: Claud Montaril
    Description: Other Catholic Prayers Page
    Date Created: 05/16/2017
    Date Modified:
    Modified by:
    --------------------------->
    <link href="Content/Site.css" rel="stylesheet"/>
    <link href="Content/SimbahanStyle.css" rel="stylesheet"/>
    <link href="Content/calendar-blue.css" rel="stylesheet"/>
    <link href="Content/prayers.css" rel="stylesheet"/>
    <script src ="Scripts/isotope.js"></script>
    <link href="Content/Breadcrumbs.css" rel="stylesheet"/>

    <div class="box-body" id="app" style="background-image: url(Images/Background.jpg); background-repeat: round">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                     <%--<div class="container">
                    <ol class="breadcrumb breadcrumb-arrow">
		                <li><a href="#">Prayer & Devotions</a></li>
		                <%--<li class="active"><a href="#">Daily Gospel</a></li>--%>
		               <%-- <li class="active"><span>Other Catholic Prayers</span></li>
	                </ol>
                </div>
                        <br />--%>
                    <div class="btn-group btn-breadcrumb">
            <a href="default.aspx" class="btn btn-info"><i class="glyphicon glyphicon-home"></i></a>
            <a href="#" class="btn btn-info">Prayer & Devotions</a>
            <a href="#" class="btn btn-info"><strong>Other Catholic Prayers</strong></a>
          
        </div>

            <br /><br />

                    <h1 class="moods">OTHER CATHOLIC PRAYERS</h1>

                    <br/><br/>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <ul class="btn-categories">
                            <li>
                                <category-button category="*" @category-clicked="OnCategoryClicked"></category-button>
                            </li>
                            <li v-for="category in categories">
                                <category-button :category="category" @category-clicked="OnCategoryClicked"></category-button>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <div id="container">
                        <div class="row">
                            <div class="col-md-3 col-md-offset-8">
                                <input v-model="search" @keyup.enter="OnSearchChanged" @input="OnSearchChanged" type="text" class="form-control" placeholder="Search . . ."/>
                            </div>
                        </div>

                        <prayer-item v-for="prayer in prayers" :key="prayer.Id" :prayer="prayer"></prayer-item>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:content>

<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <script>
        Vue.component('prayer-item',
            {
                props: ['prayer'],
                template: '<div class="col-md-3 prayers-ocp"><a class="aLink prayer" :href="getUrl(prayer.Id)">{{ prayer.Title }}</a></div>',
                methods: {
                    getUrl: function (id) {
                        return 'OtherCatholicPrayer.aspx?id=' + id;
                    }
                }
            });

        Vue.component('category-button',
            {
                props: ['category'],
                computed: {
                    name: function () {
                        return this.category instanceof Object ? this.category.Name : "All";
                    },
                    mclass: function () {
                        return this.category instanceof Object ? this.category.Class : "*";
                    }
                },
                template: '<button @click.prevent="OnCategoryClicked" class="button">{{ name }}</button>',
                methods: {
                    OnCategoryClicked: function () {
                        this.$emit('category-clicked', this.mclass);
                    }
                }
            });

        var app = new Vue({
            el: "#app",
            data: {
                allPrayers: [],
                prayers: [],
                categories: [],
                search: ''
            },
            created: function () {
                var self = this;
                (new http).post('OtherCatholicPrayers.aspx/GetOtherCatholicPrayers').then(function(response) {
                    self.prayers = response.d;
                    self.allPrayers = response.d;
                }).run();

                (new http).post('OtherCatholicPrayers.aspx/GetCategories').then(function (response) {
                    self.categories = response.d;
                }).run();
            },
            computed: {

            },
            methods: {
                OnSearchChanged: function(e) {
                    e.preventDefault();

                    var self = this;

                    self.prayers = _(self.allPrayers).filter(function (prayer) {
                        var title = prayer.Title.toLowerCase();
                        return title.match(new RegExp(self.search.toLowerCase()));
                    });
                },
                OnCategoryClicked: function(category) {
                    var self = this;

                    if (category == "*")
                        return self.prayers = self.allPrayers;

                    self.prayers = _(self.allPrayers).filter(function(prayer) {
                        return prayer.ClassName == category;
                    });
                }
            }
        });
    </script>
</asp:Content>