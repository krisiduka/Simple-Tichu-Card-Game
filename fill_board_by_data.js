function fill_board_by_data(data) {	
	board=data;	
	for(var i=0;i<data.length;i++) {	
		var o = data[i];
		//var id = '#square_'+ o.x +'_' + o.y;	
		var c = (o.card_name!=null)?o.card_color + o.card_name:'';
		
		var pc= (o.card_name!=null)?'card_name'+o.card_color:'';
		var im = (o.card_name!=null)?'<img class="card_name '+pc+'" src="images/'+c+'.png">':''; /
		
		//$(id).addClass(o.b_color+'_square').html(im);
	}
 
	$('.ui-droppable').droppable( "disable" );
		
	if(me && me.card_color!=null) {
		$('.card_name'+me.card_color).draggable({start: start_dragging, stop: end_dragging, revert:true});
	}
	if(me.card_color!=null && current_match.player_turn==me.card_color) { 
		$('#move_div').show(1000);
	} else {
		$('#move_div').hide(1000);
	}
}