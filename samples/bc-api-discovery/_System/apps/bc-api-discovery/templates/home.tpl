<div class="col-md-4">

	<select class="form-control clear-after" selectize="resourceSelection.options" placeholder="Choose a resource ..."
		ng-model="resourceSelection.value" options="resources" ></select>

		 <select class="form-control clear-both" selectize="versionsSelection.options" placeholder="Choose a version ..."
        		ng-model="versionsSelection.value" options="versions"></select>

		<div class="clear-both" ng-if="resourceSelection.value && versionsSelection.value && sampleResources.length > 0">
            		<select class="form-control" selectize="sampleResourcesSelection.options"
            				placeholder="Choose an existing resource id ..."
            				ng-model="sampleResourcesSelection.value" options="sampleResources">
            		</select>
            	</div>

		 <div class="clear-both" ng-if = "subresources.length > 0 && resourceSelection.value && versionsSelection.value && sampleResourcesSelection.value">
                 		<select class="form-control" selectize="subresourceSelection.options" placeholder="Choose a subresource ..."
                 			ng-model="subresourceSelection.value" options="subresources"></select>
                 	</div>
</div>

<div class="col-md-8" ng-hide="!resourceSelection.value">
	<div ng-controller="QueryBuilderController">
		<div ng-include="'/_System/apps/bc-api-discovery/templates/generators/query_builder.tpl'"></div>
	</div>
</div>

<br style="clear: both" />
<br style="clear: both" />

<div class="col-md-4" ng-if="fields.length > 0">
	<table class="table table-bordered">
		<thead>
			<tr>
				<th><input type="checkbox" ng-click="selectAllFields();" ng-checked="allFieldsSelected"/>Include</th>
				<th>Field name</th>
				<th>Field type</th>
			</tr>
		</thead>

		<tbody>
			<tr ng-repeat="field in fields">
				<td><input type="checkbox" ng-model="field.selected" ng-checked="field.selected" ng-click="updateGeneratorsData()" /></td>
				<td>{{field.name}}</td>
				<td>{{field.type}}</td>
			</tr>
		</tbody>
	</table>
</div>

<div class="col-md-8" ng-if="fields.length > 0">
	<api-tabs>
		<api-tab-pane title="module_data">
			<div ng-controller="ModuleDataController">
				<div ng-include="'/_System/apps/bc-api-discovery/templates/generators/module_data.tpl'"></div>
			</div>
		</api-tab-pane>

		<api-tab-pane title="JQuery">
			<div ng-controller="JqueryController">
				<div ng-include="'/_System/apps/bc-api-discovery/templates/generators/jquery.tpl'"></div>
			</div>
		</api-tab-pane>

		<api-tab-pane title="HTTP 1.1">
			<div ng-controller="Http11Controller">
				<div ng-include="'/_System/apps/bc-api-discovery/templates/generators/http11.tpl'"></div>
			</div>
		</api-tab-pane>
	</api-tabs>
</div>