$(function() {
  $("ul.social li a, ul.bio-langs li a").hover(function() {
    $(this).fadeTo(100, 1);
  }, function() {
    $(this).fadeTo(100, 0.7);
  }).fadeTo(100, 0.7);

  $("ul.bio-langs li a").click(function(e) {
    var lang = $(this).parent().attr("class");
    $(this).parents("td.bios").find("ul.bio-text > li:not(." + lang + ")").hide();
    $(this).parents("td.bios").find("ul.bio-text > li." + lang).fadeIn();
    e.preventDefault();
  });

  $("ul.portrait").each(function() {
    if ($("li", this).length > 1) {
      $(this).nivoSlider({
        effect: "fade",
        slices: 1,
        animSpeed: 100,
        directionNav: false,
        keyboardNav: false,
        manualAdvance: true
      });
    }
  });
});