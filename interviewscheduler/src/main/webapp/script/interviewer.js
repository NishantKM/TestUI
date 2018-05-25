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
		
		var formData = {
		        "iName": $('#intName').val(),
		        "contact": $('#intCont').val(),
		        "email": $('#intEmail').val(),
		        "priority": $('#intPrior').val()
		    };
		
		
		$.ajax({
			type : 'POST',
			url : 'http://10.150.222.139:9999/interviewer/',
			crossDomain : true,
			data :  JSON.stringify(formData),
			contentType : "application/json",
  		  	dataType: 'json',
  		  	Accept: "application/json",
			success : function(data) {
				alert('data: ' + data);
			}
			
		});
	});
	
	$("#candidateSave").click(function(event) {
		event.preventDefault();
		
		var formData = {
		        "name": $('#canName').val(),
		        "expYears": $('#canExpYears').val(),
		        "email": $('#canEmail').val(),
		        "contact": $('#canContact').val()
		    };
		
		
		$.ajax({
			type : 'POST',
			url : 'http://10.150.222.139:9999/candidate/',
			crossDomain : true,
			data :  JSON.stringify(formData),
			contentType : "application/json",
  		  	dataType: 'json',
  		  	Accept: "application/json",
			success : function(data) {
				alert('data: ' + data);
			}
			
		});
	});
	
	$.ajax({
        type: "GET",
        url: 'http://10.150.222.139:9999/interviewer/',
        crossDomain : true,
        success: function(data)
        {
            helpers.buildDropdown(
               data,
                $('#intSlotdropdown'),
                'Select an option'
            );
        }
    });
	$.ajax({
        type: "GET",
        url: 'http://10.150.222.139:9999/candidate/',
        crossDomain : true,
        success: function(data)
        {
        	candHelpers.buildDropdown(
               data,
                $('#canSlotdropdown'),
                'Select an option'
            );
        }
    });
	
	var helpers =
	{
	    buildDropdown: function(result, dropdown, emptyMessage)
	    {
	        // Remove current options
	        dropdown.html('');
	        // Add the empty option with the empty message
	        dropdown.append('<option value="">' + emptyMessage + '</option>');
	        // Check result isnt empty
	        if(result != '')
	        {
	            // Loop through each of the results and append the option to the dropdown
	            $.each(result, function(k, v) {
	                dropdown.append('<option value="' + v.iid + '">' + v.name + '</option>');
	            });
	        }
	    }
	}
	
	var candHelpers =
	{
	    buildDropdown: function(result, dropdown, emptyMessage)
	    {
	        // Remove current options
	        dropdown.html('');
	        // Add the empty option with the empty message
	        dropdown.append('<option value="">' + emptyMessage + '</option>');
	        // Check result isnt empty
	        if(result != '')
	        {
	            // Loop through each of the results and append the option to the dropdown
	            $.each(result, function(k, v) {
	                dropdown.append('<option value="' + v.cid + '">' + v.name + '</option>');
	            });
	        }
	    }
	}
	
	
	$("#interviewChooseSlot").click(function(event) {
		event.preventDefault();
		
		var formData = {
		        "iid": $('#intSlotdropdown').val(),
		        "date": $('#intSlotdate').val(),
		        "slot": $('#intSlot').val()
		    };
		
		
		$.ajax({
			type : 'POST',
			url : 'http://10.150.222.139:9999/interviewer/schedule',
			crossDomain : true,
			data :  JSON.stringify(formData),
			contentType : "application/json",
  		  	dataType: 'json',
  		  	Accept: "application/json",
			success : function(data) {
				alert('data: ' + data);
			}
			
		});
	});
	
	$("#candidateChooseSlot").click(function(event) {
		event.preventDefault();
		
		var formData = {
		        "cid": $('#canSlotdropdown').val(),
		        "date": $('#canSlotdate').val()
		    };
		
		
		$.ajax({
			type : 'POST',
			url : 'http://10.150.222.139:9999/candidate/schedule',
			crossDomain : true,
			data :  JSON.stringify(formData),
			contentType : "application/json",
  		  	dataType: 'json',
  		  	Accept: "application/json",
			success : function(data) {
				alert('data: ' + data);
			}
			
		});
	});
	
	$.ajax({
        type: "GET",
        url: 'http://10.150.222.139:9999/schedular/',
        crossDomain : true,
        success: function(data)
        {
        	schedulerHelpers.buildschedule(
               data,
                $('#scheduleTable')
            );
        }
    });
	
	var schedulerHelpers =
	{
	    buildschedule: function(result, domElement)
	    {
	        // Remove current options
	    	domElement.html('');
	        // Check result isn't empty
	        if(result != '')
	        {
	            // Loop through each of the results and append the option to the dropdown
	        	
	        	domElement.append('<tbody><tr><td>Date</td><td>Slot</td><td>CandidateId</td><td>CandidateName</td><td>InterviewerId</td><td>InterviewerName</td></tr>');
	            $.each(result, function(k, v) {
	            	domElement.append('<tr><td>'+v.scheduledDate+'</td><td>'+v.slot+'</td><td>'+v.candidate.cid+'</td><td>'+v.candidate.name+'</td><td>'+v.interviewer.iid+'</td><td>'+v.interviewer.name+'</td></tr>')
//	            			  .append('<td>'+v.slot+'</td>')
//	            	          .append('<td>'+v.candidate.cid+'</td>')
//	            	          .append('<td>'+v.candidate.name+'</td>')
//	            			  .append('<td>'+v.interviewer.iid+'</td>')
//	            	          .append('<td>'+v.interviewer.name+'</td></tr>');
	            });
	        	domElement.append('</tbody>')
	        }
	    }
	}
	
});

