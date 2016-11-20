$(function () {

    var playlist_search = $('#search-field');

    playlist_search.keyup(function () { // on keyup, filter the dom with user typed text
        var input_field = $(this);
        var text = input_field.val();
        filterDom(text);
    });

    var filterDom = function (text) { // filters playlist results based off of playlist name or track name
        $(".filterable").show(); // show all .filterable elements
        var elements_not_containing_txt =  $(':not(.filterable:contains('+ text +'))'); // select jquery els with class .filterable not containing search txt
        var divs = elements_not_containing_txt.filter("div .filterable"); // of those elements grab only the divs
        divs.hide(); // hide those divs
    };
});
