<%@ Page Title="Blogs Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Blogs.aspx.cs" Inherits="SimbahanApp.Blogs" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<link href="Content/SimbahanStyle.css" rel="stylesheet" />
    <iframe id="blogs" src="Blogs/Main_Blog_Page/index.html" class="frame1"></iframe>--%>

    <link href="Content/blog-home.css" rel="stylesheet" />

    <div class="headcontainer">
        <img src="Images/blogheader.png" width="100%"/>
    </div>

     <!-- Page Content -->
    <div class="container">

      <div class="row">

        <!-- Blog Entries Column -->
        <div class="col-md-8">

          <h1 class="my-4">Articles About Faith and Inspirations
            
          </h1>

          <!-- Blog Post -->
          <div class="card mb-4">
            <img class="card-img-top" src="Images/20121030-QUEZONCITY-NEX5N-0002.png" alt="Card image cap">
            <div class="card-body">
              <h2 class="card-title">Top 10 Most Beautiful Churches in Quezon City</h2>
              <p class="card-text">Hi Everyone. For those living or for those who wanted to visit the Quezon City Area, here's our list of Beautiful Churches in said area that you might want to visit:</p>
              <a href="Blog-1.html" class="btn btn-primary">Read More &rarr;</a>
            </div>
            <div class="card-footer text-muted">
              Posted on January 1, 2017 by
              <a href="#">MyCatholicPortal.org</a>
            </div>
          </div>

          <!-- Blog Post -->
          <div class="card mb-4">
            <img class="card-img-top" src="Images/ManilaCathedralCover.png" alt="Card image cap">
            <div class="card-body">
              <h2 class="card-title">Top 10 Most Beautiful Churches in Manila</h2>
              <p class="card-text">Aside from our world-class beach resorts and our famous Filipino hospitality, Philippines is also known as a predominantly Catholic country, something we inherited after 300 years of being under the Spaniards.  Only third from Brazil and Mexico in terms of Catholic Population, 81.4% or over 81 million Filipinos are Catholics. Our culture has been heavily shaped by Catholicism to the point that some Catholic traditions, such as the Sinulog Festival, has become a tourist attraction in the country.  </p>
              <a href="#" class="btn btn-primary">Read More &rarr;</a>
            </div>
            <div class="card-footer text-muted">
              Posted on January 1, 2017 by
              <a href="#">MyCatholicPortal.org</a>
            </div>
          </div>

          <!-- Blog Post -->
          <div class="card mb-4">
            <img class="card-img-top" src="Images/MakatiCover.png" alt="Card image cap">
            <div class="card-body">
              <h2 class="card-title">Top 10 Most Beautiful Churches in Makati</h2>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis aliquid atque, nulla? Quos cum ex quis soluta, a laboriosam. Dicta expedita corporis animi vero voluptate voluptatibus possimus, veniam magni quis!</p>
              <a href="#" class="btn btn-primary">Read More &rarr;</a>
            </div>
            <div class="card-footer text-muted">
              Posted on January 1, 2017 by
              <a href="#">MyCatholicPortal.org</a>
            </div>
          </div>

          <%--<!-- Pagination -->
          <ul class="pagination justify-content-center mb-4">
            <li class="page-item">
              <a class="page-link" href="#">&larr; Older</a>
            </li>
            <li class="page-item disabled">
              <a class="page-link" href="#">Newer &rarr;</a>
            </li>
          </ul>--%>

        </div>

        <!-- Sidebar Widgets Column -->
        <div class="col-md-4" style="padding-top: 111px;">

          <!-- Search Widget -->
          <div class="card my-4">
            <h5 class="card-header">Search</h5>
            <div class="card-body">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search for...">
                <span class="input-group-btn">
                  <button class="btn btn-secondary" type="button">Go!</button>
                </span>
              </div>
            </div>
          </div>

          <!-- Categories Widget -->
          <div class="card my-4">
            <h5 class="card-header">Articles</h5>
            <div class="card-body">
              <div class=row>
                <div class="col-lg-6">
                  <ul class="list-unstyled mb-0">
                    <li>
                      <a href="#">Top 10 Most Beautiful Churches in Quezon City </a>
                    </li>
                    <li>
                      <a href="#">Top 10 Most Beautiful Churches in Manila</a>
                    </li>
                    <li>
                      <a href="#">Top 10 Most Beautiful Churches in Makati</a>
                    </li>
                  </ul>
                </div>
                
                
         <%-- <!-- Side Widget -->
          <div class="card my-4">
            <h5 class="card-header">Side Widget</h5>
            <div class="card-body">
              You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
            </div>
          </div>--%>

        </div>

      </div>
      <!-- /.row -->

    </div></div></div></div>
    <!-- /.container -->
         <script src="Scripts/popper.min.js"></script>
    
</asp:Content>