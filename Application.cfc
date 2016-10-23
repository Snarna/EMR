<cfcomponent>
	<cfset This.name="EMR">
	<cfset This.Sessionmanagement="True">
	<cfset This.loginstorage="session">
	<cfset this.mappings["/local"] = getDirectoryFromPath(getCurrentTemplatePath()) />

	<cffunction name="onApplicationStart" returntype="boolean">
			<cfset application.loginService = createObject("component",'local.classes.auth.loginService') />
		<cfreturn true />
	</cffunction>

	<cffunction name="onRequestStart" returntype="boolean">
		<cfreturn true />
	</cffunction>
</cfcomponent>
