# Table of Contents
- [Codebooks](https://github.com/sarakyeo/sarakyeo.github.io/blob/master/COMM-3710/LA/README.MD#codebooks)
  - [HELP dataset](https://github.com/sarakyeo/sarakyeo.github.io/blob/master/COMM-3710/LA/README.MD#help-dataset)
  - [CPS dataset](https://github.com/sarakyeo/sarakyeo.github.io/blob/master/COMM-3710/LA/README.MD#cps-dataset)
  - [Utilities dataset](https://github.com/sarakyeo/sarakyeo.github.io/blob/master/COMM-3710/LA/README.MD#utilities-dataset)


---

# Codebooks
## HELP dataset
| Variable Name | Description |
| ------------- | ----------- |
| `age` | Subject age at baseline |
| `anysub` | Use of any substance post-detox (no, yes) |
| `cesd` | Center for Epidemiologic Studies Depression measure at baseline (high scores indicate more depressive symptoms) |
| `d1` | Lifetime number of hospitalizations for medical problems (measured at baseline) |
| `daysanysub` | Time (in days) to first use of any substance post-detox |
| `dayslink` | Time (in days) to linkage to primary care |
| `drugrisk` | Risk Assessment Battery drug risk scale at baseline |
| `e2b` | Number of times in past 6 months entered a detox program (measured at baseline) |
| `female` | Biological sex (0 = male, 1 = female) |
| `sex` | Biological sex (male, female)  |
| `g1b` | Experienced serious thoughts of suicide in last 30 days (measured at baseline; no, yes) |
| `homeless` | Housing status (housed, homeless) |
| `i1` | Average number of drinks consumed per day in past 30 days (measured at baseline) |
| `i2` | Maximum number of drinks consumed per day in past 30 days (measured at baseline) |
| `id` | Subject identifier |
| `indtot` | Inventory of Drug Use Consequences (InDUC) total score (measured at baseline) |
| `linkstatus` | Post-detox linkage to primary care (0 = no, 1 = yes) |
| `link` | Post-detox linkage to primary care (no, yes) |
| `mcs` | SF-36 Mental Component Score (measured at baseline; lower scores indicate worse status) |
| `pcs` | SF-36 Physical Component Score (measured at baseline; lower scores indicate worse status) |
| `pss_fr` | Perceived social support by friends (measured at baseline; higher scores indicate more support) |
| `racegrp` | Race/Ethnicity (black, hispanic, white, other) |
| `satreat` | Any BSAS substance abuse treatment at baseline (no, yes) |
| `sexrisk` | Risk Assessment battery; sex risk score (measured at baseline; high scores indicates higher risk) |
| `substance` | Primary substance of abuse (alcohol, cocaine, heroin) |
| `treat` | Randomized to HELP clinic (no, yes) |

## CPS dataset
| Variable Name | Description |
| ------------- | ----------- |
| `wage` | Wage (US dollars per hour) |
| `educ` | Number of years of education |
| `race` | Factor with levels: NW (non-white), W (white) |
| `sex` | Factor with levels: F, M |
| `hispanic` | Factor with levels: Hisp, NH (non-Hispanic) |
| `south` | Factor with levels: NS (non-south), S (south) |
| `married` | Factor with levels: Married, Single |
| `exper` | Number of years of work experience |
| `union` | Factor with levels: Not (not part of union), Union |
| `age` | Age in years |
| `sector` | Factor with levels: clerical, const, manag, manuf, other prof, sales, service |
| `satisfaction` | 1 = satisfied with current employment, 0 = otherwise |

## Utilities dataset
| Variable Name | Description |
| ------------- | ----------- |
| `month` | month (coded as a number) |
| `day` | day of month on which bill was calculated |
| `year` | year of bill |
| `temp` | average temperature (degrees Celsius) for billing period |
| `kwh` | electricity usage (kwh) |
| `ccf` | gas usage (ccf) |
| `thermsPerDay` | a numeric vector |
| `billingDays` | number of billing days in billing period |
| `totalbill` | total monthly bill (in dollars) |
| `gasbill` | monthly gas bill (in dollars) |
| `elecbill` | monthly electric bill (in dollars) |
| `notes` | notes about the billing period |
| `donate` | (yes or no) did the person add money to their bill to be donated to Operation Fuel, a charity providing heat to families/small businesses in need |
