<%@ Page Title="Categories of Bible Verses" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BibleVerses.aspx.cs" Inherits="SimbahanApp.BibleVerses" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<!---------------------------
Author: Claud Montaril
Description: Bible Verse Inspiration Page
Date Created: 03/8/2017
Date Modified:
Modified by:
--------------------------->

<link href="Content/Site.css" rel="stylesheet"/>
<link href="Content/set1.css" rel="stylesheet"/>
<link href="Content/set2.css" rel="stylesheet"/>
<link href="Content/bootstrap.css" rel="stylesheet"/>
<link href="Content/demo.css" rel="stylesheet"/>

<div class="bible" style="background-image: url(Images/Background.jpg)">
<div class="row">
    <br/>
    <h1 class="moods">BIBLE VERSES</h1>
    <h3 class="sub-mood">How are you feeling today?</h3>
    <br />
</div>
<div class="content">
<div class="row">
    <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Anger.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>ANGRY</span>
                    </h2>
                    <p>
                        A soft answer turns away wrath, but a harsh word stirs up anger. <br/>
                        ― Proverbs 15:1
                    </p>
                    <a class="mood" data-mood="angry" href="Bible-Anger.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Alone.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>ALONE</span>
                    </h2>
                    <p>
                        I will never leave you nor forsake you. <br/>
                        ― Hebrews 13:5
                    </p>
                    <a class="mood" data-mood="alone" href="Bible-Alone.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Confused.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>CONFUSED</span>
                    </h2>
                    <p>
                        Do not let your hearts be troubled. You believe in God; believe also in me. <br/>
                        ― John 14:1
                    </p>
                    <a class="mood" data-mood="confused" href="Bible-Confused.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Financially.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>FINANCIALLY STRESSED</span>
                    </h2>
                    <p>
                        And my God will supply every need of yours according to his riches in glory in Christ Jesus. <br/>
                        ― Philippians 4:19
                    </p>
                    <a class="mood" data-mood="financially stressed" href="Bible-Financially.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Rejected.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>REJECTED</span>
                    </h2>
                    <p>
                        My grace is sufficient for you, for my power is made perfect in weakness. <br/>
                        ― 2 Corinthians 12:9
                    </p>
                    <a class="mood" data-mood="rejected" href="Bible-Rejected.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Worried.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>WORRIED</span>
                    </h2>
                    <p>
                        Therefore do not worry about tomorrow, for tomorrow will worry about itself. Each day has enough trouble of its own. <br/>
                        ― Matthew 6:34
                    </p>
                    <a class="mood" data-mood="worried" href="Bible-Worried.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Weak.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>WEAK</span>
                    </h2>
                    <p>
                        But they who wait for the Lord shall renew their strength; they shall mount up with wings like eagles; they shall run and not be weary; they shall walk and not faint. <br/>
                        ― Isaiah 40:31
                    </p>
                    <a class="mood" data-mood="weak" href="Bible-Weak.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Bitter.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>BITTER</span>
                    </h2>
                    <p>
                        Do not be conformed to this world, but be transformed by the renewal of your mind, that by testing you may discern what is the will of God, what is good and acceptable and perfect. <br/>
                        ― Romans 12:2
                    </p>
                    <a class="mood" data-mood="bitter" href="Bible-Bitter.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Tempted.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>TEMPTED</span>
                    </h2>
                    <p>
                        No temptation has overtaken you except what is common to mankind. And God is faithful; he will not let you be tempted beyond what you can bear. But when you are tempted, he will also provide a way out so that you can endure it. <br/>
                        ― 1 Corinthians 10:13
                    </p>
                    <a class="mood" data-mood="tempted" href="Bible-Tempted.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Grateful.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>GRATEFUL</span>
                    </h2>
                    <p>
                        Give thanks to the LORD, for he is good; his love endures forever. <br/>
                        ― 1 Chronicles 16:34
                    </p>
                    <a class="mood" data-mood="grateful" href="Bible-Grateful.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Peaceful.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>PEACEFUL</span>
                    </h2>
                    <p>
                        So do not fear, for I am with you; do not be dismayed, for I am your God. I will strengthen you and help you; I will uphold you with my righteous right hand. <br/>
                        ― Isaiah 41:10
                    </p>
                    <a class="mood" data-mood="peace" href="Bible-Peaceful.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Joyful.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>JOYFUL</span>
                    </h2>
                    <p>
                        Clap your hands, all you nations; shout to God with cries of joy. <br/>
                        ― Psalm 47:1
                    </p>
                    <a class="mood" data-mood="joyful" href="Bible-Joyful.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Faithful.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>FAITHFUL</span>
                    </h2>
                    <p>
                        Draw near to God and He will draw near to you. Cleanse your hands, you sinners; and purify your hearts, you double-minded. <br/>
                        ― Hebrews 4:8
                    </p>
                    <a class="mood" data-mood="faithful" href="Bible-Faithful.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Hopeful.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>HOPEFUL</span>
                    </h2>
                    <p>
                        The name of the LORD is a fortified tower; the righteous run to it and are safe. <br/>
                        ― Proverbs 18:10
                    </p>
                    <a class="mood" data-mood="hopeful" href="Bible-Hopeful.aspx">View more</a>
                </figcaption>
            </figure>
        </div>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
        <div class="grid">
            <figure class="effect-layla">
                <img src="Images/Bible%20Verses/Love.jpg"/>
                <figcaption>
                    <h2 class="emotion">
                        <span>LOVE</span>
                    </h2>
                    <p>
                        For God so loved the world, that He gave His only begotten Son, that whoever believes in Him shall not perish, but have eternal life. <br/>
                        ― John 3:16
                    </p>
                    <a class="mood" data-mood="love" href="Bible-Love.aspx">View more</a>
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
            $("a.mood").on("click",
                function(e) {
                    e.preventDefault();

                    localStorage.setItem('moodContainer', $(this).data("mood"));

                    window.location.href = $(this).attr('href');
                });
        });
    </script>
</asp:Content>