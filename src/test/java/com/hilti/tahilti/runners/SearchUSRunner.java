package com.hilti.tahilti.runners;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {"target/test-classes"},
        glue = {"com.hilti.utils", "com.hilti.tahilti.steps"},
        plugin = {"html:target/cukes", "json:target/cucumber-SearchUS-report.json", "junit:target/cucumber-SearchUS-report.xml", "pretty"},
        strict = true,
        tags = {"@SearchUS", "~@InDevelopment"}
)
public class SearchUSRunner {}