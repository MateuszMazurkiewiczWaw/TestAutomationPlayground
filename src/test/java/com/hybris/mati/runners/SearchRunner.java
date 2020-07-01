package com.hybris.mati.runners;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {"target/test-classes"},
        glue = {"com.hybris.utils", "com.hybris.tahybris.steps"},
        plugin = {"html:target/cukes", "json:target/cucumber-Search-report.json", "junit:target/cucumber-Search-report.xml", "pretty"},
        strict = true,
        tags = {"@Search", "~@InDevelopment"}
)
public class SearchRunner {}