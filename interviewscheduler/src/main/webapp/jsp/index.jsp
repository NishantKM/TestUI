<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1" />
<style>
body {
	font-family: Arial;
}
/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}
</style>
</head>

<body>
    <script src="/script/jquery-3.3.1.min.js"></script>
    
	
	<h4>Interview Scheduler</h4>
	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'Interviewer')"
			id="defaultOpen">Interviewer</button>
		<button class="tablinks" onclick="openCity(event, 'Candidate')">Candidate</button>
		<button class="tablinks" onclick="openCity(event, 'Schedule')">Schedule</button>
	</div>
	<div id="Interviewer" class="tabcontent">
		<h6>Interviewer Details</h6>
		<form>
			<table>
				<tbody>
					<tr>
						<td>Name :</td>
						<td><input id="intName" type="text" /></td>
					</tr>
					<tr>
						<td>Email :</td>
						<td><input id="intEmail" type="text" /></td>
					</tr>
					<tr>
						<td>Contact :</td>
						<td><input id="intCont" type="text" /></td>
					</tr>
					<tr>
						<td>Priority :</td>
						<td><input id="intPrior" type="text" /></td>
					</tr>
					<tr>
						<td><input id="interviewerSave" type="submit" value="save" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<h6>Update Interviewer Details</h6>
		<form>
			<table>
				<tbody>
					<tr>
						<td>Interviewer Id :</td>
						<td><input type="text" /></td>
					</tr>

					<tr>
						<td><input type="submit" value="update" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div id="Candidate" class="tabcontent">
		<h6>Candidate Details</h6>
		<form>
			<table>
				<tbody>
					<tr>
						<td>Name :</td>
						<td><input type="text" /></td>
					</tr>
					<tr>
						<td>Email :</td>
						<td><input type="text" /></td>
					</tr>
					<tr>
						<td>Contact :</td>
						<td><input type="text" /></td>
					</tr>
					<tr>
						<td>YearsOfExp :</td>
						<td><input type="text" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="save" /></td>
					</tr>
				</tbody>
			</table>
		</form>
		<h6>Update Candidate Details</h6>
		<form>
			<table>
				<tbody>
					<tr>
						<td>Candidate Id :</td>
						<td><input type="text" /></td>
					</tr>

					<tr>
						<td><input type="submit" value="update" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div id="Schedule" class="tabcontent"></div>

	
	<script>
		function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}
		
		document.getElementById("defaultOpen").click();
		
				
		$(document).ready(function(){
		    $("#interviewerSave").click(function(event){
		    	event.preventDefault();
		        $.ajax({type: 'POST',
		        	    url: 'http://10.150.222.139:9999/interviewer/',
		        	    crossDomain: true,
		        	    data: '{"iName": "abc", "contact": "12234124"}', // or JSON.stringify ({name: 'jonas'}),
		        	    success: function(data) { alert('data: ' + data); },
		        	    dataType: 'json',});
		        });
		     });
	</script>



</body>
</html>
