
// var itemQty;
function addItem (qtyID, dishName, vOn, priceType, tdClass, price, priceTypeId, restoID) {
	itemQty = document.getElementsByClassName(String(qtyID))[0].innerHTML;
	document.getElementsByClassName(String(qtyID))[0].innerHTML = String(1 + Number(itemQty));
	var table = document.getElementById("mycart");
	var index;
	var n = mylistPriceType.length;
	var a = document.getElementsByClassName("total")[0].innerHTML;
	var tot = Number(a) + Number(price);
	document.getElementsByClassName("total")[0].innerHTML = tot;
	document.getElementsByClassName("total")[1].innerHTML = tot;
	document.getElementsByClassName("finalpay")[0].innerHTML = tot;
	document.getElementsByClassName("finalpay")[1].innerHTML = tot;
	// document.getElementsByClassName("servTax")[0].innerHTML = tot;

	for(index = 0; index<n; index++){
		// console.log(mylistPriceType[index] == String(priceTypeId));
		if(mylistPriceType[index] == String(priceTypeId)){
			var cell = document.getElementById(String(priceTypeId));
			// var cell = row.insertCell(3);
			cell.innerHTML = document.getElementById(String(tdClass)).innerHTML;	
			return;
		}
	}
	mylistPriceType.push(String(priceTypeId));
	var row = table.insertRow(0);
	var cell2 = row.insertCell(0);
	var cell1 = row.insertCell(1);
	var cell3 = row.insertCell(2);
	var cell4 = row.insertCell(3);
	cell3.id = priceTypeId;
	cell1.innerHTML = String(dishName);
	var sym = "";
	if(vOn=='V')
		sym = String("<span style='color:green;padding:0 .5em'>&#9679;</span>");
	else if(vOn=='N')
		sym = String("<span style='color:red;padding:0 .5em'>&#9679;</span>");
	cell2.innerHTML = sym + String(priceType);
	cell3.innerHTML = document.getElementById(String(tdClass)).innerHTML;
	cell4.innerHTML = "&#8377;" + String(price);
	// console.log(mylistPriceType);
	sessionStorage.setItem(restoID+'mylistPriceType', mylistPriceType);
	// console.log( "yo yo "+sessionStorage.getItem('mylistPriceType'));

}
function delItem(qtyID, dishName, vOn, priceType, tdClass, price, priceTypeId){
	itemQty = document.getElementsByClassName(String(qtyID))[0].innerHTML;
	if(Number(itemQty) > 0){
		document.getElementsByClassName(String(qtyID))[0].innerHTML = String(Number(itemQty)-1);	

		var a = document.getElementsByClassName("total")[0].innerHTML;
		var tot = String(Number(a) - Number(price));
		document.getElementsByClassName("total")[0].innerHTML = tot;
		document.getElementsByClassName("total")[1].innerHTML = tot;
		document.getElementsByClassName("finalpay")[0].innerHTML = tot;
		document.getElementsByClassName("finalpay")[1].innerHTML = tot;
	}
	var index;
	var n = mylistPriceType.length;

	for(index = 0; index<n; index++){
		if(mylistPriceType[index] == String(priceTypeId)){
			var cell = document.getElementById(String(priceTypeId));
			cell.innerHTML = document.getElementById(String(tdClass)).innerHTML;	
			return;
		}
	}
	sessionStorage.setItem('{{restaurant.id}}mylistPriceType', mylistPriceType);

}
function submitBill(){
	var tbl2 = document.getElementById("mycart");
	var txt = tbl2.innerText;
	txt = txt.split(txt[0]);
	var mybillstring = "";
	for(i = 0; i<txt.length; i++){
		mybillstring +=txt[i];
		mybillstring +=";";
	}
	document.getElementById("mycartValue").setAttribute('value', mybillstring);
	$("#billForm").submit();

}
