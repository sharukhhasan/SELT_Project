$(function () {
    
    var iframe = document.createElement('iframe');
    var picframe = document.createElement('img');
    var album;
    var artists;
    var available_markets;
    var disc_number;
    var duration_ms;
    var explicit;
    var external_ids;
    var external_urls;
    var href;
    var id;
    var name;
    var popularity;
    var preview_url;
    var track_number;
    var type;
    var uri;
    var modal = document.getElementById('myModal');
    var span = document.getElementsByClassName("close")[0];

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
        $("p").hide();
        var trackname = $(".track-name");
        $("p").each(function( index ) {
            trackname[index].style.fontSize= ($( this ).text())/4+6 + "px";
        });
        
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
    
    $('.track-name').click(function(event)
    {
        var temp_info_el = $('.temp_information');
        console.log(temp_info_el.data('temp')[$(this).get(0).innerHTML]);
        var artists = temp_info_el.data('temp')[$(this).get(0).innerHTML].artists;
        var album = temp_info_el.data('temp')[$(this).get(0).innerHTML].album;
        var artists = temp_info_el.data('temp')[$(this).get(0).innerHTML].artists;
        var available_markets = temp_info_el.data('temp')[$(this).get(0).innerHTML].available_markets;
        var disc_number = temp_info_el.data('temp')[$(this).get(0).innerHTML].disc_number;
        var duration_ms = temp_info_el.data('temp')[$(this).get(0).innerHTML].duration_ms;
        var explicit = temp_info_el.data('temp')[$(this).get(0).innerHTML].explicit;
        var external_ids = temp_info_el.data('temp')[$(this).get(0).innerHTML].external_ids;
        var external_urls = temp_info_el.data('temp')[$(this).get(0).innerHTML].external_urls;
        var href = temp_info_el.data('temp')[$(this).get(0).innerHTML].href;
        var id = temp_info_el.data('temp')[$(this).get(0).innerHTML].id;
        var name = temp_info_el.data('temp')[$(this).get(0).innerHTML].name;
        var popularity = temp_info_el.data('temp')[$(this).get(0).innerHTML].popularity;
        var preview_url = temp_info_el.data('temp')[$(this).get(0).innerHTML].preview_url;
        var track_number = temp_info_el.data('temp')[$(this).get(0).innerHTML].track_number;
        var type = temp_info_el.data('temp')[$(this).get(0).innerHTML].type;
        var uri = temp_info_el.data('temp')[$(this).get(0).innerHTML].uri;
        
        console.log("preview: " + preview_url);

        var artistsString = "";
        for (i = 0; i < artists.length; i++)
        {
            //console.log(artists.length);
            if(artists.length - 1 == i)
            {
                artistsString += artists[i].name;
            }
            else
            {
                artistsString += artists[i].name + ", ";
            }
        }
        document.getElementById("modal-text").innerHTML =
        "Song: " + name + "<br>" + 
        "Album: " + album.name + "<br>" + 
        "Artists: " + artistsString + "<br>" +
        "Disc Number: " + disc_number + "<br>" +
        "Explicit: " + explicit + "<br>";
        if(document.getElementById("modal-text").childElementCount == 1)
        {
            document.getElementById("modal-text").removeChild(iframe);
            document.getElementById("modal-text").removeChild(picframe);
        }
        iframe.id = 'myembed';
        iframe.src = preview_url;
        iframe.width = "300";
        iframe.height = "80";
        iframe.frameborder = "0";
        iframe.allowtransparency = "true";
        document.getElementById("modal-text").appendChild(picframe);
        picframe.style = "-webkit-user-select: none";
        picframe.src = album.images[1].url;
        if(preview_url != null)
        {
            document.getElementById("modal-text").appendChild(iframe);
        }
        else
        {
            document.getElementById("modal-text").innerHTML =
                "Song: " + name + "<br>" + 
                "Album: " + album.name + "<br>" + 
                "Artists: " + artistsString + "<br>" +
                "Disc Number: " + disc_number + "<br>" +
                "Explicit: " + explicit + "<br>" +
                "NO Preview Available" + "<br>"; 
        }
        modal.style.display = "block";
    });
    
    // When the user clicks on <span> (x), close the modal
    span.onclick = function() 
    {
        modal.style.display = "none";
        document.getElementById("modal-text").removeChild(iframe);
        document.getElementById("modal-text").removeChild(picframe);
    }
    
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) 
    {
        if (event.target == modal) 
        {
            modal.style.display = "none";
            document.getElementById("modal-text").removeChild(iframe);
            document.getElementById("modal-text").removeChild(picframe);
        }
    }
});
