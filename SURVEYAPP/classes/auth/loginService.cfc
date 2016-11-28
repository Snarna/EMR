<cfcomponent>
	<!--- Login --->
	<cffunction name="doLogin" access="remote" returntype="any" returnformat="json">
		<cfargument name="adminUsername" type="string" required="true"/>
		<cfargument name="adminPassword" type="string" required="true"/>

		<!--- Get data from db --->
		<cfquery name="rsLoginUser" datasource="surveyApp">
			SELECT adminId, adminUsername, adminPassword
			FROM adminData 
			WHERE adminData.adminUsername = '#arguments.adminUsername#'
			AND adminData.adminPassword = '#arguments.adminPassword#'
		</cfquery>
		<cfset var isLoggedIn = false>
		<!--- should only get one user --->
		<cfif rsLoginUser.recordCount EQ 1>
			<!--- log user in --->
			<cflogin>
				<cfloginuser name='#rsLoginUser.adminUsername#' password='#rsLoginUser.adminPassword#' roles="user">
			</cflogin>
			<!--- save in the session (important) --->
			<cfset session.adminUsername = rsLoginUser.adminUsername/>
			<cfset session.adminId = rsLoginUser.adminId/>
			<!--- change logged in variable to true --->
			<cfset isLoggedIn=true/>
		</cfif>

		<!--- retruned aforementioned variable --->
		<cfreturn isLoggedIn>
	</cffunction>
</cfcomponent>
