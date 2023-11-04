
var xmlhhtp = new XMLHttpRequest();

function login_to_game(){
	var username = document.getElementById("inputName").value;
    if(username==""){
        window.alert("Συμπληρώστε Όνομα Χρήστη!");   
        return;
	}
	else{
		
		var url = "./DBfunctions.php?query=player";
		xmlhhtp.open("GET",url,true);
		xmlhhtp.onreadystatechange = login_result;
		xmlhhtp.send(null);
		window.alert("success");
	}
			
}

function fill_board() {
	$.ajax({url: "DBfynctions.php/player_A_cards/", 
			//headers: {"X-Token": me.token},
			//dataType: "json",
			//contentType: 'application/json',
			//data: JSON.stringify( {token: me.token}),
			success: fill_board_by_data});
}

function login_result() {

	if(xmlhhtp.readyState ==4){ //o kwdikas tha ektelestei
		if(xmlhhtp.status == 200){ //error apo server
			window.open("game.html","_self"); //anoigei h selida paixnidiou
			var response = xmlhhtp.responseText; //h apanthsh se string
			var name = document.getElementById("inputName");
			name.innerHTML = response; //apothikeuetai h apanthsh
		}
		else{
			alert("Σφάλμα");
		}
	}
	
}

function Game(){
    fill_board();   
}

function Exit(){
    window.open("index.html","_self"); 
}

function Deadline(){
    var table1 = document.getElementById("card");
    var table2 = document.getElementById("cards");
    if(table1.rows.length == 0 || table2.rows.length == 0){
        do_reset();    
    }
}
