<%@ Page Title="Religious Quotes Categories" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReligiousQuotes.aspx.cs" Inherits="SimbahanApp.ReligiousQuotes" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<!---------------------------
Author: Claud Montaril
Description: Religious Quotes Inspiration Page
Date Created: 03/13/2017
Date Modified:
Modified by:
--------------------------->

<link href='<%= ResolveUrl("Content/Site.css") %>' rel="stylesheet"/>
<link href='<%= ResolveUrl("Content/set1.css") %>' rel="stylesheet"/>
<link href='<%= ResolveUrl("Content/set2.css") %>' rel="stylesheet"/>
<link href='<%= ResolveUrl("Content/bootstrap.css") %>' rel="stylesheet"/>
<link href='<%= ResolveUrl("Content/demo.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/Breadcrumbs.css") %>' rel="stylesheet"/>

<div class="bible" style="background-image: url(Images/Background.jpg)">
<div class="row">
    <br />
 <div class="container">
                    <ol class="breadcrumb breadcrumb-arrow">
		                <li><a href="#">Inspirations</a></li>
		                <%--<li class="active"><a href="#">Daily Gospel</a></li>--%>
		                <li class="active"><span>Religous Quotes</span></li>
	                </ol>
                </div>
    
    <br/>
    <h1 class="moods">RELIGIOUS QUOTES</h1>
    <h3 class="sub-mood">How are you feeling today?</h3>
    <br />
</div>
<div class="content">
<div class="row">
    <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Anger.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>ANGRY</span>
                    </h2>
                    <p>
                        We win by tenderness. We conquer by forgiveness.<br/>
                        ― Frederick W. Robertson
                    </p>
                    <a class="mood" data-mood="angry" href='<%= ResolveUrl("RelQuotes-Anger.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Alone.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>ALONE</span>
                    </h2>
                    <p>
                        Snuggle in God’s arms. When you are hurting, when you feel lonely, left out. Let Him cradle you, comfort you, reassure you of His all-sufficient power and love. <br/>
                        ― Kay Arthur
                    </p>
                    <a class="mood" data-mood="alone" href='<%= ResolveUrl("RelQuotes-Alone.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Confused.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>CONFUSED</span>
                    </h2>
                    <p>
                        If, then, you are looking for the way by which you should go, take Christ, because He Himself is the way. <br/>
                        ― Thomas Aquinas
                    </p>
                    <a class="mood" data-mood="confused" href='<%= ResolveUrl("RelQuotes-Confused.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Financially.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>FINANCIALLY STRESSED</span>
                    </h2>
                    <p>
                        Wealth is an inner feeling. More precisely, wealth is an outlook, an attitude, a belief. And the most obvious measurement of wealth is gratitude. <br/>
                        ― Bo Sánchez
                    </p>
                    <a class="mood" data-mood="financially stressed" href='<%= ResolveUrl("RelQuotes-Financially.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Rejected.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>REJECTED</span>
                    </h2>
                    <p>
                        A rejection is nothing more than a necessary step in the pursuit of success. <br/>
                        ― Bo Bennett
                    </p>
                    <a class="mood" data-mood="rejected" href='<%= ResolveUrl("RelQuotes-Rejected.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Worried.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>WORRIED</span>
                    </h2>
                    <p>
                        Worry does not empty tomorrow of its sorrow, it empties today of its strength. <br/>
                        ― Corrie ten Boom
                    </p>
                    <a class="mood" data-mood="worried" href='<%= ResolveUrl("RelQuotes-Worried.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Weak.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>WEAK</span>
                    </h2>
                    <p>
                        When we pray for the Spirit's help ... we will simply fall down at the Lord's feet in our weakness. There we will find the victory and power that comes from His love. <br/>
                        ― Andrew Murray
                    </p>
                    <a class="mood" data-mood="weak" href='<%= ResolveUrl("RelQuotes-Weak.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Bitter.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>BITTER</span>
                    </h2>
                    <p>
                        God uses broken things. It takes broken soil to produce a crop, broken clouds to give rain, broken grain to give bread, broken bread to give strength. It is the broken alabaster box that gives forth perfume. It is Peter, weeping bitterly, who returns to greater power than ever. <br/>
                        ― Vance Havner
                    </p>
                    <a class="mood" data-mood="bitter" href='<%= ResolveUrl("RelQuotes-Bitter.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Tempted.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>TEMPTED</span>
                    </h2>
                    <p>
                        It is not a sin to be tempted. The sin is to fall on temptation. <br/>
                        ― Rick Warren
                    </p>
                    <a class="mood" data-mood="tempted" href='<%= ResolveUrl("RelQuotes-Tempted.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Grateful.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>GRATEFUL</span>
                    </h2>
                    <p>
                        Be thankful for what you have; you'll end up having more. If you concentrate on what you don't have, you will never, ever have enough. <br/>
                        ― Oprah Winfrey
                    </p>
                    <a class="mood" data-mood="grateful" href='<%= ResolveUrl("RelQuotes-Grateful.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Peaceful.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>PEACEFUL</span>
                    </h2>
                    <p>
                        An eye for an eye only ends up making the whole world blind. <br/>
                        ― Mahatma Gandhi
                    </p>
                    <a class="mood" data-mood="peace" href='<%= ResolveUrl("RelQuotes-Peaceful.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Joyful.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>JOYFUL</span>
                    </h2>
                    <p>
                        “Even the smallest shift in perspective can bring about the greatest healing. <br/>
                        ― Joshua Kai
                    </p>
                    <a class="mood" data-mood="joyful" href='<%= ResolveUrl("RelQuotes-Joyful.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Faithful.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>FAITHFUL</span>
                    </h2>
                    <p>
                        God never gives someone a gift they are not capable of receiving. If he gives us the gift of Christmas, it is because we all have the ability to understand and receive it. <br/>
                        ― Pope Francis
                    </p>
                    <a class="mood" data-mood="faithful" href='<%= ResolveUrl("RelQuotes-Faithful.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Hopeful.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>HOPEFUL</span>
                    </h2>
                    <p>
                        Happiness is always there. You just have to choose to see it. There's no point dwelling in the dark and ignoring the light of the stars. <br/>
                        ― Carrie Hope Fletcher
                    </p>
                    <a class="mood" data-mood="hopeful" href='<%= ResolveUrl("RelQuotes-Hopeful.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src='<%= ResolveUrl("Images/Bible%20Verses/Love.jpg") %>'/>
                <figcaption>
                    <h2 class="emotion">
                        <span>LOVE</span>
                    </h2>
                    <p>
                        Do ordinary things with extraordinary love. <br/>
                        ― Mother Theresa
                    </p>
                    <a class="mood" data-mood="love" href='<%= ResolveUrl("RelQuotes-Love.aspx") %>'>View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
</div>
</div>
</div>
</asp:Content>
<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
    <script>
        // For Demo purposes only (show hover effect on mobile devices)
        [].slice.call(document.querySelectorAll('a[href="#"')).forEach(function(el) {
            el.addEventListener('click', function(ev) { ev.preventDefault(); });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {

            $(".mood").on("click",
                function() {
                    localStorage.setItem('moodContainer', $(this).data("mood"));
                });
        });
    </script>
</asp:Content>