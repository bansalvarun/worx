function expand(myId){
	if(document.getElementById(String(myId)).style.display=='block')
		document.getElementById(String(myId)).style.display='none';
	else	
		document.getElementById(String(myId)).style.display='block';
}
