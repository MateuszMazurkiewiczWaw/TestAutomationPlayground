@SearchUS @Search
Feature: HOL-24392 - Search - US

  Scenario Outline: HOL-24392 - Search results validation - US
		#Enter the page
		When General: Search for <search_term> on site United States
		And Webshop Main Page: If section I_UNDERSTAND_COOKIES is visible click I_UNDERSTAND_BUTTON
		And Webshop Main Page: If section ONE_MORE_THING_BANNER is visible click DO_NOT_ASK_AGAIN_BUTTON
		And Search Results Page: If element SHOW_ALL_BUTTON is visible click SHOW_ALL_BUTTON
		Then Search Results Page: Products <expected_results> are in top <expected_search_ranking> while products <not_expected_results> aren't for search term <search_term>
	
	Examples:
|	search_term	|	expected_results	|	expected_search_ranking	|	not_expected_results	|
|	fs one	|	r3859360	|	1	|	N/A	|
|	has	|	r6289, r4234, r6287, r257, r1630267, r1630267, r1824287, r 5230, r5231	|	10	|	N/A	|
|	profis	|	r3604720, r3029930, r2755, r3605369, r4335368, r5208850, r4335368, r3496285, r2907870	|	10	|	r6281, r4914, r6292, r6296, r6294, r6282, r6279, r1764635, r67127, r66212, r1830455, r2349, 337919, 337918	|
|	kbtz	|	r6281, r4914, r6282	|	5	|	N/A	|
|	hdi	|	r232, r67855, r67854, r67853, r710, r1956373, r4208885	|	10	|	N/A	|
|	epoxy	|	r4929903, r4929723, r4417, r4803, r4993, r1830871, r4901, r3562, r2641, r3147	|	8	|	N/A	|
|	kwik bolt	|	r6281, r4914, r6292, r6296, r6294, r6282, r6279, r1764635, r67127, r66212, r1830455, r2349, 337919, 337918	|	20	|	r6289, r4234, r6287, r257, r1630267, r1630267, r1824287, r 5230, r5231	|
|	kb tz	|	r6281, r4914, r6282	|	5	|	N/A	|
|	kb-tz	|	r6281, r4914, r6282	|	5	|	N/A	|
|	HAS	|	r6289, r4234, r6287, r257, r1630267, r1630267, r1824287, r 5230, r5231	|	10	|	N/A	|
|	KB-TZ	|	r6281, r4914, r6282	|	3	|	N/A	|
|	kwik bolt tz	|	r6281, r4914, r6282	|	5	|	N/A	|
|	x-u	|	r6220, r4889899, r3650, r3649, r4889834	|	10	|	N/A	|
|	te cx	|	r5225, r4701, r5226, r4429, r4912, r4913, r4930	|	10	|	N/A	|
|	HDI	|	r232, r67855, r67854, r67853, r710, r1956373, r4208885	|	10	|	N/A	|
|	screws	|	r524280, r129, r4638, r3732, r4643, r3733, r122, r6271, r6262, r6265, r6263, r6258, r6270, r6264, r67520, r86, r4800	|	20	|	N/A	|
|	fs one max	|	r3859360	|	1	|	N/A	|
|	kh-ez	|	r6271, r6262, r4800	|	3	|	r4718	|
|	Laser	|	r4890614, r587776, r587754, r4996, r2891111, r40930, r40928, r4705, r4387, r25990	|	3	|	N/A	|
|	kwik con	|	r6265, r6263, r6258, r6270, r6264, r67520, r86, r6200	|	10	|	N/A	|
|	mineral wool	|	236993,374508,374507,374506,374505	|	10	|	N/A	|
|	sds	|	r5225, r4701, r5226, r4429, r4912, r4913, r4930, r5444	|	10	|	N/A	|
|	te-cx	|	r5225, r4701, r5226, r4429, r4912, r4913, r4930	|	10	|	N/A	|
|	has rod	|	r6289, r4234, r6287, r257, r1630267, r1630267, r1824287, r 5230, r5231	|	10	|	N/A	|
|	kwik hus	|	r6271, r6262, r4800, r4844439	|	6	|	N/A	|
|	te yx	|	r1537, r1534, r436, 	|	5	|	N/A	|
|	hus	|	r6271, r6262, r4800, r4844439	|	6	|	N/A	|
|	laser	|	r4890614, r587776, r587754, r4996, r2891111, r40930, r40928, r4705, r4387, r25990	|	15	|	N/A	|
|	kh ez	|	r6271, r6262, r4800	|	5	|	N/A	|
|	fs-one	|	r3859360	|	1	|	N/A	|
|	KBTZ	|	r6281, r4914, r6282	|	3	|	N/A	|
|	KH-EZ	|	r6271, r6262, r4800	|	5	|	N/A	|
|	HAS-E	|	r6289, r4234, r6287, r257, r1630267, r1630267, r1824287, r 5230, r5231	|	10	|	N/A	|
|	hit z	|	r5230, r5231	|	3	|	N/A	|
|	hus ez	|	r6271, r6262, r4800	|	5	|	N/A	|
|	threaded rod	|	r6289, r4234, r6287, r257, r1630267, r1630267, r1824287, r 5230, r5231	|	10	|	N/A	|
|	kwik hus ez	|	r6271, r6262, r4800	|	5	|	N/A	|
|	sfh	|	r4177	|	1	|	N/A	|
|	has e	|	r6289, r4234, r6287, r257, r1630267, r1630267, r1824287, r 5230, r5231	|	10	|	N/A	|
|	hit-z	|	r5230, r5231	|	3	|	N/A	|
|	wsr	|	r4426, r929, r3696, r3123, r3122	|	6	|	N/A	|
|	grinder	|	r2328133, r2328134, r3601, r3477, r3602, r3478, r2328154, r2654	|	10	|	N/A	|
|	drill bit	|	r5225, r4701, r4429, r5444, r1537, r1534, r4487	|	10	|	N/A	|
|	has-e	|	r6289, r4234, r6287, r257, r1630267, r1630267, r1824287, r 5230, r5231	|	10	|	N/A	|
|	tz	|	r6281, r4914, r6282	|	5	|	N/A	|
|	KWIK BOLT	|	r6281, r4914, r6292, r6296, r6294	|	8	|	N/A	|
|	hlc	|	r2529, r2508, r243, r2507, r248, r244, r247, r2530	|	10	|	N/A	|
|	KB TZ	|	r6281, r4914, r6282	|	5	|	N/A	|
|	wedge anchor	|	r6281, r4914, r6292, r6296, r6294	|	8	|	N/A	|
|	ceiling wire	|	r2530, r2349, r2572, r4589, r4220, r4588, r3774, r4126, r4127, r62364, r62363, r4085, r4084	|	15	|	N/A	|
|	hsl	|	r2813, r2815, r2814, r1198, r1197	|	6	|	N/A	|
|	hus-ez	|	r6271, r6262, r4800	|	5	|	N/A	|
|	has rods	|	r6289, r4234, r6287, r257, r1630267, r1630267, r1824287, r 5230, r5231	|	10	|	N/A	|
|	kbv	|	r1764635	|	1	|	N/A	|
|	hdi-p	|	r232, r4208885, r1956403, r247776	|	5	|	N/A	|
|	HUS-EZ	|	r6271, r6262, r4800	|	5	|	N/A	|
|	anchor bolts	|	r6281, r4914, r6282, r6281, r4914, r6292, r6296, r6294, r6289, r4234, r6287, r257, r1630267, r1630267, r1824287, r 5230, r5231	|	20	|	N/A	|
|	charger	|	2108815, 2109005, 2015764, 2015761, 2028878	|	8	|	N/A	|
|	hva	|	r190, r73278, r124882, r250, r4755, 	|	6	|	N/A	|
|	hvu	|	r190, r73278, r124882, r250, r4755	|	6	|	N/A	|
|	has-r	|	r5231, r6287, r4234, r261	|	6	|	N/A	|
|	pdc	|	r4890614	|	1	|	N/A	|
|	dsh	|	r4828495, r4828498	|	3	|	N/A	|
|	fire caulk	|	r3859360, r4754117, r4775, r3039443, r361, r1960535, r2322168	|	10	|	N/A	|
