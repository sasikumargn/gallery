 $(document).ready(function(){
  $(".pagination a").on("click", function() {
    $(".pagination").html("Page is loading...");
    $.get(this.href,null,null,"script");
    return false;
  });
 });