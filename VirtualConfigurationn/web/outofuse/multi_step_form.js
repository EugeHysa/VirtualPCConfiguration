// Function that executes on click of first next button.
/*function next_step1() {
document.getElementById("first").style.display = "none";
document.getElementById("second").style.display = "block";
document.getElementById("active2").style.color = "blueviolet";
//Insert into PriceField the first Component Price selected
var startPrice = document.getElementById("mbPrice").value;
document.getElementById("priceField").value = startPrice;


}*/

// Funzione per il calcolo del prezzo
function CalcPrice(tempPrice){
    //Valore PriceField in PastPriceField
    var PastPrice = document.getElementById("priceField").value;
    
    //Somma PastPriceField + tempPrice in NewPriceField
    var sumPrice = parseFloat(PastPrice) + sumPrice + tempPrice;
    //Valore NewPriceField in PriceField   
    document.getElementById("priceField").value = sumPrice;

}

// Function that executes on click of first previous button.
function prev_step1() {
document.getElementById("first").style.display = "block";
document.getElementById("second").style.display = "none";
document.getElementById("active1").style.color = "blueviolet";
document.getElementById("active2").style.color = "gray";
}
// Function that executes on click of second next button.
function next_step2() {
document.getElementById("second").style.display = "none";
document.getElementById("third").style.display = "block";
document.getElementById("active3").style.color = "blueviolet";

var sCpuPrice = document.getElementById("cpuPrice").value;
CalcPrice(sCpuPrice);
}

// Function that executes on click of second previous button.
function prev_step2() {
document.getElementById("third").style.display = "none";
document.getElementById("second").style.display = "block";
document.getElementById("active2").style.color = "blueviolet";
document.getElementById("active3").style.color = "gray";
}
// Function that executes on click of second next button.
function next_step3() {
document.getElementById("third").style.display = "none";
document.getElementById("fourth").style.display = "block";
document.getElementById("active4").style.color = "blueviolet";

var sRamPrice = document.getElementById('ramPrice').value;
CalcPrice(sRamPrice);
}

// Function that executes on click of second previous button.
function prev_step3() {
document.getElementById("fourth").style.display = "none";
document.getElementById("third").style.display = "block";
document.getElementById("active3").style.color = "blueviolet";
document.getElementById("active4").style.color = "gray";
}
// Function that executes on click of second next button.
function next_step4() {
document.getElementById("fourth").style.display = "none";
document.getElementById("fifth").style.display = "block";
document.getElementById("active5").style.color = "blueviolet";

var sGcPrice = document.getElementById("gcPrice").value;
CalcPrice(sGcPrice);
}

// Function that executes on click of second previous button.
function prev_step4() {
document.getElementById("fifth").style.display = "none";
document.getElementById("fourth").style.display = "block";
document.getElementById("active4").style.color = "blueviolet";
document.getElementById("active5").style.color = "gray";
}
// Function that executes on click of second next button.
function next_step5() {
document.getElementById("fifth").style.display = "none";
document.getElementById("sixth").style.display = "block";
document.getElementById("active6").style.color = "blueviolet";

var sHdPrice = document.getElementById("hdPrice").value;
CalcPrice(sHdPrice);
}

// Function that executes on click of second previous button.
function prev_step5() {
document.getElementById("sixth").style.display = "none";
document.getElementById("fifth").style.display = "block";
document.getElementById("active5").style.color = "blueviolet";
document.getElementById("active6").style.color = "gray";
}
// Function that executes on click of second next button.
function next_step6() {
document.getElementById("sixth").style.display = "none";
document.getElementById("seventh").style.display = "block";
document.getElementById("active7").style.color = "blueviolet";

var sPsPrice = document.getElementById("psPrice").value;
CalcPrice(sPsPrice);
}

// Function that executes on click of second previous button.
function prev_step6() {
document.getElementById("seventh").style.display = "none";
document.getElementById("sixth").style.display = "block";
document.getElementById("active6").style.color = "blueviolet";
document.getElementById("active7").style.color = "gray";
}
// Function that executes on click of second next button.
function next_step7() {
    document.getElementById("seventh").style.display = "none";
    document.getElementById("eighth").style.display = "block";
    
    var sCasePrice = document.getElementById("casePrice").value;
    CalcPrice(sCasePrice);
}