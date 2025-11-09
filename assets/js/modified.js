function smoothScroll(target) {
    var $scrollContainer = $(target).parent();
    while ($scrollContainer.scrollTop() === 0) {
        $scrollContainer = $scrollContainer.parent();
        if (!$scrollContainer.length) {
            return;
        }
    }

    var targetY = 0;
    do {
        if ($scrollContainer[0] === target) {
            break;
        }
        targetY += target.offsetTop;
    } while (target = target.offsetParent);

    $scrollContainer.animate({
        scrollTop: targetY
    }, 1000);
}
