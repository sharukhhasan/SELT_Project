$(function () {

    var playlist_search = $('#search-field');

    playlist_search.keyup(function () { // on keyup, filter the dom with user typed text
        var input_field = $(this);
        var text = input_field.val();
        filterDom(text);
    });
    //The following 3 lines of code were taken directly from stackoverflow: https://stackoverflow.com/questions/35480973/jquery-filtering-case-insensitive
    jQuery.expr[':'].casecontains = function(a, i, m) {
      return jQuery(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
    };
    //end stackoverflow code
    var filterDom = function (text) { // filters playlist results based off of playlist name or track name
        $(".filterable").show(); // show all .filterable elements
        var elements_not_containing_txt =  $(':not(.filterable:casecontains('+ text +'))'); // select jquery els with class .filterable not containing search txt
        var divs = elements_not_containing_txt.filter("div .filterable"); // of those elements grab only the divs
        divs.hide(); // hide those divs
    };


});
