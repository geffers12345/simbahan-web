<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" EnableEventValidation="false" CodeBehind="ChurchAdminPageUpdate.aspx.cs" Inherits="SimbahanApp.ChurchAdminPageUpdate" %>

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
    <input type="hidden" id="SimbahanId" runat="server" />
<strong>
<h2>CHURCH INFORMATION SHEET</h2>
</strong>
<form role="form" class="form-horizontal">
<div class="row form-group">
    <label for="churchName">Church Name:</label>
    <input type="text" runat="server" class="form-control input-lg" id="churchName" placeholder="Church Name" />
</div>
<div class="row form-group">
    <label for="">Address:</label>
    <input type="text" runat="server" class="form-control input-lg" id="address" placeholder="Address" />
</div>
<div class="row">
    <div class="col-md-4 form-group">
        <label class="font-large" for="city">City:</label>
        <input type="text" runat="server" class="form-control input-lg" id="city" placeholder="City" />
    </div>
    <div class="col-md-4 form-group">
        <label class="font-large" for="province">Province:</label>
        <input type="text" runat="server" class="form-control input-lg" id="province" placeholder="Province" />
    </div>
    <div class="col-md-4 form-group">
        <label class="font-large" for="country">Country:</label>
        <input type="text" runat="server" class="form-control input-lg" id="country" placeholder="Philippines" disabled />
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <label class="font-large" for="vicariate">Vicariate:</label>
        <input type="text" runat="server" class="form-control input-lg" id="vicariate" placeholder="Vicariate" />
    </div>
    <div class="col-md-6">
        <label class="font-large" for="feastDay">Feast Day:</label>
        <input type="text" runat="server" class="form-control input-lg" id="feastDay" placeholder="Feast Day" />
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <label class="font-large" for="parishPriest">Parish Priest:</label>
        <input type="text" runat="server" class="form-control input-lg" id="parishPriest" placeholder="Parish Priest" />
    </div>
    <div class="col-md-6">
        <label class="font-large" for="administeredBy">Administered by:</label>
        <input type="text" runat="server" class="form-control input-lg" id="administeredBy" placeholder="Administered by" />
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <label class="font-large" for="diocese">Diocese:</label>
        <input type="text" runat="server" class="form-control input-lg" id="diocese" placeholder="Diocese" />
    </div>
    <div class="col-md-6">
        <label class="font-large" for="dateEstablished">Date Established:</label>
        <input type="text" runat="server" class="form-control input-lg" id="dateEstablished" placeholder="Date Established" />
    </div>
</div>
<div class="row">
    <div class="col-md-4">
        <label class="font-large" for="phoneNo">Phone No.:</label>
        <input type="text" runat="server" class="form-control input-lg" id="phoneNo" placeholder="Phone No." />
    </div>
    <div class="col-md-4">
        <label class="font-large" for="emailAdd">Email:</label>
        <input type="text" runat="server" class="form-control input-lg" id="emailAdd" placeholder="Email" />
    </div>
    <div class="col-md-4">
        <label class="font-large" for="website">Website:</label>
        <input type="text" runat="server" class="form-control input-lg" id="website" placeholder="Website" />
    </div>
</div>
<div class="row">
	<div class="col-md-6">
		<%--<span class="text-danger">*</span>--%><label class="font-large" for="">Longitude:</label>
		<input type="text" runat="server" class="form-control input-lg" id="Longitude" placeholder="Longitude" data-name="" />
		<%--<label id="errorVicariate" class="text-danger" style="display: none;"></label>--%>
	</div>
	<div class="col-md-6">
		<label class="font-large" for="">Latitude:</label>
		<input type="text" runat="server" class="form-control input-lg" id="Latitude" placeholder="Latitude" />
	</div>
	</div>
<h3>FACILITIES</h3>
<div id="category-list">
<h4>CHURCH FACILITIES:</h4>
<div class="row">
    <div class="col-md-3">
        <div class="row">
            <div class="col-md-3">
                <asp:CheckBox ID="facAirCon" name="type" runat="server" CssClass="ChkBoxCss" class="form-control" />
            </div>
            <div class="col-md-9">
                <label class="font-large">AIR CONDITIONED</label>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="form-group">
            <div class="row">
                <div class="col-md-3">
                    <asp:CheckBox runat="server" name="type" ID="facCeilingFan" CssClass="ChkBoxCss" class="form-control" />
                </div>
                <div class="col-md-9">
                    <label class="font-large">CEILING FAN</label>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="form-group">
            <div class="row">
                <div class="col-md-3">
                    <asp:CheckBox runat="server" name="type" ID="facOrdinaryFan" CssClass="ChkBoxCss" class="form-control" />
                </div>
                <div class="col-md-9">
                    <label class="font-large">ORDINARY FAN</label>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%--<input type="button" onclick='printChecked()' value="Print Selected Items"/>--%>
<%-- <asp:Button runat="server" id="Button1" Text="Submit" onclick="Button1_Click" CssClass="btn btn-primary btn-block"/>--%>
<hr>
<div class="row">
<h4>CHURCH LOCATION:</h4>

<div class="col-md-3">
    <div class="row">
        <div class="col-md-4">
            <input type="radio" name="ChurchLocation" runat="server" id="locSeparate" onclick="analyzeLocation(this.value);" value="1" class="form-control location" />
        </div>
        <div class="col-md-5">
            <label class="font-large">SEPARATE/PRIVATE</label>
        </div>
    </div>
</div>
<div class="col-md-2">
    <div class="row">
        <div class="col-md-5">
            <input type="radio" name="ChurchLocation" runat="server" id="locMall" onclick="analyzeLocation(this.value);" value="3" class="form-control location" />
        </div>
        <div class="col-md-7">
            <label class="font-large">MALL</label>
        </div>
    </div>
</div>
<div class="col-md-2">
    <div class="row">
        <div class="col-md-5">
            <input type="radio" name="ChurchLocation" runat="server" id="locHospital" onclick="analyzeLocation(this.value);" value="5" class="form-control location" />
        </div>
        <div class="col-md-7">
            <label class="font-large">HOSPITAL</label>
        </div>
    </div>
</div>
<div class="col-md-2">
    <div class="row">
        <div class="col-md-5">
            <input type="radio" name="ChurchLocation" runat="server" id="locSchool" onclick="analyzeLocation(this.value);" value="4" class="form-control location" />
        </div>
        <div class="col-md-7">
            <label class="font-large">SCHOOL</label>
        </div>
    </div>
</div>
<div class="col-md-2">
    <div class="row">
        <div class="col-md-5">
            <input type="radio" name="ChurchLocation" runat="server" id="locConvent" onclick="analyzeLocation(this.value);" value="2" class="form-control location" />
        </div>
        <div class="col-md-7">
            <label class="font-large">CONVENT</label>
        </div>
    </div>
</div>
</div>

<hr>
<h4>CHURCH PARKING:</h4>
<div class="row">
<div class="col-md-3">
    <div class="row">
        <div class="col-md-3">
            <asp:CheckBox runat="server" name="churchParking" ID="parkStreet" CssClass="ChkBoxCss" class="form-control" />
        </div>
        <div class="col-md-9">
            <label class="font-large">STREET PARKING</label>
        </div>
    </div>
</div>
<div class="col-md-3">
    <div class="form-group">
        <div class="row">
            <div class="col-md-3">
                <asp:CheckBox runat="server" name="churchParking" ID="parkMall" CssClass="ChkBoxCss" class="form-control" />
            </div>
            <div class="col-md-9">
                <label class="font-large">MALL PARKING</label>
            </div>
        </div>
    </div>
</div>
<div class="col-md-3">
    <div class="form-group">
        <div class="row">
            <div class="col-md-3">
                <asp:CheckBox runat="server" name="churchParking" ID="parkPrivate" CssClass="ChkBoxCss" class="form-control" />
            </div>
            <div class="col-md-9">
                <label class="font-large">PRIVATE CHURCH PARKING</label>
            </div>
        </div>
    </div>
</div>
<div class="col-md-3">
    <div class="form-group">
        <div class="row">
            <div class="col-md-3">
                <asp:CheckBox runat="server" name="churchParking" ID="parkOther" CssClass="ChkBoxCss" class="form-control" />
            </div>
            <div class="col-md-9">
                <label class="font-large">OTHER PARKING</label>
            </div>
        </div>
    </div>
</div>
</div>
<hr>

<div class="row">
<div class="col-md-6">
    <div class="row">
        <div class="col-md-6">
            <label class="font-large">ADORATION CHAPEL:</label>
        </div>
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-5">
                    <input type="radio" runat="server" id="hasAdoYes" name="hasAdoration" value="1" class="form-control hasAdoration" />
                </div>
                <div class="col-md-7">
                    <label class="font-large">YES</label>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="row">
                <div class="col-md-5">
                    <input type="radio" runat="server" id="hasAdoNo" name="hasAdoration" value="0" class="form-control hasAdoration" />
                </div>
                <div class="col-md-7">
                    <label class="font-large">NO</label>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<div>
<div id="has-adoration-container" class="row">
    <asp:TextBox ID="adoID" runat="server" style="display: none;"></asp:TextBox>
    <div class="row">
        <div class="col-md-3">
            <label class="font-large">ADD DISPLAY TEXT</label>
        </div>
        <div class="col-md-9">
            <textarea type="textarea" runat="server" class="form-control input-lg" id="displayText"></textarea>
        </div>
        </div>
    <div class="row">
        <div class="col-md-2">
                    <label class="font-large">Is Open 24/7?</label><br />
        </div>
            <div class="row">
                <div class="col-md-3">
        <div class="col-md-3">
            <input type="radio" name="OpenWholeDay" runat="server" id="openYes" onclick="analyzeOpen(this.value);" value="1" class="form-control IsOpen" />
        </div>
        <div class="col-md-1">
            <label class="font-large">YES</label>
        </div>
                    
        <div class="col-md-4">
            <input type="radio" name="OpenWholeDay"  runat="server" id="openNo" onclick="analyzeOpen(this.value);" value="0" class="form-control IsOpen" />
        </div>
        <div class="col-md-2">
            <label class="font-large">NO</label>
        </div>
        </div>
</div>
</div>
    <h4>Ventilation:</h4>
    <div class="col-md-3">
        <div class="row">
            <div class="col-md-3">
                <asp:CheckBox runat="server" name="Ventilation" ID="ventAirCon" CssClass="ChkBoxCss" class="form-control" />
            </div>
            <div class="col-md-9">
                <label class="font-large">AIR CONDITIONED</label>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="form-group">
            <div class="row">
                <div class="col-md-3">
                    <asp:CheckBox runat="server" name="Ventilation" ID="ventCeilingFan" CssClass="ChkBoxCss" class="form-control" />
                </div>
                <div class="col-md-9">
                    <label class="font-large">CEILING FAN</label>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3">
        <div class="form-group">
            <div class="row">
                <div class="col-md-3">
                    <asp:CheckBox runat="server" name="Ventilation" ID="ventOrdinaryFan" CssClass="ChkBoxCss" class="form-control" />
                </div>
                <div class="col-md-9">
                    <label class="font-large">ORDINARY FAN</label>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</form>
<hr>
<h3>SCHEDULES</h3>
<div class="row">
<div class="col-md-12">
<form action="#" method="post" id="massschedule" role="form">
<div id="entryMass" class="clonedInputMass">
<h4 id="referenceMass" name="referenceMass" class="heading-reference">Mass Schedule</h4>
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
<div>
</div>
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
    <label class="font-large">LANGUAGE:</label>
        <select runat="server" id="SelectLanguage" class="form-control">
            <option value="English">English</option>
            <option value="Tagalog">Tagalog</option>
            <option value="Cebuano">Cebuano</option>
        </select>
</div>
        <div class="col-md-2"><br />
            <button type="button" id="btnAddMass" name="btnAddMass" class="btn btn-info btn-block"><i class="fa fa-plus"></i>Save</button>
        </div>
</div>
</div>
</div>
<div class="row">
<button id="showMassModal" class="btn btn-success">Add New Mass Schedule</button>
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
    <tbody id="tableMassSchedules" runat="server">
    </tbody>
</table><br />
</div>
</div>
<div class="row">
<div class="col-md-12">
<div id="confession">
<form action="#" method="post" id="confessionschedule" role="form">
<div id="entryConfess" class="clonedInputMass">
<h4 id="referenceConfess" name="referenceConfess" class="heading-reference">Confession Schedule</h4>

<fieldset>
    <!-- Multiple Checkboxes (inline) -->
    <label class="label_day control-label" for="checkboxitem">Day:</label>
    <div class="weekDays-selector">
        <div class="col-md-3">
            <div class="form-group">
                <div class="row">
                    <div class="col-md-3">
                        <input type="checkbox" id="confSun" value="Sunday" class="form-control" />
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
                        <input type="checkbox" id="confMon" value="Monday" class="form-control" />
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
                        <input type="checkbox" id="confTue" class="form-control" />
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
                        <input type="checkbox" id="confWed" class="form-control" />
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
                        <input type="checkbox" id="confThu" class="form-control" />
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
                        <input type="checkbox" id="confFri" class="form-control" />
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
                        <input type="checkbox" id="confSat" class="form-control" />
                    </div>
                    <div class="col-md-9">
                        <label class="font-medium">Sat</label>
                    </div>
                </div>
            </div>
        </div>
</fieldset>
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
    <input class="timepicker4 form-control" id="timepicker4" type="text" name="timepicker4[]" placeholder="-:--" /><br />
</div>
</div>
<div class="row">
<div class="col-md-3">
    <br /><label class="font-large">DISPLAY TEXT FOR YOUR CONFESSION SCHEDULES:</label>
</div>
<div class="col-md-9">
    <textarea type="textarea" runat="server" class="form-control input-lg" id="confessionText"></textarea>
</div>
</div>
</form>
<div class="col-md-3"><br />
    <button type="button" id="btnAddConfession" name="btnAddConfession" class="btn btn-info btn-block"><i class="fa fa-plus"></i>Save Changes</button>
</div>
</div>
</div>
<button id="showConfessionModal" class="btn btn-success">Add New Confession Schedule</button>
 <div class="table-responsive">
    <table id="ConfessionTable">
        <thead>
            <tr class="bg-primary">
                <td class="text-center">
                    <strong>Days(Confessions)</strong>
                </td>
                <td class="text-center">
                    <strong>From</strong>
                </td>
                <td class="text-center">
                    <strong>To</strong>
                </td>
                <td class="text-center">
                    <strong>Display Text</strong>
                </td>
                <td class="text-center">
                    <strong>Action</strong>
                </td>
            </tr>
        </thead>
        <tbody id="tableConfessionSchedules" runat="server">
        </tbody>
    </table><br />
</div>
</div>
<div id="has-adoration-container2" class="row">
<div class="row">
<div class="col-md-12">
<div id="adoration">
 <form action="#" method="post" id="adorationschedule" role="form">
<div id="entryadoration" class="clonedInputMass">
    <h4 id="referenceadoration" name="referenceadoration" class="heading-reference">Adoration Chapel Schedule</h4>

    <fieldset>
        <!-- Multiple Checkboxes (inline) -->
        <label class="label_day control-label" for="checkboxitem">Day:</label>

        <div class="weekDays-selector">
            <div class="col-md-3">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-3">
                            <input type="checkbox" id="adoSun" class="form-control" />
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
                            <input type="checkbox" id="adoMon" class="form-control" />
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
                            <input type="checkbox" id="adoTue" class="form-control" />
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
                            <input type="checkbox" id="adoWed" class="form-control" />
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
                            <input type="checkbox" id="adoThu" class="form-control" />
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
                            <input type="checkbox" id="adoFri" class="form-control" />
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
                            <input type="checkbox" id="adoSat" class="form-control" />
                        </div>
                        <div class="col-md-9">
                            <label class="font-medium">Sat</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
</div>
<!-- Timepicker-->

<div class="col-md-5">
    <div class="inner cover indexpicker">
        <label class="label_timepicker5 control-label" for="timepicker5">From:</label>
        <input class="timepicker5 form-control" id="timepicker5" type="text" name="timepicker5[]" placeholder="-:--" />
    </div>
</div>
<div class="col-md-5">
    <div class="inner cover indexpicker">
        <label class="label_timepicker6 control-label" for="timepicker6">To:</label>
        <input class="timepicker6 form-control" id="timepicker6" type="text" name="timepicker6[]" placeholder="-:--" />
    </div>
</div>
    <div class="col-md-3"><br />
        <button type="button" id="btnAddAdoration" name="btnAddAdoration" class="btn btn-info btn-block"><i class="fa fa-plus"></i>Save Adoration Details</button>
    </div>
</form>
</div>
</div>
</div>
<div class="row">
<button id="showAdorationModal" class="btn btn-success">Add New Adoration Schedule</button>
    <div class="table-responsive">
        <table id="AdorationTable">
            <thead>
                <tr class="bg-primary">
                    <td class="text-center">
                        <strong>Days(Adoration Chapel)</strong>
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
            <tbody id="tableAdorationSchedules" runat="server">
            </tbody>
        </table>
    </div>
</div>
</div>
<div class="row">
<div class="col-md-3">
    <label class="font-large">OFFICE SCHEDULE/S:</label>
</div>
<div class="col-md-9">
    <textarea type="textarea" runat="server" class="form-control input-lg" id="OfficeSchedule"></textarea>
</div>
</div>

<div class="row">
<div class="col-md-3">
    <label class="font-large">SCHEDULE OF DEVOTIONS:</label>
</div>
<div class="col-md-9">
    <textarea type="textarea" runat="server" class="form-control input-lg" id="SchedOfDevotion"></textarea>
</div>
</div>

<div class="row">
<div class="col-md-3">
    <label class="font-large">BAPTISM SCHEDULE/S:</label>
</div>
<div class="col-md-9">
    <textarea type="textarea" runat="server" class="form-control input-lg" id="BaptismSched"></textarea>
</div>
</div>

<div class="row">
<div class="col-md-3">
    <label class="font-large">WEDDING SCHEDULE/S:</label>
</div>
<div class="col-md-9">
    <textarea type="textarea" runat="server" class="form-control input-lg" id="WeddingSchedule"></textarea>
</div>
</div>

<div class="row">
<div class="col-md-5">
    <h4>OTHER EVENT/S: (quarterly or monthly held)</h4>
</div>
<div class="col-md-4">
    <button id="addEvent" class="btn btn-primary">Add Event</button>
</div>
<div class="table-responsive">
<table class="table table-bordered table-hover table-striped">
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
    <tbody id="tableEventSchedules" runat="server">
    </tbody>
</table>
<br />
<div class="row">
<div class="col-md-5">
<label class="font-large">ADD CHURCH PHOTOS</label>
<div style="padding: 40px;">
<asp:FileUpload ID="FileUpload1" runat="server" /><br />
<asp:FileUpload ID="FileUpload2" runat="server" /><br />
<asp:FileUpload ID="FileUpload3" runat="server" /><br />
<asp:Button ID="btnUpload" runat="server" Text="Save" CssClass="hidden"/>
</div>
</div>
    <div class="col-md-4">
            <label class="font-large">Add Church Thumbnail</label>
            <asp:FileUpload ID="FileUpload6" runat="server" style="padding: 20px 0px 20px 40px;"/>
            <asp:Button ID="btnAddThumbnail" runat="server" Text="Save Thumbnail" onclick="btnAddThumbnail_Click" CssClass="btn btn-success"/>
        </div>
</div>
</div>
<hr>
</div>
<div class="row">
<div class="col-md-3 col-md-offset-9">
    <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary btn-block" ></asp:Button>
</div>
</div>
<hr>
</div>
</div>
<!-- Modal Start-->
<div class="modal fade" id="add-event-modal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Add Event</h4>
            </div>
                <div class="modal-body">
                    <div class="form-group">

                        <div class="col-md-12">
                            <label class="control-label">Event Name:</label>
                            <input type="text" class="form-control" runat="server" id="newEventName" value="" />
                        </div>

                        <div class="col-md-12">
                            <label class="control-label">Venue:</label>
                            <input type="text" class="form-control" runat="server" id="newEventVenue" value="" />
                        </div>

                        <div class="col-md-12">
                            <label class="control-label">Event Description:</label>
                            <textarea type="textarea" class="form-control input-lg" runat="server" id="newEventDesc" value=""></textarea>
                        </div>

                        <div class="col-md-4"><br />
                           <label for="FileUpload5">Event Picture:</label>
                        </div>

                        <div class="col-md-6"><br />
                            <asp:FileUpload runat="server" ID="FileUpload5" />
                        </div>

                        <div class="col-md-6">
                            <label class="control-label">Start Date</label>
                            <input type="date" class="form-control" runat="server" id="newEventDate" value="" />
                        </div>

                        <div class="col-md-6">
                            <label class="control-label">Start Time</label>
                            <input type="time" class="form-control" runat="server" id="newEventTime" value="" />
                        </div>

                        <div class="col-md-6">
                            <label class="control-label">End Date</label>
                            <input type="date" class="form-control" runat="server" id="newEventEndDate" value="" />
                        </div>

                        <div class="col-md-6">
                            <label class="control-label">End Time</label>
                            <input type="time" class="form-control" runat="server" id="newEventEndTime" value="" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnAddNewEvent" CssClass="btn btn-primary" UseSubmitBehavior="false" data-dismiss="modal" runat="server" OnClick="btnAddNewEvent_Click" Text="Add"></asp:Button>
                </div>
            </div>
        </div>
    </div>
    <!--Modal End-->
<!-- Modal Start-->
<div class="modal fade" id="add-event-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Edit Event</h4>
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
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <asp:Button ID="btnAddEvent" CssClass="btn btn-primary" UseSubmitBehavior="false" data-dismiss="modal" runat="server" OnClientClick="eventEdit()" OnClick="btnAddEvent_Click" Text="Update"></asp:Button>
                </div>
            </div>
        </div>
    </div>
    <!--Modal End-->
<!-- Modal Start-->
<div class="modal fade" id="add-massSchedule-modal" tabindex="-1" style="width: 100%;" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Add Mass Schedules</h4>
            </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div id="massModal" class="clonedInputMass">
                        <fieldset>
                        <!-- Multiple Checkboxes (inline) -->
                        <label class="label_day control-label" for="checkboxitem">Day:</label>
                        
                        <div class="weekDays-selector">
                        <div class="row">
                             <div class="col-md-1">
                                 <label>Sun</label>
                                <input type="radio" id="Sun" value="1" name="massOption[]" onclick="analyzeMassDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Mon</label>
                                <input type="radio" id="Mon" value="2" name="massOption[]" onclick="analyzeMassDayID();"  class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Tue</label>
                                <input type="radio" id="Tue" value="3" name="massOption[]" onclick="analyzeMassDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Wed</label>
                                <input type="radio" id="Wed" value="4" name="massOption[]" onclick="analyzeMassDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Thu</label>
                                <input type="radio" id="Thu" value="5" name="massOption[]" onclick="analyzeMassDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Fri</label>
                                <input type="radio" id="Fri" value="6" name="massOption[]" onclick="analyzeMassDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Sat</label>
                            <input type="radio" id="Sat" value="7" name="massOption[]" onclick="analyzeMassDayID();" class="form-control" />
                            </div>
                        </fieldset>
                        <div>
                        </div>
                        <div class="col-md-12">
                            <div class="inner cover indexpicker">
                                <label class="label_timepicker1 control-label" for="timepicker11">From:</label>
                                <input class="timepicker11 form-control" id="timepicker11" type="text" name="timepicker1[]" placeholder="-:--" />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="inner cover indexpicker">
                                <label class="label_timepicker2 control-label" for="timepicker12">To:</label>
                                <input class="timepicker12 form-control" id="timepicker12" type="text" name="timepicker2[]" placeholder="-:--" />
                            
                            </div>
                        </div>
                        <div class="col-md-4">
                            <label class="font-large">LANGUAGE:</label>
                                <select id="Select1" class="form-control">
                                    <option value="English">English</option>
                                    <option value="Tagalog">Tagalog</option>
                                    <option value="Cebuano">Cebuano</option>
                                </select>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="AddMassbtn" name="AddMassbtn" class="btn btn-info btn-block"><i class="fa fa-plus"></i>Add New Mass</button>
                </div>
            </div>
        </div>
    </div>
    <!--Modal End-->
<!-- Modal Start-->
<div class="modal fade" id="add-Condession-modal" tabindex="-1" style="width: 100%;" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Add Confession Schedules</h4>
            </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div id="confessionModal" class="clonedInputMass">
                        <fieldset>
                        <!-- Multiple Checkboxes (inline) -->
                        <label class="label_day control-label" for="checkboxitem">Day:</label>
                        
                        <div class="weekDays-selector">
                        <div class="row">
                             <div class="col-md-1">
                                 <label>Sun</label>
                                <input type="radio" id="CSun" value="1" name="conOption[]" onclick="analyzeConDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Mon</label>
                                <input type="radio" id="CMon" value="2" name="conOption[]" onclick="analyzeConDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Tue</label>
                                <input type="radio" id="CTue" value="3" name="conOption[]" onclick="analyzeConDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Wed</label>
                                <input type="radio" id="CWed" value="4" name="conOption[]" onclick="analyzeConDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Thu</label>
                                <input type="radio" id="CThu" value="5" name="conOption[]" onclick="analyzeConDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Fri</label>
                                <input type="radio" id="CFri" value="6" name="conOption[]" onclick="analyzeConDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Sat</label>
                            <input type="radio" id="CSat" value="7" name="conOption[]" onclick="analyzeConDayID();" class="form-control" />
                            </div>
                        </fieldset>
                        <div>
                        </div>
                        <div class="col-md-12">
                            <div class="inner cover indexpicker">
                                <label class="label_timepicker1 control-label" for="timepicker13">From:</label>
                                <input class="timepicker13 form-control" id="timepicker13" type="text" name="timepicker13[]" placeholder="-:--" />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="inner cover indexpicker">
                                <label class="label_timepicker2 control-label" for="timepicker13">To:</label>
                                <input class="timepicker14 form-control" id="timepicker14" type="text" name="timepicker14[]" placeholder="-:--" />
                            
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label class="font-large">Display Text:</label>
                                <textarea id="Select2" class="form-control"></textarea>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="AddConfessionBtn" name="AddConfessionBtn" class="btn btn-info btn-block"><i class="fa fa-plus"></i>Add Confession Mass</button>
                </div>
            </div>
        </div>
    </div>
    <!--Modal End-->
<!-- Modal Start-->
<div class="modal fade" id="add-Adoration-modal" tabindex="-1" style="width: 100%;" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4>Add Adoration Schedules</h4>
            </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div id="AdorationModal" class="clonedInputMass">
                        <fieldset>
                        <!-- Multiple Checkboxes (inline) -->
                        <label class="label_day control-label" for="checkboxitem">Day:</label>
                        
                        <div class="weekDays-selector">
                        <div class="row">
                             <div class="col-md-1">
                                 <label>Sun</label>
                                <input type="radio" id="ASun" value="1" name="adoOption[]" onclick="analyzeAdoDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Mon</label>
                                <input type="radio" id="AMon" value="2" name="adoOption[]" onclick="analyzeAdoDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Tue</label>
                                <input type="radio" id="ATue" value="3" name="adoOption[]" onclick="analyzeAdoDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Wed</label>
                                <input type="radio" id="AWed" value="4" name="adoOption[]" onclick="analyzeAdoDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Thu</label>
                                <input type="radio" id="AThu" value="5" name="adoOption[]" onclick="analyzeAdoDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Fri</label>
                                <input type="radio" id="AFri" value="6" name="adoOption[]" onclick="analyzeAdoDayID();" class="form-control" />
                            </div>
                            <div class="col-md-1">
                                <label>Sat</label>
                            <input type="radio" id="ASat" value="7" name="adoOption[]" onclick="analyzeAdoDayID();" class="form-control" />
                            </div>
                        </fieldset>
                        <div>
                        </div>
                        <div class="col-md-12">
                            <div class="inner cover indexpicker">
                                <label class="label_timepicker15 control-label" for="timepicker15">From:</label>
                                <input class="timepicker15 form-control" id="timepicker15" type="text" name="timepicker15[]" placeholder="-:--" />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="inner cover indexpicker">
                                <label class="label_timepicker6 control-label" for="timepicker16">To:</label>
                                <input class="timepicker16 form-control" id="timepicker16" type="text" name="timepicker16[]" placeholder="-:--" />
                            
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="AddAdorationBtn" name="AddAdorationBtn" class="btn btn-info btn-block"><i class="fa fa-plus"></i>Add Adoration Mass</button>
                </div>
            </div>
        </div>
    </div>
    <!--Modal End-->
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/locale/af.js">
</script>
    <script>
    $(document).ready(function () {
        $("#massschedule").hide();
        $('#confession').hide();
        $('#adoration').hide();
    });

    //Delete Mass Details
    $(document).on('click', '#delete', function (e) {
        e.preventDefault();

        var confirmDelete = confirm('Are you sure yo want to delete this schedule?');
        var id = $(this).data('id');

        if (confirmDelete)
        {
            console.log($(this).data('id'));
            (new http).post('ChurchAdminPageUpdate.aspx/DeleteMassDetails', {
                massDetailsId: id
            }).then(function (response) {
                alert('Deleted!');
                window.location.reload();
            }).run();
        }
        $("#massschedule").hide();
    });

    //Delete Confession Details
    $(document).on('click', '#deleteConfession', function (e) {
        e.preventDefault();

        var confirmDelete = confirm('Are you sure yo want to delete this schedule?');
        var id = $(this).data('id');

        if (confirmDelete) {
            console.log($(this).data('id'));
            (new http).post('ChurchAdminPageUpdate.aspx/DeleteConfessionDetails', {
                confessionDetailsId: id
            }).then(function (response) {
                alert('Deleted!');
                window.location.reload();
            }).run();
        }
        $("#confession").hide();
    });

    //Delete Adoration Details
    $(document).on('click', '#deleteAdoration', function (e) {
        e.preventDefault();

        var confirmDelete = confirm('Are you sure yo want to delete this schedule?');
        var id = $(this).data('id');

        if (confirmDelete) {
            console.log($(this).data('id'));
            (new http).post('ChurchAdminPageUpdate.aspx/DeleteAdorationDetails', {
                adorationDetailsId: id
            }).then(function (response) {
                alert('Deleted!');
                window.location.reload();
            }).run();
        }
        $("#adoration").hide();
    });

    //Edit Mass Details
    var editMassDetailId = 0;
    var editMassDetail;
    var schedID = 0;
    $(document).on('click', '#edit', function (e) {
        e.preventDefault();
        
        $("#massschedule").show();

        var id = $(this).data('id');
        editMassDetailId = id;

       $('#<%= tableMassSchedules.ClientID %> tr[name="' + id + '"]').each(function (index, tr) {

            var lines = $('td', tr).map(function (index, td) {
                return $(td).text();
            });

            var day = lines[0];
            var lang = lines[1];
            var massStart = lines[2];
            var massEnd = lines[3];

            $("#massThu").prop('checked', false);
            $("#massMon").prop('checked', false);
            $("#massTue").prop('checked', false);
            $("#massWed").prop('checked', false);
            $("#massSun").prop('checked', false);
            $("#massFri").prop('checked', false);
            $("#massSat").prop('checked', false);

            if (day == 'Sunday'){
                schedID = 1;
                $("#massSun").prop('checked', true);
            } else if (day == 'Monday') {
                schedID = 2;
                $("#massMon").prop('checked', true);
            } else if (day == 'Tuesday') {
                schedID = 3;
                $("#massTue").prop('checked', true);
            } else if (day == 'Wednesday') {
                schedID = 4;
                $("#massWed").prop('checked', true);
            } else if (day == 'Thursday') {
                schedID = 5;
                $("#massThu").prop('checked', true);
            } else if (day == 'Friday') {
                schedID = 6;
                $("#massFri").prop('checked', true);
            } else if (day == 'Saturday') {
                schedID = 7;
                $("#massSat").prop('checked', true);
            }

               $('#<%= SelectLanguage.ClientID%>').val(lang);
               $('#timepicker1').val(massStart);
               $('#timepicker2').val(massEnd);

               editMassDetail = {
                   massStart: massStart,
                   massEnd: massEnd,
                   day: day,
                   scheduleId: schedID,
                   language: lang
               }
         })
    });

    //Edit Confession Details
    var editConfessionDetailId = 0;
    var editConfessionDetail;
    var schedID = 0;
    $(document).on('click', '#editConfession', function (e) {
        e.preventDefault();
        
        $("#confession").show();

        var id = $(this).data('id');
        editConfessionDetailId = id;

       $('#<%= tableConfessionSchedules.ClientID %> tr[name="' + id + '"]').each(function (index, tr) {

            var lines = $('td', tr).map(function (index, td) {
                return $(td).text();
            });

            var day = lines[0];
            var confStart = lines[1];
            var confEnd = lines[2];
            var text = lines[3];

            $("#confThu").prop('checked', false);
            $("#confMon").prop('checked', false);
            $("#confTue").prop('checked', false);
            $("#confWed").prop('checked', false);
            $("#confSun").prop('checked', false);
            $("#confFri").prop('checked', false);
            $("#confSat").prop('checked', false);

            if (day == 'Sunday'){
                schedID = 1;
                $("#confSun").prop('checked', true);
            } else if (day == 'Monday') {
                schedID = 2;
                $("#confMon").prop('checked', true);
            } else if (day == 'Tuesday') {
                schedID = 3;
                $("#confTue").prop('checked', true);
            } else if (day == 'Wednesday') {
                schedID = 4;
                $("#confWed").prop('checked', true);
            } else if (day == 'Thursday') {
                schedID = 5;
                $("#massThu").prop('checked', true);
            } else if (day == 'Friday') {
                schedID = 6;
                $("#confFri").prop('checked', true);
            } else if (day == 'Saturday') {
                schedID = 7;
                $("#confSat").prop('checked', true);
            }

               $('#<%= confessionText.ClientID%>').val(text);
               $('#timepicker3').val(confStart);
               $('#timepicker4').val(confEnd);

               editConfessionDetail = {
                   confStart: confStart,
                   confEnd: confEnd,
                   day: day,
                   scheduleId: schedID,
                   text: text
               }
         })
    });

    //Edit Adoration Details
    var editAdorationDetailId = 0;
    var editAdoDetail;
    var schedID = 0;
    $(document).on('click', '#editAdoration', function (e) {
        e.preventDefault();
        
        $("#adoration").show();

        var id = $(this).data('id');
        editAdorationDetailId = id;

       $('#<%= tableAdorationSchedules.ClientID %> tr[name="' + id + '"]').each(function (index, tr) {

            var lines = $('td', tr).map(function (index, td) {
                return $(td).text();
            });

            var day = lines[0];
            var adoStart = lines[1];
            var adoEnd = lines[2];

            $("#adoThu").prop('checked', false);
            $("#adoMon").prop('checked', false);
            $("#adoTue").prop('checked', false);
            $("#adoWed").prop('checked', false);
            $("#adoSun").prop('checked', false);
            $("#adoFri").prop('checked', false);
            $("#adoSat").prop('checked', false);

            if (day == 'Sunday'){
                schedID = 1;
                $("#adoSun").prop('checked', true);
            } else if (day == 'Monday') {
                schedID = 2;
                $("#adoMon").prop('checked', true);
            } else if (day == 'Tuesday') {
                schedID = 3;
                $("#adoTue").prop('checked', true);
            } else if (day == 'Wednesday') {
                schedID = 4;
                $("#adoWed").prop('checked', true);
            } else if (day == 'Thursday') {
                schedID = 5;
                $("#adoThu").prop('checked', true);
            } else if (day == 'Friday') {
                schedID = 6;
                $("#adoFri").prop('checked', true);
            } else if (day == 'Saturday') {
                schedID = 7;
                $("#adoSat").prop('checked', true);
            }

               $('#timepicker5').val(adoStart);
               $('#timepicker6').val(adoEnd);

               editAdoDetail = {
                   adoStart: adoStart,
                   adoEnd: adoEnd,
                   day: day,
                   scheduleId: schedID,
               }
         })
    });

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

        $(document).on('click', '#btnAddMass', function (e) {
            e.preventDefault();
            
            var fromHour = editMassDetail.massStart.split(' ')[0];
            var fromAMorPM = editMassDetail.massStart.split(':')[1].split(' ')[1];
            var toHour = editMassDetail.massEnd.split(' ')[0];
            var toAMorPM = editMassDetail.massEnd.split(':')[1].split(' ')[1];

            var timeStd = 0;

            timestandard[fromAMorPM].forEach(
                function (time, timeStandardID) {
                    if (fromHour.split(':')[0] == time.substr(0, 1))
                        timeStd = timeStandardID;
                });

            if (timeStd != 0) {
                (new http).post('ChurchAdminPageUpdate.aspx/UpdateMassDetails', {
                    massDetailsId: editMassDetailId,
                    ScheduleId: schedID,
                    Language: $('#<%= SelectLanguage.ClientID%>').val(),
                    Time: $("#timepicker1").val() + '-' + $("#timepicker2").val(),
                    SimbahanId: $("#<%= SimbahanId.ClientID %>").val(),
                    TimeStandard: timeStd,
                }).then(function (response) {
                    alert('Updated!');
                    window.location.reload();
                }).run();
            }
        });

        //Update Confession Details
        $(document).on('click', '#btnAddConfession', function (e) {
            e.preventDefault();
            
            var fromHour = editConfessionDetail.confStart.split(' ')[0];
            var fromAMorPM = editConfessionDetail.confStart.split(':')[1].split(' ')[1];
            var toHour = editConfessionDetail.confEnd.split(' ')[0];
            var toAMorPM = editConfessionDetail.confEnd.split(':')[1].split(' ')[1];

            var timeStd = 0;

            timestandard[fromAMorPM].forEach(
                function (time, timeStandardID) {
                    if (fromHour.split(':')[0] == time.substr(0, 1))
                        timeStd = timeStandardID;
                });

            if (timeStd != 0) {
                (new http).post('ChurchAdminPageUpdate.aspx/UpdateConfessionDetails', {
                    confessionDetailsId: editConfessionDetailId,
                    ScheduleId: schedID,
                    text: $('#<%= confessionText.ClientID%>').val(),
                    Time: $("#timepicker3").val() + '-' + $("#timepicker4").val(),
                    SimbahanId: $("#<%= SimbahanId.ClientID %>").val(),
                    TimeStandard: timeStd,
                }).then(function (response) {
                    alert('Updated!');
                    window.location.reload();
                }).run();
            }
        });

        //Update Details
        $(document).on('click', '#btnAddAdoration', function (e) {
            e.preventDefault();
            
            var fromHour = editAdoDetail.adoStart.split(' ')[0];
            var fromAMorPM = editAdoDetail.adoStart.split(':')[1].split(' ')[1];
            var toHour = editAdoDetail.adoEnd.split(' ')[0];
            var toAMorPM = editAdoDetail.adoEnd.split(':')[1].split(' ')[1];

            var timeStd = 0;

            timestandard[fromAMorPM].forEach(
                function (time, timeStandardID) {
                    if (fromHour.split(':')[0] == time.substr(0, 1))
                        timeStd = timeStandardID;
                });

            if (timeStd != 0) {
                (new http).post('ChurchAdminPageUpdate.aspx/UpdateAdorationDetails', {
                    adorationDetailsId: editAdorationDetailId,
                    ScheduleId: schedID,
                    Time: $("#timepicker5").val() + '-' + $("#timepicker6").val(),
                    TimeStandard: timeStd,
                }).then(function (response) {
                    alert('Updated!');
                    window.location.reload();
                }).run();
            }
        });

        var editEventDetailId;
        $(document).on('click', '#editEvent', function (e) {
            e.preventDefault();


            var id = $(this).data('id');

            $('#<%= tableEventSchedules.ClientID %> tr[name="' + id + '"]').each(function (index, tr) {
                
            var lines = $('td', tr).map(function (index, td) {
                return $(td).text();
            });

            var eventName = lines[0];
            var venue = lines[1];
            var desc = lines[2];
            //var startDate = moment(lines[4], 'MM/DD/YYYY').format('YYYY-MM-DD');

            editEventDetailId = id;
            console.log(editEventDetailId);

            $('#<%= eventName.ClientID%>').val(eventName);
            $('#<%= eventDesc.ClientID%>').val(desc);
            $('#<%= eventVenue.ClientID%>').val(venue);

            $("#add-event-modal").modal('show');
         })
        });


        //Update Event Details
        function eventEdit(){

            var filename;
            fileName = $("#<% =FileUpload4.ClientID%>").val().split('\\')[$("#<%= FileUpload4.ClientID%>").val().split('\\').length - 1];

            (new http).post('ChurchAdminPageUpdate.aspx/UpdateEventDetails', {
                    eventDetailsId: editEventDetailId,
                    eventName: $('#<%= eventName.ClientID%>').val(),
                    eventStartDate: $('#<%= eventDate.ClientID%>').val(),
                    eventStartTime: $('#<%= eventTime.ClientID%>').val(),
                    eventEndDate: $('#<%= eventEndDate.ClientID%>').val(),
                    eventEndTime: $('#<%= eventEndTime.ClientID%>').val(),
                    SimbahanId: $('#<% =SimbahanId.ClientID%>').val(),
                    venue: $('#<%= eventVenue.ClientID%>').val(),
                    path: fileName,
                    desc: $('#<% =eventDesc.ClientID%>').val()
                }).then(function (response) {
                    alert('Updated!');
                    window.location.reload();
                }).run();
                console.log($('#<%= FileUpload4.ClientID%>').val());
        };

        //Delete Adoration Details
        $(document).on('click', '#deleteEvent', function (e) {
            e.preventDefault();

            var confirmDelete = confirm('Are you sure yo want to delete this schedule?');
            var id = $(this).data('id');

            if (confirmDelete) {
                console.log($(this).data('id'));
                (new http).post('ChurchAdminPageUpdate.aspx/DeleteEventDetails', {
                    eventDetailsId: id
                }).then(function (response) {
                    alert('Deleted!');
                    window.location.reload();
                }).run();
            }
        });

        $(document).on('click', '#addEvent', function (e) {
            e.preventDefault();

            $("#add-event-modal2").modal("show");

        });

        $(document).on('click', '#showMassModal', function (e) {
            e.preventDefault();
            $('#add-massSchedule-modal').modal('show');
        });

        var massDayID = 0;

			function analyzeMassDayID() {
				var inputName = $("#Sun").attr('name');
				massDayID = $('input[name="' + inputName + '"]:checked').val();
				//console.log(massDayID);

				//window.localStorage.setItem('locationID', locationID);
			}

        $(document).on('click', '#AddMassbtn', function (e) {
            e.preventDefault();

            var fromHour = removeZeroPrefix($('#timepicker11').val().split(':')[0]);
            var fromAMorPM = $('#timepicker11').val().split(':')[1].split(' ')[1];
            var toHour = removeZeroPrefix($('#timepicker12').val().split(':')[0]);
            var toAMorPM = $('#timepicker12').val().split(':')[1].split(' ')[1];

            
            var timeStd = 0;

            timestandard[fromAMorPM].forEach(
                function (time, timeStandardID) {
                    if (fromHour == time.substr(0, 1))
                        timeStd = timeStandardID;
                });

            console.log('timeStd ', timeStd);

            (new http).post('ChurchAdminPageUpdate.aspx/addNewMass', {
                day: massDayID,
                massStart: $('#timepicker11').val(),
                massEnd: $('#timepicker12').val(),
                lang: $('#Select1').val(),
                timestandard: timeStd,
                simbahanID: $('#<% =SimbahanId.ClientID%>').val()
            }).then(function (response) {
                alert('Added!');
                window.location.reload();
            }).run();
        });

        $(document).on('click', '#showConfessionModal', function (e) {
            e.preventDefault(e);
            
            $('#add-Condession-modal').modal('show');
        });


        var conFDayID = 0;

        function analyzeConDayID() {
            var inputName = $("#CSun").attr('name');
            conFDayID = $('input[name="' + inputName + '"]:checked').val();
            //console.log(conFDayID);

            //window.localStorage.setItem('locationID', locationID);
        }

        $(document).on('click', '#AddConfessionBtn', function (e) {
            e.preventDefault();
            
            var fromHour = removeZeroPrefix($('#timepicker13').val().split(':')[0]);
            var fromAMorPM = $('#timepicker13').val().split(':')[1].split(' ')[1];
            var toHour = removeZeroPrefix($('#timepicker14').val().split(':')[0]);
            var toAMorPM = $('#timepicker14').val().split(':')[1].split(' ')[1];

            
            var timeStd = 0;

            timestandard[fromAMorPM].forEach(
                function (time, timeStandardID) {
                    if (fromHour == time.substr(0, 1))
                        timeStd = timeStandardID;
                });

            console.log('timeStd ', timeStd);

            (new http).post('ChurchAdminPageUpdate.aspx/addNewConfession', {
                conday: conFDayID,
                conStart: $('#timepicker13').val(),
                conEnd: $('#timepicker14').val(),
                display: $('#Select2').val(),
                timestandard: timeStd,
                simbahanID: $('#<% =SimbahanId.ClientID%>').val()
            }).then(function (response) {
                alert('Added!');
                window.location.reload();
            }).run();
        });

        $(document).on('click', '#showAdorationModal', function (e) {
            e.preventDefault();
            $('#add-Adoration-modal').modal('show');
        });

        var adoDayID = 0;

        function analyzeAdoDayID() {
            var inputName = $("#ASun").attr('name');
            adoDayID = $('input[name="' + inputName + '"]:checked').val();
            console.log(adoDayID);

            //window.localStorage.setItem('locationID', locationID);
        }

        $(document).on('click', '#AddAdorationBtn', function (e) {
            e.preventDefault();
            
            var fromHour = removeZeroPrefix($('#timepicker15').val().split(':')[0]);
            var fromAMorPM = $('#timepicker15').val().split(':')[1].split(' ')[1];
            var toHour = removeZeroPrefix($('#timepicker16').val().split(':')[0]);
            var toAMorPM = $('#timepicker16').val().split(':')[1].split(' ')[1];

            
            var timeStd = 0;

            timestandard[fromAMorPM].forEach(
                function (time, timeStandardID) {
                    if (fromHour == time.substr(0, 1))
                        timeStd = timeStandardID;
                });

            console.log('timeStd ', timeStd);

            (new http).post('ChurchAdminPageUpdate.aspx/addNewAdoration', {
                adoday: adoDayID,
                adoStart: $('#timepicker15').val(),
                adoEnd: $('#timepicker16').val(),
                timestandard: timeStd,
                simbahanID: $('#<% =SimbahanId.ClientID%>').val()
            }).then(function (response) {
                alert('Added!');
                window.location.reload();
            }).run();
        });
</script>
<script src="Scripts/timepicki.js"></script>
<script>
            $('#timepicker1').timepicki();
            $('#timepicker2').timepicki();
            $('#timepicker3').timepicki();
            $('#timepicker4').timepicki();
            $('#timepicker5').timepicki();
            $('#timepicker6').timepicki();
            $('#timepicker11').timepicki();
            $('#timepicker12').timepicki();
            $('#timepicker13').timepicki();
            $('#timepicker14').timepicki();
            $('#timepicker15').timepicki();
            $('#timepicker16').timepicki();
</script>
</asp:Content>