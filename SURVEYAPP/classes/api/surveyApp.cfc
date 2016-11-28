<cfcomponent output="false">
  <cffunction name="sendSurveyData" access="remote" returnformat="json" returnType="any">
	<cfset dateStamp = #DateFormat(Now(), "yyyy-mm-dd")#>
	<cfhttp  
		method="Post" 
		url="http://rdesurvey.cf/EMR/classes/api/emrApp.cfc?method=insertSurveyData" 
		resolveurl="Yes">
			<cfhttpparam type="Formfield" value="#form.fname#" name="fname">
			<cfhttpparam type="Formfield" value="#form.lname#" name="lname">
			<cfhttpparam type="Formfield" value="#DateFormat(form.dob, "yyyy-mm-dd")#"  name="dob">
			<cfhttpparam type="Formfield" value="#form.q1#" name="q1">
			<cfhttpparam type="Formfield" value="#form.q2#" name="q2">
			<cfhttpparam type="Formfield" value="#form.q3#" name="q3">
			<cfhttpparam type="Formfield" value="#dateStamp#" name="regDate">
	</cfhttp>
				
	<cfquery datasource="surveyApp" name="updateCodeAvailability">
	UPDATE surveyTracker
	SET codeAvail = codeAvail - 1
	WHERE surveyCode = '#form.surveyCode#'
	</cfquery>
                
    <cfquery datasource="surveyApp" name="updateCodeUsed">
	UPDATE surveyTracker
	SET codeUsed = codeUsed + 1	
	WHERE surveyCode = '#form.surveyCode#'
	</cfquery>	
                
	<cflocation url = "/SURVEYAPP/pages/submitPage.cfm" >
		
  </cffunction>
</cfcomponent>
