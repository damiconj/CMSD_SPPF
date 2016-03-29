WITH perf_n as (
		SELECT	SCHOOL_CODE
				,SCHOOL_YEAR
				,test_subject
				,cast(isnull([11], 0) as float)			AS	adv_n
				,cast(isnull([12], 0) as float)			AS	acc_n
				,cast(isnull([13], 0) as float)			AS	prf_n
				,cast(isnull([14], 0) as float)			AS	bsc_n
				,cast(isnull([15], 0) as float)			AS	lmt_n
		FROM 
		(SELECT	FAY.SCHOOL_CODE				AS		school_code
				,FAY.SCHOOL_YEAR			AS		school_year
				,test_subject				AS		test_subject
				,performance_level			AS		performance_level
				,COUNT(FAY.STUDENT_ID)		AS		stu_n
		FROM SPPF..FAY_SUBGROUPS_V		AS	FAY
		LEFT JOIN SPPF..OAA_OGT_TESTS	AS	OAA
		ON FAY.STUDENT_ID = OAA.STUDENT_ID AND FAY.SCHOOL_YEAR=datepart(YEAR, OAA.TEST_DATE)
		WHERE TEST_TYPE IN ('OGT') 
		AND	FAY.GRADE IN ('10')
		AND (DATEPART(MONTH, test_date)>=3 and DATEPART(month,test_date)<6)
		AND SCHOOL_YEAR<2015
		GROUP BY FAY.SCHOOL_CODE, FAY.SCHOOL_YEAR, performance_level, test_subject
		) as source_table
		
		PIVOT
		(
		max(stu_n) FOR performance_level in ([11], [12], [13], [14], [15])
		) as pivot_table
		)
		
SELECT	perf_n.school_code
		,perf_n.school_year
		,perf_n.test_subject
		,round((perf_n.adv_n +perf_n.acc_n + perf_n.prf_n) / 
		(perf_n.adv_n+perf_n.acc_n+perf_n.prf_n+perf_n.bsc_n+perf_n.lmt_n)*100 , 1)
												AS		prof_perc
		,perf_n.adv_n+perf_n.acc_n+perf_n.prf_n+perf_n.bsc_n+perf_n.lmt_n
												AS		stu_n

/*
	   Name:	prof_hs_legacy_v
	   Author:	Damico, Nicholas J
	   Purpose:	Query that calcualtes the percentage of students proficient or higher by subject and year for all 
	   students in a school, based on legacy state testing data (OAA, OGT). Student totals for the denominator are 
	   based on total number of tests and would miss untested students that should be in the denominator. 
	   PROF_LEVEL_STATE_AUDIT has official state data that can be used to calculate total percentage proficient 
	   or higher.
	   Change Log:
	   Date		        Who				       What
	   *************   **********************  ****************
	   24-Mar-2016	    Damico, Nicholas J	   Initial creation
	   		
*/
FROM perf_n
order by school_code, school_year, test_subject