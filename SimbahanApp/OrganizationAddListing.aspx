<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrganizationAddListing.aspx.cs" Inherits="SimbahanApp.OrganizationAddListing" EnableEventValidation="false"%>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<style>
    input[type=text], select{
        border-radius: 0px !important;
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
</style>
    <div class="container">
        <strong>
            <h2>CHURCH ORGANIZATION INFORMATION SHEET</h2>
        </strong>
        <form role="form" class="form-horizontal">
            <div class="row form-group">
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
                    <h5>ORGANIZATION VENUE VENTILATION</h5>
                    
                    <table style="border: none !important; border-color: none !important;">
                        <tr>
                            <td><input type="checkbox" name="venueVent" class="myClass" runat="server" /></td>
                            <td><label> CEILING FAN</label></td>
                            <td><input type="checkbox" name="venueVent" class="myClass" runat="server" /></td>
                            <td><label> AIR CONDITIONED</label></td>
                            <td><input type="checkbox" name="venueVent" class="myClass" runat="server" /></td>
                            <td><label> WALL FAN</label></td>
                            <td><input type="checkbox" name="venueVent" class="myClass" runat="server" /></td>
                            <td><label> STANDARD FAN</label></td>

                        </tr>
                    </table>
                    <div class="col-md-3">
                        
                    </div>                                      
                    <div class="col-md-3">                      
                        
                    </div>                                      
                    <div class="col-md-3">                      
                        
                    </div>                                      
                    <div class="col-md-3">                      
                        
                    </div>
                </div>
            </div>
        </form>
    </div>
</asp:Content>