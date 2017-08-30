<%@ Page Title="Blogs Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Blogs.aspx.cs" Inherits="SimbahanApp.Blogs" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/SimbahanStyle.css" rel="stylesheet" />
    <iframe id="blogs" src="Blogs/Main_Blog_Page/index.html" class="frame1"></iframe>
    
</asp:Content>