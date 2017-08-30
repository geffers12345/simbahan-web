<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MusicalInspirations.aspx.cs" Inherits="SimbahanApp.MusicalInspirations" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

   
	 <!---------------------------
		Author: Claud Montaril
		Description: Musical Inspiration Page
		Date Created: 03/8/2017
		Date Modified:
		Modified by:   
		--------------------------->

	<%--<link href="Content/Site.css" rel="stylesheet" />--%>
	<link href="Content/set1.css" rel="stylesheet" />
	<link href="Content/set2.css" rel="stylesheet" />
	<link href="Content/bootstrap.css" rel="stylesheet" />
	<link href="Content/demo.css" rel="stylesheet" />

	 <div class="bible" style="background-image: url(Images/Background.jpg)">
		<div class="row">
			<br />
			<h1 class="moods">MUSICAL INSPIRATION</h1>
		</div>
		 <div class="content">
		 <div class="row">
			<div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
			   <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Anger.jpg" />
						<figcaption>
							<h2 class="emotion"><span>ANGRY</span></h2>
							<p> They don't know that I come running home when I fall down<br/>
								They don't know who picks me up when no one is around<br />
								I drop my sword and cry for just a while<br/>
								'Coz deep inside this armor<br/>
								The warrior is a child<br />
						 ― Warrior is A Child by Gary Valenciano
							</p>
							<a class="mood" data-mood="anger" href="Musical-Anger.aspx">View more</a>
						</figcaption>			
					</figure>					
				</div>
			</div>
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				<div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Alone.jpg" />
						<figcaption>
							<h2 class="emotion"><span>ALONE</span></h2>
							<p>Hear me Jesus <br />
								Hide me in thy wounds<br />
								That I may never leave thy side<br />
						 ― Anima Cristi by Bukas Palad</p>
							<a class="mood" data-mood="alone" href="Musical-Alone.aspx">View more</a>
						</figcaption>			
					</figure>					
				</div> 
			</div>
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				  <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Confused.jpg" />
						<figcaption>
							<h2 class="emotion"><span>CONFUSED</span></h2>
							<p>Whom shall I fear?
							   Whom shall I fear? <br />
							  'Cause I am Yours, I am Yours.<br />
						 ― Who I am by Casting Crown</p>
							<a class="mood" data-mood="confused" href="Musical-Confused.aspx">View more</a>
						</figcaption>			
					</figure>					
				</div>
			</div>
		</div>
		 <div class="row">
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				 <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Financially.jpg" />
						<figcaption>
							<h2 class="emotion"><span>FINANCIALLY STRESSED</span></h2>
							<p>Here in you I find shelter <br />
							   Captivated by the splendor <br />
							   Of your face, my secret place <br />
						 ― Sinking Deep by Hillsong Young & Free</p>
							<a class="mood" data-mood="financially stressed" href="Musical-Financially.aspx">View more</a>
						</figcaption>								</figure>					
				</div>
			 </div>
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				 <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Rejected.jpg" />
						<figcaption>
							<h2 class="emotion"><span>REJECTED</span></h2>
							<p>I will call upon Your name <br />
							   Keep my eyes above the waves <br />
							   My soul will rest in Your embrace <br />
							   I am Yours and You are mine<br />
						 ― Oceans by Hillsong United</p>
							<a class="mood" data-mood="rejected" href="Musical-Rejected.aspx">View more</a>
						</figcaption>								
					</figure>					
				</div>
			 </div>
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				 <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Worried.jpg" />
						<figcaption>
							<h2 class="emotion"><span>WORRIED</span></h2>
							<p>Your presence is heaven to me<br/>
							Your presence is heaven to me<br />
						 ― Your Presence is Heaven by Israel & New Breed</p>
							<a class="mood" data-mood="worried" href="Musical-Worried.aspx">View more</a>
						</figcaption>								
					</figure>					
				</div>
			 </div>
		 </div>
		  <div class="row">
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				 <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Weak.jpg" />
						<figcaption>
							<h2 class="emotion"><span>WEAK</span></h2>
							<p>My chains are gone <br />
							   I've been set free <br />
							   My God, my Savior has ransomed me <br />
						 ― Amazing Grace by Chris Tomlin</p>
							<a class="mood" data-mood="weak" href="Musical-Weak.aspx">View more</a>
						</figcaption>								
					</figure>					
				</div> 
			 </div>
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				 <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Bitter.jpg" />
						<figcaption>
							<h2 class="emotion"><span>BITTER</span></h2>
							<p>There will be a day with no more tears, <br />
							   No more pain, and no more fears <br />
							   There will be a day when the burdens of this place <br />
							   Will be no more, we'll see Jesus face to face <br />
						 ― There Will Be A Day by Jeremy Camp</p>
							<a class="mood" data-mood="bitterness" href="Musical-Bitter.aspx">View more</a>
						</figcaption>								
					</figure>					
				</div>
			 </div>
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				 <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Tempted.jpg" />
						<figcaption>
							<h2 class="emotion"><span>TEMPTED</span></h2>
							<p>Light of the world, You step down into darkness. <br />
							   Opened my eyes let me see. <br />
							   Beauty that made this heart adore you hope of a life spent with you. <br />
						 ― Here I am to worship by </p>
							<a class="mood" data-mood="tempted" href="Musical-Tempted.aspx">View more</a>
						</figcaption>								
					</figure>					
				</div>
			 </div>
		 </div>
		 <div class="row">
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				 <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Grateful.jpg" />
						<figcaption>
							<h2 class="emotion"><span>GRATEFUL</span></h2>
							<p>Set a fire down in my soul<br/>
							That I can't contain<br />
							I can't control<br/>
							I want more of you God<br/>
						 ― Set a Fire</p>
							<a class="mood" data-mood="grateful" href="Musical-Grateful.aspx">View more</a>
						</figcaption>								
					</figure>					
				</div>
			 </div>
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				 <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Peaceful.jpg" />
						<figcaption>
							<h2 class="emotion"><span>PEACEFUL</span></h2>
							<p>Name above all names<br/>
							Worthy of all praise<br/>
							My heart will sing<br/>
							How great is our God<br />
						 ― How Great is Our God</p>
							<a class="mood" data-mood="peace" href="Musical-Peaceful.aspx">View more</a>
						</figcaption>								
					</figure>					
				</div>
			 </div>
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				  <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Joyful.jpg" />
						<figcaption>
							<h2 class="emotion"><span>JOYFUL</span></h2>
							<p>Sumasayaw na nga, Sa galak tumatawa<br/>
							Nananabik na makita muli mong pagbisita<br/>
							Panginoong Hesus… Malayang malaya Ka<br/>
							Baguhin Mo ang buhay ko Ito’y Iyong Iyo<br />
						 ― Sabik sa Presensya Mo</p>
							<a class="mood" data-mood="joyful" href="Musical-Joyful.aspx">View more</a>
						</figcaption>								
					</figure>					
				</div>
			 </div>
		 </div>
		 <div class="row">
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				 <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Faithful.jpg" />
						<figcaption>
							<h2 class="emotion"><span>FAITHFUL</span></h2>
							<p>Through You I can do anything<br/>
								I can do all things<br/>
								Cause it's You who give me strength<br/>
								Nothing is impossible<br/>
								Through You<br/>
								Blind eyes are opened<br/>
								Strongholds are broken
								I am living by faith
								Nothing is impossible!<br />
						 ― Nothing is Impossible</p>
							<a class="mood" data-mood="faithful" href="Musical-Faithful.aspx">View more</a>
						</figcaption>								
					</figure>					
				</div> 
			 </div>
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				 <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Hopeful.jpg" />
						<figcaption>
							<h2 class="emotion"><span>HOPEFUL</span></h2>
							<p>You raise me up, so I can stand on mountains;<br/>
							You raise me up to walk on stormy seas;<br/>
							I am strong when I am on your shoulders;<br/>
							You raise me up to more than I can be.<br/>
						 ― You Raise Me Up</p>
							<a class="mood" data-mood="hopeful" href="Musical-Hopeful.aspx">View more</a>
						</figcaption>								
					</figure>					
				</div>
			 </div>
			 <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
				 <div class="grid">
					<figure class="effect-layla">
						<img src="Images/Bible%20Verses/Love.jpg" />
						<figcaption>
							<h2 class="emotion"><span>LOVE</span></h2>
							<p>I know I still make mistakes<br/>
							But You have new mercies for me everyday<br/>
							Your love never fails<br />
						 ― Your Love Never Fails</p>
							<a class="mood" data-mood="love" href="Musical-Love.aspx">View more</a>
						</figcaption>								
					</figure>					
				</div>
			 </div>
		 </div>       
  </div>   
  </div>

</asp:Content>
<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
	 <script type="text/javascript">
		 $(document).ready(function () {

			 $(".mood").on("click", function () {
				 localStorage.setItem('moodContainer', $(this).data("mood"));
			 });
		 });
	</script>
</asp:Content>