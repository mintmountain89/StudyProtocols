# @file PaperExecutionCode.R
#
# Copyright 2017 Observational Health Data Sciences and Informatics
#
# This file is part of CiCalibration
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

library(CiCalibration)
# options('fftempdir' = 'R:/fftemp')
options(fftempdir = "S:/fftemp")

pw <- NULL
dbms <- "pdw"
user <- NULL
server <- "JRDUSAPSCTL01"
cdmDatabaseSchema <- "CDM_CPRD_V510.dbo"
oracleTempSchema <- NULL
workDatabaseSchema <- "scratch.dbo"
studyCohortTable <- "mschuemie_ci_calibration_cohorts_cprd"
port <- 17001
workFolder <- "S:/Temp/CiCalibration_Cprd"
maxCores <- 30
study <- "Tata"

pw <- NULL
dbms <- "pdw"
user <- NULL
server <- "JRDUSAPSCTL01"
cdmDatabaseSchema <- "CDM_TRUVEN_MDCR_V520.dbo"
oracleTempSchema <- NULL
workDatabaseSchema <- "scratch.dbo"
studyCohortTable <- "mschuemie_ci_calibration_cohorts_mdcr"
port <- 17001
workFolder <- "S:/Temp/CiCalibration_Mdcr"
maxCores <- 10
study <- "Graham"

pw <- NULL
dbms <- "pdw"
user <- NULL
server <- "JRDUSAPSCTL01"
cdmDatabaseSchema <- "cdm_optum_extended_ses_V515.dbo"
oracleTempSchema <- NULL
workDatabaseSchema <- "scratch.dbo"
studyCohortTable <- "mschuemie_ci_calibration_cohorts_optum"
port <- 17001
workFolder <- "S:/Temp/CiCalibration_Optum"
maxCores <- 30
study <- "Southworth"

connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = dbms,
                                                                server = server,
                                                                user = user,
                                                                password = pw,
                                                                port = port)

execute(connectionDetails = connectionDetails,
        cdmDatabaseSchema = cdmDatabaseSchema,
        oracleTempSchema = oracleTempSchema,
        workDatabaseSchema = workDatabaseSchema,
        studyCohortTable = studyCohortTable,
        study = study,
        workFolder = workFolder,
        createCohorts = FALSE,
        injectSignals = FALSE,
        runAnalyses = TRUE,
        empiricalCalibration = TRUE,
        maxCores = maxCores)
