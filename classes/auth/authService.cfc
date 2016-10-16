<cfcomponent output="false">
	<!--- validateUser() - validates the user, returns array --->
	<cffunction name="validateUser" access="public" output="false" returntype="array">
		<cfargument name="proemail" type="string" required="true" />
		<cfargument name="prouserName" type="string" required="true" />
		<cfargument name="profname" type="string" required="true" />
		<cfargument name="prolname" type="string" required="true" />
		<cfargument name="propassword" type="string" required="true" />

		<cfset var aErrorMessages = ArrayNew(1) />

		<!--- Validate email --->
		<cfif NOT isValid('email', arguments.proemail)>
			<cfset arrayAppend(aErrorMessages, 'Email missing') />
		</cfif>

		<!--- Validate password --->
		<cfif arguments.userPassword EQ ' '>
			<cfset arrayAppend(aErrorMessages, "Password missing") />
		
		<cfreturn aErrorMessages />
	</cffunction>

	<!--- Login --->
	<cffunction name="doLogin" access="public" output="false" returntype="boolean">
		<cfargument name="proEmail" type="string" required="true" />
		<cfargument name="proPassword" type="string" required="true" />

		<!--- To determine if user is logged in --->
		<cfset var isLoggedIn = false />
		<!--- Get data from db --->
		<cfquery name="rsLoginUser" datasource="capstone">
		SELECT Providers.proFname, Providers.proLname, Providers.providerId, Providers.proEmail, Providers.proPassword WHERE proEmail = '#arguments.proemail#' AND proPassword = '#arguments.propassword#'
		</cfquery>
		<!--- should only get one user --->
		<cfif rsLoginUser.recordCount EQ 1>
			<!--- log user in --->
			<cflogin>
				<cfloginuser name='#rsLoginUser.proFname#'password='#rsLoginUser.proPassword#'>
			</cflogin>
			<!--- save in the session (important) --->
			<cfset session.stLoggedInUser = {'ProviderName' = rsLoginUser.proUsername, 'userFname' = rsLoginUser.proFname} />
			<!--- change logged in variable to true --->
			<cfset var isLoggedIn = true />
		</cfif>
		<!--- retruned aforementioned variable --->
		<cfreturn isLoggedIn />
	</cffunction>

	<!--- Logout --->
	<cffunction name="doLogout" access="public" output="false" returntype="void">
		<cfset structdelete(session, 'stLoggedInUser'); />
		<cflogout />	
	</cffunction>
</cfcomponent>
