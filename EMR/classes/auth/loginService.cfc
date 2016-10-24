<cfcomponent>
	<!--- Login --->
	<cffunction name="doLogin" access="remote" returntype="any" returnformat="json">
		<cfargument name="proEmail" type="string" required="true"/>
		<cfargument name="proPassword" type="string" required="true"/>

		<!--- Get data from db --->
		<cfquery name="rsLoginUser" datasource="emrApp">
			SELECT providerData.proFname, providerData.proLname, providerData.proId, providerData.proEmail, providerData.proPassword
			FROM providerData WHERE providerData.proEmail = '#arguments.proEmail#'
			AND providerData.proPassword = '#arguments.proPassword#'
		</cfquery>
		<cfset var isLoggedIn = false>
		<!--- should only get one user --->
		<cfif rsLoginUser.recordCount EQ 1>
			<!--- log user in --->
			<cflogin>
				<cfloginuser name='#rsLoginUser.proFname#' password='#rsLoginUser.proPassword#' roles="user">
			</cflogin>
			<!--- save in the session (important) --->
			<cfset session.providerEmail = rsLoginUser.proEmail/>
			<cfset session.userFname = rsLoginUser.proFname/>
			<cfset session.userLname = rsLoginUser.proLname/>
			<!--- change logged in variable to true --->
			<cfset isLoggedIn=true/>
		</cfif>

		<!--- retruned aforementioned variable --->
		<cfreturn isLoggedIn>
	</cffunction>
</cfcomponent>
