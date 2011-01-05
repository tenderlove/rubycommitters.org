$(function () {
    $('ul.portraits').each(function () {
        var lis = $(this).find('li.image-wrapper');

        if (lis.length > 1) {
            var firstLi = lis.first(), lastLi, curLi;

            lis.each(function () {
                curLi = $(this);

                if (lastLi != null) {
                    lastLi.data('next', curLi);
                }

                lastLi = curLi;
            });

            lastLi.data('next', firstLi);

            curLi = firstLi;

            var nextPortrait = function () {
                curLi.fadeTo(600, 0.0);
                curLi.data('next').fadeTo(600, 1.0);

                curLi = curLi.data('next');

                setTimeout(nextPortrait, 3000);
            }

            setTimeout(nextPortrait, 3000);
        }

    });

    $('ul.portraits a').fancybox({
        'transitionIn':  'elastic',
        'transitionOut': 'elastic',
        'speedIn':       300,
        'speedOut':      200,
        'overlayShow':   false
    });
});
