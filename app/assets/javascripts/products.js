$(document).on('click', 'a[href^="#"]', function (event) {
    event.preventDefault();
    console.log($($.attr(this, 'href')).offset().top)
    $('html, body').animate({
        scrollTop: $($.attr(this, 'href')).offset().top - 110
    }, 700);
});