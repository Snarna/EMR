<cfcomponent output="false">
	<cfset This.name="surveyApp"/>
	<cfset This.Sessionmanagement="True"/>
	<cfset this.sessionTimeout = createTimeSpan( 0, 0, 30, 0 ) />
	<cfset This.loginstorage="session"/>
	<cfset this.mappings["/local" ]=getDirectoryFromPath(getCurrentTemplatePath())/>

	<!-- Kill Session -->
	<cfif structKeyExists( url, "logout" )>
		<cfset this.sessionTimeout = createTimeSpan( 0, 0, 0, 0 ) />
	</cfif>

  <!-- On Application Start -->
	<cffunction name="onApplicationStart" returntype="boolean">
		<cfset application.loginService=createObject("component",'local.classes.auth.loginService')/>
		<cfreturn true/>
	</cffunction>

	<!--On Every Request Start -->
	<cffunction name="onRequestStart" returntype="boolean" output="false">
		<cfargument name="targetPage" required="true"/>

		<!-- Login Valication Control -->
		<cfif #targetPage# NEQ "/SURVEYAPP/classes/auth/loginService.cfc" 
			  AND #targetPage# NEQ "/SURVEYAPP/classes/api/surveyApp.cfc"
			  AND #targetPage# NEQ "/SURVEYAPP/pages/adminLogin.cfm" 
			  AND #targetPage# NEQ "/SURVEYAPP/pages/index.cfm" 
			  AND #targetPage# NEQ "/SURVEYAPP/pages/surveyPage.cfm" 
			  AND #targetPage# NEQ "/SURVEYAPP/pages/submitPage.cfm">
			<cfif NOT StructKeyExists(session, "adminUsername")>
				<cflocation url="adminLogin.cfm" addtoken="false">
			</cfif>
		</cfif>

		<!-- Logout Action -->
		<cfif structKeyExists( url, "logout" )>
				<cflocation url="index.cfm" addtoken="false">
		</cfif>

		<!-- Return True So Page Can Process -->
		<cfreturn true/>
	</cffunction>

</cfcomponent>