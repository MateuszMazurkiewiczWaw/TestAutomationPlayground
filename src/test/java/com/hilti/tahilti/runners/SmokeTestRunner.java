package com.hilti.tahilti.runners;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
	features = {"target/test-classes"},
	glue = {"com.hilti.utils", "com.hilti.tahilti.steps", "com.hilti.tahilti.utils"},
	plugin = {"html:target/cukes", "json:target/cucumber-Smoke-report.json", "junit:target/cucumber-Smoke-report.xml", "pretty"},
	strict = true,
	tags = {"@Smoke", "~@InDevelopment"}
)
public class SmokeTestRunner {}