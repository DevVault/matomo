{loadJavascriptTranslations plugins='CoreHome Dashboard'}

<script type="text/javascript">
{if !empty($layout) }
	piwik.dashboardLayout = {$layout};
{else}
{literal}
	piwik.dashboardLayout = 
	[
		[
			{"uniqueId":"widgetVisitsSummarygetEvolutionGraph","parameters":{"module":"VisitsSummary","action":"getEvolutionGraph","columns":["nb_visits"]}},
			{"uniqueId":"widgetVisitorInterestgetNumberOfVisitsPerVisitDuration","parameters":{"module":"VisitorInterest","action":"getNumberOfVisitsPerVisitDuration"}},
			{"uniqueId":"widgetUserSettingsgetBrowser","parameters":{"module":"UserSettings","action":"getBrowser"}},
			{"uniqueId":"widgetUserCountrygetCountry","parameters":{"module":"UserCountry","action":"getCountry"}},
			{"uniqueId":"widgetExampleFeedburnerfeedburner","parameters":{"module":"ExampleFeedburner","action":"feedburner"}}
		],
		[
			{"uniqueId":"widgetReferersgetKeywords","parameters":{"module":"Referers","action":"getKeywords"}},
			{"uniqueId":"widgetReferersgetWebsites","parameters":{"module":"Referers","action":"getWebsites"}}
		],
		[
			{"uniqueId":"widgetReferersgetSearchEngines","parameters":{"module":"Referers","action":"getSearchEngines"}},
			{"uniqueId":"widgetVisitTimegetVisitInformationPerServerTime","parameters":{"module":"VisitTime","action":"getVisitInformationPerServerTime"}},
			{"uniqueId":"widgetExampleRssWidgetrssPiwik","parameters":{"module":"ExampleRssWidget","action":"rssPiwik"}}
		]
	];
{/literal}

	{*
	the old dashboard layout style is:
	piwik.dashboardLayout = 'VisitsSummary.getEvolutionGraph~VisitorInterest.getNumberOfVisitsPerVisitDuration~UserSettings.getBrowser~ExampleFeedburner.feedburner|Referers.getKeywords~Referers.getWebsites|Referers.getSearchEngines~VisitTime.getVisitInformationPerServerTime~ExampleRssWidget.rssPiwik|';
	*}
{/if}
piwik.availableWidgets = {$availableWidgets};
</script>

{literal}
<script type="text/javascript">
$(document).ready( function() {
		var dashboardObject = new dashboard();
		var widgetMenuObject = new widgetMenu(dashboardObject);
		dashboardObject.init(piwik.dashboardLayout);
		widgetMenuObject.init();
		$('.button#addWidget').click(function(){widgetMenuObject.show();});
});
</script>
{/literal}
<div id="dashboard">
 
	<div class="dialog" id="confirm"> 
	        <img src="themes/default/images/delete.png" style="padding: 10px; position: relative; margin-top: 10%; float: left;"/>
	        <p>{'Dashboard_DeleteWidgetConfirm'|translate}</p>
			<input id="yes" type="button" value="{'General_Yes'|translate}"/>
			<input id="no" type="button" value="{'General_No'|translate}"/>
	</div> 

	<div class="button" id="addWidget">
		{'Dashboard_AddWidget'|translate}
	</div>
	
	<div class="menu" id="widgetChooser">
		<div id="closeMenuIcon"><img src="themes/default/images/close_medium.png" title="{'General_Close'|translate}"/></div>
		<div id="menuTitleBar">{'Dashboard_SelectWidget'|translate}</div>

		<div class="subMenu" id="sub1"></div>
		<div class="subMenu" id="sub2"></div>
		<div class="subMenu" id="sub3"></div>
		<div class="menuClear"> </div>
	</div>	

	<div id="dashboardWidgetsArea">
		<div class="col" id="1"></div>
		<div class="col" id="2"></div>
		<div class="col" id="3"></div>
	</div>
</div>
