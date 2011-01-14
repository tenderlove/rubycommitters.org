module ApplicationHelper
  def analytics_tag
    if Rails.env.production?
      (<<-eojs).html_safe
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-1260604-9']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
      eojs
    else
      ''
    end
  end

  def jquery_include_tag
    if Rails.env == 'production'
      javascript_include_tag 'http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js'
    else
      javascript_include_tag 'jquery-1.4.4.min.js'
    end
  end

end
