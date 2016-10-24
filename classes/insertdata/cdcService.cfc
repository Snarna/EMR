<cfcomponent>
	<!--- Component for CDC Data insert --->
	<cffunction name="insertCD4" access="remote" returntype="any">
		<cfargument name="patientId" type="numeric" required="true"/>
		<cfargument name="cd4Test" type="numeric" required="true"/>
		<cfargument name="cd4Date" type="date" required="true"/>
		<cfargument name="cd4Notes" type="string" required="true"/>
		
		<!---Get the data from the form and insert them into database. --->
		<!--- Change the datasource name to match yours --->		
		<cfquery datasource="emrdb">
			INSERT INTO cd4testData
			(patientId, cdTestId, cd4Test, cd4Date, cd4Notes)
			VALUES
			('#arguments.patientId#', NULL, '#arguments.cd4Test#', '#arguments.cd4Date#', '#arguments.cd4Notes#')
		</cfquery>
		<!--- Doesn't seem to be a way to check if query successful without cfdump --->
	</cfunction>
</cfcomponent>
