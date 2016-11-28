<cfcomponent output="false">

    <cffunction name="getSurvey" access="remote" returnformat="json" returntype="any">
      <cfargument name="pid" required="true"/>
      <cfargument name="surveyid" required="true"/>

        <cfquery name="surveyQuery" datasource="emrdb">
            SELECT *
            FROM surveyData
            WHERE surveyid = '#surveyid#'
            AND patientid = '#pid#'
        </cfquery>

        <cfset response = {
          "q1a" = #surveyQuery.question1#,
          "q2a" = #surveyQuery.question2#,
          "q3a" = #surveyQuery.question3#
          }>
        <cfreturn response>
    </cffunction>
</cfcomponent>
