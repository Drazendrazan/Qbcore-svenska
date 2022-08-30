/* 
	Config File For Simple Loading Screen v1.0
	NOTE: IF YOU WANT A CUSTOM BACKGROUND, IT MUST BE NAMED 'bg.jpg'
 	Made by G.H.0.S.T
 */




/* DO NOT MODIFY ANYTHING BELOW */

var counter = 0;
var elem = document.getElementById("rules");
setInterval(change, 2000);

function change() {
  elem.innerHTML = rules[counter];
  counter++;
  if (counter >= rules.length) {
    counter = 0;
  }
}

function changeText(){
    document.getElementById('text02 title').innerHTML = title;
    document.getElementById('text01 desc').innerHTML = description;
}
changeText();