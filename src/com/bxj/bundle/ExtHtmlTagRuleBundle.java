package com.bxj.bundle;

import org.sitemesh.SiteMeshContext;
import org.sitemesh.content.ContentProperty;
import org.sitemesh.content.tagrules.TagRuleBundle;
import org.sitemesh.content.tagrules.html.ExportTagToContentRule;
import org.sitemesh.tagprocessor.State;

public class ExtHtmlTagRuleBundle implements TagRuleBundle {

	@Override
	public void install(State defaultState, ContentProperty contentProperty, SiteMeshContext siteMeshContext) {
		
		defaultState.addRule("pagetitle",
				new ExportTagToContentRule(siteMeshContext, contentProperty.getChild("pagetitle"), false));
		
		defaultState.addRule("pagescript",
				new ExportTagToContentRule(siteMeshContext, contentProperty.getChild("pagescript"), false));
		
	}

	@Override
	public void cleanUp(State defaultState, ContentProperty contentProperty, SiteMeshContext siteMeshContext) {

	}

}
