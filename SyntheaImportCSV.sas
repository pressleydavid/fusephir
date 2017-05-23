/* Generated Code (IMPORT) */
/* Source File: conditions.csv */
/* Source Path: /folders/myfolders/synthea/csv */
/* Code generated on: 5/22/17, 8:53 PM */


libname synthea '/folders/myfolders/synthea/csv/';
FILENAME ALLRGS '/folders/myfolders/synthea/csv/allergies.csv';
FILENAME CRPLNS '/folders/myfolders/synthea/csv/careplans.csv';
FILENAME CNDTNS '/folders/myfolders/synthea/csv/conditions.csv';
FILENAME NCNTRS '/folders/myfolders/synthea/csv/encounters.csv';
FILENAME MNZTNS '/folders/myfolders/synthea/csv/immunizations.csv';
FILENAME MDCTNS '/folders/myfolders/synthea/csv/medications.csv';
FILENAME BSRVNS '/folders/myfolders/synthea/csv/observations.csv';
FILENAME PTNTSS '/folders/myfolders/synthea/csv/patients.csv';
FILENAME PRCDRS '/folders/myfolders/synthea/csv/procedures.csv';



proc import lrecl=max datafile=CNDTNS replace
	dbms=CSV
	out=synthea.conditions(where=(code in(44054006)));
	getnames=yes;
	guessingrows=32767;
run;


%let usubjid=;
proc sql noprint;
	select "'"||(trim(patient))||"'" into: usubjid separated by ','
	from synthea.conditions;
quit;
%put &usubjid;

proc import datafile=ALLRGS replace
	dbms=CSV
	out=synthea.allergies(where=(patient in(&usubjid)));
	getnames=YES;
	guessingrows=32767;
run;

proc import datafile=CRPLNS replace
	dbms=CSV
	out=synthea.careplans(where=(patient in(&usubjid)));
	getnames=YES;
	guessingrows=32767;
run;

proc import datafile=NCNTRS replace
	dbms=CSV
	out=synthea.encounters(where=(patient in(&usubjid)));
	getnames=YES;
	guessingrows=32767;
run;

proc import datafile=MNZTNS replace
	dbms=CSV
	out=synthea.immunizations(where=(patient in(&usubjid)));
	getnames=YES;
	guessingrows=32767;
run;

proc import datafile=MDCTNS replace
	dbms=CSV
	out=synthea.medications(where=(patient in(&usubjid)));
	getnames=YES;
	guessingrows=32767;
run;

proc import datafile=BSRVNS replace
	dbms=CSV
	out=synthea.observations(where=(patient in(&usubjid)));
	getnames=YES;
	guessingrows=32767;
run;

proc import datafile=PTNTSS replace
	dbms=CSV
	out=synthea.patients(where=(id in(&usubjid)));
	getnames=YES;
	guessingrows=32767;
run;

proc import datafile=PRCDRS replace
	dbms=CSV
	out=synthea.procedures(where=(patient in(&usubjid)));
	getnames=YES;
run;

/*	PROC CONTENTS DATA=WORK.CONDITIONS; run;	*/


/*		%web_open_table(WORK.CONDITIONS);	*/
