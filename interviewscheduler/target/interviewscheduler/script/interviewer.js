function openTab(evt, tabId) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tablinks.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}
	document.getElementById(tabId).style.display = "block";
	evt.currentTarget.className += " active";
}

function defaultDisplay(){
	document.getElementById("Candidate").style.display = "none";
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
}

function display(evt, subTabId){
	defaultDisplay();
	if(subTabId.includes("nterviewer")){
		document.getElementById("Interviewer").style.display = "block";
		document.getElementById("Candidate").style.display = "none";
	}
	if(subTabId.includes("andidate")){
		document.getElementById("Candidate").style.display = "block";
		document.getElementById("Interviewer").style.display = "none";
	}
	document.getElementById(subTabId).style.display = "block";
	evt.currentTarget.className += " active";
}

function openSubTabs(evt, subTabId){
	defaultDisplay();
	if(subTabId == "Interviewer"){
		document.getElementById("Candidate").style.display = "none";
	}
	if(subTabId == "Candidate"){
		document.getElementById("Interviewer").style.display = "none";
	}
	document.getElementById(subTabId).style.display = "block";
}


$(document).ready(function() {
	defaultDisplay();
	$("#interviewerSave").click(function(event) {
		event.preventDefault();
		$.ajax({
			type : 'POST',
			url : 'http://10.150.222.139:9999/interviewer/',
			crossDomain : true,
			data : '{"iName": $("#intName").val(), "contact": $("#intCont").val() , "email": $("#intEmail").val() , "priority": $("#intPrior").val()}',
			success : function(data) {
				alert('data: ' + data);
			},
			dataType : 'json',
		});
	});
});

