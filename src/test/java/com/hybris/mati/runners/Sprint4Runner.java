package com.hybris.mati.runners;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {"target/test-classes"},
        glue = {"com.hybris.utils", "com.hybris.tahybris.steps"},
        plugin = {"html:target/cukes", "json:target/cucumber-Sprint4-report.json", "junit:target/cucumber-Sprint4-report.xml", "pretty"},
        strict = true,
        tags = {"@Sprint4", "~@InDevelopment"}
)
public class Sprint4Runner {}