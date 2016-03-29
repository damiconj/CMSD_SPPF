WITH nwea_fall as (
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
				,nwea.SUBJECT_AREA			AS		test_subject
				,performance_level			AS		performance_level
				,COUNT(FAY.STUDENT_ID)		AS		stu_n
		FROM SPPF..FAY_SUBGROUPS_V		AS	FAY
		LEFT JOIN SPPF..NWEA_PROFICIENCY_LEGACY_V	AS	NWEA
		ON FAY.STUDENT_ID = NWEA.STUDENT_ID AND FAY.SCHOOL_YEAR=NWEA.school_year
		WHERE FAY.GRADE IN ('03', '04', '05', '06', '07', '08')
		AND TERM='Fall'
		AND SUBJECT_AREA in ('Reading', 'Mathematics')
		AND fay.school_year>2014
		GROUP BY FAY.SCHOOL_CODE, FAY.SCHOOL_YEAR, performance_level, subject_area
		) as source_table
		
		PIVOT
		(
		max(stu_n) FOR performance_level in ([11], [12], [13], [14], [15])
		) as pivot_table
		)
		,

		nwea_winter as (
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
				,nwea.SUBJECT_AREA			AS		test_subject
				,performance_level			AS		performance_level
				,COUNT(FAY.STUDENT_ID)		AS		stu_n
		FROM SPPF..FAY_SUBGROUPS_V		AS	FAY
		LEFT JOIN SPPF..NWEA_PROFICIENCY_LEGACY_V	AS	NWEA
		ON FAY.STUDENT_ID = NWEA.STUDENT_ID AND FAY.SCHOOL_YEAR=NWEA.school_year
		WHERE FAY.GRADE IN ('03', '04', '05', '06', '07', '08')
		AND TERM='Winter'
		AND SUBJECT_AREA in ('Reading', 'Mathematics')
		AND fay.school_year>2014
		GROUP BY FAY.SCHOOL_CODE, FAY.SCHOOL_YEAR, performance_level, subject_area
		) as source_table
		
		PIVOT
		(
		max(stu_n) FOR performance_level in ([11], [12], [13], [14], [15])
		) as pivot_table
		)
		
SELECT	nwea_fall.school_code
		,nwea_fall.school_year
		,nwea_fall.test_subject
		,round((nwea_fall.adv_n +nwea_fall.acc_n + nwea_fall.prf_n) / 
		(nwea_fall.adv_n+nwea_fall.acc_n+nwea_fall.prf_n+nwea_fall.bsc_n+nwea_fall.lmt_n)*100 , 1)
												AS		prof_fall_perc
		,nwea_fall.adv_n+nwea_fall.acc_n+nwea_fall.prf_n+nwea_fall.bsc_n+nwea_fall.lmt_n
												AS		stu_fall_n
		,round((nwea_winter.adv_n +nwea_winter.acc_n + nwea_winter.prf_n) / 
		(nwea_winter.adv_n+nwea_winter.acc_n+nwea_winter.prf_n+nwea_winter.bsc_n+nwea_winter.lmt_n)*100 , 1)
												AS		prof_winter_perc
		,nwea_winter.adv_n+nwea_winter.acc_n+nwea_winter.prf_n+nwea_winter.bsc_n+nwea_winter.lmt_n
												AS		stu_winter_n

/*
	   Name:	prof_k8_est_legacy_v
	   Author:	Damico, Nicholas J
	   Purpose:	Query that estimates the percentage of students proficient or better according to legacy state 
	   testing data (OAA, OGT) by subject and year for all students and in a school. NWEA data is used to make the
	   proficiency estimates. Estimates are for ELA and Math ONLY. 
	   Change Log:
	   Date		        Who				       What
	   *************   **********************  ****************
	   24-Mar-2016	    Damico, Nicholas J	   Initial creation
	   		
*/
FROM nwea_fall			
left join nwea_winter
ON nwea_fall.school_code=nwea_winter.school_code 
AND nwea_fall.school_year=nwea_winter.school_year 
AND nwea_fall.test_subject=nwea_winter.test_subject
order by school_code, school_year, test_subject
