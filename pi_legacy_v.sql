WITH perf_n as (
		SELECT	SCHOOL_CODE
				,SCHOOL_YEAR
				,cast(isnull([11], 0) as float)			AS	adv_n
				,cast(isnull([12], 0) as float)			AS	acc_n
				,cast(isnull([13], 0) as float)			AS	prf_n
				,cast(isnull([14], 0) as float)			AS	bsc_n
				,cast(isnull([15], 0) as float)			AS	lmt_n
		FROM 
		(SELECT	FAY.SCHOOL_CODE				AS		school_code
				,FAY.SCHOOL_YEAR			AS		school_year
				,performance_level			AS		performance_level
				,COUNT(FAY.STUDENT_ID)		AS		stu_n
		FROM SPPF..FAY_SUBGROUPS_V		AS	FAY
		LEFT JOIN SPPF..OAA_OGT_TESTS	AS	OAA
		ON FAY.STUDENT_ID = OAA.STUDENT_ID AND FAY.SCHOOL_YEAR=datepart(YEAR, OAA.TEST_DATE)
		WHERE TEST_TYPE IN ('OAA', 'OGT') 
		AND	FAY.GRADE IN ('03', '04', '05', '06', '07', '08', '10')
		AND (DATEPART(MONTH, test_date)>=3 and DATEPART(month,test_date)<6)
		AND SCHOOL_YEAR<2015
		GROUP BY FAY.SCHOOL_CODE, FAY.SCHOOL_YEAR, performance_level
		) as source_table
		
		PIVOT
		(
		max(stu_n) FOR performance_level in ([11], [12], [13], [14], [15])
		) as pivot_table
		)

SELECT	perf_n.school_code
		,perf_n.school_year
		,round((adv_n / (adv_n+acc_n+prf_n+bsc_n+lmt_n) ) * 120 +
		(acc_n / (adv_n+acc_n+prf_n+bsc_n+lmt_n) ) * 110 +
		(prf_n / (adv_n+acc_n+prf_n+bsc_n+lmt_n) ) * 100 +
		(bsc_n / (adv_n+acc_n+prf_n+bsc_n+lmt_n) ) * 60 +
		(lmt_n / (adv_n+acc_n+prf_n+bsc_n+lmt_n) ) * 30, 1)
												AS		pi_points
/*
	   Name:		pi_legacy_v
	   Author:	Damico, Nicholas J
	   Purpose:	Query that calcualtes the Performance Index Points for a school, based on legacy state testing 
	   data (OAA, OGT). Student totals for the denominator are based on total number of tests and would miss 
	   untested students that should be in the denominator. PI_STATE_AUDIT table has state audited PI results.
	   Change Log:
	   Date		    Who				   What
	   *************   **********************  ****************
	   23-Mar-2016	    Damico, Nicholas J	   Initial creation
	   		
*/
FROM perf_n
order by school_code, school_year
