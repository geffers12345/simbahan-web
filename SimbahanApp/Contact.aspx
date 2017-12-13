<%@ Page Title="Contact Us Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SimbahanApp.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server" >
    
    <link href='<%= ResolveUrl("Content/Site.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/SimbahanStyle.css") %>' rel="stylesheet"/>
    <link href='<%= ResolveUrl("Content/contact.css") %>' rel="stylesheet" />
    <link href='<%= ResolveUrl("Content/magnific-popup.css") %>' rel="stylesheet" />
    <link href='<%= ResolveUrl("Content/agency.min.css") %>' rel="stylesheet" />

    <div class="box-body" style="background-image: url(Images/Background.jpg)">
        <div class="row">
            <h1 class="moods">CONTACT US</h1>
            <br />
            <br />
            <h2 class="text-center">We would love to connnect with you</h2>
           </div>
            <%--<div class="container second-portion">
                <div class="row">
                    <!-- Boxes de Acoes -->
                    <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="box">
                            <div class="icon">
                                <div class="image"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                                <div class="info">
                                    <br />
                                    <h3 class="title">MAIL & WEBSITE</h3>
                                    <p>
                                        <i class="fa fa-envelope" aria-hidden="true"></i>&nbsp info@hardik.com
						
                                        <br>
                                        <br>
                                        <i class="fa fa-globe" aria-hidden="true"></i>&nbsp www.gondhiya.com
					
                                    </p>

                                </div>
                            </div>
                            <div class="space"></div>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="box">
                            <div class="icon">
                                <div class="image"><i class="fa fa-mobile" aria-hidden="true"></i></div>
                                <div class="info">
                                    <br />
                                    <h3 class="title">CONTACT</h3>
                                    <p>
                                        <i class="fa fa-mobile" aria-hidden="true"></i>&nbsp (+91)-97120 20865
						
                                        <br>
                                        <br>
                                        <i class="fa fa-mobile" aria-hidden="true"></i>&nbsp  (+91)-7567065254 
					
                                    </p>

                                </div>
                            </div>
                            <div class="space"></div>
                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-6 col-lg-4">
                        <div class="box">
                            <div class="icon">
                                <div class="image"><i class="fa fa-map-marker" aria-hidden="true"></i></div>
                                <div class="info">
                                    <br />
                                    <h3 class="title">ADDRESS</h3>
                                    <p>
                                        <i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp Office no.33 , 2nd floor , Akshay  Commercial Complex,, Near Swaminarayan Gurukul, Gondal Rd,, Rajkot-360004
					
                                    </p>
                                </div>
                            </div>
                            <div class="space"></div>
                        </div>
                    </div>
                    <!-- /Boxes de Acoes -->
                </div>
            </div>--%>
        <section id="services">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <hr class="primary">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-map-marker text-primary sr-icons"></i>
                        <br />
                        <h3 class="text-center">Address</h3>
                        <br />
                        <p class="text-center">1801 West Trade Building, West Avenue, Quezon City</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-envelope-o text-primary sr-icons"></i>
                        <br />
                       <h3 class="text-center">General Inquiries</h3>
                        <br />
                        <p class="text-muted">You may send your inquiries / feedback to the following</p>
                        <br />
                        <p class="text-center">Church Related: <strong><a class="contact" href="mailto:churchinfo@mycatholicportal.org">churchinfo@mycatholicportal.org</a></strong></p>
                        <br />
                        <p class="text-center">Catholic Organization Related: <strong><a class="contact" href="mailto:organizationinfo@mycatholicportal.org">organizationinfo@mycatholicportal.org</a></strong></p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-phone text-primary sr-icons"></i>
                        <br />
                        <h3 class="text-center">Phone</h3>
                        <br />
                        <p class="text-center black">+63 2 356 74 89</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-clock-o text-primary sr-icons"></i>
                        <br />
                        <h3 class="text-center">Office Hours</h3>
                        <br />
                        <p class="text-center">Monday - Friday</p>
                        <p class="text-center">9 AM - 5 PM</p>
                    </div>
                </div>
            </div>
    </section>
        <%-- <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h4 class="section-subheading text-muted">Feel free to fill up this for if you have questions, comments, suggestions or feedbacks about the website.</h4>
                </div>
            </div>
            <br />
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ControlToValidate="YourName" ValidationGroup="save" /><br />
                                    <asp:TextBox Placeholder="Name" ID="YourName" runat="server" />
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="YourEmail" ValidationGroup="save" /><br />
                                    <asp:TextBox Placeholder="Email" ID="YourEmail" runat="server" />
                                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator23" SetFocusOnError="true" Text="Example: username@gmail.com" ControlToValidate="YourEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic" ValidationGroup="save" />
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="YourSubject" ValidationGroup="save" /><br />
                                    <asp:TextBox Placeholder="Subject" ID="YourSubject" runat="server" />
                                </div>
                                </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="Comments" ValidationGroup="save" /><br />
                                    <asp:TextBox Placeholder="Inquiry" ID="Comments" runat="server" TextMode="MultiLine" Rows="10" />
                                </div>
                            </div>
                            <div class="col-lg-12 text-center">
                                <div class="eltd-listing-search-submit-holder">
                                 <asp:Button ID="btnSubmit" runat="server" Text="Send"  />
                                    </div>
                                <p>
                                <asp:Label ID="DisplayMessage" runat="server" Visible="false" />
                                </p> 
                            </div>
                        </div>
        </div>
    </section>--%></div>
</asp:Content>

<asp:Content ID="ScriptsPlaceHolder" ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">

    <script src="Scripts/scrollreveal.min.js"></script>
    <script src="Scripts/jquery.magnific-popup.min.js"></script>
    <script src="Scripts/creative.min.js"></script>
<%--    <script src="Scripts/agency.min.js"></script>
    <script src="Scripts/contact_me.js"></script>
    <script src="Scripts/jqBootstrapValidation.js"></script>--%>

</asp:Content>