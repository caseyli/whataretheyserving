$(function(){
  
  $(".upvote").click(incrementUpVotes);
  $(".downvote").click(incrementDownVotes);
  $(".soldoutvote").click(incrementSoldOutVotes);
  
});

function incrementUpVotes() {
  incrementVotes($(this), "up");
  return false;
}

function incrementDownVotes() {
  incrementVotes($(this), "down");
  return false;
}

function incrementSoldOutVotes() {
  incrementVotes($(this), "soldout");
  return false;
}

function incrementVotes(element, voteType) {
  var id = element.attr("entry_id");
  var location_id = element.attr("location_id");
  var company_id = element.attr("company_id");
  
  element.siblings(".vote-value").html("<i class='icon-refresh icon-spin'></i>");
  
  $.ajax({
    url: "/companies/" + company_id + "/locations/" + location_id + "/entries/" + id + "/increment_" + voteType + "votes",
    dataType: "JSON",
    success: function(data, textStatus, jqXHR){
      element.siblings(".vote-value").html(data.value);
    },
    error: function(jqXHR, textStatus, errorThown) {
      element.siblings(".vote-value").html("ERR");
    }
  });
}