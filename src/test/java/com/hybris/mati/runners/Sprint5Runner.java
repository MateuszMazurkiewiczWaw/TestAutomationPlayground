package com.hybris.mati.runners;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {"target/test-classes"},
        glue = {"com.hybris.utils", "com.hybris.tahybris.steps"},
        plugin = {"html:target/cukes", "json:target/cucumber-Sprint5-report.json", "junit:target/cucumber-Sprint5-report.xml", "pretty"},
        strict = true,
        tags = {"@Sprint5", "~@InDevelopment"}
)
public class Sprint5Runner {}