<cfcomponent output="false">
  <cffunction name="insertSurveyData" access="remote" returnformat="json" returnType="any">
    <cfquery name="survQuery" datasource="emr">
		SELECT id, fname, lname, dob
		FROM surveyData
	</cfquery>
	<cfreturn survQuery>
  </cffunction>
</cfcomponent>
