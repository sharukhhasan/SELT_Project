$(function () {

    var configSearch = function () {
        var playlist_search = $('#search-field');
        playlist_search.keyup(function () { // on keyup, filter the dom with user typed text
            var input_field = $(this);
            var text = input_field.val();
            filterDom(text);
        });

        //The following 20 or so lines of code were taken directly from an example on github: https://github.com/jquery/sizzle/wiki#-backwards-compatible-plugins-for-pseudos-with-arguments
        // An implementation of a case-insensitive contains
        function icontains( elem, text ) {
            return (
                    elem.textContent ||
                    elem.innerText ||
                    $( elem ).text() ||
                    ""
                ).toLowerCase().indexOf( (text || "").toLowerCase() ) > -1;
        }
        $.expr.pseudos.icontains = $.expr.createPseudo ?
            $.expr.createPseudo(function( text ) {
                return function( elem ) {
                    return icontains( elem, text );
                };
            }) :
            function( elem, i, match ) {
                return icontains( elem, match[3] );
            };
        //end github code
        var filterDom = function (text) { // filters playlist results based off of playlist name or track name
            $(".filterable").show(); // show all .filterable elements
            var elements_not_containing_txt =  $(':not(.filterable:icontains('+ text +'))'); // select jquery els with class .filterable not containing search txt
            var divs = elements_not_containing_txt.filter("div .filterable"); // of those elements grab only the divs
            divs.hide(); // hide those divs
        };
    };

    var configFontResize = function () {
        $("p").each(function( index ) {
            $(".track-name")[index].style.fontSize= ($( this ).text())/4+6 + "px";
        });
        $("p").hide();
    };
    var configYTPlaylistClick = function () {

        var playlist_divs = $(".playlist-div");

        playlist_divs.mouseover(function () {
            $(this).css('background-color', '#f2f2f2');
            $(this).css('cursor', 'pointer');
        });

        playlist_divs.mouseout(function () {
            $(this).css('background-color', '');
        });

        playlist_divs.dblclick(function () {
            var playlist_name = $(this).find(".playlist-name").text();
            console.log('playlist selected: ' + playlist_name);
            var url = window.location.href + 'youtube_playlist?'+'name=' + playlist_name;
            window.location.href = url;
        });
    };

    configYTPlaylistClick();
    configSearch();
    configFontResize();
});
