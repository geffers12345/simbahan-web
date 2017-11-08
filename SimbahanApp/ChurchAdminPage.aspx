<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ChurchAdminPage.aspx.cs" Inherits="SimbahanApp.ChurchAdminPage" EnableEventValidation="false" %>

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
			<h2>CHURCH INFORMATION SHEET</h2><span class="text-danger" style="float: right; margin-top: -40px;">(* - required)</span>
		</strong>
		<form role="form" class="form-horizontal">
			<input type="text" runat="server" id="MassSchedules" style="display: none;" data-name="Mass Schedule" />
			<input type="text" runat="server" id="ConfessionSchedules" style="display: none;" data-name="Confession Schedule" />
			<input type="text" runat="server" id="AdorationSchedules" style="display: none;" />
			<input type="text" runat="server" id="EventSchedules" style="display: none;" />
			<div class="row form-group">
				<span class="text-danger">*</span><label for="churchName">Church Name:</label>
				<input type="text" runat="server" class="form-control input-lg" id="churchName" placeholder="Church Name" data-name="Church Name" />
				<label id="errorChurchName" class="text-danger" style="display: none;"></label>
			</div>
			<div class="row form-group">
				<span class="text-danger">*</span><label for="">Address:</label>
				<input type="text" runat="server" class="form-control input-lg" id="address" placeholder="Address" data-name="Church Address" />
				<label id="errorChurchAddress" class="text-danger" style="display: none;"></label>
			</div>
			<div class="row">
				<div class="col-md-4 form-group">
					<%--<span class="text-danger">*</span>--%><label class="font-large" for="city">City:</label>
					<input type="text" runat="server" class="form-control input-lg" id="city" placeholder="City" data-name="City" />
					<label id="errorChurchCity" class="text-danger" style="display: none;"></label>
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
					<%--<span class="text-danger">*</span>--%><label class="font-large" for="vicariate">Vicariate:</label>
					<input type="text" runat="server" class="form-control input-lg" id="vicariate" placeholder="Vicariate" data-name="Vicariate" />
					<label id="errorVicariate" class="text-danger" style="display: none;"></label>
				</div>
				<div class="col-md-6">
					<label class="font-large" for="feastDay">Feast Day:</label>
					<input type="text" runat="server" class="form-control input-lg" id="feastDay" placeholder="Feast Day" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<%--<span class="text-danger">*</span>--%><label class="font-large" for="parishPriest">Parish Priest:</label>
					<input type="text" runat="server" class="form-control input-lg" id="parishPriest" placeholder="Parish Priest" data-name="Parish Priest" />
					<label id="errorPriest" class="text-danger" style="display: none;"></label>
				</div>
				<div class="col-md-6">
					<label class="font-large" for="administeredBy">Administered by:</label>
					<input type="text" runat="server" class="form-control input-lg" id="administeredBy" placeholder="Administered by" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<%--<span class="text-danger">*</span>--%><label class="font-large" for="diocese">Diocese:</label>
					<input type="text" runat="server" class="form-control input-lg" id="diocese" placeholder="Diocese" data-name="Diocese"/>
					<label id="errorDiocese" class="text-danger" style="display: none;"></label>
				</div>
				<div class="col-md-6">
					<label class="font-large" for="dateEstablished">Date Established:</label>
					<input type="text" runat="server" class="form-control input-lg" id="dateEstablished" placeholder="Date Established" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<%--<span class="text-danger">*</span>--%><label class="font-large" for="phoneNo">Phone No.:</label>
					<input type="text" runat="server" class="form-control input-lg" id="phoneNo" placeholder="Phone No." data-name="Phone Number" />
					<label id="errorPhone" class="text-danger" style="display: none;"></label>
				</div>
				<div class="col-md-4">
					<%--<span class="text-danger">*</span>--%><label class="font-large" for="emailAdd">Email:</label>
					<input type="text" runat="server" class="form-control input-lg" id="emailAdd" placeholder="Email" data-name="email" />
					<label id="errorEmail" class="text-danger" style="display: none;"></label>
				</div>
				<div class="col-md-4">
					<label class="font-large" for="website">Website:</label>
					<input type="text" runat="server" class="form-control input-lg" id="website" placeholder="Website" />
				</div>
                <div class="row">
				<div class="col-md-6">
					<span class="text-danger">*</span><label class="font-large" for="">Longitude:</label>
					<input type="text" runat="server" class="form-control input-lg" id="Longitude" placeholder="Longitude" data-name="Longitude" />
					<label id="errorLong" class="text-danger" style="display: none;"></label>
				</div>
				<div class="col-md-6">
					<span class="text-danger">*</span><label class="font-large" for="">Latitude:</label>
					<input type="text" runat="server" class="form-control input-lg" id="Latitude" placeholder="Latitude" data-name="Latitude" />
                    <label id="errorLat" class="text-danger" style="display: none;"></label>
				</div>
			    </div>
			</div>

			<h3>FACILITIES</h3>
			<div id="category-list">
				<h4><%--<span class="text-danger">*</span>--%>CHURCH FACILITIES:</h4>
				<div class="row">
					<div class="col-md-3">
						<div class="row">
							<div class="col-md-3">
								<asp:CheckBox ID="facAirCon" name="type" runat="server" CssClass="ChkBoxCss" />
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
									<asp:CheckBox runat="server" name="type" ID="facCeilingFan" CssClass="ChkBoxCss" />
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
									<asp:CheckBox runat="server" name="type" ID="facOrdinaryFan" CssClass="ChkBoxCss" />
								</div>
								<div class="col-md-9">
									<label class="font-large">ORDINARY FAN</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%--<label id="errorChecked" class="text-danger" style="display: none;"></label>--%>
				<div class="text-danger">
					<label id="errorCheckbox"  style="display: none;">Please Select Atleast 1 Ventilation</label>
				</div>
			</div>
			<div class="row">
				<h4><%--<span class="text-danger">*</span>--%>CHURCH LOCATION:</h4>

				<div class="col-md-3">
					<div class="row">
						<div class="col-md-4">
							<input type="radio" runat="server" name="ChurchLocation" id="locSeparate" onclick="analyzeLocation();" value="1" class="form-control location" data-name="Church Location"/>
						</div>
						<div class="col-md-5">
							<label class="font-large">SEPARATE/PRIVATE</label>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="row">
						<div class="col-md-5">
							<input type="radio" runat="server" name="ChurchLocation" id="locMall" onclick="analyzeLocation();" value="3" class="form-control location" data-name="Church Location"/>
						</div>
						<div class="col-md-7">
							<label class="font-large">MALL</label>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="row">
						<div class="col-md-5">
							<input type="radio" runat="server" name="ChurchLocation" id="locHospital" onclick="analyzeLocation();" value="5" class="form-control location" data-name="Church Location"/>
						</div>
						<div class="col-md-7">
							<label class="font-large">HOSPITAL</label>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="row">
						<div class="col-md-5">
							<input type="radio" runat="server" name="ChurchLocation" id="locSchool" onclick="analyzeLocation();" value="4" class="form-control location" data-name="Church Location"/>
						</div>
						<div class="col-md-7">
							<label class="font-large">SCHOOL</label>
						</div>
					</div>
				</div>
				<div class="col-md-2">
					<div class="row">
						<div class="col-md-5">
							<input type="radio" runat="server" name="ChurchLocation" id="locConvent" onclick="analyzeLocation();" value="2" class="form-control location" data-name="Church Location" />
						</div>
						<div class="col-md-7">
							<label class="font-large">CONVENT</label>
						</div>
					</div>
				</div><br />
				<p class="text-danger" id="ErrorLocation"></p>
			</div>

			<hr>
			<h4><%--<span class="text-danger">*</span>--%>CHURCH PARKING:</h4>
			<div class="row">
				<div class="col-md-3">
					<div class="row">
						<div class="col-md-3">
							<asp:CheckBox runat="server" name="churchParking" ID="parkStreet" CssClass="ChkBoxCss" />
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
								<asp:CheckBox runat="server" name="churchParking" ID="parkMall" CssClass="ChkBoxCss" />
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
								<asp:CheckBox runat="server" name="churchParking" ID="parkPrivate" CssClass="ChkBoxCss" />
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
								<asp:CheckBox runat="server" name="churchParking" ID="parkOther" CssClass="ChkBoxCss" />
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
									<input type="radio" runat="server" id="yes" name="hasAdoration" value="1" onclick="analyzeAdoration();" class="form-control hasAdoration" />
								</div>
								<div class="col-md-7">
									<label class="font-large">YES</label>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="row">
								<div class="col-md-5">
									<input type="radio" runat="server" id="no" name="hasAdoration" value="0" onclick="analyzeAdoration();" class="form-control hasAdoration" />
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
							<input type="radio" runat="server" id="openYes" name="OpenWholeDay" onclick="analyzeOpen();" value="1" class="form-control IsOpen" />
						</div>
						<div class="col-md-1">
							<label class="font-large">YES</label>
						</div>
					
						<div class="col-md-4">
							<input type="radio" runat="server" id="openNo" name="OpenWholeDay" onclick="analyzeOpen();" value="0" class="form-control IsOpen" />
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
								<asp:CheckBox runat="server" name="Ventilation" ID="ventAirCon" CssClass="ChkBoxCss" />
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
									<asp:CheckBox runat="server" name="Ventilation" ID="ventCeilingFan" CssClass="ChkBoxCss" />
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
									<asp:CheckBox runat="server" name="Ventilation" ID="ventOrdinaryFan" CssClass="ChkBoxCss"  />
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
						<label class="font-large">LANGUAGE:</label>
						 <%--<select runat="server" id="SelectLanguage" class="form-control">
								<option value="English">English</option>
								<option value="Tagalog">Tagalog</option>
								<option value="Cebuano">Cebuano</option>
							</select>--%>
                        <input type="text" class="form-control input-lg" id="SelectLanguage" runat="server" placeholder="Language" />
					</div>
							<div class="col-md-2"><br />
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
				<form action="#" method="post" id="confessionschedule" role="form">
					<div id="entryConfess" class="clonedInputMass">
						<h4 id="referenceConfess" name="referenceConfess" class="heading-reference"><%--<span class="text-danger">*</span>--%>Confession Schedule</h4>
						<label id="errorConfession" class="text-danger" style="display: none;"></label>
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
								<button type="button" id="btnAddConfession" name="btnAddConfession" class="btn btn-info btn-block"><i class="fa fa-plus"></i>Add Confession Details</button>
							</div>
				</form>
			</div>
		</div>
		<div class="row">
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
								<strong>Action</strong>
							</td>
						</tr>
					</thead>
					<tbody id="eventContainerConfess">
					</tbody>
				</table><br />
			<div class="col-md-3">
				<label class="font-large"><%--<span class="text-danger">*</span>--%>DISPLAY TEXT FOR YOUR CONFESSION SCHEDULES:</label>
			   
		   </div>
		   <div class="col-md-9">
				<textarea type="textarea" runat="server" class="form-control input-lg" id="confessionText" data-name="Displa Text for Confession"></textarea>
				<label id="errorDisplayTextConfession" class="text-danger" style="display: none;"></label>
			</div>
			</div>
		</div>
		<div id="has-adoration-container2" class="row">
			<div class="row">
				<div class="col-md-12">
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
						<div>
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
									<button type="button" id="btnAddAdoration" name="btnAddAdoration" class="btn btn-info btn-block"><i class="fa fa-plus"></i>Add Adoration Details</button>
								</div>
					</form>
				</div>
			</div>
			<div class="row">
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
						<tbody id="eventContainerAdoration">
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<%--<span class="text-danger">*</span>--%><label class="font-large">OFFICE SCHEDULE/S:</label>
			</div>
			<div class="col-md-9">
				<textarea type="textarea" runat="server" class="form-control input-lg" id="OfficeSchedule" data-name="Office Schedules"></textarea>
				<label id="errorOfficeSchedules" class="text-danger" style="display: none;"></label>
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
			   <%--<span class="text-danger">*</span> --%><label class="font-large">BAPTISM SCHEDULE/S:</label>
			</div>
			<div class="col-md-9">
				<textarea type="textarea" runat="server" class="form-control input-lg" id="BaptismSched" data-name="Baptism Schedules"></textarea>
				<label id="errorBaptism" class="text-danger" style="display: none;"></label>
			</div>
		</div>

		<div class="row">
			<div class="col-md-3">
				<%--<span class="text-danger">*</span>--%><label class="font-large">WEDDING SCHEDULE/S:</label>
			</div>
			<div class="col-md-9">
				<textarea type="textarea" runat="server" class="form-control input-lg" id="WeddingSchedule" data-name="Wedding Schedules"></textarea>
				<label id="errorWedding" class="text-danger" style="display: none;"></label>
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
			<br />
			<div class="row">
		<div class="col-md-5">
			<%--<span class="text-danger">*</span>--%><label class="font-large">ADD CHURCH PHOTOS</label>
		<div style="padding: 40px;">
		<asp:FileUpload ID="FileUpload1" runat="server" data-name="Church Photo"/><br />
		<asp:FileUpload ID="FileUpload2" runat="server" /><br />
		<asp:FileUpload ID="FileUpload3" runat="server" /><br />
		<label id="errorPhoto" class="text-danger" style="display: none;"></label>
		<asp:Button ID="btnUpload" runat="server" Text="Save" OnClick="btnUpload_Click" CssClass="hidden"/>
	</div>
			<div class="col-md-4">
			<label class="font-large">Add Church Thumbnail</label>
			<asp:FileUpload ID="FileUpload6" runat="server" style="padding: 20px 0px 20px 40px;"/>
			<asp:Button ID="btnAddThumbnail" runat="server" Text="Save Thumbnail" OnClick="btnAddThumbnail_Click" CssClass="hidden"/>
		</div>
	</div>
	 </div>
		</div>
		<hr>
	</div>
	<div class="row">
		<div class="col-md-3 col-md-offset-9">
			<asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-primary btn-block" />
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
						<asp:Button ID="btnAddEvent" CssClass="btn btn-primary" UseSubmitBehavior="false" data-dismiss="modal" runat="server" OnClick="btnAddEvent_Click" Text="Add"></asp:Button>
						<%--<button ID="btnAddEvent" class="btn btn-primary" onclick="saveimg()">Add</button>--%>
					</div>
				</div>
			</div>
		</div>
		<!--Modal End-->
	</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptsPlaceHolder" runat="server">
	<script src="Scripts/timepicki.js">
	</script>
		<script>

			function saveimg() {

				var src = $("#<%= FileUpload4.ClientID%>").val();
				var dest = (Server.MapPath("Images/Photos/"));

				aqFileSystem.CopyFile(src, dest);

			}

				$(document).ready(function () {

					$("#<%= eventName.ClientID%>").val('');
					$("#<%= eventVenue.ClientID%>").val('');
					$("#<%= eventDate.ClientID%>").val('');
					$("#<%= eventTime.ClientID%>").val('');
					$("#<%= eventDesc.ClientID%>").val('');
					$("#<%= eventEndDate.ClientID%>").val('');
					$("#<%= eventEndTime.ClientID%>").val('');

					var locationIDnew = parseInt(window.localStorage.getItem('locationID'));
					console.log(locationIDnew);
					var HasAdorationChapelnew = parseInt(window.localStorage.getItem('HasAdorationChapel'));
					console.log(HasAdorationChapelnew);
					var isOpennew = parseInt(window.localStorage.getItem('isOpen'));
					console.log(isOpennew);

					$('#has-adoration-container').hide();
					// Check if MAssSchedules has value
					if ($("#<%= MassSchedules.ClientID %>").val() != "")
					{
						var massesString = $("#<%= MassSchedules.ClientID %>").val();
						var massStr = massesString.split('|');
						Simbahan = new Map();

						$.each(massStr, function (key, value) {
							if (value == "")
								return true;
							var mass = JSON.parse(value);
							Simbahan.set(key, mass);

							$("#eventContainerMass").append('<tr><td>' + mass.day.join(', ') + '</td><td>' + mass.language + '</td><td>' + mass.MassFrom + '</td><td>' + mass.MassTo + '</td><td><button type="button" id="btnDelConfession" data-id="' + key + '" class="btn btn-danger">Delete</button></td></tr>');
						});
					}
					//alert('alert 1');
					if ($("#<%= ConfessionSchedules.ClientID %>").val() != "")
					{
						var ConString = $("#<%= ConfessionSchedules.ClientID %>").val();
						var ConStr = ConString.split('|');
						ConfessionID = new Map();

						$.each(ConStr, function (key, value) {
							if (value == "")
								return true;
							var confession = JSON.parse(value);
							ConfessionID.set(key, confession);

							$("#eventContainerConfess").append('<tr><td>' + confession.day.join(', ') + '</td><td>' + confession.ConFrom + '</td><td>' + confession.ConTo + '</td><td><button type="button" id="btnDelConfession" data-id="' + key + '" class="btn btn-danger">Delete</button></td></tr>');
						});
					}

					if ($("#<%= AdorationSchedules.ClientID %>").val() != "")
					{
						var AdoString = $("#<%= AdorationSchedules.ClientID %>").val();
						var AdoStr = AdoString.split('|');
						AdorationID = new Map();

						$.each(AdoStr, function (key, value) {
							if (value == "")
								return true;
							var adoration = JSON.parse(value);
							AdorationID.set(key, adoration);
							$("#eventContainerAdoration").append('<tr><td>' + adoration.day.join(', ') + '</td><td>' + adoration.AdoFrom + '</td><td>' + adoration.AdoTo + '</td><td><button type="button" id="btnDelConfession" data-id="' + key + '" class="btn btn-danger">Delete</button></td></tr>');
						});
					}
					//alert('alert 3');
					if ($("#<%= EventSchedules.ClientID %>").val() != "")
					{
						var EventString = $("#<%= EventSchedules.ClientID %>").val();
						var EventStr = EventString.split('|');
						EventID = new Map();

						$.each(EventStr, function (key, value) {
							console.log("iterating...");
							if (value == "")
								return true;
							var event = JSON.parse(value);
							console.log('data parsed', event);
							EventID.set(key, event);
							$("#eventContainer").append('<tr><td>' + event.name + '</td><td>' + event.venue + '</td><td>' + event.desc + '</td><td>' + event.path + '</td><td>' + event.startdate + '</td><td>' + event.starttime + '</td><td>' + event.enddate + '</td><td>' + event.endtime + '</td><td><button type="button" id="btnDelConfession" data-id="' + key + '" class="btn btn-danger">Delete</button></td></tr>');

						});
					}

				});

				//Upload Image in event
				function readURL(input) {
					if (input.files && input.files[0]) {
						var reader = new FileReader();

						reader.onload = function (e) {
							$('#blah')
								.attr('src', e.target.result)
								.width(200)
								.height(150);
						};

						reader.readAsDataURL(input.files[0]);
					}
				}

				var shouldNotSubmit = false;
				mainFormName.submit(function (e) {
					if (! shouldNotSubmit)
						e.preventDefault();
				});


				//Insert Adorations

				var HasAdorationChapel = 0;
				//open daily
				function analyzeAdoration() {
					var inputNameAdo = $("#<%= yes.ClientID %>").attr('name');
					HasAdorationChapel = $('input[name="' + inputNameAdo + '"]:checked').val();
					//console.log(HasAdorationChapel);

					window.localStorage.setItem('HasAdorationChapel', HasAdorationChapel);
				}

				//Church Location Selection

				var locationID = 0;

				function analyzeLocation() {
					var inputName = $("#<%= locConvent.ClientID %>").attr('name');
					locationID = $('input[name="' + inputName + '"]:checked').val();
					//console.log(locationID);

					window.localStorage.setItem('locationID', locationID);
				}

				var isOpen = 0;
				//open daily
				function analyzeOpen() {
					var inputNameOpen = $("#<%= openYes.ClientID %>").attr('name');
					isOpen = $('input[name="' + inputNameOpen + '"]:checked').val();
					console.log(isOpen);

					window.localStorage.setItem('isOpen', isOpen);
				}

				$(document).on('click',
				   'input[type="radio"].hasAdoration',
				   function () {
					   if ($(this).val() == '1')
						   $('#has-adoration-container').show() && $('#has-adoration-container2').show();
					   else {
						   //$('#has-adoration-container2').hide();
						   $('#has-adoration-container').hide();
					   }
					   
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
			
				<%--function FacilitiesValidators()
				{
					<%--if (
						$("#<%= facAirCon.ClientID%>").attr('checked', false) &&
						$("#<%= facCeilingFan.ClientID%>").attr('checked', false) && $("#<%= facOrdinaryFan.ClientID%>").attr('checked', false)) {

						$('#errorCheckbox').show();
					}
				}--%>

				function isInputValid()
				{
					var isChurchNameValid = $("#<%= churchName.ClientID%>").validate(['required']).displayErrorOn($("#errorChurchName"));
					var isChurchAddressValid = $("#<%= address.ClientID%>").validate(['required']).displayErrorOn($("#errorChurchAddress"));
					<%--var isChurchVicariateValid = $("#<%= vicariate.ClientID%>").validate(['required']).displayErrorOn($("#errorVicariate"));
					var isChurchDioceseValid = $("#<%= diocese.ClientID%>").validate(['required']).displayErrorOn($("#errorDiocese"));
					var isChurchPriestValid = $("#<%= parishPriest.ClientID%>").validate(['required']).displayErrorOn($("#errorPriest"));
					var isChurchPhoneValid = $("#<%= phoneNo.ClientID%>").validate(['required']).displayErrorOn($("#errorPhone"));
					var isChurchCity = $("#<%= city.ClientID%>").validate(['required']).displayErrorOn($("#errorChurchCity"));
					var isEmailValid = $("#<%= emailAdd.ClientID%>").validate(['required','email']).displayErrorOn($("#errorEmail"));--%>
					var hasMassSchedule = $("#<%= MassSchedules.ClientID%>").validate(['required']).displayErrorOn($("#errorMassSchedule"));
					<%--var hasConfession = $("#<%= ConfessionSchedules.ClientID%>").validate(['required']).displayErrorOn($("#errorConfession"));
					var isConfessionvalid = $("#<%= confessionText.ClientID%>").validate(['required']).displayErrorOn($("#errorDisplayTextConfession"));
					var isOfficeValid = $("#<%= OfficeSchedule.ClientID%>").validate(['required']).displayErrorOn($("#errorOfficeSchedules"));
					var isBaptismValid = $("#<%= BaptismSched.ClientID%>").validate(['required']).displayErrorOn($("#errorBaptism"));--%>
					var isLongitudeValid = $("#<%= Latitude.ClientID%>").validate(['required']).displayErrorOn($("#errorLong"));
					var isLatitudeValid = $('#<%= Longitude.ClientID%>').validate(['required']).displayErrorOn($("#errorLat"));

				    return isChurchNameValid && isChurchAddressValid && hasMassSchedule && isLongitudeValid && isLatitudeValid;
				}
			
				//insert simbahan info
				var events = [];
				$(document).on('click',
					'#<%= btnSubmit.ClientID %>',
			function (e) {
				e.preventDefault();

				var locationIDnew = parseInt(window.localStorage.getItem('locationID'));
				console.log(locationIDnew);
				var HasAdorationChapelnew = parseInt(window.localStorage.getItem('HasAdorationChapel'));
				console.log(HasAdorationChapelnew);
				var isOpennew = parseInt(window.localStorage.getItem('isOpen'));
				console.log(isOpennew);

				var checked = $(':checkbox:checked').length;

				if (isInputValid()) {

					//if (checked == 0) {
					//	$('#errorCheckbox').show();
					//	return false;
					//}
					//else {
					//	$('#errorCheckbox').hide();

					(new http).post('ChurchAdminPage.aspx/CreateChurch', {
						name: $("#<%= churchName.ClientID %>").val(),
						address: $("#<%= address.ClientID%>").val(),
						city: $("#<%= city.ClientID%>").val(),
						province: $("#<%= province.ClientID%>").val(),
						country: $("#<%= country.ClientID%>").val(),
						vicariate: $("#<%= vicariate.ClientID%>").val(),
						feastday: $("#<%= feastDay.ClientID%>").val(),
						parishPriest: $("#<%= parishPriest.ClientID%>").val(),
						diocese: $("#<%= diocese.ClientID%>").val(),
						dateEstablished: $("#<%= dateEstablished.ClientID%>").val(),
						phoneNumber: $("#<%= phoneNo.ClientID%>").val(),
						email: $("#<%= emailAdd.ClientID%>").val(),
						website: $("#<%= website.ClientID%>").val(),
						administeredBy: "someone",
						activated: "0",
						Long: $("#<%= Longitude.ClientID%>").val(),
						Lat: $("#<%= Latitude.ClientID%>").val(),
						OfficeHours: $("#<%= OfficeSchedule.ClientID%>").val(),
						DevotionSchedule: $("#<%= SchedOfDevotion.ClientID%>").val(),
						textBapt: $("#<%= BaptismSched.ClientID%>").val(),
						DateCreatedBapt: "",
						textWedd: $("#<%= WeddingSchedule.ClientID%>").val(),
						DateCreatedWedd: "",
						LocationID: locationIDnew,
						HasAdorationChapel: HasAdorationChapelnew,
						IsOpen24By7: isOpennew,
						DisplayText: $("#<%= displayText.ClientID%>").val(),
						HasAirCon: $("#<%= ventAirCon.ClientID%>").is(':checked'),
						HasAircon: $("#<%= ventAirCon.ClientID%>").is(':checked'),
						HasCeilingFan: $("#<%= ventCeilingFan.ClientID%>").is(':checked'),
						HasOrdinaryFan: $("#<%= ventOrdinaryFan.ClientID%>").is(':checked')
					}).then(function (response) {
					    var church = response.d;

						var _id = church.SimbahanID;
						console.log(AdorationID);
						alert('Successfully Added! Simbahan ID is ' + _id);
						
						AdorationID.forEach(function (adoration) {
							console.log(adoration);
							$.each(adoration.day, function (key, day) {
								console.log(day);
								var fromHour = removeZeroPrefix(adoration.AdoFrom.split(':')[0]);
								var fromAMorPM = adoration.AdoFrom.split(':')[1].split(' ')[1];
								var toHour = removeZeroPrefix(adoration.AdoTo.split(':')[0]);
								var toAMorPM = adoration.AdoTo.split(':')[1].split(' ')[1];

								var timeStd = 0;

								timestandard[fromAMorPM].forEach(
									function (time, timeStandardID) {
										if (fromHour == time.substr(0, 1))
											timeStd = timeStandardID;
									});

								if (timeStd != 0) {
									(new http).post('ChurchAdminPage.aspx/InsertAdorationChapelSched', {
										FromDate: adoration.AdoFrom,
										ToDate: adoration.AdoTo,
										ScheduleID: getIdOfDay(day),
										TimeStandard: timeStd,
										AdorationID: church.AdorationID
									}).then(function (data) {

									}).run();
								}

							});
						})
				
						// Events
						EventID.forEach(function (event) {
							(new http).post('ChurchAdminPage.aspx/CreateEvent', {
								eventDesc: event.desc,
								StartDate: event.startdate,
								StartTime: event.starttime,
								EndDate: event.enddate,
								EndTime: event.endtime,
								Title: event.name,
								Address: event.venue,
								ImagePath: event.path,
								SimbahanID: _id
							}).then(function (data) {
							}).run();
						});

						shouldNotSubmit = true;
						mainFormName.trigger('submit');
						$("#<%= btnUpload.ClientID%>").trigger('click');

						$("#<%= btnAddThumbnail.ClientID%>").trigger('click');
						//(new http).post('ChurchAdminPage.aspx/UploadEventImage', {
						//    paths: events.map(function (event) { return event.path; })
						//}).run();

						//Mass Details
						Simbahan.forEach(function (simbahan) {
							console.log(simbahan);
							$.each(simbahan.day, function (key, day) {
								console.log(day);
								var fromHour = removeZeroPrefix(simbahan.MassFrom.split(':')[0]);
								var fromAMorPM = simbahan.MassFrom.split(':')[1].split(' ')[1];
								var toHour = removeZeroPrefix(simbahan.MassTo.split(':')[0]);
								var toAMorPM = simbahan.MassTo.split(':')[1].split(' ')[1];

								var timeStd = 0;

								timestandard[fromAMorPM].forEach(
									function (time, timeStandardID) {
										if (fromHour == time.substr(0, 1))
											timeStd = timeStandardID;
									});

								if (timeStd != 0) {
									(new http).post('ChurchAdminPage.aspx/InsertMassDetails', {
										DateCreated: "",
										FromDate: simbahan.MassFrom,
										ToDate: simbahan.MassTo,
										ScheduleID: getIdOfDay(day),
										TimeStandard: timeStd,
										Language: simbahan.language,
										SimbahanID: _id
									}).then(function (data) {

									}).run();
								}

							});
						})

						//Confession Details
						ConfessionID.forEach(function (simbahan) {
							console.log(simbahan);
							$.each(simbahan.day, function (key, day) {
								console.log(day);
								var fromHour = removeZeroPrefix(simbahan.ConFrom.split(':')[0]);
								var fromAMorPM = simbahan.ConFrom.split(':')[1].split(' ')[1];
								var toHour = removeZeroPrefix(simbahan.ConTo.split(':')[0]);
								var toAMorPM = simbahan.ConTo.split(':')[1].split(' ')[1];

								var timeStd = 0;

								timestandard[fromAMorPM].forEach(
									function (time, timeStandardID) {
										if (fromHour == time.substr(0, 1))
											timeStd = timeStandardID;
									});

								if (timeStd != 0) {
									(new http).post('ChurchAdminPage.aspx/InsertConfessionDetails', {
										Text: $("#<%= confessionText.ClientID%>").val(),
										FromDate: simbahan.ConFrom,
										ToDate: simbahan.ConTo,
										ScheduleID: getIdOfDay(day),
										TimeStandard: timeStd,
										SimbahanID: _id
									}).then(function (data) {

									}).run();
								}

							});
						})
					}).run();

						
					//}

				} else {
					// Either one or all of the validation has failed.
					// alert('Please provide a valid data');
				}
			    
			});

				function removeZeroPrefix(value)
				{
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


				$(document).on('onchange', '#FileUpload4', function (e) {
					e.preventDefault();
					shouldNotSubmit = true;
					mainFormName.trigger('submit');
					alert('test');
				});

				var isSumbitted = false;

				function onSubmit() {
					if (isSumbitted) {
						/*
						* 3) reset to false after the form submission executed
						*/
						isSumbitted = false;
						return false;
					}
				}

				//Add Event
				$("#btnAddEvent").on('click', function (e) {
					e.preventDefault();

					$("#btnTriggerEvent").trigger('click');
					var Event = new Map()
					var index = 1;
					var eventSchedules = [];
					var fileName;

					if ($("#<% =FileUpload4.ClientID%>").val() == '')
						fileName = 'Church_Events.jpg'
					else
						fileName = $("#<% =FileUpload4.ClientID%>").val().split('\\')[$("#<% =FileUpload4.ClientID%>").val().split('\\').length - 1]

					//(new http).post('ChurchAdminPage.aspx/AddFileControl').run();

					$("#EventTable").append('' +
						'<tr>' +
						'<td>' +
						$("#<%= eventName.ClientID %>").val() +
						'</td>' +
						'<td>' +
						$("#<%= eventVenue.ClientID%>").val() +
						'</td>' +
						'<td>' +
						$("#<%= eventDesc.ClientID%>").val() +
						'</td>' +
						'<td>' +
						fileName +
						'</td>' +
						'<td>' +
						$("#<%= eventDate.ClientID %>").val() +
						'</td>' +
						'<td>' +
						$("#<%= eventTime.ClientID %>").val() +
						'</td>' +
						'<td>'  +
						$("#<%= eventEndDate.ClientID %>").val() +
						'</td>' +
						'<td>'  +
						$("#<%= eventEndTime.ClientID %>").val() +
						'</td>' +
						'<td>' +
						'<button type="button" id="btnDelEvent" data-id="' + index + '" class="btn btn-danger">Delete</button>' +
						'</td>' +
						'</tr>');
					

					alert("this is event");

					eventSchedules.push({
						name: $("#<%= eventName.ClientID %>").val(),
						venue: $("#<%= eventVenue.ClientID%>").val(),
						desc: $("#<%= eventDesc.ClientID %>").val(),
						path: fileName,
						startdate: $("#<%= eventDate.ClientID %>").val(),
						starttime: $("#<%= eventTime.ClientID %>").val(),
						enddate: $("#<%= eventEndDate.ClientID %>").val(),
						endtime: $("#<%= eventEndTime.ClientID %>").val()
					});

					Events.set(index, {
						name: $("#<%= eventName.ClientID %>").val(),
						venue: $("#<%= eventVenue.ClientID%>").val(),
						desc: $("#<%= eventDesc.ClientID %>").val(),
						path: fileName,
						startdate: $("#<%= eventDate.ClientID %>").val(),
						starttime: $("#<%= eventTime.ClientID %>").val(),
						enddate: $("#<%= eventEndDate.ClientID %>").val(),
						endtime: $("#<%= eventEndTime.ClientID %>").val()
					});

					index++;
					var schedulesString = '';

					Events.forEach(function (schedule) {
						schedulesString += JSON.stringify(schedule) + "|";
					});

					$("#<%= EventSchedules.ClientID %>").val(schedulesString);
					
					$("#add-event-modal").modal('hide');

					document.getElementById("eventName").value = '';
					document.getElementById("#<%= eventVenue.ClientID%>").value = '';
					document.getElementById("eventDate").value = '';
					document.getElementById("eventTime").value = '';
					document.getElementById("#<%= eventDesc.ClientID%>").value = '';
					document.getElementById("eventEndDate").value = '';
					document.getElementById("eventEndTime").value = '';
				});

				$(document).on('click', "#btnDelEvent", function (e) {
					$(this).closest('tr').remove()
				});

			
		</script>

		<script>//Add Mass Schedules
		   
			var days = [];
			var Simbahan = new Map()
			var index = 1;
			var massSchedules = [];

			$("#btnAddMass").css("display", "none");

			$(document).on('focusout', "#timepicker2", function (e) {
				$("#btnAddMass").css("display", "block");
			});

			$(document).on('click', "#btnAddMass", function (e) {
				e.preventDefault();

				days = [];

				if ($("#massSun").is(":checked")) {
					days.push("Sunday");
				}
				if ($("#massMon").is(":checked")) {
					days.push("Monday");
				}
				if ($("#massTue").is(":checked")) {
					days.push("Tuesday");
				}
				if ($("#massWed").is(":checked")) {
					days.push("Wednesday");
				}
				if ($("#massThu").is(":checked")) {
					days.push("Thursday");
				}
				if ($("#massFri").is(":checked")) {
					days.push("Friday");
				}
				if ($("#massSat").is(":checked")) {
					days.push("Saturday");
				}

				$("#eventContainerMass").append('' +
						'<tr>' +
						'<td>' +
						days.join(', ') +
						'</td>' +
						'<td>' +
						$("#<%= SelectLanguage.ClientID%>").val() +
						'</td>' +
						'<td>' +
						$("#timepicker1").val() +
						'</td>' +
						'<td>' +
						$("#timepicker2").val() +
						'</td>' +
						'<td>' +
						'<button type="button" id="btnDelMass" data-id="' + index + '" class="btn btn-danger">Delete</button>' +
						'</td>' +
						'</tr>');
			   
				massSchedules.push({
					massDays: days,
					massStart: $("#timepicker1").val(),
					massEnd: $("timepicker2").val(),
					language: $("#<%= SelectLanguage.ClientID%>").val()
				});

				Simbahan.set(index, {
					day: days,
					MassFrom: $("#timepicker1").val(),
					MassTo: $("#timepicker2").val(),
					language: $("#<%= SelectLanguage.ClientID%>").val()
				});

				index++;
				var schedulesString = '';

				Simbahan.forEach(function (schedule) {
					schedulesString += JSON.stringify(schedule) + "|";
				});

				$("#<%= MassSchedules.ClientID %>").val(schedulesString);
				console.log(schedulesString);
				document.getElementById("timepicker1").value = "";
				document.getElementById("timepicker2").value = "";
				document.getElementById("massSun").checked = false;
				document.getElementById("massMon").checked = false;
				document.getElementById("massTue").checked = false;
				document.getElementById("massWed").checked = false;
				document.getElementById("massThu").checked = false;
				document.getElementById("massFri").checked = false;
				document.getElementById("massSat").checked = false;
				$("#btnAddMass").css("display", "none");
			});

			$(document).on('click', "#btnDelMass", function (e) {
				$(this).closest('tr').remove()
			});

		</script>

		<script>//Add Confession Schedules
			var days = [];
			var ConfessionID = new Map();
			var index = 1;
			var confessionSchedules = [];

			$("#btnAddConfession").css("display", "none");

			$(document).on('focusout', "#timepicker4", function (e) {
				$("#btnAddConfession").css("display", "block");
			});

			$(document).on('click', "#btnAddConfession", function (e) {
				e.preventDefault();

				days = [];

				if ($("#confSun").is(":checked")) {
					days.push("Sunday");
				}
				if ($("#confMon").is(":checked")) {
					days.push("Monday");
				}
				if ($("#confTue").is(":checked")) {
					days.push("Tuesday");
				}
				if ($("#confWed").is(":checked")) {
					days.push("Wednesday");
				}
				if ($("#confThu").is(":checked")) {
					days.push("Thursday");
				}
				if ($("#confFri").is(":checked")) {
					days.push("Friday");
				}
				if ($("#confSat").is(":checked")) {
					days.push("Saturday");
				}
				$("#eventContainerConfess").append('' +
						'<tr>' +
						'<td>' +
						days.join(', ') +
						'</td>' +
						'<td>' +
						$("#timepicker3").val() +
						'</td>' +
						'<td>' +
						$("#timepicker4").val() +
						'</td>' +
						'<td>' +
						'<button type="button" id="btnDelConfession" data-id="' + index + '" class="btn btn-danger">Delete</button>' +
						'</td>' +
						'</tr>');

				confessionSchedules.push({
					confessionDays: days,
					confessionStart: $("timepicker3").val(),
					confessionEnd: $("timepicker4").val()
				})

				ConfessionID.set(index, {
					day: days,
					ConFrom: $("#timepicker3").val(),
					ConTo: $("#timepicker4").val()
				});

				index++;
				var schedulesString = '';

				ConfessionID.forEach(function (schedule) {
					schedulesString += JSON.stringify(schedule) + "|";
				});

				$("#<%= ConfessionSchedules.ClientID %>").val(schedulesString);

				document.getElementById("timepicker3").value = "";
				document.getElementById("timepicker4").value = "";
				document.getElementById("confSun").checked = false;
				document.getElementById("confMon").checked = false;
				document.getElementById("confTue").checked = false;
				document.getElementById("confWed").checked = false;
				document.getElementById("confThu").checked = false;
				document.getElementById("confFri").checked = false;
				document.getElementById("confSat").checked = false;
				$("#btnAddConfession").css("display", "none");
			});

			$(document).on('click', "#btnDelConfession", function (e) {
				$(this).closest('tr').remove()
			});

		</script>

		<script>//Add Adoration Chapel Schedules
			var days = [];
			var AdorationID = new Map();
			var index = 1;
			var adorationSchedules = [];

			$("#btnAddAdoration").css("display", "none");

			$(document).on('focusout', "#timepicker6", function (e) {
				$("#btnAddAdoration").css("display", "block");
			});

			$(document).on('click', "#btnAddAdoration", function (e) {
				e.preventDefault();

				days = [];

				if ($("#adoSun").is(":checked")) {
					days.push("Sunday");
				}
				if ($("#adoMon").is(":checked")) {
					days.push("Monday");
				}
				if ($("#adoTue").is(":checked")) {
					days.push("Tuesday");
				}
				if ($("#adoWed").is(":checked")) {
					days.push("Wednesday");
				}
				if ($("#adoThu").is(":checked")) {
					days.push("Thursday");
				}
				if ($("#adoFri").is(":checked")) {
					days.push("Friday");
				}
				if ($("#adoSat").is(":checked")) {
					days.push("Saturday");
				}
				$("#eventContainerAdoration").append('' +
						'<tr id="AdorationRow" data-id="' + index + '">' +
						'<td>' +
						days.join(', ') +
						'</td>' +
						'<td>' +
						$("#timepicker5").val() +
						'</td>' +
						'<td>' +
						$("#timepicker6").val() +
						'</td>' +
						'<td>' +
						'<button type="button" id="btnDelAdoration" data-id="' + index + '" class="btn btn-danger">Delete</button>' +
						'</td>' +
						'</tr>');


				adorationSchedules.push({
					adorationDays: days,
					adorationStart: $("timepicker5").val(),
					adorationEnd: $("timepicker6").val()
				})

				AdorationID.set(index, {
					day: days,
					AdoFrom: $("#timepicker5").val(),
					AdoTo: $("#timepicker6").val()
				});

				index++;
				var schedulesString = '';

				AdorationID.forEach(function (schedule) {
					schedulesString += JSON.stringify(schedule) + "|";
				});

				$("#<%= AdorationSchedules.ClientID %>").val(schedulesString);

				document.getElementById("timepicker5").value = "";
				document.getElementById("timepicker6").value = "";
				document.getElementById("adoSun").checked = false;
				document.getElementById("adoMon").checked = false;
				document.getElementById("adoTue").checked = false;
				document.getElementById("adoWed").checked = false;
				document.getElementById("adoThu").checked = false;
				document.getElementById("adoFri").checked = false;
				document.getElementById("adoSat").checked = false;
				$("#btnAddAdoration").css("display", "none");
			});

			$(document).on('click', "#btnDelAdoration", function (e) {
				$(this).closest('tr').remove()
			});
		</script>

		<script>
			function hideAdoration() {
				$("#has-adoration-container").css('display', 'none');
			}
		</script>

		<script>
			$('#timepicker1').timepicki();

			$('#timepicker2').timepicki();

			$('#timepicker3').timepicki();

			$('#timepicker4').timepicki();

			$('#timepicker5').timepicki();

			$('#timepicker6').timepicki();


			function ClearFields()
			{
				alert('test');
				$('#<%= churchName.ClientID%>').val('');
				$('#<%= address.ClientID%>').val('');
				$('#<%= city.ClientID%>').val('');
				$('#<%= province.ClientID%>').val('');
				$('#<%= vicariate.ClientID%>').val('');
				$('#<%= feastDay.ClientID%>').val('');
				$('#<%= parishPriest.ClientID%>').val('');
				$('#<%= diocese.ClientID%>').val('');
				$('#<%= dateEstablished.ClientID%>').val('');
				$('#<%= phoneNo.ClientID%>').val('');
				$('#<%= emailAdd.ClientID%>').val('');
				$('#<%= website.ClientID%>').val('');
				$('#<%= facAirCon.ClientID%>').attr('checked', false);
				$('#<%= facOrdinaryFan.ClientID%>').attr('checked', false);
				$('#<%= facCeilingFan.ClientID%>').attr('checked', false);
				$('#<%= locSchool.ClientID%>').attr('checked', false);
				$('#<%= locMall.ClientID%>').attr('checked', false);
				$('#<%= locConvent.ClientID%>').attr('checked', false);
				$('#<%= locSeparate.ClientID%>').attr('checked', false);
				$('#<%= locHospital.ClientID%>').attr('checked', false);
				$('#<%= parkPrivate.ClientID%>').attr('checked', false);
				$('#<%= parkStreet.ClientID%>').attr('checked', false);
				$('#<%= parkMall.ClientID%>').attr('checked', false);
				$('#<%= parkOther.ClientID%>').attr('checked', false);
				$('#<%= yes.ClientID%>').attr('checked', false);
				$('#<%= no.ClientID%>').attr('checked', false);
				$('#<%= openYes.ClientID%>').attr('checked', false);
				$('#<%= openNo.ClientID%>').attr('checked', false);
				$('#<%= displayText.ClientID%>').val('');
				$('#<%= ventAirCon.ClientID%>').attr('checked', false);
				$('#<%= ventCeilingFan.ClientID%>').attr('checked', false);
				$('#<%= ventOrdinaryFan.ClientID%>').attr('checked', false);
				$('#<%= confessionText.ClientID%>').val('');
				$('#<%= OfficeSchedule.ClientID%>').val('');
				$('#<%= SchedOfDevotion.ClientID%>').val('');
				$('#<%= BaptismSched.ClientID%>').val('');
				$('#<%= WeddingSchedule.ClientID%>').val('');
				$('#<%= MassSchedules.ClientID%>').val('');
				$('#<%= ConfessionSchedules.ClientID%>').val('');
				$('#<%= AdorationSchedules.ClientID%>').val('');
				$('#<%= EventSchedules.ClientID%>').val('');
				$("#<%= eventName.ClientID%>").val('');
				$("#<%= eventVenue.ClientID%>").val('');
				$("#<%= eventDate.ClientID%>").val('');
				$("#<%= eventTime.ClientID%>").val('');
			}
</script>
</asp:Content>