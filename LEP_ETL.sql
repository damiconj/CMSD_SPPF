IF(OBJECT_ID('tempdb..#PIV1') Is Not NULL)
Begin
	Drop TABLE PIV1
END

SELECT	STUDENT_ID,
		"laucode2010" =
		CASE
			WHEN cast(LAUCURRENTSTART as date)<'10/15/2009' THEN LAUCURRENT
			WHEN cast(LAU4START as date)<'10/15/2009' THEN LAU4
			WHEN cast(LAU3START as date)<'10/15/2009' THEN LAU3
			WHEN cast(LAU2START as date)<'10/15/2009' THEN LAU2
			WHEN cast(LAU1START as date)<'10/15/2009' THEN LAU1
			ELSE ''  
		END,
		"laucode2011" =
		CASE
			WHEN cast(LAUCURRENTSTART as date)<'10/15/2010' THEN LAUCURRENT
			WHEN cast(LAU4START as date)<'10/15/2010' THEN LAU4
			WHEN cast(LAU3START as date)<'10/15/2010' THEN LAU3
			WHEN cast(LAU2START as date)<'10/15/2010' THEN LAU2
			WHEN cast(LAU1START as date)<'10/15/2010' THEN LAU1
			ELSE ''  
		END,
		"laucode2012" =
		CASE
			WHEN cast(LAUCURRENTSTART as date)<'10/15/2011' THEN LAUCURRENT
			WHEN cast(LAU4START as date)<'10/15/2011' THEN LAU4
			WHEN cast(LAU3START as date)<'10/15/2011' THEN LAU3
			WHEN cast(LAU2START as date)<'10/15/2011' THEN LAU2
			WHEN cast(LAU1START as date)<'10.15.2011' THEN LAU1
			ELSE ''  
		END,
		"laucode2013" =
		CASE
			WHEN cast(LAUCURRENTSTART as date)<'10/15/2012' THEN LAUCURRENT
			WHEN cast(LAU4START as date)<'10/15/2012' THEN LAU4
			WHEN cast(LAU3START as date)<'10/15/2012' THEN LAU3
			WHEN cast(LAU2START as date)<'10/15/2012' THEN LAU2
			WHEN cast(LAU1START as date)<'10/15/2012' THEN LAU1
			ELSE ''  
		END,
		"laucode2014" =
		CASE
			WHEN cast(LAUCURRENTSTART as date)<'10/15/2013' THEN LAUCURRENT
			WHEN cast(LAU4START as date)<'10/15/2013' THEN LAU4
			WHEN cast(LAU3START as date)<'10/15/2013' THEN LAU3
			WHEN cast(LAU2START as date)<'10/15/2013' THEN LAU2
			WHEN cast(LAU1START as date)<'10/15/2013' THEN LAU1
			ELSE ''  
		END,
		"laucode2015" =
		CASE
			WHEN cast(LAUCURRENTSTART as date)<'10/15/2014' THEN LAUCURRENT
			WHEN cast(LAU4START as date)<'10/15/2014' THEN LAU4 
			WHEN cast(LAU3START as date)<'10/15/2014' THEN LAU3
			WHEN cast(LAU2START as date)<'10/15/2014' THEN LAU2
			WHEN cast(LAU1START as date)<'10/15/2014' THEN LAU1
			ELSE ''  
		END,
		"laucode2016" =
		CASE
			WHEN cast(LAUCURRENTSTART as date)<'10/15/2015' THEN LAUCURRENT
			WHEN cast(LAU4START as date)<'10/15/2015' THEN LAU4
			WHEN cast(LAU3START as date)<'10/15/2015' THEN LAU3
			WHEN cast(LAU2START as date)<'10/15/2015' THEN LAU2
			WHEN cast(LAU1START as date)<'10/15/2015' THEN LAU1
			ELSE ''  
		END
INTO #PIV1
FROM (	select 
		STUDENT_ID,
		CASE
			WHEN	FIELD_VALUE IS NULL	
			THEN	NULL
			WHEN	FIELD_VALUE	= 'NULL'
			THEN	NULL
			WHEN	FIELD_VALUE = ''
			THEN	NULL
			WHEN	FIELD_VALUE IS NOT NULL
			THEN	rtrim(FIELD_VALUE)
		END						AS	VALUE,
		"TEMPNAME" =
		CASE
			WHEN FIELD_NUMBER = 478 THEN 'LAUCURRENT'
			WHEN FIELD_NUMBER = 479 THEN 'LAUCURRENTSTART'
			WHEN FIELD_NUMBER = 464 THEN 'LAU1'
			WHEN FIELD_NUMBER = 465 THEN 'LAU1START'
			WHEN FIELD_NUMBER = 466 THEN 'LAU1END'
			WHEN FIELD_NUMBER = 468 THEN 'LAU2'
			WHEN FIELD_NUMBER = 469 THEN 'LAU2START'
			WHEN FIELD_NUMBER = 470 THEN 'LAU2END'
			WHEN FIELD_NUMBER = 472 THEN 'LAU3'
			WHEN FIELD_NUMBER = 473 THEN 'LAU3START'
			WHEN FIELD_NUMBER = 474 THEN 'LAU3END'
			WHEN FIELD_NUMBER = 481 THEN 'LAU4'
			WHEN FIELD_NUMBER = 482 THEN 'LAU4START'
			WHEN FIELD_NUMBER = 483 THEN 'LAU4END'
			WHEN FIELD_NUMBER = 476 THEN 'HASLAU'
		END
		from CLEeSchool_Live..REG_USER
		where SCREEN_NUMBER = 2002 AND FIELD_NUMBER IN (478, 479, 464, 465, 466, 468, 469, 470, 472, 473, 474, 481, 482, 483, 476)
		) as LAU
		
		PIVOT

		(MAX(VALUE)
		FOR TEMPNAME IN (LAUCURRENT, LAUCURRENTSTART, LAU1, LAU1START, LAU1END, LAU2, LAU2START, 
						 LAU2END, LAU3, LAU3START, LAU3END, LAU4, LAU4START, LAU4END , HASLAU)) AS PIV  
WHERE STUDENT_ID <> 'student_id'
ORDER BY STUDENT_ID     

SELECT	student_id,
		laucode,
		"school_year" = 
		CASE
			WHEN year = 'laucode2010' THEN	'2010'
			WHEN year = 'laucode2011' THEN	'2011'
			WHEN year = 'laucode2012' THEN	'2012'
			WHEN year = 'laucode2013' THEN	'2013'
			WHEN year = 'laucode2014' THEN	'2014'
			WHEN year = 'laucode2015' THEN	'2015'
			WHEN year = 'laucode2016' THEN	'2016'
		END
FROM #PIV1
UNPIVOT
(laucode FOR year IN ([laucode2010], [laucode2011], [laucode2012], [laucode2013], [laucode2014], [laucode2015], [laucode2016])
)	AS unpvt
WHERE laucode<> ''
ORDER BY STUDENT_ID  