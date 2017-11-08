<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrganizationAddListing.aspx.cs" Inherits="SimbahanApp.OrganizationAddListing" EnableEventValidation="false"%>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<style>
    .col-md-6 {
        z-index: 1;
    }
    input[type=text], select{
        border-radius: 0px !important;
        z-index: 999999999;
    }

    .myClass {
        height: 15px;
        width: 15px;
    }

    tr {
        border: none !important;
        border-color: none !important;
    }   

    td {
        border: none !important;
        border-color: none !important;
    }


    /* The containers */
.containers {
    display: block;
    position: relative;
    padding-left: 35px;
    margin-bottom: 12px;
    cursor: pointer;
    /*font-size: 22px;*/
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

/* Hide the browser's default checkbox */
.containers input {
    position: absolute;
    opacity: 0;
}

/* Create a custom checkbox */
.checkmark {
    position: absolute;
    top: 0;
    left: 0;
    height: 25px;
    width: 25px;
    background-color: #eee;
}

/* On mouse-over, add a grey background color */
.containers:hover input ~ .checkmark {
    background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.containers input:checked ~ .checkmark {
    background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
    content: "";
    position: absolute;
    display: none;
}

/* Show the checkmark when checked */
.containers input:checked ~ .checkmark:after {
    display: block;
}

/* Style the checkmark/indicator */
.containers .checkmark:after {
    left: 9px;
    top: 5px;
    width: 5px;
    height: 10px;
    border: solid white;
    border-width: 0 3px 3px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}
</style>
<div class="box-body" style="background-color: white;">
    <div class="container">
        <strong>
            <h2>CHURCH ORGANIZATION INFORMATION SHEET</h2>
        </strong>
        <form role="form" class="form-horizontal">
            <div class="row">
                <div class="col-md-12">
                    <label>Organization Name</label>
                    <input type="text" id="orgName" placeholder="Organization Name" class="form-control input-lg" />
                </div>
                <div class="col-md-6">
                    <label>Latitude</label>
                    <input type="text" id="latitude" class="form-control input-lg" placeholder="Latitude" />
                </div>
                <div class="col-md-6">
                    <label>Latitude</label>
                    <input type="text" id="longitude" class="form-control input-lg" placeholder="Longitude" />
                </div>
                <div class="col-md-12">
                    <label>Address</label>
                    <input type="text" id="address" placeholder="Address" class="form-control input-lg" />
                </div>
                <div class="col-md-6">
                    <label>City</label>
                    <input type="text" id="City" class="form-control input-lg" placeholder="City" />
                </div>
                <div class="col-md-6">
                    <label>Province</label>
                    <input type="text" id="province" class="form-control input-lg" placeholder="Province" />
                </div>
                <div class="col-md-6">
                    <label>Branch</label>
                    <input type="text" id="branch" class="form-control input-lg" placeholder="Branch" />
                </div>
                <div class="col-md-6">
                    <label>Parent Organization</label>
                    <input type="text" id="parent" class="form-control input-lg" placeholder="Parent Organization" />
                </div>
                <div class="col-md-6">
                    <label>Contact Number</label>
                    <input type="text" id="contact" class="form-control input-lg" placeholder="Contact" />
                </div>
                <div class="col-md-6">
                    <label>Website</label>
                    <input type="text" id="website" class="form-control input-lg" placeholder="Website" />
                </div>
                <div class="col-md-6">
                    <label>Email</label>
                    <input type="email" id="email" class="form-control input-lg" placeholder="Email" />
                </div>
                <div class="col-md-6">
                    <label>Date Established</label>
                    <input type="text" id="date" class="form-control input-lg" placeholder="Date Established" />
                </div>
                <div class="col-md-12">
                    <h3>ORGANIZATION FACILITIES</h3>
                    <div class="col-md-4">
                    <h5>ORGANIZATION VENUE VENTILATION</h5>
                    <label class="containers">AIR CONDITIONED
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">CEILING FAN
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">WALL FAN
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">STAND FAN
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                </div>
                <div class="col-md-4">
                     <h5>ACTIVITY VENUE</h5>
                    <label class="containers">CHURCH
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">SCHOOLS
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">PUBLIC PLACE
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">MALL
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">PRIVATE BUILDING
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                </div>
                <div class="col-md-4">
                    <h5>VEHICLE PARKING</h5>
                    <label class="containers">STREET PARKING
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">MALL PARKING
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">PRIVATE LOT
                      <input type="checkbox">
                      <span class="checkmark"></span>
                    </label>
                    </div>
                    <div class="row" style="clear: both;">
                        <div class="col-md-12">
                            <h3>ORGANIZATION ACTIVITIES</h3>
                            <div class="col-md-3">
                                <label class="containers">WORSHIP
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">MASS
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">RECOLLECTION
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">TALKS
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="col-md-3">
                                <label class="containers">BIBLE STUDY
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">RETREAT
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">VOLUNTEER WORKS
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">CAMPS
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                            </div>
                           
                            <div class="col-md-3" style="margin-top: -2.3%;">
                                 <h3>ATTENDEES</h3>
                                <label class="containers">MEN
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">SINGLES
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">PROFESSIONALS
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">MISSIONARIES
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="col-md-3">
                                <label class="containers">WOMEN
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">COUPLES
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">STUDENTS
                                  <input type="checkbox">
                                  <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label>AFFILIATED ORGANIZATIONS</label>
                        <input type="text" id="affiliated" class="form-control input-lg" placeholder="Affiliated Organization" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
</asp:Content>
