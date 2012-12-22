$(function() {
	
	$("#selectUsersBtn").on("click", function(event) {
		$("#availableUsers option:selected").each(function(idx, element){
			console.log("added : " + $(element).text());
			$("<option selected value=" + $(element).val() + ">" + $(element).text() + "</option>").appendTo("#selectedUsers");
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

	$("#create-theme").on("click", function(event) {
		if ($("#selectedUsers option").length == 0) {
			alert("no users selected. select or create users.");
			return false;
		} else {
			if (confirm("実行しますか？")) {
				$('#theme-form').submit();
			} else {
			return false;
			}
		}
	});
	
});