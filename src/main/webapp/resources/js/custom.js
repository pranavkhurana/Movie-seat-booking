var request;
function sendInfo(date) {

	var datebutton = document.getElementsByClassName("datebutton");
	for (i = 0; i < datebutton.length; i++) {
		datebutton[i].style.transform = 'rotateY(0deg)';
		datebutton[i].style.boxShadow = '0px 0px';
		datebutton[i].style.backgroundColor='white';
		datebutton[i].style.color='#5bc0de';
	}
	document.getElementById('button' + date).style.boxShadow = '0px 0px 15px grey';
	document.getElementById('button' + date).style.backgroundColor = '#5bc0de';
	document.getElementById('button' + date).style.color = 'white';
	document.getElementById('button' + date).style.transform = 'rotateY(360deg)';
	
	
	var url = 'http://' + location.host + '/MVCfirst/showtimes/' + date;
	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = getInfo;
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function getInfo() {
	if (request.readyState == 4) {
		var val = request.responseText;
		document.getElementById("1").innerHTML = val;
		document.getElementById("2").innerHTML = null;
	}
}

function sendInfo2(showid) {

	var timebutton = document.getElementsByClassName("timebutton");
	for (i = 0; i < timebutton.length; i++) {
		timebutton[i].style.boxShadow = '0px 0px';		
		timebutton[i].style.transform='rotateY(0deg)';
		timebutton[i].style.backgroundColor='white';
		timebutton[i].style.color='#5bc0de';
	}
	document.getElementById('button' + showid).style.boxShadow = '0px 0px 15px grey';
	document.getElementById('button' + showid).style.backgroundColor='#5bc0de';
	document.getElementById('button' + showid).style.color='white';
	document.getElementById('button' + showid).style.transform='rotateY(360deg)';
	
	var url = 'http://' + location.host + '/MVCfirst/showseatstatus/' + showid;
	if (window.XMLHttpRequest) {
		request = new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		request = new ActiveXObject("Microsoft.XMLHTTP");
	}

	try {
		request.onreadystatechange = getInfo2;
		request.open("GET", url, true);
		request.send();
	} catch (e) {
		alert("Unable to connect to server");
	}
}

function getInfo2() {
	if (request.readyState == 4) {
		var val = request.responseText;
		document.getElementById("2").innerHTML = val;
	}
}

function editShow(showid) {	
	
	var oTable = document.getElementById('show-table');
	//gets rows of table
	var rowLength = oTable.rows.length;
	//loops through rows
	for (i = 1; i < rowLength; i++){
	   //gets cells of current row
	   var oCells = oTable.rows.item(i).cells;
	   
	   //gets amount of cells of current row
	   var cellLength = oCells.length;
	   //loops through each cell in current row
	   for(var j = 0; j < cellLength; j++){
	       //get your cell info here 
	       var cellVal = oCells.item(j).innerHTML; 
	   }
	   
	   cellVal=oCells.item(7).innerHTML="<span class='glyphicon glyphicon-edit'></span>";
	   cellVal=oCells.item(8).innerHTML="<span class='glyphicon glyphicon-remove'></span>";
	}
	
	var tr=document.getElementById(showid);
	var movieid=tr.getElementsByClassName('movieid')[0].innerHTML;
	var	date=tr.getElementsByClassName('date')[0].innerHTML;
	var time=tr.getElementsByClassName('time')[0].innerHTML;
	var	price=tr.getElementsByClassName('prices')[0].innerHTML;
	var seatstatus=tr.getElementsByClassName('seatstatus')[0].innerHTML;
	
	tr.style.backgroundColor="rgba(216, 216, 216, 0.45098)";
	
	tr.getElementsByClassName('showid')[0].innerHTML=showid+"<input id='showid' type='hidden' name='showid' value="+showid+">";
	tr.getElementsByClassName('moviename')[0].innerHTML="";
	tr.getElementsByClassName('movieid')[0].innerHTML="<input id='movieid' type='number' name='movieid' value="+movieid+">";
	tr.getElementsByClassName('date')[0].innerHTML="<input id='date' type='date' name='date' value="+date+">";
	tr.getElementsByClassName('time')[0].innerHTML="<input id='time' type='time' name='timestring' value="+time+">";
	tr.getElementsByClassName('prices')[0].innerHTML="<input id='prices' type='number' name='price' value="+price+">";
	tr.getElementsByClassName('seatstatus')[0].innerHTML="<textarea name='seatstatus' id='seatstatus' rows='1' cols='50'>"+seatstatus+"</textarea>";
	tr.getElementsByClassName('edit')[0].innerHTML="<a href='javascript:{}' onclick='document.getElementById(`editform`).submit();'><span class='glyphicon glyphicon-ok'></span></a></form>";
	tr.getElementsByClassName('delete')[0].innerHTML="<a href='shows'><span class='glyphicon glyphicon-refresh'></span></a>";

}

function editMovie(id) {	
	
	var oTable = document.getElementById('movie-table');
	//gets rows of table
	var rowLength = oTable.rows.length;
	//loops through rows
	for (i = 1; i < rowLength; i++){
	   //gets cells of current row
	   var oCells = oTable.rows.item(i).cells;
	   
	   /*//gets amount of cells of current row
	   var cellLength = oCells.length;
	   //loops through each cell in current row
	   for(var j = 0; j < cellLength; j++){
	       //get your cell info here 
	       var cellVal = oCells.item(j).innerHTML; 
	   }*/
	   
	   cellVal=oCells.item(9).innerHTML="<span class='glyphicon glyphicon-edit'></span>";
	   cellVal=oCells.item(10).innerHTML="<span class='glyphicon glyphicon-remove'></span>";
	}
	
	var tr=document.getElementById(id);
	var id=tr.getElementsByClassName('id')[0].innerHTML;
	var	name=tr.getElementsByClassName('name')[0].innerHTML;
	var genre=tr.getElementsByClassName('genre')[0].innerHTML;
	var	cast=tr.getElementsByClassName('cast')[0].innerHTML;
	var rating=tr.getElementsByClassName('rating')[0].innerHTML;
	var synopsis=tr.getElementsByClassName('synopsis')[0].innerHTML;
	var	releasedate=tr.getElementsByClassName('releasedate')[0].innerHTML;
	var duration=tr.getElementsByClassName('duration')[0].innerHTML;
	var	posteraddress=tr.getElementsByClassName('posteraddress')[0].innerHTML;
	
	tr.style.backgroundColor="rgba(216, 216, 216, 0.45098)";
	
	tr.getElementsByClassName('id')[0].innerHTML=id+"<input type='hidden' name='id' value='"+id+"'>";
	tr.getElementsByClassName('name')[0].innerHTML="<input id='name' type='text' name='name' value='"+name+"'>";
	tr.getElementsByClassName('genre')[0].innerHTML="<input id='genre' type='text' name='genre' value='"+genre+"'>";
	tr.getElementsByClassName('cast')[0].innerHTML="<textarea name='cast' id='cast' rows='4' cols='18'>"+cast+"</textarea>";
	tr.getElementsByClassName('rating')[0].innerHTML="<input id='rating' type='text' name='rating' value='"+rating+"'>";
	tr.getElementsByClassName('synopsis')[0].innerHTML="<textarea name='synopsis' id='synopsis' rows='4' cols='100'>"+synopsis+"</textarea>";
	tr.getElementsByClassName('releasedate')[0].innerHTML="<input id='releasedate' type='text' name='releasedate' value='"+releasedate+"'>";
	tr.getElementsByClassName('duration')[0].innerHTML="<input id='duration' type='text' name='duration' value='"+duration+"'>";
	tr.getElementsByClassName('posteraddress')[0].innerHTML="<input id='posteraddress' type='text' name='posteraddress' value='"+posteraddress+"'>";
	tr.getElementsByClassName('edit')[0].innerHTML="<a href='javascript:{}' onclick='document.getElementById(`editform`).submit();'><span class='glyphicon glyphicon-ok'></span></a></form>";
	tr.getElementsByClassName('delete')[0].innerHTML="<a href='movies'><span class='glyphicon glyphicon-refresh'></span></a>";
}