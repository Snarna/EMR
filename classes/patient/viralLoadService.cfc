<cfcomponent>
	<!--- Component for CDC Data insert --->
	<cffunction name="insertVL" access="remote" returnformat="json" returntype="any">
		<cfargument name="pid" type="numeric" required="true"/>
		<cfargument name="vlTest" type="numeric" required="true"/>
		<cfargument name="vlDate" type="date" required="true"/>
		<cfargument name="vlNotes" type="string" required="true"/>

		<!---Get the data from the form and insert them into database. --->
		<!--- Change the datasource name to match yours --->
		<cfquery name="vlInsertQuery" datasource="emrdb" result="result">
			INSERT INTO loadtestData
			(patientid, loadtestnum, loadtestnotes, loadtestdate)
			VALUES
			('#pid#', '#arguments.vlTest#', '#arguments.vlNotes#', <cfqueryparam cfsqltype="cf_sql_date" value="#vlDate#">)
		</cfquery>

		<cfset var newId=result.GENERATEDKEY>
		<cfreturn newId>
	</cffunction>

	<cffunction name="getVL" access="remote" returnformat="json" returnType="any">
		<cfargument name="pid" type="numeric" required="true"/>
		<cfset var response="">

		<cfquery name="getViralLoadQuery" datasource="emrdb">
			SELECT *
			FROM loadtestData
			WHERE patientid = '#pid#'
		</cfquery>

		<cfloop query="getViralLoadQuery">
			<cfset var response &="<tr>">
			<cfset var response &="<td class='col-sm-2'>" & #loadtestid# & "</td><td class='col-sm-2'>" & #loadtestnum# & "</td><td class='col-sm-3'>" & #DateFormat(loadtestdate, "mm/dd/yyyy")# & "</td><td class='col-sm-4'>" & #loadtestnotes# & "</td><td class='col-sm-1' ><button class='btn btn-xs' onclick='edit(this);'>Edit</button></td>">
		</cfloop>

		<cfreturn response>
	</cffunction>

	<cffunction name="editViralLoad" access="remote" returnformat="json" returnType="any">
		<cfargument name="newNum" type="numeric" required="true"/>
		<cfargument name="newNotes" type="string" required="true"/>
		<cfargument name="viralLoadId" type="numeric" required="true"/>

		<cfquery name="editViralLoadQuery" datasource="emrdb">
			UPDATE loadtestData
			SET loadtestnum = '#newNum#', loadtestnotes = '#newNotes#'
			WHERE loadtestid = '#viralLoadId#'
		</cfquery>

	</cffunction>

</cfcomponent>
