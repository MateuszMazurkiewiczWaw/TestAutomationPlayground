package com.hybris.mati.runners;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {"target/test-classes"},
        glue = {"com.hybris.utils", "com.hybris.tahybris.steps"},
        plugin = {"html:target/cukes", "json:target/cucumber-SearchUS-report.json", "junit:target/cucumber-SearchUS-report.xml", "pretty"},
        strict = true,
        tags = {"@SearchUS", "~@InDevelopment"}
)
public class SearchUSRunner {}