
// function addBill(itemPrice){

// }
// function decBill(itemPrice){

// }
function addItem(myId, item, itemDish, itemQty, itemPrice, itemId, qtyId){
	var current = document.getElementById(Number(myId)).value;
	current = Number(current);
	current+=1;
	document.getElementById(Number(myId)).value = String(current);
	// addBill(itemPrice);

	if (document.getElementById(String(itemId))){
		var node = document.getElementById(String(itemId));
		var item = [itemDish, itemQty, itemPrice, current];
	var itemDetails = document.createTextNode("" + item[0] + " " + item[1] + " "  + item[2] + "-" + item[3]);
		node.removeChild(node.firstChild);
		node.appendChild(itemDetails);
		document.getElementById("mycart").appendChild(node);
	}
	else{
		var node = document.createElement("LI");
		node.id = itemId;
		itemN = '1';
		var item = [itemDish, itemQty, itemPrice, current];
	var itemDetails = document.createTextNode("" + item[0] + " " + item[1] + " "  + item[2] + "-" + item[3]);
		node.appendChild(itemDetails);
		document.getElementById("mycart").appendChild(node);
	}
}

function deleteItem(myId, item, itemDish, itemQty, itemPrice, itemId, qtyId){
	var current = document.getElementById(Number(myId)).value;
	current = Number(current);
	if(current > 0){
		current-=1;
		// decBill(itemPrice);
		document.getElementById(Number(myId)).value = String(current);

		if (document.getElementById(String(itemId))){
			if(current>0){
				var node = document.getElementById(String(itemId));
				var item = [itemDish, itemQty, itemPrice, current];
				node.removeChild(node.firstChild);		
				var itemDetails = document.createTextNode("" + item[0] + " " + item[1] + " "  + item[2] + "-" + item[3]);
				node.appendChild(itemDetails);
				document.getElementById("mycart").appendChild(node);
			}
			else{
				document.getElementById(String(itemId)).remove();
			}
		}
	}
}

