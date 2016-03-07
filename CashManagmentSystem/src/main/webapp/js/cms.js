$(document).ready(function(){

	$(".button").magnificPopup();
	
	$(".add").magnificPopup();
	
	$(".delete").magnificPopup();
	
	$(".sortByID").click(function(){
		$("#sortByID").show();
		$("#sortByName").hide();
		$("#sortByMinSum").hide();
	});
	$(".sortByName").click(function(){
		$("#sortByName").show();
		$("#sortByID").hide();
		$("#sortByMinSum").hide();
	});
	$(".sortByMinSum").click(function(){
		$("#sortByMinSum").show();
		$("#sortByID").hide();
		$("#sortByName").hide();
	});
	$(".sortByAddress").click(function(){
		$("#sortByAddress").show();
		$("#sortByID").hide();
		$("#sortByName").hide();
	});
	
	$(".GenTS").click(function(){
		$(".tableAfter").show();
		$(".Send").show();
		$(".table").hide();
		$(this).hide();
		$(".comm").hide();	
	});
	$(".Send").click(function(){
		$(".tableAfterSend").show();
		$(this).hide();
		$(".tableAfter").hide();
	})
});
