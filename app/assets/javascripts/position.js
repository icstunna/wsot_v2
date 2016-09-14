$(document).ready(function() {

  $(".lookup").on('submit', function(event) {
    event.preventDefault();

    var value = $(".ticker_lookup").val()

    var lookupRequest = $.ajax({
      url: '/lookup', 
      type: 'POST',
      data: {lookup: value},
      datatype: 'json'
    });

    lookupRequest.success(function(data) {
      var lookupResults = data.results['LookupResultList']['LookupResult']
      if (lookupResults.length) {
        for ( var i=0; i < lookupResults.length; i++) {
          $(".lookup_results").append("<div>" + lookupResults[i]["Name"] + lookupResults["Symbol"] + "</div>")
        }
      } else {
        $(".lookup_results").append("<div>" + lookupResults["Name"] + lookupResults["Symbol"] + "</div>")
      }
    });
  })
})
