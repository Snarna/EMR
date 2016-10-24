<cfcomponent output="false">
	
	<cffunction name="insertSurveyData" access="remote" returnformat="json" returnType="any">
	<cfquery datasource="emrApp" name="insertTest">
		INSERT INTO surveyData(question1, question2, question3, question4)
		VALUES ('#form.fname#','#form.lname#','#form.dob#','#form.q4#')     
	</cfquery>
	</cffunction>
	
</cfcomponent>
