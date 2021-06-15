* Encoding: UTF-8.
* Step 2.
FREQUENCIES sex d1
    /STATISTICS min max mean median stddev.
RECODE sex ('male' = 0) ('female' = 1) into female. /*Needed to recode into numeric variable.
FREQUENCIES female
    /STATISTICS min max mean median stddev.

FREQUENCIES female d1
    /STATISTICS min max mean median stddev.
*a) 107 female patients.
*b) 92 patients have never been hospitalized for medical problems.
*c) 83.2% of patients in the study have been hospitalized fewer than 5 times.

* Step 3.
TEMPORARY.
SELECT IF substance = 'cocaine' AND age GE 40.
FREQUENCIES age.
*a) 17 patients in this subset are between the ages of 40 and 45.

* Step 4.
TEMPORARY.
SELECT IF substance = 'cocaine' AND age GE 40.
FREQUENCIES female.
*a) 27.
*b) 74.1%.