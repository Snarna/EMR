<cfcomponent output="false" name="Application">
	<cfset this.name = 'EMR Database'/>
	<cfset this.sessionManagement = true />

	<cffunction name="addUser" returntype="void"> 
		<cfargument  name="test" type="string" required="true" />
		<cfoutput>"#arguments.test#"</cfoutput>
		<cfreturn />
	</cffunction>
</cfcomponent>
