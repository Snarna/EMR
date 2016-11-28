<cfcomponent output="false">
	<!-- Checker for if patient exists or not -->
	<cffunction name="insertSurveyData" access="remote" returnformat="json" returnType="any">
		<cfquery name="checkPatient" datasource="emrdb">
		SELECT * FROM patientsData
		WHERE pfname = '#form.fname#'
		</cfquery>
		
		<!-- if patient exists -->
	<cfif len(checkPatient.pfname)>
		<!-- Find old patient -->
		<cfquery name="patientDataQuery" datasource="emrdb">
		SELECT patientid FROM patientsData
		WHERE pfname= '#form.fname#'
		</cfquery>
		<!-- Insert survey data -->
		<cfquery datasource="emrdb" name="insertTest">
		INSERT INTO surveyData(patientid, question1, question2, question3, dateTaken)
		VALUES ('#patientDataQuery.patientId#','#form.q1#','#form.q2#','#form.q3#', '#form.regDate#')     
		</cfquery>
		<!-- if patient doesn't exists -->
		<cfelse>
			<!-- Create new patient -->
			<cfquery datasource="emrdb" name="newPatient">
				INSERT INTO patientsData(pfname, plname, pdob, regDate)
				VALUES ('#form.fname#','#form.lname#','#form.dob#', '#form.regDate#')  
			</cfquery>
			<!-- Find new patient -->
			<cfquery name="findNewPatient" datasource="emrdb">
				SELECT patientid FROM patientsData
				WHERE pfname= '#form.fname#'
			</cfquery>
			<!-- Insert survey questions for new patient -->
			<cfquery datasource="emrdb" name="newPatSurv">
				INSERT INTO surveyData(patientid, question1, question2, question3, dateTaken)
				VALUES ('#findNewPatient.patientid#','#form.q1#','#form.q2#','#form.q3#', '#form.regDate#')     
			</cfquery>
	</cfif>
	</cffunction>
</cfcomponent>


