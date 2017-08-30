// Specific to Philippine Country only at the moment | added by: Ronald Alba
/****************************************************************************/
function initMap() {
    var options = {
        types: ['(cities)'],
        componentRestrictions: { country: "PH" }
    };

    var input = document.getElementById('autocomplete');

    var autocomplete = new google.maps.places.Autocomplete(input, options);
}