--Calculating Proficiency on the NWEA using old OAA/OGT cutscores
WITH GRD AS (
	SELECT DISTINCT	STUDENT_ID
					,school_year
					,GRADE
	FROM SPPF..GRADE)

SELECT	NWEA.STUDENT_ID
		,GRD.GRADE
		,NWEA.TERM
		,NWEA.SCHOOL_YEAR
		,NWEA.SUBJECT_AREA
		,NWEA.RIT_SCORE
		,NWEA.PERCENTILE
		,'proficiency_cat' =
		CASE
			--------------------------FALL MATHEMATICS
						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=80		THEN	'advanced'
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=78		THEN	'advanced'
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=80		THEN	'advanced'
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=78		THEN	'advanced'
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=73		THEN	'advanced'
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=84		THEN	'advanced'
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=94		THEN	'advanced'
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	'advanced'
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	'advanced'
	
						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=59		THEN	'accelerated'
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=59		THEN	'accelerated'
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=65		THEN	'accelerated'
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=64		THEN	'accelerated'
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=56		THEN	'accelerated'
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=73		THEN	'accelerated'
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=66		THEN	'accelerated'
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=50		THEN	'accelerated'
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=50		THEN	'accelerated'

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=25		THEN	'proficient'
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=34		THEN	'proficient'
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=25		THEN	'proficient'
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=22		THEN	'proficient'
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=19		THEN	'proficient'
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=19		THEN	'proficient'

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=7		THEN	'basic'
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=20		THEN	'basic'
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=7		THEN	'basic'
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=1		THEN	'basic'
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=5		THEN	'basic'
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=5		THEN	'basic'

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<7		THEN	'limited'
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<20		THEN	'limited'
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<7		THEN	'limited'
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<1		THEN	'limited'
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<5		THEN	'limited'
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<5		THEN	'limited'

						--------------------------FALL READING
						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=70		THEN	'advanced'
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=71		THEN	'advanced'
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=90		THEN	'advanced'
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=88		THEN	'advanced'
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=81		THEN	'advanced'
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=81		THEN	'advanced'
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=80		THEN	'advanced'
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=83		THEN	'advanced'
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=83		THEN	'advanced'

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=45		THEN	'accelerated'
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=45		THEN	'accelerated'
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=62		THEN	'accelerated'
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=76		THEN	'accelerated'
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=60		THEN	'accelerated'
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=63		THEN	'accelerated'
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=52		THEN	'accelerated'
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=52		THEN	'accelerated'
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=52		THEN	'accelerated'

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=25		THEN	'proficient'
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=17		THEN	'proficient'
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=10		THEN	'proficient'
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=19		THEN	'proficient'
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=17		THEN	'proficient'
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=14		THEN	'proficient'
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=14		THEN	'proficient'

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=8		THEN	'basic'
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=1		THEN	'basic'
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<8		THEN	'limited'
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<1		THEN	'limited'
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'

--------------------------WINTER MATHEMATICS
						WHEN	GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=80		THEN	'advanced'
						WHEN	GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=80		THEN	'advanced'
						WHEN	GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=81		THEN	'advanced'
						WHEN	GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=79		THEN	'advanced'
						WHEN	GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	'advanced'
						WHEN	GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=84		THEN	'advanced'
						WHEN	GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=94		THEN	'advanced'
						WHEN	GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	'advanced'
						WHEN	GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	'advanced'

						WHEN	GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=59		THEN	'accelerated'
						WHEN	GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=59		THEN	'accelerated'
						WHEN	GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=65		THEN	'accelerated'
						WHEN	GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=66		THEN	'accelerated'
						WHEN	GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=58		THEN	'accelerated'
						WHEN	GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=73		THEN	'accelerated'
						WHEN	GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=66		THEN	'accelerated'
						WHEN	GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=51		THEN	'accelerated'
						WHEN	GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=51		THEN	'accelerated'

						WHEN	GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=27		THEN	'proficient'
						WHEN	GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=27		THEN	'proficient'
						WHEN	GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=25		THEN	'proficient'
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=34		THEN	'proficient'
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=25		THEN	'proficient'
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=22		THEN	'proficient'
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=20		THEN	'proficient'
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=20		THEN	'proficient'

						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=7		THEN	'basic'
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=21		THEN	'basic'
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=7		THEN	'basic'
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=1		THEN	'basic'
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=5		THEN	'basic'
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=5		THEN	'basic'

						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<7		THEN	'limited'
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<21		THEN	'limited'
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<7		THEN	'limited'
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<1		THEN	'limited'
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<5		THEN	'limited'
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<5		THEN	'limited'

--------------------------WINTER READING
						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=71		THEN	'advanced'
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=71		THEN	'advanced'
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=90		THEN	'advanced'
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=89		THEN	'advanced'
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=82		THEN	'advanced'
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=82		THEN	'advanced'
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=80		THEN	'advanced'
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=83		THEN	'advanced'
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=83		THEN	'advanced'

						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=47		THEN	'accelerated'
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=47		THEN	'accelerated'
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=62		THEN	'accelerated'
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=77		THEN	'accelerated'
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=62		THEN	'accelerated'
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=64		THEN	'accelerated'
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=54		THEN	'accelerated'
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=53		THEN	'accelerated'
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=53		THEN	'accelerated'

						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=18		THEN	'proficient'
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=10		THEN	'proficient'
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=19		THEN	'proficient'
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=18		THEN	'proficient'
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=14		THEN	'proficient'
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=14		THEN	'proficient'

						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=8		THEN	'basic'
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=1		THEN	'basic'
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'

						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<8		THEN	'limited'
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<1		THEN	'limited'
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'

--------------------------SPRING MATHEMATICS
						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=80		THEN	'advanced'
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=80		THEN	'advanced'
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=81		THEN	'advanced'
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=79		THEN	'advanced'
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	'advanced'
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=84		THEN	'advanced'
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=94		THEN	'advanced'
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	'advanced'
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	'advanced'

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=59		THEN	'accelerated'
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=59		THEN	'accelerated'
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=65		THEN	'accelerated'
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=66		THEN	'accelerated'
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=58		THEN	'accelerated'
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=73		THEN	'accelerated'
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=66		THEN	'accelerated'
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=51		THEN	'accelerated'
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=51		THEN	'accelerated'

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=27		THEN	'proficient'
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=27		THEN	'proficient'
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=25		THEN	'proficient'
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=34		THEN	'proficient'
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=25		THEN	'proficient'
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=22		THEN	'proficient'
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=20		THEN	'proficient'
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=20		THEN	'proficient'

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=7		THEN	'basic'
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=21		THEN	'basic'
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=7		THEN	'basic'
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=1		THEN	'basic'
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=5		THEN	'basic'
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=5		THEN	'basic'

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<7		THEN	'limited'
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<21		THEN	'limited'
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<7		THEN	'limited'
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<1		THEN	'limited'
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<5		THEN	'limited'
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<5		THEN	'limited'

--------------------------SPRING READING
						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=71		THEN	'advanced'
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=71		THEN	'advanced'
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=90		THEN	'advanced'
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=89		THEN	'advanced'
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=82		THEN	'advanced'
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=82		THEN	'advanced'
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=80		THEN	'advanced'
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=83		THEN	'advanced'
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=83		THEN	'advanced'

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=47		THEN	'accelerated'
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=47		THEN	'accelerated'
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=62		THEN	'accelerated'
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=77		THEN	'accelerated'
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=62		THEN	'accelerated'
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=64		THEN	'accelerated'
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=54		THEN	'accelerated'
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=53		THEN	'accelerated'
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=53		THEN	'accelerated'

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=18		THEN	'proficient'
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	'proficient'
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=10		THEN	'proficient'
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=19		THEN	'proficient'
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=18		THEN	'proficient'
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=14		THEN	'proficient'
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=14		THEN	'proficient'

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=6		THEN	'basic'
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=8		THEN	'basic'
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=1		THEN	'basic'
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	'basic'

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<6		THEN	'limited'
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<8		THEN	'limited'
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<1		THEN	'limited'
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	'limited'
				ELSE	NULL
		END

		,'performance_level'	=
			CASE	
						--------------------------FALL MATHEMATICS
						WHEN GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=80		THEN	11
						WHEN GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=78		THEN	11
						WHEN GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=80		THEN	11
						WHEN GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=78		THEN	11
						WHEN GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=73		THEN	11
						WHEN GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=84		THEN	11
						WHEN GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=94		THEN	11
						WHEN GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	11
						WHEN GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	11

						WHEN GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=59		THEN	12
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=59		THEN	12
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=65		THEN	12
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=64		THEN	12
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=56		THEN	12
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=73		THEN	12
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=66		THEN	12
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=50		THEN	12
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=50		THEN	12

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=25		THEN	13
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=34		THEN	13
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=25		THEN	13
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=22		THEN	13
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=19		THEN	13
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=19		THEN	13
	
						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=7		THEN	14
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=20		THEN	14
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=7		THEN	14
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=1		THEN	14
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=5		THEN	14
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=5		THEN	14

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<7		THEN	15
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<20		THEN	15
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<7		THEN	15
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<1		THEN	15
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<5		THEN	15
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<5		THEN	15

--------------------------FALL READING
						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=70		THEN	11
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=71		THEN	11
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=90		THEN	11
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=88		THEN	11
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=81		THEN	11
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=81		THEN	11
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=80		THEN	11
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=83		THEN	11
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=83		THEN	11

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=45		THEN	12
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=45		THEN	12
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=62		THEN	12
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=76		THEN	12
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=60		THEN	12
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=63		THEN	12
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=52		THEN	12
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=52		THEN	12
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=52		THEN	12

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=25		THEN	13
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=17		THEN	13
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=10		THEN	13
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=19		THEN	13
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=17		THEN	13
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=14		THEN	13
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=14		THEN	13

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=8		THEN	14
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=1		THEN	14
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14

						WHEN	GRD.GRADE='02' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN	GRD.GRADE='03' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN	GRD.GRADE='04' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15
						WHEN	GRD.GRADE='05' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<8		THEN	15
						WHEN	GRD.GRADE='06' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<1		THEN	15
						WHEN	GRD.GRADE='07' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15
						WHEN	GRD.GRADE='08' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15
						WHEN	GRD.GRADE='09' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15
						WHEN	GRD.GRADE='10' AND TERM='Fall' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15

						--------------------------WINTER MATHEMATICS
						WHEN	GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=80		THEN	11
						WHEN	GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=80		THEN	11
						WHEN	GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=81		THEN	11
						WHEN	GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=79		THEN	11
						WHEN	GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	11
						WHEN	GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=84		THEN	11
						WHEN	GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=94		THEN	11
						WHEN	GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	11
						WHEN	GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	11

						WHEN	GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=59		THEN	12
						WHEN	GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=59		THEN	12
						WHEN	GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=65		THEN	12
						WHEN	GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=66		THEN	12
						WHEN	GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=58		THEN	12
						WHEN	GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=73		THEN	12
						WHEN	GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=66		THEN	12
						WHEN	GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=51		THEN	12
						WHEN	GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=51		THEN	12

						WHEN	GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=27		THEN	13
						WHEN	GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=27		THEN	13
						WHEN	GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=25		THEN	13
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=34		THEN	13
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=25		THEN	13
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=22		THEN	13
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=20		THEN	13
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=20		THEN	13

						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=7		THEN	14
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=21		THEN	14
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=7		THEN	14
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=1		THEN	14
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=5		THEN	14
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=5		THEN	14

						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<7		THEN	15
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<21		THEN	15
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<7		THEN	15
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<1		THEN	15
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<5		THEN	15
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<5		THEN	15

-------------------------WINTER READING
						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=71		THEN	11
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=71		THEN	11
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=90		THEN	11
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=89		THEN	11
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=82		THEN	11
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=82		THEN	11
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=80		THEN	11
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=83		THEN	11
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=83		THEN	11

						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=47		THEN	12
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=47		THEN	12
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=62		THEN	12
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=77		THEN	12
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=62		THEN	12
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=64		THEN	12
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=54		THEN	12
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=53		THEN	12
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=53		THEN	12

						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=18		THEN	13
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=10		THEN	13
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=19		THEN	13
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=18		THEN	13
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=14		THEN	13
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=14		THEN	13

						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=8		THEN	14
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=1		THEN	14
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14

						WHEN GRD.GRADE='02' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN GRD.GRADE='03' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN GRD.GRADE='04' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15
						WHEN GRD.GRADE='05' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<8		THEN	15
						WHEN GRD.GRADE='06' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<1		THEN	15
						WHEN GRD.GRADE='07' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15
						WHEN GRD.GRADE='08' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15
						WHEN GRD.GRADE='09' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15
						WHEN GRD.GRADE='10' AND TERM='Winter' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15

-----------------------SPRING MATHEMATICS
						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=80		THEN	11
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=80		THEN	11
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=81		THEN	11
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=79		THEN	11
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	11
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=84		THEN	11
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=94		THEN	11
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	11
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=74		THEN	11

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=59		THEN	12
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=59		THEN	12
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=65		THEN	12
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=66		THEN	12
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=58		THEN	12
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=73		THEN	12
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=66		THEN	12
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=51		THEN	12
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=51		THEN	12

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=27		THEN	13
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=27		THEN	13
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=25		THEN	13
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=34		THEN	13
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=25		THEN	13
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=22		THEN	13
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=20		THEN	13
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=20		THEN	13

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=7		THEN	14
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=21		THEN	14
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=7		THEN	14
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=1		THEN	14
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=5		THEN	14
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE>=5		THEN	14

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<7		THEN	15
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<21		THEN	15
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<7		THEN	15
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<1		THEN	15
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<5		THEN	15
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Mathematics' 
						AND NWEA.PERCENTILE<5		THEN	15

--------------------------SPRING READING
						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=71		THEN	11
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=71		THEN	11
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=90		THEN	11
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=89		THEN	11
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=82		THEN	11
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=82		THEN	11
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=80		THEN	11
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=83		THEN	11
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=83		THEN	11

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=47		THEN	12
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=47		THEN	12
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=62		THEN	12
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=77		THEN	12
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=62		THEN	12
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=64		THEN	12
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=54		THEN	12
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=53		THEN	12
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=53		THEN	12

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=18		THEN	13
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=26		THEN	13
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=10		THEN	13
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=19		THEN	13
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=18		THEN	13
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=14		THEN	13
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=14		THEN	13

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=6		THEN	14
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=8		THEN	14
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=1		THEN	14
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE>=2		THEN	14

						WHEN GRD.GRADE='02' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN GRD.GRADE='03' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<6		THEN	15
						WHEN GRD.GRADE='04' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15
						WHEN GRD.GRADE='05' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<8		THEN	15
						WHEN GRD.GRADE='06' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<1		THEN	15
						WHEN GRD.GRADE='07' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15
						WHEN GRD.GRADE='08' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15
						WHEN GRD.GRADE='09' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15
						WHEN GRD.GRADE='10' AND TERM='Spring' AND SUBJECT_AREA='Reading' 
						AND NWEA.PERCENTILE<2		THEN	15

				ELSE	NULL
			END
FROM SPPF..NWEA_SCORE	AS	NWEA
LEFT JOIN GRD ON NWEA.student_id = GRD.student_id AND NWEA.school_year = GRD.school_year
WHERE GRD.GRADE IN ('02', '03', '04', '05', '06', '07', '08', '09', '10')