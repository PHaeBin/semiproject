function searchBbs(){
   let choice = document.getElementById("choice").value;
   let search = document.getElementById("search").value;
   let spot = document.getElementById("spot").value;
   
   location.href = "board.do?choice="+ choice + "&search=" + search + "&spot="+spot;
}