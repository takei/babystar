$(function() {
	$("#selectUsersBtn").on("click", function(event) {
		$("#availableUsers option:selected").each(function(idx, element){
			console.log("added : " + $(element).text());
			$("<option>" + $(element).text() + "</option>").appendTo("#selectedUsers");
			$(element).remove();
		});
	});

	$("#removeUsersBtn").on("click", function(event) {
		$("#selectedUsers option:selected").each(function(idx, element){
			console.log("removed : " + $(element).text());
			$("<option>" + $(element).text() + "</option>").appendTo("#availableUsers");
			$(element).remove();
		});
	});
});