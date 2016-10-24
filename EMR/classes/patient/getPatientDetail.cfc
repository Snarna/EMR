<cfcomponent output="false">

    <cffunction name="getPatientDetail" access="remote" returnformat="json" returntype="any">
      <cfargument name="pid" required="true"/>
        <cfquery name="patientDetailQuery" datasource="emrApp">
            SELECT * FROM surveyData WHERE patientID = '#pid#'
        </cfquery>

        <cfset response = {
          "fname" = #patientDetailQuery.question1#,
          "lname" = #patientDetailQuery.question2#,
          "dob" = #patientDetailQuery.question3#
          }>
        <cfreturn response>
    </cffunction>

    <cffunction name="getPatientSurveyNum" access="remote" returnformat="json" returntype="any">
      <cfargument name="pid" required="true"/>
        <cfquery name="surveyCountQuery" datasource="emrdb">
            SELECT COUNT(*) AS surveyNum FROM surveyData WHERE patientID = '#pid#'
        </cfquery>
        <cfreturn surveyCountQuery.surveyNum>
    </cffunction>

</cfcomponent>
