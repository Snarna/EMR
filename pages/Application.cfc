<cfcomponent output="false" name="Application">
	<cfset this.name = 'EMR Database'/>
	<cfset this.sessionManagement = true />

	<!--- Add validation and encryption later --->
	<cffunction name="addUser" returntype="void"> 
		<cfargument name="proEmail" type="string" required="true" />
		<cfargument name="proUsername" type="string" required="true" />
		<cfargument name="proFname" type="string" required="true" />
		<cfargument name="proLname" type="string" required="true" />
		<cfargument name="proPassword" type="string" required="true" />
		
		<cfquery datasource="capstone">
			INSERT INTO Providers
			(providerId, proEmail, proUsername, proFname, proLname, proPassword)
			VALUES
			(0, '#arguments.proEmail#', '#arguments.proUsername#', '#arguments.proFname#', '#arguments.proLname#', '#arguments.proPassword#')
		</cfquery>
		<cfreturn />
	</cffunction>
</cfcomponent>
