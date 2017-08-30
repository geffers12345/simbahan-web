<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="SimbahanApp.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
     <!---------------------------
        Author: Claud Montaril
        Description:Ragister Page
        Date Created: 03/16/2017
        Date Modified:
        Modified by:   
        --------------------------->

    <div class="box-body" style="background-image: url(Images/Background.jpg);">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 login-box-container">
                <h2></h2>
                <p class="text-danger">
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </p>

                <div class="form-horizontal">
                    <h4>Create a new account</h4>
                    <hr />
                    <asp:ValidationSummary runat="server" CssClass="text-danger" />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-3 control-label">First Name</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                                CssClass="text-danger" ErrorMessage="The first name field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="LastName" CssClass="col-md-3 control-label">Last Name</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="LastName" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName"
                                CssClass="text-danger" ErrorMessage="The last name field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Birthday" CssClass="col-md-3 control-label">Birthday</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="Birthday" CssClass="form-control" TextMode="Date" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Birthday"
                                CssClass="text-danger" ErrorMessage="The birthday field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-3 control-label">Gender</asp:Label>
                        <div class="col-md-9">
                            <asp:RadioButtonList ID="Gender" runat="server" RepeatDirection="Horizontal" Width="176px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Gender"
                                CssClass="text-danger" ErrorMessage="The gender field is required." />
                        </div>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-3 control-label">Email</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-3 control-label">Password</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-3 control-label">Confirm password</asp:Label>
                        <div class="col-md-9">
                            <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-6">
                            <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" />
                        </div>
                        <div class="form-group">
                            <div class="col-md-offset-2 col-md-6">
                                 <a href="Login.aspx">Already have an account? Click here to Login</a>
                            </div>
                        </div>             
                </div>

            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
        </div>
</asp:Content>
