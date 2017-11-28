<%@ Page Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="OrganizationUpdate.aspx.cs" Inherits="SimbahanApp.OrganizationUpdate" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<style>
    .btn {
        border-radius: 0 !important;
    }

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
<input type="text" id="organizationId" runat="server" style="display: none" />
<input type="text" id="metatitle" runat="server" style="display: none" />
<input type="text" id="metadesc" runat="server" style="display: none" />
<div class="box-body" style="background-color: white;">

    <div class="container">
        <strong>
            <h2>CHURCH ORGANIZATION INFORMATION SHEET</h2>
        </strong>
        <form role="form" class="form-horizontal">
            <div class="row">
                <div class="col-md-12">
                    <label>Organization Name</label>
                    <input type="text" id="orgName" runat="server" placeholder="Organization Name" class="form-control input-lg" />
                </div>
                <div class="col-md-6">
                    <label>Latitude</label>
                    <input type="text" id="latitude" runat="server" class="form-control input-lg" placeholder="Latitude" />
                </div>
                <div class="col-md-6">
                    <label>Latitude</label>
                    <input type="text" id="longitude" runat="server" class="form-control input-lg" placeholder="Longitude" />
                </div>
                <div class="col-md-12">
                    <label>Address</label>
                    <input type="text" id="address" runat="server" placeholder="Address" class="form-control input-lg" />
                </div>
                <div class="col-md-2" style="z-index: 1;">
                    <label>City</label>
                    <input type="text" id="City" runat="server" class="form-control input-lg" placeholder="City" />
                </div>
                <div class="col-md-5" style="z-index: 1;">
                    <label>Street No.</label>
                    <input type="text" id="streetNo" runat="server" class="form-control input-lg" placeholder="Street Number" />
                </div>
                <div class="col-md-5" style="z-index: 1;">
                    <label>Street Name</label>
                    <input type="text" id="streetName" runat="server" class="form-control input-lg" placeholder="Street Name" />
                </div>
                <div class="col-md-6">
                    <label>Barangay</label>
                    <input type="text" id="barangay" runat="server" class="form-control input-lg" placeholder="Barangay" />
                </div>
                <div class="col-md-6">
                    <label>Province</label>
                    <input type="text" id="province" runat="server" class="form-control input-lg" placeholder="Province" />
                </div>
                <div class="col-md-6">
                    <label>Country</label>
                    <input type="text" id="country" runat="server" class="form-control input-lg" placeholder="Philippines" disabled/>
                </div>
                <div class="col-md-6">
                    <label>Feast Builder</label>
                    <input type="text" id="builder" runat="server" class="form-control input-lg" placeholder="Feast Builder" />
                </div>
                <div class="col-md-6">
                    <label>Branch</label>
                    <input type="text" id="branch" runat="server" class="form-control input-lg" placeholder="Branch" />
                </div>
                <div class="col-md-6">
                    <label>Parent Organization</label>
                    <input type="text" id="parent" runat="server" class="form-control input-lg" placeholder="Parent Organization" />
                </div>
                <div class="col-md-6">
                    <label>Contact Number</label>
                    <input type="text" id="contact" runat="server" class="form-control input-lg" placeholder="Contact" />
                </div>
                <div class="col-md-6">
                    <label>Website</label>
                    <input type="text" id="website" runat="server" class="form-control input-lg" placeholder="Website" />
                </div>
                <div class="col-md-6">
                    <label>Email</label>
                    <input type="email" id="email" runat="server" class="form-control input-lg" placeholder="Email" />
                </div>
                <div class="col-md-6">
                    <label>Date Established</label>
                    <input type="text" id="date" runat="server" class="form-control input-lg" placeholder="Date Established" />
                </div>
                <div class="col-md-12">
                    <label>About</label>
                    <textarea id="abouts" runat="server" class="form-control"></textarea>
                    <%--<input type="text" id="about" runat="server" class="form-control input-lg" placeholder="About" />--%>
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
                      <input type="checkbox" id="privatebuilding" class="venue" runat="server" name="getVenueID" value="3">
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
                                <label class="containers">Non-Catholics
                                  <input type="checkbox" id="nonCath" class="attendees" runat="server" name="getAttID" value="8">
                                  <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                   <%-- <div class="col-md-12">
                        <label>AFFILIATED ORGANIZATIONS</label>
                        <input type="text" id="affiliated" class="form-control input-lg" placeholder="Affiliated Organization" />
                    </div>--%>
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
                            <input type="text" id="worshipFrom" runat="server" class="form-control input-lg" placeholder="--:-- --"/>

                            <label>To:</label>
                            <input type="text" id="worshipTo" runat="server" class="form-control input-lg" placeholder="--:-- --"/><br />
                            <button id="addWorship" class="btn btn-primary btn-block">Save Changes</button>
                        </div>
                        <div class="col-md-8">
                            <table>
                                <thead>
                                    <tr><td>Days(Worship)</td><td>From</td><td>To</td><td>Action</td></tr>
                                </thead>
                                <tbody id="worshipTable" runat="server">

                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-12" style="clear: both">
                        <h5>MASS SCHEDULES</h5>
                        <div class="col-md-2">
                            <label class="containers">MONDAY
                                <input type="checkbox" id="masMon">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">TUESDAY
                                <input type="checkbox" id="masTue">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">WEDNESDAY
                                <input type="checkbox" id="masWed">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">THURSDAY
                                <input type="checkbox" id="masThu">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">FRIDAY
                                <input type="checkbox" id="masFri">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">SATURDAY
                                <input type="checkbox" id="masSat">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">SUNDAY
                                <input type="checkbox" id="masSun">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="col-md-4">
                            <label>From:</label>
                            <input type="text" id="massFrom" runat="server" class="form-control input-lg" placeholder="--:-- --"/>

                            <label>To:</label>
                            <input type="text" id="masssTo" runat="server" class="form-control input-lg" placeholder="--:-- --"/>

                            <%--<label>Language:</label>
                            <input type="text" id="massLanguage" class="form-control input-lg" placeholder="Language"/>--%><br />
                            <button id="addMass" class="btn btn-primary btn-block">Add Mass</button>
                        </div>
                        <div class="col-md-6">
                            <table>
                                <thead>
                                    <tr><td>Days(Mass)</td><td>From</td><td>To</td><%--<td>Langauge</td>--%><td>Action</td></tr>
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
                                <input type="checkbox" id="bibMon">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">TUESDAY
                                <input type="checkbox" id="bibTue">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">WEDNESDAY
                                <input type="checkbox" id="bibWed">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">THURSDAY
                                <input type="checkbox" id="bibThu">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">FRIDAY
                                <input type="checkbox" id="bibFri">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers" id="bibSat">SATURDAY
                                <input type="checkbox">
                                <span class="checkmark"></span>
                            </label>
                            <label class="containers">SUNDAY
                                <input type="checkbox" id="bibSun">
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
                            <input type="text" id="retreat" runat="server" class="form-control input-lg" placeholder="Retreat" />
                        </div>
                    </div>
                     <div class="col-md-12" style="clear: both;">
                         <div class="col-md-6">
                              <label>RECOLLECTION</label>
                              <input type="text" runat="server" id="recollection" class="form-control input-lg" placeholder="Recollection" />
                              <label>TALKS</label>
                              <input type="text" runat="server" id="talks" class="form-control input-lg" placeholder="Talks" />
                         </div>
                          <div class="col-md-6">
                              <label>CAMPS</label>
                              <input type="text" runat="server" id="camps" class="form-control input-lg" placeholder="Camps" />
                              <label>VOLUNTEER WORKS</label>
                              <input type="text" runat="server" id="volunteerWorks" class="form-control input-lg" placeholder="Volunteer Works" />
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
                              <%--<input type="file" id="eventPicture" class="form-control input-lg" />--%>
                              <asp:FileUpload ID="FileUpload1" runat="server" class="form-control input-lg" />
                         </div>
                        <div class="col-md-6">
                              <label>START DATE</label>
                              <input type="date" id="startDate" class="form-control input-lg" placeholder="Event Date" />
                              <label>START TIME</label>
                              <input type="text" id="startTime" class="form-control input-lg" placeholder="Start Time" />
                              <label>END DATE</label>
                              <input type="date" id="endDate" class="form-control input-lg" placeholder="End Date" />
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
                        <asp:Button ID="triggerME" runat="server" style="display: none;" Text="trigger" />
                    </div>
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <h3>ADD CHURCH PHOTOS</h3><br />
                            <asp:FileUpload ID="FileUpload2" runat="server" /><br />
                            <asp:FileUpload ID="FileUpload3" runat="server" /><br />
                            <asp:FileUpload ID="FileUpload4" runat="server" />
                            <asp:Button ID="trigger" runat="server" Text="trigger" style="display: none;"/>
                        </div>
                        <div class="col-md-6">
                            <h3>ADD CHURCH THUMBNAIL</h3><br />
                            <asp:FileUpload ID="FileUpload5" runat="server" />
                        </div>
                    </div>
                    <div class="col-md-12" style="clear: both;">
                        <%--<button id="submit" OnClick="" style="width: 50%; margin-left: 25%;" class="btn btn-primary btn-block" >Submit</button>--%>
                        <asp:Button ID="submit" Text="Save Changes" runat="server" style="width: 50%; margin-left: 25%;" class="btn btn-primary btn-block" OnClick="submit_Click" />
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="Scripts/helpers.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    var timestandard = [];
    timestandard.push('AM');
    timestandard.push('PM');
    timestandard["AM"] = new Map();
    timestandard["PM"] = new Map();

    timestandard["AM"].set(1, '12:00 - 01:00 AM');
    timestandard["AM"].set(2, '01:00 - 02:00 AM');
    timestandard["AM"].set(3, '02:00 - 03:00 AM');
    timestandard["AM"].set(4, '03:00 - 04:00 AM');
    timestandard["AM"].set(5, '04:00 - 05:00 AM');
    timestandard["AM"].set(6, '05:00 - 06:00 AM');
    timestandard["AM"].set(7, '06:00 - 07:00 AM');
    timestandard["AM"].set(8, '07:00 - 08:00 AM');
    timestandard["AM"].set(9, '08:00 - 09:00 AM');
    timestandard["AM"].set(10, '09:00 - 10:00 AM');
    timestandard["AM"].set(11, '10:00 - 11:00 AM');
    timestandard["AM"].set(24, '11:00 - 12:00 AM');
    timestandard["AM"].set(12, '11:00 - 12:00 PM');

    timestandard["PM"].set(12, '11:00 - 12:00 PM');
    timestandard["PM"].set(13, '12:00 - 01:00 PM');
    timestandard["PM"].set(14, '01:00 - 02:00 PM');
    timestandard["PM"].set(15, '02:00 - 03:00 PM');
    timestandard["PM"].set(16, '03:00 - 04:00 PM');
    timestandard["PM"].set(17, '04:00 - 05:00 PM');
    timestandard["PM"].set(18, '05:00 - 06:00 PM');
    timestandard["PM"].set(19, '06:00 - 07:00 PM');
    timestandard["PM"].set(20, '07:00 - 08:00 PM');
    timestandard["PM"].set(21, '08:00 - 09:00 PM');
    timestandard["PM"].set(22, '09:00 - 10:00 PM');
    timestandard["PM"].set(23, '10:00 - 11:00 PM');

    function removeZeroPrefix(value) {
        // 3
        if (value.length == 1 || value.substr(0, 1) != 0)
            return value;

        return value.substr(1, value.length - 1);
    }

    var editWorshipDetailId = 0;
    var editWorshipDetail;
    var schedID = 0;

    $(document).ready(function () {
        $('#addWorship').hide();
    });

    $(document).on('click', '#edit', function (e) {
        e.preventDefault();

        $('#addWorship').show('slow');
        
        var id = $(this).data('id');
        editWorshipDetailId = id;

        console.log(id);

       $('#<%= worshipTable.ClientID %> tr[name="' + id + '"]').each(function (index, tr) {

            var lines = $('td', tr).map(function (index, td) {
                return $(td).text();
            });

            var day = lines[0];
            console.log(day);
            var Start = lines[1];
            var End = lines[2];
            console.log(Start);
            console.log(End);

            $("#worfThu").prop('checked', false);
            $("#worfMon").prop('checked', false);
            $("#worfTue").prop('checked', false);
            $("#worfWed").prop('checked', false);
            $("#worfSun").prop('checked', false);
            $("#worfFri").prop('checked', false);
            $("#worfSat").prop('checked', false);

            if (day == 'Sunday'){
                schedID = 1;
                $("#worSun").prop('checked', true);
            } else if (day == 'Monday') {
                schedID = 2;
                $("#worMon").prop('checked', true);
            } else if (day == 'Tuesday') {
                schedID = 3;
                $("#worTue").prop('checked', true);
            } else if (day == 'Wednesday') {
                schedID = 4;
                $("#worWed").prop('checked', true);
            } else if (day == 'Thursday') {
                schedID = 5;
                $("#worThu").prop('checked', true);
            } else if (day == 'Friday') {
                schedID = 6;
                $("#worFri").prop('checked', true);
            } else if (day == 'Saturday') {
                schedID = 7;
                $("#worSat").prop('checked', true);
            }

               $('#<%= worshipFrom.ClientID%>').val(Start);
               $('#<%= worshipTo.ClientID%>').val(End);

               editWorshipDetail = {
                   Start: Start,
                   End: End,
                   day: day,
                   scheduleId: schedID
               }
               console.log(editWorshipDetail);
         })
    });

    //Save Changes for Worship schedule
    $(document).on('click', '#addWorship', function (e) {
            e.preventDefault();
            
            var fromHour = editWorshipDetail.Start.split(' ')[0];
            var fromAMorPM = editWorshipDetail.Start.split(':')[1].split(' ')[1];
            var toHour = editWorshipDetail.End.split(' ')[0];
            var toAMorPM = editWorshipDetail.End.split(':')[1].split(' ')[1];

            var timeStd = 0;

            timestandard[fromAMorPM].forEach(
                function (time, timeStandardID) {
                    if (fromHour.split(':')[0] == time.substr(0, 2))
                        timeStd = timeStandardID;
                });
            console.log(timeStd);

            if (timeStd != 0) {
                (new http).post('OrganizationUpdate.aspx/UpdateWorshipDetails', {
                    worshipDetailsId: editWorshipDetailId,
                    ScheduleId: schedID,
                    Time: $("#<%= worshipFrom.ClientID%>").val() + '-' + $("#<%= worshipTo.ClientID%>").val(),
                    OrgId: $("#<%= organizationId.ClientID %>").val(),
                    TimeStandard: timeStd,
                }).then(function (response) {
                    alert('Updated!');
                    window.location.reload();
                }).run();
            }
    });


    //MassSchedule
     var editMassDetailId = 0;
    var editMassDetail;
    var schedIDformass = 0;

    $(document).ready(function () {
        $('#addMass').hide();
    });

    $(document).on('click', '#editmass', function (e) {
        e.preventDefault();

        $('#addMass').show('slow');
        
        var id = $(this).data('id');
        editMassDetailId = id;

        console.log(id);

       $('#<%= massTable.ClientID %> tr[name="' + id + '"]').each(function (index, tr) {

            var lines = $('td', tr).map(function (index, td) {
                return $(td).text();
            });

            var day = lines[0];
            console.log(day);
            var Start = lines[1];
            var End = lines[2];
            console.log(Start);
            console.log(End);

            $("#masThu").prop('checked', false);
            $("#masMon").prop('checked', false);
            $("#masTue").prop('checked', false);
            $("#masWed").prop('checked', false);
            $("#masSun").prop('checked', false);
            $("#masFri").prop('checked', false);
            $("#masSat").prop('checked', false);

            if (day == 'Sunday'){
                schedIDformass = 1;
                $("#masSun").prop('checked', true);
            } else if (day == 'Monday') {
                schedIDformass = 2;
                $("#masMon").prop('checked', true);
            } else if (day == 'Tuesday') {
                schedIDformass = 3;
                $("#masTue").prop('checked', true);
            } else if (day == 'Wednesday') {
                schedIDformass = 4;
                $("#masWed").prop('checked', true);
            } else if (day == 'Thursday') {
                schedIDformass = 5;
                $("#masThu").prop('checked', true);
            } else if (day == 'Friday') {
                schedIDformass = 6;
                $("#masFri").prop('checked', true);
            } else if (day == 'Saturday') {
                schedIDformass = 7;
                $("#masSat").prop('checked', true);
            }

               $('#<%= massFrom.ClientID%>').val(Start);
               $('#<%= masssTo.ClientID%>').val(End);

               editMassDetail = {    
                   Start: Start,
                   End: End,
                   day: day,
                   scheduleId: schedIDformass
               }
               console.log(editMassDetail);
         })
    });

    //Save Changes for Mass schedule
    $(document).on('click', '#addMass', function (e) {
            e.preventDefault();
            
            var fromHour = editMassDetail.Start.split(' ')[0];
            var fromAMorPM = editMassDetail.Start.split(':')[1].split(' ')[1];
            var toHour = editMassDetail.End.split(' ')[0];
            var toAMorPM = editMassDetail.End.split(':')[1].split(' ')[1];

            var timeStd = 0;

            timestandard[fromAMorPM].forEach(
                function (time, timeStandardID) {
                    if (fromHour.split(':')[0] == time.substr(0, 2))
                        timeStd = timeStandardID;
                });
            console.log(timeStd);

            if (timeStd != 0) {
                (new http).post('OrganizationUpdate.aspx/UpdateMassDetails', {
                    massDetailsId: editMassDetailId,
                    ScheduleId: schedIDformass,
                    Time: $("#<%= massFrom.ClientID%>").val() + '-' + $("#<%= masssTo.ClientID%>").val(),
                    OrgId: $("#<%= organizationId.ClientID %>").val(),
                    TimeStandard: timeStd,
                }).then(function (response) {
                    alert('Updated!');
                    window.location.reload();
                }).run();
            }
    });


     //BibleSchedule
     var editBibleDetailId = 0;
    var editBibleDetail;
    var schedIDforbible = 0;

    $(document).ready(function () {
        $('#addBible').hide();
    });

    $(document).on('click', '#editbible', function (e) {
        e.preventDefault();

        $('#addBible').show('slow');
        
        var id = $(this).data('id');
        editBibleDetailId = id;

        console.log(id);

       $('#<%= bibleTable.ClientID %> tr[name="' + id + '"]').each(function (index, tr) {

            var lines = $('td', tr).map(function (index, td) {
                return $(td).text();
            });

            var day = lines[0];
            console.log(day);
            var Start = lines[1];
            var End = lines[2];
            console.log(Start);
            console.log(End);

            $("#bibMon").prop('checked', false);
            $("#bibTue").prop('checked', false);
            $("#bibWed").prop('checked', false);
            $("#bibThu").prop('checked', false);
            $("#bibFri").prop('checked', false);
            $("#bibSat").prop('checked', false);
            $("#bibSun").prop('checked', false);

            if (day == 'Sunday'){
                schedIDforbible = 1;
                $("#bibSun").prop('checked', true);
            } else if (day == 'Monday') {
                schedIDforbible = 2;
                $("#bibMon").prop('checked', true);
            } else if (day == 'Tuesday') {
                schedIDforbible = 3;
                $("#bibTue").prop('checked', true);
            } else if (day == 'Wednesday') {
                schedIDforbible = 4;
                $("#bibWed").prop('checked', true);
            } else if (day == 'Thursday') {
                schedIDforbible = 5;
                $("#bibThu").prop('checked', true);
            } else if (day == 'Friday') {
                schedIDforbible = 6;
                $("#bibFri").prop('checked', true);
            } else if (day == 'Saturday') {
                schedIDforbible = 7;
                $("#bibSat").prop('checked', true);
            }

               $('#<%= bibleFrom.ClientID%>').val(Start);
               $('#<%= bibleTo.ClientID%>').val(End);

               editBibleDetail = {    
                   Start: Start,
                   End: End,
                   day: day,
                   scheduleId: schedIDforbible
               }
               console.log(editBibleDetail);
         })
    });

    //Save Changes for Mass schedule
    $(document).on('click', '#addBible', function (e) {
            e.preventDefault();
            
            var fromHour = editBibleDetail.Start.split(' ')[0];
            var fromAMorPM = editBibleDetail.Start.split(':')[1].split(' ')[1];
            var toHour = editBibleDetail.End.split(' ')[0];
            var toAMorPM = editBibleDetail.End.split(':')[1].split(' ')[1];

            var timeStd = 0;

            timestandard[fromAMorPM].forEach(
                function (time, timeStandardID) {
                    if (fromHour.split(':')[0] == time.substr(0, 2))
                        timeStd = timeStandardID;
                });
            console.log(timeStd);

            if (timeStd != 0) {
                (new http).post('OrganizationUpdate.aspx/UpdateBibleDetails', {
                    massDetailsId: editBibleDetailId,
                    ScheduleId: schedIDforbible,
                    Time: $("#<%= bibleFrom.ClientID%>").val() + '-' + $("#<%= bibleTo.ClientID%>").val(),
                    OrgId: $("#<%= organizationId.ClientID %>").val(),
                    TimeStandard: timeStd,
                }).then(function (response) {
                    alert('Updated!');
                    window.location.reload();
                }).run();
            }
    });

    $(document).on('click', '#deletemass', function (e) {
        e.preventDefault();

        var id = $(this).data('id');
        console.log(id);

        var x = confirm('Are you sure you want to delete this mass detail?');

        if(x == true){
            (new http).post('OrganizationUpdate.aspx/deleteMassDetail', {
                id: id
            }).then(function (response) {
                alert('Deleted!');
                window.location.reload();
            }).run();
        }
    });

</script>
</asp:Content>
