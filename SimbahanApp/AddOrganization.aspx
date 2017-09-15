<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" EnableEventValidation="false" CodeBehind="AddOrganization.aspx.cs" Inherits="SimbahanApp.AddOrganization" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<div class="box-body" style="background-image: url(Images/Background.jpg);">
    <%--<link href="Content\MassScheduleStyle.css" rel="stylesheet" />--%>
    <link href="Content\timepicki.css" rel="stylesheet" />

    <style>
        input[type="radio"], input[type="checkbox"] {
            height: 30px;
        }

        label.font-large {
            font-size: large;
        }

        div.row {
            margin-bottom: 20px;
        }

        .ChkBoxCss input {
            width: 27px;
            height: 27px;
        }
    </style>
    <style>
        article, aside, figure, footer, header, hgroup, 
        menu, nav, section { display: block; }
    </style>
    <hr>
    <div class="container" onload="hideAdoration()">
        <strong>
            <h2>ORGANIZATION INFORMATION SHEET</h2><span class="text-danger" style="float: right; margin-top: -40px;">(* - required)</span>
        </strong>
        <form role="form" class="form-horizontal">
            <input type="text" runat="server" id="MassSchedules" style="display: none;" data-name="Mass Schedule" />
            <input type="text" runat="server" id="ConfessionSchedules" style="display: none;" data-name="Confession Schedule" />
            <input type="text" runat="server" id="AdorationSchedules" style="display: none;" />
            <input type="text" runat="server" id="EventSchedules" style="display: none;" />
            <div class="row form-group">
                <span class="text-danger">*</span><label for="">Organization Name:</label>
                <input type="text" runat="server" class="form-control input-lg" id="organizationName" placeholder="Organization Name" data-name="Organization Name" />
                <label id="errorOrgName" class="text-danger" style="display: none;"></label>
            </div>
            <div class="row form-group">
                <span class="text-danger">*</span><label for="">Address:</label>
                <input type="text" runat="server" class="form-control input-lg" id="address" placeholder="Address" data-name="Organization Address" />
                <label id="errorChurchAddress" class="text-danger" style="display: none;"></label>
            </div>
            <div class="row">
                <div class="col-md-4 form-group">
                    <span class="text-danger">*</span><label class="font-large" for="city">City:</label>
                    <input type="text" runat="server" class="form-control input-lg" id="city" placeholder="City" data-name="City" />
                    <label id="errorChurchCity" class="text-danger" style="display: none;"></label>
                </div>
                <div class="col-md-4 form-group">
                    <label class="font-large" for="province">Province:</label>
                    <input type="text" runat="server" class="form-control input-lg" id="province" placeholder="Province" />
                </div>
           
            <div class="col-md-4 form-group">
                <span class="text-danger">*</span><label for="">Branch/Location:</label>
                <input type="text" runat="server" class="form-control input-lg" id="branch" placeholder="Branch/Location" data-name="Branch" />
                <label id="errorBranch" class="text-danger" style="display: none;"></label>
            </div>
            <div class="col-md-12 form-group">
                <span class="text-danger">*</span><label for="">Feast Builder or Preacher:</label>
                <input type="text" runat="server" class="form-control input-lg" id="preacher" placeholder="Feast Builder or Preacher" data-name="Preacher" />
                <label id="errorPreacher" class="text-danger" style="display: none;"></label>
            </div>
             </div>
            <div class="row">
                <div class="col-md-4 form-group">
                    <span class="text-danger">*</span><label class="font-large" for="city">Parent Organization:</label>
                    <input type="text" runat="server" class="form-control input-lg" id="parentOrganization" placeholder="Parent Organization" data-name="Parent" />
                    <label id="errorParentOrg" class="text-danger" style="display: none;"></label>
                </div>
                <div class="col-md-4 form-group">
                    <label class="font-large" for="">Date Established:</label>
                    <input type="text" runat="server" class="form-control input-lg" id="dateEstablished" placeholder="Date Established" />
                </div>
                <div class="col-md-4 form-group">
                    <label class="font-large" for="">Telephone Number:</label>
                    <input type="text" runat="server" class="form-control input-lg" id="telephoneNumber" placeholder="Telephone Number" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <span class="text-danger">*</span><label class="font-large" for="">Email Address:</label>
                    <input type="text" runat="server" class="form-control input-lg" id="emailAdd" placeholder="Email Address" data-name="Email" />
                    <label id="errorEmail" class="text-danger" style="display: none;"></label>
                </div>
                <div class="col-md-6">
                    <label class="font-large" for="">Website:</label>
                    <input type="text" runat="server" class="form-control input-lg" id="website" placeholder="Website" />
                </div>
            </div>
            <div class="row">
            <div id="category-list">
                <h4><span class="text-danger">*</span>ORGANIZATION ACTIVITIES</h4>
                <div class="row">
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-3">
                                <asp:CheckBox ID="worship" name="type" runat="server" CssClass="ChkBoxCss" />
                            </div>
                            <div class="col-md-9">
                                <label class="font-large">Worship</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="bibleStudy" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Bible Study</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="mass" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Mass</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="retreats" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Retreats</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="recollection" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Recollection</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="volunteerWorks" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Volunteer Works</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="talks" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Talks</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="camps" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Camps</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--Attendees--%>
                <h4><span class="text-danger">*</span>ATTENDEES</h4>
                <div class="row">
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-3">
                                <asp:CheckBox ID="men" name="type" runat="server" CssClass="ChkBoxCss" />
                            </div>
                            <div class="col-md-9">
                                <label class="font-large">Men</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="women" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Women</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="singles" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Singles</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="couples" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Couples</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="professionals" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Professionals</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="students" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Students</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="missionaries" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Missionaries</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="nonCatholic" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Non-Catholic</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--OrgVenueVentilation--%>
                <h4><span class="text-danger">*</span>ORGANIZATION VENUE VENTILATIONS</h4>
                <div class="row">
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-3">
                                <asp:CheckBox ID="aircon" name="type" runat="server" CssClass="ChkBoxCss" />
                            </div>
                            <div class="col-md-9">
                                <label class="font-large">Air Condition</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="ceiling" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Ceiling Fan</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="wallfan" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Wall Fan</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="stdfan" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Standard Fan</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <%--Vehicle Parking--%>
                <h4><span class="text-danger">*</span>VEHICLE PARKING</h4>
                <div class="row">
                    <div class="col-md-3">
                        <div class="row">
                            <div class="col-md-3">
                                <asp:CheckBox ID="streetPark" name="type" runat="server" CssClass="ChkBoxCss" />
                            </div>
                            <div class="col-md-9">
                                <label class="font-large">Street Parking</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="mallPark" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Mall Parking</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="separatePark" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Separate Parking</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-3">
                                    <asp:CheckBox runat="server" name="type" ID="otherPark" CssClass="ChkBoxCss" />
                                </div>
                                <div class="col-md-9">
                                    <label class="font-large">Other</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-danger">
                    <label id="errorCheckbox"  style="display: none;">Please Select Atleast 1 Ventilation</label>
                </div>
            </div>
        </div>
        <div class="row">
                <h4><span class="text-danger">*</span>ORGANIZATION LOCATION:</h4>

                <div class="col-md-3">
                    <div class="row">
                        <div class="col-md-4">
                            <input type="radio" runat="server" name="OrgLocation" id="locChurch" onclick="analyzeLocation();" value="1" class="form-control location" data-name="Organization Location"/>
                        </div>
                        <div class="col-md-5">
                            <label class="font-large">Church</label>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="row">
                        <div class="col-md-5">
                            <input type="radio" runat="server" name="OrgLocation" id="locSchool" onclick="analyzeLocation();" value="3" class="form-control location" data-name="Organization Location"/>
                        </div>
                        <div class="col-md-7">
                            <label class="font-large">School</label>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="row">
                        <div class="col-md-5">
                            <input type="radio" runat="server" name="OrgLocation" id="locPublic" onclick="analyzeLocation();" value="5" class="form-control location" data-name="Organization Location"/>
                        </div>
                        <div class="col-md-7">
                            <label class="font-large">Public Place</label>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="row">
                        <div class="col-md-5">
                            <input type="radio" runat="server" name="OrgLocation" id="locMall" onclick="analyzeLocation();" value="4" class="form-control location" data-name="Organization Location"/>
                        </div>
                        <div class="col-md-7">
                            <label class="font-large">Mall</label>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="row">
                        <div class="col-md-5">
                            <input type="radio" runat="server" name="OrgLocation" id="locPrivate" onclick="analyzeLocation();" value="2" class="form-control location" data-name="Organization Location" />
                        </div>
                        <div class="col-md-7">
                            <label class="font-large">Private Building</label>
                        </div>
                    </div>
                </div><br />
                <p class="text-danger" id="ErrorLocation"></p>
            </div>
        <h3>SCHEDULES</h3>
        <div class="row">
            <div class="col-md-12">
                <form action="#" method="post" id="massschedule" role="form">
                    <div id="entryMass" class="clonedInputMass">
                        <h4 id="referenceMass" name="referenceMass" class="heading-reference"><span class="text-danger">*</span>Mass Schedule</h4>
                        <label id="errorMassSchedule" class="text-danger" style="display: none;"></label>
                        <fieldset>
                            <!-- Multiple Checkboxes (inline) -->
                            <label class="label_day control-label" for="checkboxitem">Day:</label>

                            <div class="weekDays-selector">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="massSun" value="Sunday" name="massOption[]" class="form-control" />
                                            </div>
                                            <div class="col-md-2">
                                                <label class="font-medium">Sun</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="massMon" value="Monday" name="massOption[]"  class="form-control" />
                                            </div>
                                            <div class="col-md-2">
                                                <label class="font-medium">Mon</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="massTue" value="Tuesday" name="massOption[]" class="form-control" />
                                            </div>
                                            <div class="col-md-2">
                                                <label class="font-medium">Tue</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="massWed" value="Wednesday" name="massOption[]" class="form-control" />
                                            </div>
                                            <div class="col-md-2">
                                                <label class="font-medium">Wed</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="massThu" value="Thursday" name="massOption[]" class="form-control" />
                                            </div>
                                            <div class="col-md-2">
                                                <label class="font-medium">Thu</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="massFri" value="Friday" name="massOption[]" class="form-control" />
                                            </div>
                                            <div class="col-md-2">
                                                <label class="font-medium">Fri</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="massSat" value="Saturday" name="massOption[]" class="form-control" />
                                            </div>
                                            <div class="col-md-2">
                                                <label class="font-medium">Sat</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                    <div>
                    </div>
                    <!-- Timepicker-->

                    <div class="col-md-5">
                        <div class="inner cover indexpicker">
                            <label class="label_timepicker1 control-label" for="timepicker1">From:</label>
                            <input class="timepicker1 form-control" id="timepicker1" type="text" name="timepicker1[]" placeholder="-:--" />
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="inner cover indexpicker">
                            <label class="label_timepicker2 control-label" for="timepicker2">To:</label>
                            <input class="timepicker2 form-control" id="timepicker2" type="text" name="timepicker2[]" placeholder="-:--" />
                            
                        </div>
                    </div>
                            <div class="col-md-3"><br />
                                <button type="button" id="btnAddMass" name="btnAddMass" class="btn btn-info btn-block"><i class="fa fa-plus"></i>Add Mass</button>
                            </div>
            </div>
        </div>
        <div class="row">
            <div class="table-responsive">
                <table id="MassTable">
                    <thead>
                        <tr class="bg-primary">
                            <td class="text-center">
                                <strong>Days(Mass)</strong>
                            </td>
                            <td class="text-center">
                                <strong>Language</strong>
                            </td>
                            <td class="text-center">
                                <strong>From</strong>
                            </td>
                            <td class="text-center">
                                <strong>To</strong>
                            </td>
                            <td class="text-center">
                                <strong>Action</strong>
                            </td>
                        </tr>
                    </thead>
                    <tbody id="eventContainerMass">
                    </tbody>
                </table><br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form action="#" method="post" id="worshipschedule" role="form">
                    <div id="entryWorship" class="clonedInputMass">
                        <h4 id="referenceWorship" name="referenceWorship" class="heading-reference"><span class="text-danger">*</span>Worship Schedule</h4>
                        <label id="errorWorship" class="text-danger" style="display: none;"></label>
                        <fieldset>
                            <!-- Multiple Checkboxes (inline) -->
                            <label class="label_day control-label" for="checkboxitem">Day:</label>
                            <div class="weekDays-selector">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="worshipSun" value="Sunday" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Sun</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="worshipMon" value="Monday" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Mon</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="worshipTue" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Tue</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="worshipWed" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Wed</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="worshipThu" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Thu</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="worshipFri" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Fri</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="worshipSat" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Sat</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </fieldset>
                    </div>
                    <div>
                    </div>
                    <!-- Timepicker-->

                    <div class="col-md-5">
                        <div class="inner cover indexpicker">
                            <label class="label_timepicker3 control-label" for="timepicker3">From:</label>
                            <input class="timepicker3 form-control" id="timepicker3" type="text" name="timepicker3[]" placeholder="-:--" />
                        </div>
                    </div>
                    <div class ="col-md-5">
                        <div class="inner cover indexpicker">
                            <label class="label_timepicker4 control-label" for="timepicker3">To:</label>
                            <input class="timepicker4 form-control" id="timepicker4" type="text" name="timepicker4[]" placeholder="-:--" />
                        </div>
                    </div>
                            <div class="col-md-3"><br />
                                <button type="button" id="btnAddWorship" name="btnAddWorship" class="btn btn-info btn-block"><i class="fa fa-plus"></i>Add Worship Details</button>
                            </div>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="table-responsive">
                <table id="WorshipTable">
                    <thead>
                        <tr class="bg-primary">
                            <td class="text-center">
                                <strong>Days(Worship)</strong>
                            </td>
                            <td class="text-center">
                                <strong>From</strong>
                            </td>
                            <td class="text-center">
                                <strong>To</strong>
                            </td>
                            <td class="text-center">
                                <strong>Action</strong>
                            </td>
                        </tr>
                    </thead>
                    <tbody id="eventWorshipConfess">
                    </tbody>
                </table><br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form action="#" method="post" id="bibleSchedule" role="form">
                    <div id="entryBible" class="clonedInputMass">
                        <h4 id="referenceBible" name="referenceBible" class="heading-reference"><span class="text-danger">*</span>Bible Study Schedule</h4>
                        <label id="errorBible" class="text-danger" style="display: none;"></label>
                        <fieldset>
                            <!-- Multiple Checkboxes (inline) -->
                            <label class="label_day control-label" for="checkboxitem">Day:</label>
                            <div class="weekDays-selector">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="bibleSun" value="Sunday" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Sun</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="bibleMon" value="Monday" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Mon</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="bibleTue" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Tue</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="bibleWed" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Wed</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="bibleThu" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Thu</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="bibleFri" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Fri</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <input type="checkbox" id="bibleSat" class="form-control" />
                                            </div>
                                            <div class="col-md-9">
                                                <label class="font-medium">Sat</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </fieldset>
                    </div>
                    <div>
                    </div>
                    <!-- Timepicker-->

                    <div class="col-md-5">
                        <div class="inner cover indexpicker">
                            <label class="label_timepicker3 control-label" for="timepicker3">From:</label>
                            <input class="timepicker3 form-control" id="timepicker5" type="text" name="timepicker3[]" placeholder="-:--" />
                        </div>
                    </div>
                    <div class ="col-md-5">
                        <div class="inner cover indexpicker">
                            <label class="label_timepicker4 control-label" for="timepicker3">To:</label>
                            <input class="timepicker4 form-control" id="timepicker6" type="text" name="timepicker4[]" placeholder="-:--" />
                        </div>
                    </div>
                            <div class="col-md-3"><br />
                                <button type="button" id="btnAddBible" name="btnAddBible" class="btn btn-info btn-block"><i class="fa fa-plus"></i>Add Bible Study Details</button>
                            </div>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="table-responsive">
                <table id="BibleTable">
                    <thead>
                        <tr class="bg-primary">
                            <td class="text-center">
                                <strong>Days(Bible)</strong>
                            </td>
                            <td class="text-center">
                                <strong>From</strong>
                            </td>
                            <td class="text-center">
                                <strong>To</strong>
                            </td>
                            <td class="text-center">
                                <strong>Action</strong>
                            </td>
                        </tr>
                    </thead>
                    <tbody id="eventBible">
                    </tbody>
                </table><br />
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label class="font-large">Affiliated Organization</label>
            </div>
            <div class="col-md-9">
                <textarea type="textarea" runat="server" class="form-control input-lg" id="affiliatedSched"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label class="font-large">Retreat Schedule</label>
            </div>
            <div class="col-md-9">
                <textarea type="textarea" runat="server" class="form-control input-lg" id="retreatSched"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label class="font-large">Recollection Schedule</label>
            </div>
            <div class="col-md-9">
                <textarea type="textarea" runat="server" class="form-control input-lg" id="recollectionSched"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label class="font-large">Talk Schedule</label>
            </div>
            <div class="col-md-9">
                <textarea type="textarea" runat="server" class="form-control input-lg" id="talkSched"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label class="font-large">Camp Schedule</label>
            </div>
            <div class="col-md-9">
                <textarea type="textarea" runat="server" class="form-control input-lg" id="campSched"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <label class="font-large">Volunteer Schedule</label>
            </div>
            <div class="col-md-9">
                <textarea type="textarea" runat="server" class="form-control input-lg" id="volunterSched"></textarea>
            </div>
        </div>
        <div class="row">
            <div class="col-md-5">
                <h4>OTHER EVENT/S: (quarterly or monthly held)</h4>
            </div>
            <div class="col-md-4">
                <button type="button" class="btn btn-primary btn-block" data-toggle="modal" data-target="#add-event-modal" data-whatever="@mdo"
                    name="add event">
                    Add Event
                </button>
            </div>
        </div>
        <div class="table-responsive">
            <table id="EventTable">
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
            </table>
        </div>
        <hr>
    <span class="text-danger">*</span><label class="font-large">ADD ORGANIZATION PHOTOS</label>
        <div style="padding: 40px;">
        <asp:FileUpload ID="FileUpload1" runat="server" data-name="Organization Photo"/><br />
        <asp:FileUpload ID="FileUpload2" runat="server" /><br />
        <asp:FileUpload ID="FileUpload3" runat="server" /><br />
        <label id="errorPhoto" class="text-danger" style="display: none;"></label>
    <asp:Button ID="btnUpload" runat="server" Text="Save" CssClass="hidden"/>
    </div>
    <div class="row">
        <div class="col-md-3 col-md-offset-9">
            <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary btn-block" />
         </div>
        </div>
   
        <hr>

        <!-- Modal Start-->
        <div class="modal fade" id="add-event-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4>Add Event</h4>
                    </div>


                    <div class="modal-body">
                        <div class="form-group">

                            <div class="col-md-12">
                            <label class="control-label">Event Name:</label>
                            <input type="text" class="form-control" runat="server" id="eventName" value="" />
                        </div>

                        <div class="col-md-12">
                            <label class="control-label">Venue:</label>
                            <input type="text" class="form-control" runat="server" id="eventVenue" value="" />
                        </div>

                        <div class="col-md-12">
                            <label class="control-label">Event Description:</label>
                            <textarea type="textarea" class="form-control input-lg" runat="server" id="eventDesc" value=""></textarea>
                        </div>

                        <div class="col-md-4"><br />
                           <label for="FileUpload4">Event Picture:</label>
                        </div>

                        <div class="col-md-6"><br />
                            <asp:FileUpload runat="server" ID="FileUpload4" />
                        </div>

                        <div class="col-md-6">
                            <label class="control-label">Start Date</label>
                            <input type="date" class="form-control" runat="server" id="eventDate" value="" />
                        </div>

                        <div class="col-md-6">
                            <label class="control-label">Start Time</label>
                            <input type="time" class="form-control" runat="server" id="eventTime" value="" />
                        </div>

                        <div class="col-md-6">
                            <label class="control-label">End Date</label>
                            <input type="date" class="form-control" runat="server" id="eventEndDate" value="" />
                        </div>

                        <div class="col-md-6">
                            <label class="control-label">End Time</label>
                            <input type="time" class="form-control" runat="server" id="eventEndTime" value="" />
                        </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button id="btnTriggerEvent" style="display: none;" onclick="TriggerEvent()">Triggerme</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <asp:Button ID="btnAddEvent" CssClass="btn btn-primary" UseSubmitBehavior="false" data-dismiss="modal" runat="server" Text="Add"></asp:Button>
                        <%--<button ID="btnAddEvent" class="btn btn-primary" onclick="saveimg()">Add</button>--%>
                    </div>
                </div>
            </div>
        </div>
        <!--Modal End-->
    </div>
</div>
</asp:Content>