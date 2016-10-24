<cfcomponent>
	<!--- Component for Viral Load Data insert --->
	<cffunction name="insertViral" access="remote" returntype="any">
		<cfargument name="patientId" type="numeric" required="true"/>
		<cfargument name="loadTest" type="numeric" required="true"/>
		<cfargument name="loadDate" type="date" required="true"/>
		<cfargument name="loadNotes" type="string" required="true"/>
		
		<!---Get the data from the form and insert them into database. --->
		<!--- Change the datasource name to match yours --->		
		<cfquery datasource="emrdb">
			INSERT INTO loadtestData
			(patientId, loadTestId, loadTest, loadDate, loadNotes)
			VALUES
			('#arguments.patientId#', NULL, '#arguments.loadTest#', '#arguments.loadDate#', '#arguments.loadNotes#')
		</cfquery>
	</cfunction>
</cfcomponent>
