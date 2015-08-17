
// function addBill(itemPrice){

// }
// function decBill(itemPrice){

// }
// function addItem(myId, item, itemDish, itemQty, itemPrice, itemId, qtyId){
// 	var current = document.getElementById(Number(myId)).value;
// 	current = Number(current);
// 	current+=1;
// 	document.getElementById(Number(myId)).value = String(current);
// 	// addBill(itemPrice);

// 	if (document.getElementById(String(itemId))){
// 		var node = document.getElementById(String(itemId));
// 		var item = [itemDish, itemQty, itemPrice, current];
// 	var itemDetails = document.createTextNode("" + item[0] + " " + item[1] + " "  + item[2] + "-" + item[3]);
// 		node.removeChild(node.firstChild);
// 		node.appendChild(itemDetails);
// 		document.getElementById("mycart").appendChild(node);
// 	}
// 	else{
// 		var node = document.createElement("LI");
// 		node.id = itemId;
// 		itemN = '1';
// 		var item = [itemDish, itemQty, itemPrice, current];
// 	var itemDetails = document.createTextNode("" + item[0] + " " + item[1] + " "  + item[2] + "-" + item[3]);
// 		node.appendChild(itemDetails);
// 		document.getElementById("mycart").appendChild(node);
// 	}
// }

// function deleteItem(myId, item, itemDish, itemQty, itemPrice, itemId, qtyId){
// 	var current = document.getElementById(Number(myId)).value;
// 	current = Number(current);
// 	if(current > 0){
// 		current-=1;
// 		// decBill(itemPrice);
// 		document.getElementById(Number(myId)).value = String(current);

// 		if (document.getElementById(String(itemId))){
// 			if(current>0){
// 				var node = document.getElementById(String(itemId));
// 				var item = [itemDish, itemQty, itemPrice, current];
// 				node.removeChild(node.firstChild);		
// 				var itemDetails = document.createTextNode("" + item[0] + " " + item[1] + " "  + item[2] + "-" + item[3]);
// 				node.appendChild(itemDetails);
// 				document.getElementById("mycart").appendChild(node);
// 			}
// 			else{
// 				document.getElementById(String(itemId)).remove();
// 			}
// 		}
// 	}
// }

	mylistPriceType = [];
	// var itemQty;
	function addItem (qtyID, dishName, vOn, priceType, tdClass, price, priceTypeId) {
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

	}