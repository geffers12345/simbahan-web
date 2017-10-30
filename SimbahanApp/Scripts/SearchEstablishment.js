// Specific to Philippine Country only at the moment | added by: Ronald Alba
/****************************************************************************/
function initMap() {
    var options = {
        types: ['establishment'],
        componentRestrictions: { country: "PH" }
    };

    var input = document.getElementById('searchEstablishment');
    var input2 = document.getElementById('startPosition');

    var autocomplete = new google.maps.places.Autocomplete(input, options);
    var autocomplete2 = new google.maps.places.Autocomplete(input2, options);
}