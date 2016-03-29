WITH perf_lep_n as (
		SELECT	SCHOOL_CODE
				,SCHOOL_YEAR
				,test_subject
				,cast(isnull([5], 0) as float)			AS	adv_n
				,cast(isnull([4], 0) as float)			AS	acc_n
				,cast(isnull([3], 0) as float)			AS	prf_n
				,cast(isnull([2], 0) as float)			AS	bsc_n
				,cast(isnull([1], 0) as float)			AS	lmt_n
				,cast(isnull([0], 0) as float)			AS	unt_n
		FROM 
		(SELECT	FAY.SCHOOL_CODE							AS		school_code
				,FAY.SCHOOL_YEAR						AS		school_year
				,subject_description					AS		test_subject
				,isnull(SUM_PERFORMANCE_LEVEL, 0)		AS		performance_level
				,COUNT(FAY.STUDENT_ID)					AS		stu_n
		FROM SPPF..FAY_SUBGROUPS_V						AS	FAY 
		INNER JOIN SPPF..STUDENT						AS	STU
		ON FAY.STUDENT_ID = STU.STUDENT_ID
		LEFT JOIN SPPF..PARCC_TEST						AS	PARCC
		ON STU.STATE_STUDENT_ID = PARCC.STATE_STUDENT_ID AND FAY.SCHOOL_YEAR=PARCC.SCHOOL_YEAR
		WHERE FAY.GRADE IN ('03', '04', '05', '06', '07', '08')
		AND EXAM_TERM = 'Spring'
		AND FAY.SCHOOL_YEAR>=2015
		AND LEP = 1
		GROUP BY FAY.SCHOOL_CODE, FAY.SCHOOL_YEAR, sum_performance_level, SUBJECT_DESCRIPTION
		) as source_table
		
		PIVOT
		(
		max(stu_n) FOR performance_level in ([0], [1], [2], [3], [4], [5])
		) as pivot_table
		)
		
SELECT	perf_lep_n.school_code
		,perf_lep_n.school_year
		,perf_lep_n.test_subject
		,round((perf_lep_n.adv_n +perf_lep_n.acc_n + perf_lep_n.prf_n) / 
		(nullif(perf_lep_n.adv_n+perf_lep_n.acc_n+perf_lep_n.prf_n+perf_lep_n.bsc_n+perf_lep_n.lmt_n, 0))*100 , 1)
												AS		prof_perc
		,perf_lep_n.adv_n+perf_lep_n.acc_n+perf_lep_n.prf_n+perf_lep_n.bsc_n+perf_lep_n.lmt_n
												AS		lep_n

/*
	   Name:	prof_k8_lep_v
	   Author:	Damico, Nicholas J
	   Purpose:	Query that calcualtes the percentage of Limited English Proficiency (LEP) students proficient or 
	   higher by subject and year for all students in a school, based on common core state testing data (PARCC, AIR). 
	   Student totals for the denominator are based on students in testing table and potentially miss untested 
	   students that have no records there. PROF_LEVEL_STATE_AUDIT has official state data that can be used to 
	   calculate total percentage proficient or higher.
	   Change Log:
	   Date		        Who				       What
	   *************   **********************  ****************
	   28-Mar-2016	    Damico, Nicholas J	   Initial creation
	   		
*/
FROM perf_lep_n
order by school_code, school_year, test_subject