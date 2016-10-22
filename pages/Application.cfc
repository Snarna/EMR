<cfcomponent output="false" name="Application">
	<cfset this.name = 'EMR Database'/>
	<cfset this.sessionManagement = true />
	<cfset this.loginstorage="Session">
	
	<cffunction name="onApplicationStart" returntype="boolean">
		<cfset application.loginService = createObject("component",'cfc.auth.loginService') />
		<cfreturn true />
	</cffunction>

	<cffunction name="onRequestStart" returntype="boolean">
		<cfargument name="targetPage" type="string" required="true" />
		<cfif isDefined('url.restartApp')>
			<cfset this.onApplicationStart() />
		</cfif>
		<cfreturn true/>
	</cffunction>
</cfcomponent>
