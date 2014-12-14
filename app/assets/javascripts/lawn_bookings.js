jQuery(document).ready(function(){
   $(".bookButton").click(function(){
      var me = $(this);
      $.ajax({
      type: "POST",
      url: "book_lawn",
      dataType:'json',
      data: { booking_date: me.data("date"), lawn_no: me.data("lawn-no") },
      success: function (data, status, xhr)
            {
              // Give the booker instant feedback that booking has been successful
              // Other users will be updated via SSE
              $('.unbooked[data-date="' + data.booking_date +'"][data-lawn-no="' + data.lawn_no +'"]').removeClass("unbooked").addClass("booked").empty().html("<p><strong>Lawn number " + data.lawn_no + "</strong></p><p>This lawn is booked.</p>");
            },
            error: function (xhr, status)
            {
              alert("There has been an issue with booking this lawn. Please try again or give us a call.");
            }
    });
   });
  
      setTimeout(function() {
        // Monitor updates sent out by bookings_sse controller action
        var source = new EventSource('/bookings_sse');
        var event_name = 'update';
        source.addEventListener(event_name, function(e) {
          var obj = JSON.parse(e.data);
          // Update any lawns that have changed from not booked to booked
          $('.unbooked[data-date="' + obj.booking_date +'"][data-lawn-no="' + obj.lawn_no +'"]').removeClass("unbooked").addClass("booked").empty().html("<p><strong>Lawn number " + obj.lawn_no + "</strong></p><p>This lawn is booked.</p>");
        });
      }, 0.3);
  
});

