<cfcomponent output="false">
  <cffunction name="sendSurveyData" access="remote" returnformat="json" returnType="any">
	  <cfhttp  
		method="Post" 
		url="http://localhost:8500/EMR/classes/api/emrApp.cfc?method=insertSurveyData" 
		resolveurl="Yes"> 
			<cfhttpparam type="Formfield" value="#form.fname#" name="fname">
			<cfhttpparam type="Formfield" value="#form.lname#" name="lname">
			<cfhttpparam type="Formfield" value="#form.dob#" name="dob">
			<cfhttpparam type="Formfield" value="#form.q4#" name="q4">
	  </cfhttp>
	<cflocation url = "/SURVEYAPP/pages/submitPage.cfm" >
  </cffunction>
</cfcomponent>
