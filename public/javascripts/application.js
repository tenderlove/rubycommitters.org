// tabs AJAX for Sites and Books.
$(function() {
  var fadeDuration = 400
  function activatePane(pane) {
    pane.addClass('active')
    pane.fadeIn(fadeDuration)
  }
  function activateTab(tab) {
    tab.addClass('active')
    var infoPane = tab.parent().siblings('.info-pane.' + tab.attr('tab-section'))
    activatePane(infoPane)
  }
  $('a.tab').click(function(event) {
    var tab = $(this)
    var tabs = tab.parent().parent()
    // If already active, ignore.
    if(tab.hasClass('active')) { return false }
    var activeTab = tabs.find('a.active')
    activeTab.removeClass('active')
    var activePane = tabs.find('.info-pane.active:first')
    activePane.removeClass('active')
    activePane.fadeOut(fadeDuration, function() {
      activateTab(tab)
    })
    return false
  })
  // Activate each account's first tab.
  $('.account').each(function() {
    activateTab($(this).find('.tab:first'))
  })
})
