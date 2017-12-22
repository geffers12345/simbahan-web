<%@ Page Title="Login Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SimbahanApp.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <!---------------------------
        Author: Claud Montaril
        Description: Anger Mood Page
        Date Created: 03/16/2017
        Date Modified:
        Modified by:   
        --------------------------->

    <link href="Content/SimbahanStyle.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <link href="Content/custom.css" rel="stylesheet" />
   

    <div style="background-image: url(Images/Background.jpg); background-repeat: round">
         <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 login-box-container">
                <h2></h2>
                <section id="loginForm">
                    <div class="form-horizontal">
                        <h4></h4>
                        
                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="FailureText" />
                            </p>
                        </asp:PlaceHolder>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                    CssClass="text-danger" ErrorMessage="The email field is required." />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                            <div class="col-md-10">
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                            </div>
                        </div>
                        <!--<div class="form-group">
                            <div class="col-md-offset-2 col-md-10">
                                <div class="checkbox">
                                    <asp:CheckBox runat="server" ID="RememberMe" />
                                    <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                                </div>
                            </div>
                        </div>-->
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-6">
                                <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-6">
                                 <a href="Register.aspx">Register as a new user</a>
                            </div>
                        </div>
                    </div>
                
                    <p>
                        <%-- Enable this once you have account confirmation enabled for password reset functionality
                        <asp:HyperLink runat="server" Id="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                        --%>
                    </p>
                </section>               
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
     
</asp:Content>

