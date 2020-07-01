package com.hybris.mati.runners;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        features = {"target/test-classes"},
        glue = {"com.hybris.utils", "com.hybris.tahybris.steps"},
        plugin = {"html:target/cukes", "json:target/cucumber-Regression-report.json", "junit:target/cucumber-Regression-report.xml", "pretty"},
        strict = true,
        tags = {"@Sprint1, @Sprint2, @Sprint3, @Sprint4, @Sprint5, @Sprint6", "~@InDevelopment"}
)
public class RegressionRunner {}