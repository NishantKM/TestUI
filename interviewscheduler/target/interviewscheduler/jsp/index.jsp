<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="/script/jquery-3.3.1.min.js"></script>
<script src="/script/interviewer.js"></script>
<link rel="stylesheet" href="/style/interviewer.css"></link>
</head>
<body>

	<h4>Interview Scheduler</h4>
	<div class="tab">
		<button class="tablinks" onclick="openSubTabs(event, 'Interviewer')"
			id="defaultOpen">Interviewer</button>
		<button class="tablinks" onclick="openSubTabs(event, 'Candidate')">Candidate</button>
		<button class="tablinks" onclick="openSubTabs(event, 'Schedule')">Schedule</button>
	</div>

	<div id="Interviewer">
		<button class="intbutton"
			onclick="display(event, 'CreateInterviewer')">CreateInterviewer</button>
		<button class="intbutton"
			onclick="display(event, 'UpdateInterviewer')">UpdateInterviewer</button>
		<button class="intbutton" onclick="display(event, 'ChooseSlot')">ChooseSlot</button>
		<button class="intbutton" onclick="display(event, 'InterviewerView')">View</button>
	</div>

	<div id="Candidate">
		<button class="candbutton" onclick="display(event, 'CreateCandidate')">CreateCandidate</button>
		<button class="candbutton" onclick="display(event, 'UpdateCandidate')">UpdateCandidate</button>
		<button class="candbutton" onclick="display(event, 'CandidateView')">View</button>
	</div>


	<div id="CreateInterviewer" class="tabcontent">
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
	</div>
	<div id="UpdateInterviewer" class="tabcontent">
		<h6>Update Interviewer Details</h6>
		<form>
			<table>
				<tbody>
					<tr>
						<td>Name :</td>
						<td><select id="interNames"></select></td>
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
						<td><input id="interviewerSave" type="submit" value="update" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div id="InterviewerView">
	
	</div>
	<div id="ChooseSlot" class="tabcontent">
		<h6>ChooseSlot Interviewer Details</h6>
		<form>
			<table>
				<tbody>
					<tr>
						<td>Interviewer Name :</td>
						<td><input type="text" /></td>
					</tr>
					<tr>
						<td>slot :</td>
						<td><select>
								<option>S1</option>
								<option>S2</option>
						</select></td>
					</tr>
					<tr>
						<td><input type="submit" value="update" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

	<div id="CreateCandidate" class="tabcontent">
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
	</div>
	<div id="UpdateCandidate" class="tabcontent">
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
	<div id="CandidateView">
	
	</div>

	<div id="Schedule" class="tabcontent"></div>





</body>
</html>
