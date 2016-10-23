<cfcomponent output="false">

  <cffunction name="countPatients" access="remote" returnformat="json" returntype="any">
    <!--- Get data from database --->
		<cfquery name="countQuery" datasource="emrdb">
			SELECT COUNT(*) AS patientNum FROM patientsData
		</cfquery>
    <cfreturn countQuery.patientNum>
  </cffunction>

  <cffunction name="getPatients" access="remote" returnformat="json" returntype="any">
    <cfargument name="surveyId" type="string" required="true">
  </cffunction>
</cfcomponent>
