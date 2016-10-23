<cfcomponent output="false">
	<!--- Login --->
	<cffunction name="doLogin" access="remote" output="false" returntype="boolean">
		<cfargument name="proEmail" type="string" required="true"/>
		<cfargument name="proPassword" type="string" required="true"/>
		<!--- To determine if user is logged in --->
		<cfset var isLoggedIn=false/>
		<!--- Get data from db --->
		<cfquery name="rsLoginUser" datasource="emrdb" result="loginResults">
			SELECT providersData.profname, providersData.prolname, providersData.providerid, providersData.proemail, providersData.propassword FROM providersData WHERE providersData.proEmail = '#arguments.proEmail#' AND providersData.proPassword = '#arguments.proPassword#'
		</cfquery>
		<cfdump var="#loginResults#">
		<!--- should only get one user --->
		<cfif rsLoginUser.recordCount EQ 1>
			<!--- log user in --->
			<cflogin>
				<cfloginuser name='#rsLoginUser.proFname#' password='#rsLoginUser.proPassword#' roles="user">
				<cfdump var="#rsLoginUser#">
			</cflogin>
			<!--- save in the session (important) --->
			<cfset session.stLoggedInUser={'ProviderName'=rsLoginUser.proEmail, 'userFname'=rsLoginUser.proFname}/>
			<!--- change logged in variable to true --->
			<cfset var isLoggedIn=true/>
		<cfelse>
			<cfset var isLoggedIn=false/>
		</cfif>
		<!--- retruned aforementioned variable --->
		<cfreturn isLoggedIn/>
	</cffunction>
</cfcomponent>
