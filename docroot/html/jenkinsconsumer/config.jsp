<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/html/init.jsp" %>

<%
String userName = GetterUtil.getString(portletPreferences.getValue("username", null));
String password = GetterUtil.getString(portletPreferences.getValue("password", null));
String buildsNumber = GetterUtil.getString(portletPreferences.getValue("buildsnumber", null));
String jobName = GetterUtil.getString(portletPreferences.getValue("jobname", null));
%>

<liferay-portlet:actionURL portletConfiguration="true" var="actionURL" />

<aui:form action="<%= actionURL %>" method="post" name="fm">
	<aui:input name="<%= Constants.CMD %>" type="hidden" value="<%= Constants.UPDATE %>" />

	<aui:fieldset label="basic-authentication-configuration">
		<div class="alert alert-info">
			<span class="displaying-help-message-holder">
				<liferay-ui:message key="please-set-up-here-basic-authentication-for-your-ci-server" />
			</span>
		</div>

		<aui:input cssClass="lfr-input-text-container" label="username" name="preferences--username--" type="text" value="<%= userName %>" />

		<aui:input label="password" name="preferences--password--" type="password" value="" />
	</aui:fieldset>

	<aui:fieldset label="builds-view-configuration">
		<aui:select id="preferences--jobname--" label="job-name" name="preferences--jobname--">
			<aui:option label="mdelapenya" value="mdelapenya" />
			<aui:option label="liferay-portal-master-clone" value="liferay-portal-master-clone" />
		</aui:select>

		<aui:select id="preferences--buildsnumber--" label="number-of-builds-to-view" name="preferences--buildsnumber--">
			<aui:option selected='<%= buildsNumber == "5" %>' label="5" value="5" />
			<aui:option selected='<%= buildsNumber == "10" %>' label="10" value="10" />
			<aui:option selected='<%= buildsNumber == "25" %>' label="25" value="25" />
			<aui:option selected='<%= buildsNumber == "50" %>' label="50" value="50" />
		</aui:select>
	</aui:fieldset>

	<aui:button-row>
		<aui:button type="submit" />
	</aui:button-row>
</aui:form>