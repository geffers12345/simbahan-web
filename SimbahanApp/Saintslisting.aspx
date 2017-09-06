<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Saintslisting.aspx.cs" MasterPageFile="~/Site.Master" Inherits="SimbahanApp.Saintslisting" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Site.css" rel="stylesheet"/>
    <link href="Content/SimbahanStyle.css" rel="stylesheet"/>
    <link href="Content/calendar-blue.css" rel="stylesheet"/>
    <link href="Content/prayers.css" rel="stylesheet"/>
    <script src ="Scripts/isotope.js"></script>

    <div class="box-body" style="background-image: url(Images/Background.jpg)">
        <div class="row" id="app">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <div class="row">

                    <br/><br/>

                    <h1 class="moods">Saints Listing</h1>

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
                            <input v-model="search" @input="OnSearchChanged" type="text" class="fuzzy-search form-control" placeholder="Search . . ."/>
                        </div>
                    </div>

                    <saint-item v-for="saint in saints" :key="saint.Id" :saint="saint"></saint-item>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:content>

<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <script>
        Vue.component('saint-item',
            {
                props: ['saint'],
                template: '<div class="col-md-3 prayers"><a class="aLink prayer" :href="getUrl(saint.Id)">{{ saint.Name }}</a></div>',
                methods: {
                    getUrl: function (id) {
                        return 'Saintlisting.aspx?id=' + id;
                    }
                }
            });

        Vue.component('category-button',
            {
                props: ['category'],
                computed: {
                    name: function() {
                        return this.category instanceof Object ? this.category.Name : "All";
                    },
                    mclass: function() {
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
                allSaints: [],
                saints: [],
                categories: [],
                search: ''
            },
            created: function () {
                var self = this;
                (new http).post('Saintslisting.aspx/GetSaints').then(function (response) {
                    self.saints = response.d;
                    self.allSaints = response.d;
                }).run();

                (new http).post('Saintslisting.aspx/GetCategories').then(function (response) {
                    self.categories = response.d;
                }).run();
            },
            computed: {

            },
            methods: {
                OnSearchChanged: function (e) {
                    e.preventDefault();

                    var self = this;

                    self.saints = _(self.allSaints).filter(function (saint) {
                        var title = saint.Name.toLowerCase();
                        return title.match(new RegExp(self.search.toLowerCase()));
                    });
                },
                OnCategoryClicked: function (category) {
                    var self = this;

                    if (category == "*")
                        return self.saints = self.allSaints;

                    self.saints = _(self.allSaints).filter(function (saint) {
                        return saint.ClassName == category;
                    });
                }
            }
        });
    </script>
</asp:Content>