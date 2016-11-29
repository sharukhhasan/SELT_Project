$(function()
{
    console.log($("p").text() + '\n');
    console.log($("p"));
    //debugger;
    $(".trackdata").each(function( index ) 
    {
        //console.log($("p").index(index))
        //console.log( index + ": " + $( this ).text() );
    });
    $("p").each(function( index ) 
    {
        console.log( index + ": " + $( this ).text() );
        $(".trackdata")[index].style.fontSize= ($( this ).text())/4+6 + "px";
        /*$(".trackdata").css("font-size")[0] = parseInt($(this).text().charAt(0));
        $(".trackdata").css("font-size")[1] = parseInt($(this).text().charAt(1));
        console.log($(".trackdata").css("font-size")[0] + " to " + parseInt($(this).text().charAt(0)));
        console.log($(".trackdata").css("font-size")[1] + " to " + parseInt($(this).text().charAt(1)));        
        console.log(parseInt($(this).text()));*/
        //console.log($(".trackdata").css("font-size")[index]);
    });
   //$(".trackdata").css("font-size", $("p").textContent + "px");
   
   $("p").hide();
   
});