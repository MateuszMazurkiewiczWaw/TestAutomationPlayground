package com.hilti.tahilti.runners;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {"target/test-classes"},
        glue = {"com.hilti.utils", "com.hilti.tahilti.steps"},
        plugin = {"html:target/cukes", "json:target/cucumber-Sprint2-report.json", "junit:target/cucumber-Sprint2-report.xml", "pretty"},
        strict = true,
        tags = {"@Sprint2", "~@InDevelopment"}
)
public class Sprint2Runner {}