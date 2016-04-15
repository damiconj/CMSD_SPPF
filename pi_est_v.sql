WITH perf_win_n as (
		SELECT	SCHOOL_CODE								AS	school_code
				,SCHOOL_YEAR							AS	school_year
				,'Winter'								AS	term
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
		LEFT JOIN SPPF..NWEA_PROFICIENCY_CCSTD_V	AS	NWEA
		ON FAY.STUDENT_ID = NWEA.STUDENT_ID AND FAY.SCHOOL_YEAR=NWEA.SCHOOL_YEAR
		WHERE FAY.GRADE IN ('03', '04', '05', '06', '07', '08', '09', '10')
		AND term='Winter' AND fay.school_year>2014
		GROUP BY FAY.SCHOOL_CODE, FAY.SCHOOL_YEAR, performance_level
		) as source_table
		
		PIVOT
		(
		max(stu_n) FOR performance_level in ([11], [12], [13], [14], [15])
		) as pivot_table
		)

		,
	perf_fall_n as (
		SELECT	SCHOOL_CODE								AS	school_code
				,SCHOOL_YEAR							AS	school_year
				,cast(isnull([11], 0) as float)			AS	adv_n
				,cast(isnull([12], 0) as float)			AS	acc_n
				,cast(isnull([13], 0) as float)			AS	prf_n
				,cast(isnull([14], 0) as float)			AS	bsc_n
				,cast(isnull([15], 0) as float)			AS	lmt_n
				,'Fall'									AS	term
		FROM 
		(SELECT	FAY.SCHOOL_CODE				AS		school_code
				,FAY.SCHOOL_YEAR			AS		school_year
				,performance_level			AS		performance_level
				,COUNT(FAY.STUDENT_ID)		AS		stu_n
		FROM SPPF..FAY_SUBGROUPS_V		AS	FAY
		LEFT JOIN SPPF..NWEA_PROFICIENCY_CCSTD_V	AS	NWEA
		ON FAY.STUDENT_ID = NWEA.STUDENT_ID AND FAY.SCHOOL_YEAR=NWEA.SCHOOL_YEAR
		WHERE FAY.GRADE IN ('03', '04', '05', '06', '07', '08', '09', '10')
		AND term='Fall'  AND fay.school_year>2014
		GROUP BY FAY.SCHOOL_CODE, FAY.SCHOOL_YEAR, performance_level
		) as source_table
		
		PIVOT
		(
		max(stu_n) FOR performance_level in ([11], [12], [13], [14], [15])
		) as pivot_table
		)


SELECT	perf_fall_n.school_code
		,perf_fall_n.school_year
		,perf_fall_n.term
		,round((perf_fall_n.adv_n / 
		(perf_fall_n.adv_n+perf_fall_n.acc_n+perf_fall_n.prf_n+perf_fall_n.bsc_n+perf_fall_n.lmt_n) ) * 120 +
		(perf_fall_n.acc_n / 
		(perf_fall_n.adv_n+perf_fall_n.acc_n+perf_fall_n.prf_n+perf_fall_n.bsc_n+perf_fall_n.lmt_n) ) * 110 +
		(perf_fall_n.prf_n / 
		(perf_fall_n.adv_n+perf_fall_n.acc_n+perf_fall_n.prf_n+perf_fall_n.bsc_n+perf_fall_n.lmt_n) ) * 100 +
		(perf_fall_n.bsc_n / 
		(perf_fall_n.adv_n+perf_fall_n.acc_n+perf_fall_n.prf_n+perf_fall_n.bsc_n+perf_fall_n.lmt_n) ) * 60 +
		(perf_fall_n.lmt_n / 
		(perf_fall_n.adv_n+perf_fall_n.acc_n+perf_fall_n.prf_n+perf_fall_n.bsc_n+perf_fall_n.lmt_n) ) * 30, 1)
												AS		pi_points_est

/*
	   Name:		pi_est_v
	   Author:	Damico, Nicholas J
	   Purpose:	Query that estimates the Performance Index Points for a school, based on linkage between NWEA
	   data and the legacy state tests (OAA, OGT). PI estimates include READING AND MATH ONLY. Actual PI 
	   calculations will include additional subjects. Estimates assume NWEA testing sample is representative of 
	   End of Year testing population.
	   Change Log:
	   Date		    Who				   What
	   *************   **********************  ****************
	   23-Mar-2016	    Damico, Nicholas J	   Initial creation
	   14-Apr-2016		Damico, Nicholas J		Changed the grade levels for the query		
*/
FROM perf_fall_n
UNION
SELECT	perf_win_n.school_code
		,perf_win_n.school_year
		,term
		,round((perf_win_n.adv_n / 
		(perf_win_n.adv_n+perf_win_n.acc_n+perf_win_n.prf_n+perf_win_n.bsc_n+perf_win_n.lmt_n) ) * 120 +
		(perf_win_n.acc_n / 
		(perf_win_n.adv_n+perf_win_n.acc_n+perf_win_n.prf_n+perf_win_n.bsc_n+perf_win_n.lmt_n) ) * 110 +
		(perf_win_n.prf_n / 
		(perf_win_n.adv_n+perf_win_n.acc_n+perf_win_n.prf_n+perf_win_n.bsc_n+perf_win_n.lmt_n) ) * 100 +
		(perf_win_n.bsc_n / 
		(perf_win_n.adv_n+perf_win_n.acc_n+perf_win_n.prf_n+perf_win_n.bsc_n+perf_win_n.lmt_n) ) * 60 +
		(perf_win_n.lmt_n / 
		(perf_win_n.adv_n+perf_win_n.acc_n+perf_win_n.prf_n+perf_win_n.bsc_n+perf_win_n.lmt_n) ) * 30, 1)
												AS		pi_points_est
FROM perf_win_n
order by school_code, school_year
