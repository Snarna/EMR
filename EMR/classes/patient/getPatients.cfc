<cfcomponent output="false">

    <cffunction name="countPatients" access="remote" returnformat="json" returntype="any">
        <!--- Get data from database --->
        <cfquery name="countQuery" datasource="emrApp">
            SELECT COUNT(*) AS patientNum FROM surveyData
        </cfquery>
        <cfreturn countQuery.patientNum>
    </cffunction>

    <cffunction name="getPatients" access="remote" returnformat="json" returntype="any">
        <cfset var response="">

        <cfquery name="patientQuery" datasource="emrApp">
            SELECT * FROM surveyData
        </cfquery>

        <cfloop query="patientQuery">
            <cfset var response &= "<tr>">
            <cfset var response &= "<td>" & #patientID# & "</td><td>" & #question1# & "</td><td>" & #question2# & "</td><td>" & #question3# & "</td><td>N/A</td>">
        </cfloop>

        <cfreturn response>
    </cffunction>
</cfcomponent>
