-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/8cKwsq
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "covid_statistics" (
    "Country" VARCHAR   NOT NULL,
    "Date" DATE   NOT NULL,
    "TotalCases" INT   NOT NULL,
    "TotalDeaths" INT   NOT NULL,
    "TotalRecovered" INT   NOT NULL,
    CONSTRAINT "pk_covid_statistics" PRIMARY KEY (
        "Country","Date"
     )
);

CREATE TABLE "government_measures_stringency" (
    "CountryName" VARCHAR   NOT NULL,
    "Date" DATE   NOT NULL,
    "C1_School_closing" BIGINT   NULL,
    "C2_Workplace_closing" BIGINT   NULL,
    "C3_Cancel_public_events" BIGINT   NULL,
    "C4_Restrictions_on_gatherings" BIGINT   NULL,
    "C5_Close_public_transport" BIGINT   NULL,
    "C6_Stay_at_home_requirements" BIGINT   NULL,
    "C7_Restrictions_on_internal_movement" BIGINT   NULL,
    "C8_International_travel_controls" BIGINT   NULL,
    "E1_Income_support" BIGINT   NULL,
    "E2_Debt_contract_relief" BIGINT   NULL,
    "E3_Fiscal_measures" BIGINT   NULL,
    "E4_International_support" BIGINT   NULL,
    "H1_Public_information_campaigns" BIGINT   NULL,
    "H2_Testing_policy" BIGINT   NULL,
    "H3_Contact_tracing" BIGINT   NULL,
    "H4_Emergency_investment_in_healthcare" BIGINT   NULL,
    "H5_Investment_in_vaccines" BIGINT   NULL,
    "StringencyIndex" BIGINT   NULL,
    "StringencyLegacyIndex" BIGINT   NULL,
    "GovernmentResponseIndex" BIGINT   NULL,
    "ContainmentHealthIndex" BIGINT   NULL,
    "EconomicSupportIndex" BIGINT   NULL
);

CREATE TABLE "government_measures_keydate" (
    "id" SERIAL   NOT NULL,
    "COUNTRY" VARCHAR   NOT NULL,
    "DATE_IMPLEMENTED" DATE   NOT NULL,
    "REGION" VARCHAR   NULL,
    "LOG_TYPE" VARCHAR   NULL,
    "CATEGORY" VARCHAR   NULL,
    "MEASURE" VARCHAR   NULL,
    "TARGETED_POP_GROUP" VARCHAR   NULL,
    "COMMENTS" VARCHAR   NULL,
    "SOURCE" VARCHAR   NULL,
    "SOURCE_TYPE" VARCHAR   NULL,
    "LINK" VARCHAR   NULL
);

ALTER TABLE "government_measures_stringency" ADD CONSTRAINT "fk_government_measures_stringency_CountryName_Date" FOREIGN KEY("CountryName", "Date")
REFERENCES "covid_statistics" ("Country", "Date");

ALTER TABLE "government_measures_keydate" ADD CONSTRAINT "fk_government_measures_keydate_COUNTRY_DATE_IMPLEMENTED" FOREIGN KEY("COUNTRY", "DATE_IMPLEMENTED")
REFERENCES "covid_statistics" ("Country", "Date");

