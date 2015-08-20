$(function(){

  $("td").on("click",function(){
    var id = $(this).attr("id");
    var num = id.split('-')[1];
    if($(this).data("clicked") == false){
      $(this).css("background-color","#99ff99");
      $(this).data("clicked",true);
    } else {
      $(this).css("background-color","#ffffff");
      $(this).data("clicked",false);
    }
  });

  $("#btn-erase").on("click",function(){
    $.each($("td"),function(index,td){
      $(td).css("background-color","#ffffff");
      $(td).data("clicked",false);
    })
  });

  $("#btn-init").on("click",function(){
     $.ajax({
        type: 'POST',
        url: '/initialize',
        data: "data",
        success: "success"
     });
  });

  $("#btn-rand").on("click",function(){
     $.ajax({
        type: 'POST',
        url: '/random',
        data: "data",
        success: "success"
     });
  });

  $("#btn-memory").on("click",function(){
     $.ajax({
        type: 'POST',
        url: '/memorize',
        data: "data",
        success: "success"
     });
  });

  $("#btn-img").on("click",function(){
     $.ajax({
        type: 'POST',
        url: '/imagine',
        data: "data",
        success: "success"
     });
  });

});
