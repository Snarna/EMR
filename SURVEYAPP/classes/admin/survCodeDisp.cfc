<cfcomponent output="false">
  <cffunction name="getSurvCode" access="remote" returnformat="json" returnType="any">
    <cfquery name="codeQuery" datasource="surveyApp">
		SELECT surveyCode, codeAvail, codeUsed
		FROM surveyTracker
		WHERE adminId = '#session.adminId#'
	</cfquery>
	<cfreturn codeQuery>
  </cffunction>
	  
  <cffunction name="changeSurvCode" access="remote" returnformat="json" returnType="any">
	<cfquery name="updateSurvCode" datasource="surveyApp">
		UPDATE surveyTracker
		SET codeAvail = #form.codeAvail#
		WHERE surveyCode = '#form.survCode#' AND adminId = '#session.adminId#'
	</cfquery>
	<cflocation url = "/SURVEYAPP/pages/adminPage.cfm" >
  </cffunction>
	  
  <cffunction name="createSurvCode" access="remote" returnformat="json" returnType="any">
	<cfset var numberToGenerate = #form.numGen#>
		
	<cfloop condition = "numberToGenerate GT 0"> 
		<cfquery name="newSurvCode" datasource="surveyApp">
			<cfset var randCode = '#chr(RandRange(65, 90))##chr(RandRange(65, 90))##chr(RandRange(65, 90))##RandRange(100, 999)#'>
				
			INSERT INTO surveyTracker(adminId, surveyCode, codeAvail)
			VALUE ('#session.adminId#','#randCode#' , '1')
		</cfquery>
		<cfset numberToGenerate = numberToGenerate - 1> 
	</cfloop>

	<cflocation url = "/SURVEYAPP/pages/adminPage.cfm" >
  </cffunction>
</cfcomponent>