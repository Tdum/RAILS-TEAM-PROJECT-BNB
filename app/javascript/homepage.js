var links = ['https://v.ftcdn.net/01/94/29/41/700_F_194294173_xBKpbwDJ91ekEkCC2PTkbkr2KtQWacaN_ST.mp4', 'https://v.ftcdn.net/01/16/28/37/700_F_116283741_EfYkiZQc4An9dOMs7ZfcCTAZlcriA5yF_ST.mp4'];
var i = 0;
var renew = setInterval(function(){
   if(links.length == i){
       i = 0;
   }
   else {
   document.getElementById("target-source").src = links[i];
   i++;

}
},5000);
