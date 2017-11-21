﻿<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrganizationAddListing.aspx.cs" Inherits="SimbahanApp.OrganizationAddListing" EnableEventValidation="false"%>


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

thead {
    border: 1px solid #eee;
    background-color: black;
    color: white;
}

td {
    border: 1px solid #eee;
    text-align: center;
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
                <div class="col-md-2" style="z-index: 1;">
                    <label>City</label>
                    <input type="text" id="City" class="form-control input-lg" placeholder="City" />
                </div>
                <div class="col-md-5" style="z-index: 1;">
                    <label>Street No.</label>
                    <input type="text" id="streetNo" class="form-control input-lg" placeholder="Stret Number" />
                </div>
                <div class="col-md-5" style="z-index: 1;">
                    <label>Street Name</label>
                    <input type="text" id="streetName" class="form-control input-lg" placeholder="Street Name" />
                </div>
                <div class="col-md-6">
                    <label>Barangay</label>
                    <input type="text" id="barangay" class="form-control input-lg" placeholder="Barangay" />
                </div>
                <div class="col-md-6">
                    <label>Province</label>
                    <input type="text" id="province" class="form-control input-lg" placeholder="Province" />
                </div>
                <div class="col-md-6">
                    <label>Country</label>
                    <input type="text" id="country" class="form-control input-lg" placeholder="Philippines" disabled/>
                </div>
                <div class="col-md-6">
                    <label>Feast Builder</label>
                    <input type="text" id="builder" class="form-control input-lg" placeholder="Feast Builder" />
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
                    <label>About</label>
                    <input type="text" id="about" class="form-control input-lg" placeholder="About" />
                </div>
                <div class="col-md-12">
                    <h3>ORGANIZATION FACILITIES</h3>
                    <div class="col-md-4">
                    <h5>ORGANIZATION VENUE VENTILATION</h5>
                    <label class="containers">AIR CONDITIONED
                      <input type="checkbox" id="airCon" class="vent" runat="server" name="getVentID" value="1">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">CEILING FAN
                      <input type="checkbox" id="ceiling" class="vent" runat="server" name="getVentID" value="2">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">WALL FAN
                      <input type="checkbox" id="wallFan" class="vent" runat="server" name="getVentID" value="3">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">STAND FAN
                      <input type="checkbox" id="standFan" class="vent" runat="server" name="getVentID" value="4">
                      <span class="checkmark"></span>
                    </label>
                </div>
                <div class="col-md-4">
                     <h5>ACTIVITY VENUE</h5>
                    <label class="containers">CHURCH
                      <input type="checkbox" id="church" class="venue" runat="server" name="getVenueID" value="1">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">SCHOOLS
                      <input type="checkbox" id="school" class="venue" runat="server" name="getVenueID" value="2">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">PUBLIC PLACE
                      <input type="checkbox" id="publicPlace" class="venue" runat="server" name="getVenueID" value="4">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">MALL
                      <input type="checkbox" id="mall" class="venue" runat="server" name="getVenueID" value="3">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">PRIVATE BUILDING
                      <input type="checkbox" id="private" class="venue" runat="server" name="getVenueID" value="3">
                      <span class="checkmark"></span>
                    </label>
                </div>
                <div class="col-md-4">
                    <h5>VEHICLE PARKING</h5>
                    <label class="containers">STREET PARKING
                      <input type="checkbox" id="street" class="parking" runat="server" name="getParkingID" value="1">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">MALL PARKING
                      <input type="checkbox" id="mallPark" class="parking" runat="server" name="getParkingID" value="2">
                      <span class="checkmark"></span>
                    </label>
                    <label class="containers">PRIVATE LOT
                      <input type="checkbox" id="privateLot" class="parking" runat="server" name="getParkingID" value="3">
                      <span class="checkmark"></span>
                    </label>
                     <label class="containers">OTHER PARKING
                      <input type="checkbox" id="otherParking" class="parking" runat="server" name="getParkingID" value="4">
                      <span class="checkmark"></span>
                    </label>
                    </div>
                    <div class="row" style="clear: both;">
                        <div class="col-md-12">
                            <h3>ORGANIZATION ACTIVITIES</h3>
                            <div class="col-md-3">
                                <label class="containers">WORSHIP
                                  <input type="checkbox" id="worship" class="activities" runat="server" name="getActID" value="2">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">MASS
                                  <input type="checkbox" id="mass" class="activities" runat="server" name="getActID" value="4">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">RECOLLECTION
                                  <input type="checkbox" id="recollect" class="activities" runat="server" name="getActID" value="6">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">TALKS
                                  <input type="checkbox" id="talk" class="activities" runat="server" name="getActID" value="8">
                                  <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="col-md-3">
                                <label class="containers">BIBLE STUDY
                                  <input type="checkbox" id="bibleStudy" class="activities" runat="server" name="getActID" value="3">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">RETREAT
                                  <input type="checkbox" id="retreats" class="activities" runat="server" name="getActID" value="5">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">VOLUNTEER WORKS
                                  <input type="checkbox" id="vw" class="activities" runat="server" name="getActID" value="7">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">CAMPS
                                  <input type="checkbox" id="camp" class="activities" runat="server" name="getActID" value="9">
                                  <span class="checkmark"></span>
                                </label>
                            </div>
                           
                            <div class="col-md-3" style="margin-top: -2.3%;">
                                 <h3>ATTENDEES</h3>
                                <label class="containers">MEN
                                  <input type="checkbox" id="men" class="attendees" runat="server" name="getAttID" value="1">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">SINGLES
                                  <input type="checkbox" id="singles" class="attendees" runat="server" name="getAttID" value="2">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">PROFESSIONALS
                                  <input type="checkbox" id="prof" class="attendees" runat="server" name="getAttID" value="3">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">MISSIONARIES
                                  <input type="checkbox" id="missionaries" class="attendees" runat="server" name="getAttID" value="7">
                                  <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="col-md-3">
                                <label class="containers">WOMEN
                                  <input type="checkbox" id="women" class="attendees" runat="server" name="getAttID" value="6">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">COUPLES
                                  <input type="checkbox" id="couples" class="attendees" runat="server" name="getAttID" value="5">
                                  <span class="checkmark"></span>
                                </label>
                                <label class="containers">STUDENTS
                                  <input type="checkbox" id="student" class="attendees" runat="server" name="getAttID" value="4">
                                  <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label>AFFILIATED ORGANIZATIONS</label>
                        <input type="text" id="affiliated" class="form-control input-lg" placeholder="Affiliated Organization" />
                    </div>
                    <div class="col-md-12">
                        <h3>SCHEDULES</h3>
                        <h5>WORSHIP SCHEDULES</h5>
                        <div class="col-md-2">
                            <label class="containers">MONDAY
                                <input type="checkbox" id="worMon">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">TUESDAY
                                <input type="checkbox" id="worTue">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">WEDNESDAY
                                <input type="checkbox" id="worWed">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">THURSDAY
                                <input type="checkbox" id="worThu">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">FRIDAY
                                <input type="checkbox" id="worFri">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">SATURDAY
                                <input type="checkbox" id="worSat">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">SUNDAY
                                <input type="checkbox" id="worSun">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="col-md-2">
                            <label>From:</label>
                            <input type="text" id="worshipFrom" runat="server" class="form-control input-lg" placeholder="Worship Started"/>

                            <label>To:</label>
                            <input type="text" id="worshipTo" runat="server" class="form-control input-lg" placeholder="Worship Ended"/><br />
                            <button id="addWorship" class="btn btn-primary btn-block">Add Worship</button>
                        </div>
                        <div class="col-md-8">
                            <table>
                                <thead>
                                    <tr><td>Days(Worship)</td><td>From</td><td>To</td><td>Action</td></tr>
                                </thead>
                                <tbody id="worshipTable">

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-12" style="clear: both">
                        <h5>MASS SCHEDULES</h5>
                        <div class="col-md-2">
                            <label class="containers">MONDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">TUESDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">WEDNESDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">THURSDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">FRIDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">SATURDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">SUNDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label>From:</label>
                            <input type="text" id="massFrom" runat="server" class="form-control input-lg" placeholder="Mass Started"/>

                            <label>To:</label>
                            <input type="text" id="MassTo" runat="server" class="form-control input-lg" placeholder="Mass Ended"/>

                            <label>Language:</label>
                            <input type="text" id="massLanguage" runat="server" class="form-control input-lg" placeholder="Language"/><br />
                            <button id="addMass" class="btn btn-primary btn-block">Add Mass</button>
                        </div>
                        <div class="col-md-6">
                            <table>
                                <thead>
                                    <tr><td>Days(Mass)</td><td>Langauge</td><td>From</td><td>To</td><td>Action</td></tr>
                                </thead>
                                <tbody id="massTable" runat="server">

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-12" style="clear: both">
                        <h5>BIBLE STUDY SCHEDULES</h5>
                        <div class="col-md-2">
                            <label class="containers">MONDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">TUESDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">WEDNESDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">THURSDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">FRIDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">SATURDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">SUNDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label>From:</label>
                            <input type="text" id="bibleFrom" runat="server" class="form-control input-lg" placeholder="Bible Study Started"/>

                            <label>To:</label>
                            <input type="text" id="bibleTo" runat="server" class="form-control input-lg" placeholder="Bible Study Ended"/><br />

                            <button id="addBible" class="btn btn-primary btn-block">Add Bible Study</button>
                        </div>
                        <div class="col-md-6">
                            <table>
                                <thead>
                                    <tr><td>Days(Bible)</td><td>From</td><td>To</td><td>Action</td></tr>
                                </thead>
                                <tbody id="bibleTable" runat="server">

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-12" style="clear: both">
                        <div class="col-md-12">
                            <label>RETREAT SCHEDULE</label>
                            <input type="text" id="retreat" class="form-control input-lg" placeholder="Retreat" />
                        </div>
                    </div>
                     <div class="col-md-12" style="clear: both;">
                         <div class="col-md-6">
                              <label>RECOLLECTION</label>
                              <input type="text" id="recollection" class="form-control input-lg" placeholder="Recollection" />
                              <label>TALKS</label>
                              <input type="text" id="talks" class="form-control input-lg" placeholder="Talks" />
                         </div>
                          <div class="col-md-6">
                              <label>CAMPS</label>
                              <input type="text" id="camps" class="form-control input-lg" placeholder="Camps" />
                              <label>VOLUNTEER WORKS</label>
                              <input type="text" id="volunteerWorks" class="form-control input-lg" placeholder="Volunteer Works" />
                         </div>
                    </div>
                    <div class="col-md-12" style="clear: both;">
                        <h3>OTHER EVENTS</h3>
                         <div class="col-md-6">
                              <label>EVENT NAME</label>
                              <input type="text" id="eventName" class="form-control input-lg" placeholder="Event Name" />
                              <label>EVENT VENUE</label>
                              <input type="text" id="eventVenue" class="form-control input-lg" placeholder="Event Venue" />
                              <label>DESCRIPTION</label>
                              <textarea id="eventDesc" class="form-control input-lg" placeholder="Event Description"></textarea>
                              <label>ATTACH PICTURE</label>
                              <input type="file" id="eventPicture" class="form-control input-lg" />
                         </div>
                        <div class="col-md-6">
                              <label>START DATE</label>
                              <input type="text" id="startDate" class="form-control input-lg" placeholder="Event Date" />
                              <label>START TIME</label>
                              <input type="text" id="startTime" class="form-control input-lg" placeholder="Start Time" />
                              <label>END DATE</label>
                              <input type="text" id="endDate" class="form-control input-lg" placeholder="End Date" />
                              <label>END TIME</label>
                              <input type="text" id="endTime" class="form-control input-lg"placeholder="End Time" /><br /><br />
                         </div>
                    </div>
                    <div class="col-md-12">
                        <button id="addEvent" class="btn btn-primary btn-block" style="width: 50%; margin-left: 25%;">Add Event</button><br /><br />
                        <table>
				            <thead>
					            <tr class="bg-primary">
						            <td class="text-center">
				                    <strong>Event Name</strong>
			                        </td>
			                        <td class="text-center">
				                        <strong>Venue</strong>
			                        </td>
			                        <td class="text-center">
				                        <strong>Description</strong>
			                        </td>
			                        <td class="text-center">
				                        <strong>Banner Name</strong>
			                        </td>
			                        <td class="text-center">
				                        <strong>Start Date</strong>
			                        </td>
			                        <td class="text-center">
				                        <strong>Start Time</strong>
			                        </td>
			                        <td class="text-center">
				                        <strong>End Date</strong>
			                        </td>
			                        <td class="text-center">
				                        <strong>End Time</strong>
			                        </td>
			                        <td class="text-center">
				                        <strong>Action</strong>
			                        </td>
					            </tr>
				            </thead>
				            <tbody id="eventContainer">
				            </tbody>
			            </table><br />
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <h3>ADD CHURCH PHOTOS</h3><br />
                            <asp:FileUpload ID="FileUpload1" runat="server" /><br />
                            <asp:FileUpload ID="FileUpload2" runat="server" /><br />
                            <asp:FileUpload ID="FileUpload3" runat="server" />
                        </div>
                        <div class="col-md-6">
                            <h3>ADD CHURCH THUMBNAIL</h3><br />
                            <asp:FileUpload ID="FileUpload4" runat="server" />
                        </div>
                    </div>
                    <div class="col-md-12" style="clear: both;">
                        <button id="submit" style="width: 50%; margin-left: 25%;" class="btn btn-primary btn-block">Submit</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="Scripts/helpers.js"></script>
<script>

var timestandard = [];
timestandard.push('AM');
timestandard.push('PM');
timestandard["AM"] = new Map();
timestandard["PM"] = new Map();

timestandard["AM"].set(1, '12:00 - 1:00 AM');
timestandard["AM"].set(2, '1:00 - 2:00 AM');
timestandard["AM"].set(3, '2:00 - 3:00 AM');
timestandard["AM"].set(4, '3:00 - 4:00 AM');
timestandard["AM"].set(5, '4:00 - 5:00 AM');
timestandard["AM"].set(6, '5:00 - 6:00 AM');
timestandard["AM"].set(7, '6:00 - 7:00 AM');
timestandard["AM"].set(8, '7:00 - 8:00 AM');
timestandard["AM"].set(9, '8:00 - 9:00 AM');
timestandard["AM"].set(10, '9:00 - 10:00 AM');
timestandard["AM"].set(11, '10:00 - 11:00 AM');
timestandard["AM"].set(24, '11:00 - 12:00 AM');

timestandard["PM"].set(12, '11:00 - 12:00 PM');
timestandard["PM"].set(13, '12:00 - 1:00 PM');
timestandard["PM"].set(14, '1:00 - 2:00 PM');
timestandard["PM"].set(15, '2:00 - 3:00 PM');
timestandard["PM"].set(16, '3:00 - 4:00 PM');
timestandard["PM"].set(17, '4:00 - 5:00 PM');
timestandard["PM"].set(18, '5:00 - 6:00 PM');
timestandard["PM"].set(19, '6:00 - 7:00 PM');
timestandard["PM"].set(20, '7:00 - 8:00 PM');
timestandard["PM"].set(21, '8:00 - 9:00 PM');
timestandard["PM"].set(22, '9:00 - 10:00 PM');
timestandard["PM"].set(23, '10:00 - 11:00 PM');

function removeZeroPrefix(value) {
    // 3
    if (value.length == 1 || value.substr(0, 1) != 0)
        return value;

    return value.substr(1, value.length - 1);
}


function getIdOfDay(value) {
    if (value == "Sunday") return 1;
    if (value == "Monday") return 2;
    if (value == "Tuesday") return 3;
    if (value == "Wednesday") return 4;
    if (value == "Thursday") return 5;
    if (value == "Friday") return 6;
    if (value == "Saturday") return 7;
}

$(document).on('click', '#submit', function (e) {
    e.preventDefault();
    (new http).post('OrganizationAddListing.aspx/InsertOrganization', {
        name: $('#orgName').val(),
        address: $('#address').val(),
        streetNo: $('#streetNo').val(),
        streetName: $('#streetName').val(),
        barangay: $('#barangay').val(),
        city: $('#City').val(),
        province: $('#province').val(),
        country: 'PH',
        dateEstablished: $('#date').val(),
        parentorg: $('#parent').val(),
        feastBuilder: $('#builder').val(),
        branch: $('#branch').val(),
        contact: $('#contact').val(),
        email: $('#email').val(),
        website: $('#website').val(),
        retreat: $('#retreat').val(),
        recollect: $('#recollection').val(),
        talks: $('#talks').val(),
        camp: $('#camps').val(),
        volunteer: $('#volunteerWorks').val(),
        latitude: parseFloat($('#latitude').val()),
        longitude: parseFloat($('#longitude').val()),
        about: $('#about').val()
    }).then(function (response) {
            
        var ventID = $('input.vent:checked').map(function () {
            return $(this).val();
        });
        
        $.each(ventID, function (key, id) {
            console.log(id);
            (new http).post('OrganizationAddListing.aspx/InsertVentilation', {
                id: id
            }).then(function () {
            }).run();
        });

        var venueID = $('input.venue:checked').map(function () {
            return $(this).val();
        });

        $.each(venueID, function (key, id) {
            console.log(id);
            (new http).post('OrganizationAddListing.aspx/InsertVenue', {
                id: id
            }).then(function () {
            }).run();
        });

        var parkingID = $('input.parking:checked').map(function () {
            return $(this).val();
        });

        $.each(parkingID, function (key, id) {
            console.log(id);
            (new http).post('OrganizationAddListing.aspx/InsertParking', {
                id: id
            }).then(function () {
            }).run();
        });

        var actID = $('input.activities:checked').map(function () {
            return $(this).val();
        });

        $.each(actID, function (key, id) {
            console.log(id);
            (new http).post('OrganizationAddListing.aspx/InsertActivity', {
                id: id
            }).then(function () {
            }).run();
        });

        var AttID = $('input.attendees:checked').map(function () {
            return $(this).val();
        });

        $.each(AttID, function (key, id) {
            console.log(id);
            (new http).post('OrganizationAddListing.aspx/InsertAttendees', {
                id: id
            }).then(function () {
            }).run();
        });

        WorshipID.forEach(function (simbahan) {
		    console.log(simbahan);
		    $.each(simbahan.day, function (key, day) {
			    console.log(day);
			    var fromHour = removeZeroPrefix(simbahan.WorFrom.split(':')[0]);
			    var fromAMorPM = simbahan.WorFrom.split(':')[1].split(' ')[1];
			    var toHour = removeZeroPrefix(simbahan.WorTo.split(':')[0]);
			    var toAMorPM = simbahan.WorTo.split(':')[1].split(' ')[1];

			    var timeStd = 0;

			    timestandard[fromAMorPM].forEach(
				    function (time, timeStandardID) {
					    if (fromHour == time.substr(0, 1))
						    timeStd = timeStandardID;
				    });

			    if (timeStd != 0) {
			        (new http).post('OrganizationAddListing.aspx/insertWorship', {
				        FromDate: simbahan.WorFrom,
				        ToDate: simbahan.WorTo,
					    ScheduleID: getIdOfDay(day),
					    TimeStandard: timeStd
				    }).then(function (data) {

				    }).run();
			    }

		    });
	    })
    }).run();
});

//var days = [];
var WorshipID = new Map()
var index = 1;
var worshipSched = [];

$(document).on('click', '#addWorship', function (e) {
    e.preventDefault();

    var days = [];

    if ($("#<%= worshipFrom.ClientID%>").val() == ''){
        alert('Please add start time!');
        return;
    }

    if ($("#<%= worshipTo.ClientID%>").val() == ''){
        alert('Please add end time!');
        return;
    }

    if ($("#worSun").is(":checked")) {
        days.push("Sunday");
    }
    if ($("#worMon").is(":checked")) {
        days.push("Monday");
    }
    if ($("#worTue").is(":checked")) {
        days.push("Tuesday");
    }
    if ($("#worWed").is(":checked")) {
        days.push("Wednesday");
    }
    if ($("#worThu").is(":checked")) {
        days.push("Thursday");
    }
    if ($("#worFri").is(":checked")) {
        days.push("Friday");
    }
    if ($("#worSat").is(":checked")) {
        days.push("Saturday");
    }

    console.log(days);

    $("#worshipTable").append('' +
		'<tr>' +
		'<td>' +
		days.join(', ') +
		'</td>' +
		'<td>' +
		$("#<%= worshipFrom.ClientID%>").val() +
		'</td>' +
		'<td>' +
		$("#<%= worshipTo.ClientID%>").val() +
		'</td>' +
		'<td>' +
		'<i id="btnDelMass" data-id="' + index + '" class="fa fa-remove" style="color: red; font-size: x-large;"></i>' +
		'</td>' +
		'</tr>');

    worshipSched.push({
        worshipDays: days,
        worshipStart: $("#<%= worshipFrom.ClientID%>").val(),
        worshipEnd: $("#<%= worshipTo.ClientID%>").val()
    })

    WorshipID.set(index, {
        day: days,
        WorFrom: $("#<%= worshipFrom.ClientID%>").val(),
        WorTo: $("#<%= worshipTo.ClientID%>").val()
    });

    $("#<%= worshipFrom.ClientID%>").val('');
    $("#<%= worshipTo.ClientID%>").val('')
    document.getElementById("worSun").checked = false;
    document.getElementById("worMon").checked = false;
    document.getElementById("worTue").checked = false;
    document.getElementById("worWed").checked = false;
    document.getElementById("worThu").checked = false;
    document.getElementById("worFri").checked = false;
    document.getElementById("worSat").checked = false;

    index++;
});
</script>
</asp:Content>
