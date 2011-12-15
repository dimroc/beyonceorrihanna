$(function() {
  $(".twitter_list").each(function(index, twitter_list) {
    var tags = $(twitter_list).data('twitter_tags');
    if(tags === null || tags === undefined)
      return;
    $(twitter_list).append("<ul></ul>");
    TWITTER_API = "http://api.twitter.com/1/statuses/user_timeline.json?callback=?&screen_name={0}&count=10";
    tags.forEach(function(tag) {
      var twitter_url = TWITTER_API.replace("{0}", tag);
      $.getJSON(twitter_url, function(data) {
        if(data && !_.isEmpty(data)) {
          var followers_count = _.first(data).user.followers_count;
          var list = ich.twitter_list_template({tag: tag, followers_count: followers_count, tweets: data});
          $(twitter_list).append(list);
        }
      });
    });
  });
});
