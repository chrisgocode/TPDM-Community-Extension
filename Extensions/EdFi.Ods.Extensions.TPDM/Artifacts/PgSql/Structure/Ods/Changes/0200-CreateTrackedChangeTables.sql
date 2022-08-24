DO $$
BEGIN

IF NOT EXISTS (SELECT 1 FROM information_schema.schemata WHERE schema_name = 'tracked_changes_tpdm') THEN
CREATE SCHEMA tracked_changes_tpdm;
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'applicantprofile') THEN
CREATE TABLE tracked_changes_tpdm.applicantprofile
(
       oldapplicantprofileidentifier VARCHAR(32) NOT NULL,
       newapplicantprofileidentifier VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT applicantprofile_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'application') THEN
CREATE TABLE tracked_changes_tpdm.application
(
       oldapplicantprofileidentifier VARCHAR(32) NOT NULL,
       oldapplicationidentifier VARCHAR(20) NOT NULL,
       oldeducationorganizationid INT NOT NULL,
       newapplicantprofileidentifier VARCHAR(32) NULL,
       newapplicationidentifier VARCHAR(20) NULL,
       neweducationorganizationid INT NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT application_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'applicationevent') THEN
CREATE TABLE tracked_changes_tpdm.applicationevent
(
       oldapplicantprofileidentifier VARCHAR(32) NOT NULL,
       oldapplicationeventtypedescriptorid INT NOT NULL,
       oldapplicationeventtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldapplicationeventtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldapplicationidentifier VARCHAR(20) NOT NULL,
       oldeducationorganizationid INT NOT NULL,
       oldeventdate DATE NOT NULL,
       oldsequencenumber INT NOT NULL,
       newapplicantprofileidentifier VARCHAR(32) NULL,
       newapplicationeventtypedescriptorid INT NULL,
       newapplicationeventtypedescriptornamespace VARCHAR(255) NULL,
       newapplicationeventtypedescriptorcodevalue VARCHAR(50) NULL,
       newapplicationidentifier VARCHAR(20) NULL,
       neweducationorganizationid INT NULL,
       neweventdate DATE NULL,
       newsequencenumber INT NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT applicationevent_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'candidate') THEN
CREATE TABLE tracked_changes_tpdm.candidate
(
       oldcandidateidentifier VARCHAR(32) NOT NULL,
       newcandidateidentifier VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT candidate_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'candidateeducatorpreparationprogramassociation') THEN
CREATE TABLE tracked_changes_tpdm.candidateeducatorpreparationprogramassociation
(
       oldbegindate DATE NOT NULL,
       oldcandidateidentifier VARCHAR(32) NOT NULL,
       oldeducationorganizationid INT NOT NULL,
       oldprogramname VARCHAR(255) NOT NULL,
       oldprogramtypedescriptorid INT NOT NULL,
       oldprogramtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldprogramtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       newbegindate DATE NULL,
       newcandidateidentifier VARCHAR(32) NULL,
       neweducationorganizationid INT NULL,
       newprogramname VARCHAR(255) NULL,
       newprogramtypedescriptorid INT NULL,
       newprogramtypedescriptornamespace VARCHAR(255) NULL,
       newprogramtypedescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT candidateeducatorpreparationprogramassociation_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'candidaterelationshiptostaffassociation') THEN
CREATE TABLE tracked_changes_tpdm.candidaterelationshiptostaffassociation
(
       oldcandidateidentifier VARCHAR(32) NOT NULL,
       oldstaffusi INT NOT NULL,
       oldstaffuniqueid VARCHAR(32) NOT NULL,
       newcandidateidentifier VARCHAR(32) NULL,
       newstaffusi INT NULL,
       newstaffuniqueid VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT candidaterelationshiptostaffassociation_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'certification') THEN
CREATE TABLE tracked_changes_tpdm.certification
(
       oldcertificationidentifier VARCHAR(60) NOT NULL,
       oldnamespace VARCHAR(255) NOT NULL,
       newcertificationidentifier VARCHAR(60) NULL,
       newnamespace VARCHAR(255) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT certification_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'certificationexam') THEN
CREATE TABLE tracked_changes_tpdm.certificationexam
(
       oldcertificationexamidentifier VARCHAR(60) NOT NULL,
       oldnamespace VARCHAR(255) NOT NULL,
       newcertificationexamidentifier VARCHAR(60) NULL,
       newnamespace VARCHAR(255) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT certificationexam_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'certificationexamresult') THEN
CREATE TABLE tracked_changes_tpdm.certificationexamresult
(
       oldcertificationexamdate DATE NOT NULL,
       oldcertificationexamidentifier VARCHAR(60) NOT NULL,
       oldnamespace VARCHAR(255) NOT NULL,
       oldpersonid VARCHAR(32) NOT NULL,
       oldsourcesystemdescriptorid INT NOT NULL,
       oldsourcesystemdescriptornamespace VARCHAR(255) NOT NULL,
       oldsourcesystemdescriptorcodevalue VARCHAR(50) NOT NULL,
       newcertificationexamdate DATE NULL,
       newcertificationexamidentifier VARCHAR(60) NULL,
       newnamespace VARCHAR(255) NULL,
       newpersonid VARCHAR(32) NULL,
       newsourcesystemdescriptorid INT NULL,
       newsourcesystemdescriptornamespace VARCHAR(255) NULL,
       newsourcesystemdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT certificationexamresult_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'credentialevent') THEN
CREATE TABLE tracked_changes_tpdm.credentialevent
(
       oldcredentialeventdate DATE NOT NULL,
       oldcredentialeventtypedescriptorid INT NOT NULL,
       oldcredentialeventtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldcredentialeventtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldcredentialidentifier VARCHAR(60) NOT NULL,
       oldstateofissuestateabbreviationdescriptorid INT NOT NULL,
       oldstateofissuestateabbreviationdescriptornamespace VARCHAR(255) NOT NULL,
       oldstateofissuestateabbreviationdescriptorcodevalue VARCHAR(50) NOT NULL,
       newcredentialeventdate DATE NULL,
       newcredentialeventtypedescriptorid INT NULL,
       newcredentialeventtypedescriptornamespace VARCHAR(255) NULL,
       newcredentialeventtypedescriptorcodevalue VARCHAR(50) NULL,
       newcredentialidentifier VARCHAR(60) NULL,
       newstateofissuestateabbreviationdescriptorid INT NULL,
       newstateofissuestateabbreviationdescriptornamespace VARCHAR(255) NULL,
       newstateofissuestateabbreviationdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT credentialevent_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'educatorpreparationprogram') THEN
CREATE TABLE tracked_changes_tpdm.educatorpreparationprogram
(
       oldeducationorganizationid INT NOT NULL,
       oldprogramname VARCHAR(255) NOT NULL,
       oldprogramtypedescriptorid INT NOT NULL,
       oldprogramtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldprogramtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newprogramname VARCHAR(255) NULL,
       newprogramtypedescriptorid INT NULL,
       newprogramtypedescriptornamespace VARCHAR(255) NULL,
       newprogramtypedescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT educatorpreparationprogram_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'evaluation') THEN
CREATE TABLE tracked_changes_tpdm.evaluation
(
       oldeducationorganizationid INT NOT NULL,
       oldevaluationperioddescriptorid INT NOT NULL,
       oldevaluationperioddescriptornamespace VARCHAR(255) NOT NULL,
       oldevaluationperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtypedescriptorid INT NOT NULL,
       oldperformanceevaluationtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldtermdescriptorid INT NOT NULL,
       oldtermdescriptornamespace VARCHAR(255) NOT NULL,
       oldtermdescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newevaluationperioddescriptorid INT NULL,
       newevaluationperioddescriptornamespace VARCHAR(255) NULL,
       newevaluationperioddescriptorcodevalue VARCHAR(50) NULL,
       newevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtypedescriptorid INT NULL,
       newperformanceevaluationtypedescriptornamespace VARCHAR(255) NULL,
       newperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NULL,
       newschoolyear SMALLINT NULL,
       newtermdescriptorid INT NULL,
       newtermdescriptornamespace VARCHAR(255) NULL,
       newtermdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT evaluation_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'evaluationelement') THEN
CREATE TABLE tracked_changes_tpdm.evaluationelement
(
       oldeducationorganizationid INT NOT NULL,
       oldevaluationelementtitle VARCHAR(255) NOT NULL,
       oldevaluationobjectivetitle VARCHAR(50) NOT NULL,
       oldevaluationperioddescriptorid INT NOT NULL,
       oldevaluationperioddescriptornamespace VARCHAR(255) NOT NULL,
       oldevaluationperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtypedescriptorid INT NOT NULL,
       oldperformanceevaluationtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldtermdescriptorid INT NOT NULL,
       oldtermdescriptornamespace VARCHAR(255) NOT NULL,
       oldtermdescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newevaluationelementtitle VARCHAR(255) NULL,
       newevaluationobjectivetitle VARCHAR(50) NULL,
       newevaluationperioddescriptorid INT NULL,
       newevaluationperioddescriptornamespace VARCHAR(255) NULL,
       newevaluationperioddescriptorcodevalue VARCHAR(50) NULL,
       newevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtypedescriptorid INT NULL,
       newperformanceevaluationtypedescriptornamespace VARCHAR(255) NULL,
       newperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NULL,
       newschoolyear SMALLINT NULL,
       newtermdescriptorid INT NULL,
       newtermdescriptornamespace VARCHAR(255) NULL,
       newtermdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT evaluationelement_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'evaluationelementrating') THEN
CREATE TABLE tracked_changes_tpdm.evaluationelementrating
(
       oldeducationorganizationid INT NOT NULL,
       oldevaluationdate TIMESTAMP NOT NULL,
       oldevaluationelementtitle VARCHAR(255) NOT NULL,
       oldevaluationobjectivetitle VARCHAR(50) NOT NULL,
       oldevaluationperioddescriptorid INT NOT NULL,
       oldevaluationperioddescriptornamespace VARCHAR(255) NOT NULL,
       oldevaluationperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtypedescriptorid INT NOT NULL,
       oldperformanceevaluationtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldpersonid VARCHAR(32) NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldsourcesystemdescriptorid INT NOT NULL,
       oldsourcesystemdescriptornamespace VARCHAR(255) NOT NULL,
       oldsourcesystemdescriptorcodevalue VARCHAR(50) NOT NULL,
       oldtermdescriptorid INT NOT NULL,
       oldtermdescriptornamespace VARCHAR(255) NOT NULL,
       oldtermdescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newevaluationdate TIMESTAMP NULL,
       newevaluationelementtitle VARCHAR(255) NULL,
       newevaluationobjectivetitle VARCHAR(50) NULL,
       newevaluationperioddescriptorid INT NULL,
       newevaluationperioddescriptornamespace VARCHAR(255) NULL,
       newevaluationperioddescriptorcodevalue VARCHAR(50) NULL,
       newevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtypedescriptorid INT NULL,
       newperformanceevaluationtypedescriptornamespace VARCHAR(255) NULL,
       newperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NULL,
       newpersonid VARCHAR(32) NULL,
       newschoolyear SMALLINT NULL,
       newsourcesystemdescriptorid INT NULL,
       newsourcesystemdescriptornamespace VARCHAR(255) NULL,
       newsourcesystemdescriptorcodevalue VARCHAR(50) NULL,
       newtermdescriptorid INT NULL,
       newtermdescriptornamespace VARCHAR(255) NULL,
       newtermdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT evaluationelementrating_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'evaluationobjective') THEN
CREATE TABLE tracked_changes_tpdm.evaluationobjective
(
       oldeducationorganizationid INT NOT NULL,
       oldevaluationobjectivetitle VARCHAR(50) NOT NULL,
       oldevaluationperioddescriptorid INT NOT NULL,
       oldevaluationperioddescriptornamespace VARCHAR(255) NOT NULL,
       oldevaluationperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtypedescriptorid INT NOT NULL,
       oldperformanceevaluationtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldtermdescriptorid INT NOT NULL,
       oldtermdescriptornamespace VARCHAR(255) NOT NULL,
       oldtermdescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newevaluationobjectivetitle VARCHAR(50) NULL,
       newevaluationperioddescriptorid INT NULL,
       newevaluationperioddescriptornamespace VARCHAR(255) NULL,
       newevaluationperioddescriptorcodevalue VARCHAR(50) NULL,
       newevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtypedescriptorid INT NULL,
       newperformanceevaluationtypedescriptornamespace VARCHAR(255) NULL,
       newperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NULL,
       newschoolyear SMALLINT NULL,
       newtermdescriptorid INT NULL,
       newtermdescriptornamespace VARCHAR(255) NULL,
       newtermdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT evaluationobjective_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'evaluationobjectiverating') THEN
CREATE TABLE tracked_changes_tpdm.evaluationobjectiverating
(
       oldeducationorganizationid INT NOT NULL,
       oldevaluationdate TIMESTAMP NOT NULL,
       oldevaluationobjectivetitle VARCHAR(50) NOT NULL,
       oldevaluationperioddescriptorid INT NOT NULL,
       oldevaluationperioddescriptornamespace VARCHAR(255) NOT NULL,
       oldevaluationperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtypedescriptorid INT NOT NULL,
       oldperformanceevaluationtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldpersonid VARCHAR(32) NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldsourcesystemdescriptorid INT NOT NULL,
       oldsourcesystemdescriptornamespace VARCHAR(255) NOT NULL,
       oldsourcesystemdescriptorcodevalue VARCHAR(50) NOT NULL,
       oldtermdescriptorid INT NOT NULL,
       oldtermdescriptornamespace VARCHAR(255) NOT NULL,
       oldtermdescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newevaluationdate TIMESTAMP NULL,
       newevaluationobjectivetitle VARCHAR(50) NULL,
       newevaluationperioddescriptorid INT NULL,
       newevaluationperioddescriptornamespace VARCHAR(255) NULL,
       newevaluationperioddescriptorcodevalue VARCHAR(50) NULL,
       newevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtypedescriptorid INT NULL,
       newperformanceevaluationtypedescriptornamespace VARCHAR(255) NULL,
       newperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NULL,
       newpersonid VARCHAR(32) NULL,
       newschoolyear SMALLINT NULL,
       newsourcesystemdescriptorid INT NULL,
       newsourcesystemdescriptornamespace VARCHAR(255) NULL,
       newsourcesystemdescriptorcodevalue VARCHAR(50) NULL,
       newtermdescriptorid INT NULL,
       newtermdescriptornamespace VARCHAR(255) NULL,
       newtermdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT evaluationobjectiverating_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'evaluationrating') THEN
CREATE TABLE tracked_changes_tpdm.evaluationrating
(
       oldeducationorganizationid INT NOT NULL,
       oldevaluationdate TIMESTAMP NOT NULL,
       oldevaluationperioddescriptorid INT NOT NULL,
       oldevaluationperioddescriptornamespace VARCHAR(255) NOT NULL,
       oldevaluationperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtypedescriptorid INT NOT NULL,
       oldperformanceevaluationtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldpersonid VARCHAR(32) NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldsourcesystemdescriptorid INT NOT NULL,
       oldsourcesystemdescriptornamespace VARCHAR(255) NOT NULL,
       oldsourcesystemdescriptorcodevalue VARCHAR(50) NOT NULL,
       oldtermdescriptorid INT NOT NULL,
       oldtermdescriptornamespace VARCHAR(255) NOT NULL,
       oldtermdescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newevaluationdate TIMESTAMP NULL,
       newevaluationperioddescriptorid INT NULL,
       newevaluationperioddescriptornamespace VARCHAR(255) NULL,
       newevaluationperioddescriptorcodevalue VARCHAR(50) NULL,
       newevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtypedescriptorid INT NULL,
       newperformanceevaluationtypedescriptornamespace VARCHAR(255) NULL,
       newperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NULL,
       newpersonid VARCHAR(32) NULL,
       newschoolyear SMALLINT NULL,
       newsourcesystemdescriptorid INT NULL,
       newsourcesystemdescriptornamespace VARCHAR(255) NULL,
       newsourcesystemdescriptorcodevalue VARCHAR(50) NULL,
       newtermdescriptorid INT NULL,
       newtermdescriptornamespace VARCHAR(255) NULL,
       newtermdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT evaluationrating_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'fieldworkexperience') THEN
CREATE TABLE tracked_changes_tpdm.fieldworkexperience
(
       oldbegindate DATE NOT NULL,
       oldfieldworkidentifier VARCHAR(64) NOT NULL,
       oldstudentusi INT NOT NULL,
       oldstudentuniqueid VARCHAR(32) NOT NULL,
       newbegindate DATE NULL,
       newfieldworkidentifier VARCHAR(64) NULL,
       newstudentusi INT NULL,
       newstudentuniqueid VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT fieldworkexperience_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'fieldworkexperiencesectionassociation') THEN
CREATE TABLE tracked_changes_tpdm.fieldworkexperiencesectionassociation
(
       oldbegindate DATE NOT NULL,
       oldfieldworkidentifier VARCHAR(64) NOT NULL,
       oldlocalcoursecode VARCHAR(60) NOT NULL,
       oldschoolid INT NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldsectionidentifier VARCHAR(255) NOT NULL,
       oldsessionname VARCHAR(60) NOT NULL,
       oldstudentusi INT NOT NULL,
       oldstudentuniqueid VARCHAR(32) NOT NULL,
       newbegindate DATE NULL,
       newfieldworkidentifier VARCHAR(64) NULL,
       newlocalcoursecode VARCHAR(60) NULL,
       newschoolid INT NULL,
       newschoolyear SMALLINT NULL,
       newsectionidentifier VARCHAR(255) NULL,
       newsessionname VARCHAR(60) NULL,
       newstudentusi INT NULL,
       newstudentuniqueid VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT fieldworkexperiencesectionassociation_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'financialaid') THEN
CREATE TABLE tracked_changes_tpdm.financialaid
(
       oldaidtypedescriptorid INT NOT NULL,
       oldaidtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldaidtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldbegindate DATE NOT NULL,
       oldstudentusi INT NOT NULL,
       oldstudentuniqueid VARCHAR(32) NOT NULL,
       newaidtypedescriptorid INT NULL,
       newaidtypedescriptornamespace VARCHAR(255) NULL,
       newaidtypedescriptorcodevalue VARCHAR(50) NULL,
       newbegindate DATE NULL,
       newstudentusi INT NULL,
       newstudentuniqueid VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT financialaid_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'goal') THEN
CREATE TABLE tracked_changes_tpdm.goal
(
       oldassignmentdate DATE NOT NULL,
       oldgoaltitle VARCHAR(255) NOT NULL,
       oldpersonid VARCHAR(32) NOT NULL,
       oldsourcesystemdescriptorid INT NOT NULL,
       oldsourcesystemdescriptornamespace VARCHAR(255) NOT NULL,
       oldsourcesystemdescriptorcodevalue VARCHAR(50) NOT NULL,
       newassignmentdate DATE NULL,
       newgoaltitle VARCHAR(255) NULL,
       newpersonid VARCHAR(32) NULL,
       newsourcesystemdescriptorid INT NULL,
       newsourcesystemdescriptornamespace VARCHAR(255) NULL,
       newsourcesystemdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT goal_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'openstaffpositionevent') THEN
CREATE TABLE tracked_changes_tpdm.openstaffpositionevent
(
       oldeducationorganizationid INT NOT NULL,
       oldeventdate DATE NOT NULL,
       oldopenstaffpositioneventtypedescriptorid INT NOT NULL,
       oldopenstaffpositioneventtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldopenstaffpositioneventtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldrequisitionnumber VARCHAR(20) NOT NULL,
       neweducationorganizationid INT NULL,
       neweventdate DATE NULL,
       newopenstaffpositioneventtypedescriptorid INT NULL,
       newopenstaffpositioneventtypedescriptornamespace VARCHAR(255) NULL,
       newopenstaffpositioneventtypedescriptorcodevalue VARCHAR(50) NULL,
       newrequisitionnumber VARCHAR(20) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT openstaffpositionevent_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'performanceevaluation') THEN
CREATE TABLE tracked_changes_tpdm.performanceevaluation
(
       oldeducationorganizationid INT NOT NULL,
       oldevaluationperioddescriptorid INT NOT NULL,
       oldevaluationperioddescriptornamespace VARCHAR(255) NOT NULL,
       oldevaluationperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldperformanceevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtypedescriptorid INT NOT NULL,
       oldperformanceevaluationtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldtermdescriptorid INT NOT NULL,
       oldtermdescriptornamespace VARCHAR(255) NOT NULL,
       oldtermdescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newevaluationperioddescriptorid INT NULL,
       newevaluationperioddescriptornamespace VARCHAR(255) NULL,
       newevaluationperioddescriptorcodevalue VARCHAR(50) NULL,
       newperformanceevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtypedescriptorid INT NULL,
       newperformanceevaluationtypedescriptornamespace VARCHAR(255) NULL,
       newperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NULL,
       newschoolyear SMALLINT NULL,
       newtermdescriptorid INT NULL,
       newtermdescriptornamespace VARCHAR(255) NULL,
       newtermdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT performanceevaluation_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'performanceevaluationrating') THEN
CREATE TABLE tracked_changes_tpdm.performanceevaluationrating
(
       oldeducationorganizationid INT NOT NULL,
       oldevaluationperioddescriptorid INT NOT NULL,
       oldevaluationperioddescriptornamespace VARCHAR(255) NOT NULL,
       oldevaluationperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldperformanceevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtypedescriptorid INT NOT NULL,
       oldperformanceevaluationtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldpersonid VARCHAR(32) NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldsourcesystemdescriptorid INT NOT NULL,
       oldsourcesystemdescriptornamespace VARCHAR(255) NOT NULL,
       oldsourcesystemdescriptorcodevalue VARCHAR(50) NOT NULL,
       oldtermdescriptorid INT NOT NULL,
       oldtermdescriptornamespace VARCHAR(255) NOT NULL,
       oldtermdescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newevaluationperioddescriptorid INT NULL,
       newevaluationperioddescriptornamespace VARCHAR(255) NULL,
       newevaluationperioddescriptorcodevalue VARCHAR(50) NULL,
       newperformanceevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtypedescriptorid INT NULL,
       newperformanceevaluationtypedescriptornamespace VARCHAR(255) NULL,
       newperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NULL,
       newpersonid VARCHAR(32) NULL,
       newschoolyear SMALLINT NULL,
       newsourcesystemdescriptorid INT NULL,
       newsourcesystemdescriptornamespace VARCHAR(255) NULL,
       newsourcesystemdescriptorcodevalue VARCHAR(50) NULL,
       newtermdescriptorid INT NULL,
       newtermdescriptornamespace VARCHAR(255) NULL,
       newtermdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT performanceevaluationrating_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'professionaldevelopmentevent') THEN
CREATE TABLE tracked_changes_tpdm.professionaldevelopmentevent
(
       oldnamespace VARCHAR(255) NOT NULL,
       oldprofessionaldevelopmenttitle VARCHAR(60) NOT NULL,
       newnamespace VARCHAR(255) NULL,
       newprofessionaldevelopmenttitle VARCHAR(60) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT professionaldevelopmentevent_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'professionaldevelopmenteventattendance') THEN
CREATE TABLE tracked_changes_tpdm.professionaldevelopmenteventattendance
(
       oldattendancedate DATE NOT NULL,
       oldnamespace VARCHAR(255) NOT NULL,
       oldpersonid VARCHAR(32) NOT NULL,
       oldprofessionaldevelopmenttitle VARCHAR(60) NOT NULL,
       oldsourcesystemdescriptorid INT NOT NULL,
       oldsourcesystemdescriptornamespace VARCHAR(255) NOT NULL,
       oldsourcesystemdescriptorcodevalue VARCHAR(50) NOT NULL,
       newattendancedate DATE NULL,
       newnamespace VARCHAR(255) NULL,
       newpersonid VARCHAR(32) NULL,
       newprofessionaldevelopmenttitle VARCHAR(60) NULL,
       newsourcesystemdescriptorid INT NULL,
       newsourcesystemdescriptornamespace VARCHAR(255) NULL,
       newsourcesystemdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT professionaldevelopmenteventattendance_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'quantitativemeasure') THEN
CREATE TABLE tracked_changes_tpdm.quantitativemeasure
(
       oldeducationorganizationid INT NOT NULL,
       oldevaluationelementtitle VARCHAR(255) NOT NULL,
       oldevaluationobjectivetitle VARCHAR(50) NOT NULL,
       oldevaluationperioddescriptorid INT NOT NULL,
       oldevaluationperioddescriptornamespace VARCHAR(255) NOT NULL,
       oldevaluationperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtypedescriptorid INT NOT NULL,
       oldperformanceevaluationtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldquantitativemeasureidentifier VARCHAR(64) NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldtermdescriptorid INT NOT NULL,
       oldtermdescriptornamespace VARCHAR(255) NOT NULL,
       oldtermdescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newevaluationelementtitle VARCHAR(255) NULL,
       newevaluationobjectivetitle VARCHAR(50) NULL,
       newevaluationperioddescriptorid INT NULL,
       newevaluationperioddescriptornamespace VARCHAR(255) NULL,
       newevaluationperioddescriptorcodevalue VARCHAR(50) NULL,
       newevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtypedescriptorid INT NULL,
       newperformanceevaluationtypedescriptornamespace VARCHAR(255) NULL,
       newperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NULL,
       newquantitativemeasureidentifier VARCHAR(64) NULL,
       newschoolyear SMALLINT NULL,
       newtermdescriptorid INT NULL,
       newtermdescriptornamespace VARCHAR(255) NULL,
       newtermdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT quantitativemeasure_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'quantitativemeasurescore') THEN
CREATE TABLE tracked_changes_tpdm.quantitativemeasurescore
(
       oldeducationorganizationid INT NOT NULL,
       oldevaluationdate TIMESTAMP NOT NULL,
       oldevaluationelementtitle VARCHAR(255) NOT NULL,
       oldevaluationobjectivetitle VARCHAR(50) NOT NULL,
       oldevaluationperioddescriptorid INT NOT NULL,
       oldevaluationperioddescriptornamespace VARCHAR(255) NOT NULL,
       oldevaluationperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtypedescriptorid INT NOT NULL,
       oldperformanceevaluationtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldpersonid VARCHAR(32) NOT NULL,
       oldquantitativemeasureidentifier VARCHAR(64) NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldsourcesystemdescriptorid INT NOT NULL,
       oldsourcesystemdescriptornamespace VARCHAR(255) NOT NULL,
       oldsourcesystemdescriptorcodevalue VARCHAR(50) NOT NULL,
       oldtermdescriptorid INT NOT NULL,
       oldtermdescriptornamespace VARCHAR(255) NOT NULL,
       oldtermdescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newevaluationdate TIMESTAMP NULL,
       newevaluationelementtitle VARCHAR(255) NULL,
       newevaluationobjectivetitle VARCHAR(50) NULL,
       newevaluationperioddescriptorid INT NULL,
       newevaluationperioddescriptornamespace VARCHAR(255) NULL,
       newevaluationperioddescriptorcodevalue VARCHAR(50) NULL,
       newevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtypedescriptorid INT NULL,
       newperformanceevaluationtypedescriptornamespace VARCHAR(255) NULL,
       newperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NULL,
       newpersonid VARCHAR(32) NULL,
       newquantitativemeasureidentifier VARCHAR(64) NULL,
       newschoolyear SMALLINT NULL,
       newsourcesystemdescriptorid INT NULL,
       newsourcesystemdescriptornamespace VARCHAR(255) NULL,
       newsourcesystemdescriptorcodevalue VARCHAR(50) NULL,
       newtermdescriptorid INT NULL,
       newtermdescriptornamespace VARCHAR(255) NULL,
       newtermdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT quantitativemeasurescore_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'recruitmentevent') THEN
CREATE TABLE tracked_changes_tpdm.recruitmentevent
(
       oldeducationorganizationid INT NOT NULL,
       oldeventdate DATE NOT NULL,
       oldeventtitle VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       neweventdate DATE NULL,
       neweventtitle VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT recruitmentevent_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'recruitmenteventattendance') THEN
CREATE TABLE tracked_changes_tpdm.recruitmenteventattendance
(
       oldeducationorganizationid INT NOT NULL,
       oldeventdate DATE NOT NULL,
       oldeventtitle VARCHAR(50) NOT NULL,
       oldrecruitmenteventattendeeidentifier VARCHAR(32) NOT NULL,
       neweducationorganizationid INT NULL,
       neweventdate DATE NULL,
       neweventtitle VARCHAR(50) NULL,
       newrecruitmenteventattendeeidentifier VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT recruitmenteventattendance_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'rubricdimension') THEN
CREATE TABLE tracked_changes_tpdm.rubricdimension
(
       oldeducationorganizationid INT NOT NULL,
       oldevaluationelementtitle VARCHAR(255) NOT NULL,
       oldevaluationobjectivetitle VARCHAR(50) NOT NULL,
       oldevaluationperioddescriptorid INT NOT NULL,
       oldevaluationperioddescriptornamespace VARCHAR(255) NOT NULL,
       oldevaluationperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtypedescriptorid INT NOT NULL,
       oldperformanceevaluationtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldrubricrating INT NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldtermdescriptorid INT NOT NULL,
       oldtermdescriptornamespace VARCHAR(255) NOT NULL,
       oldtermdescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newevaluationelementtitle VARCHAR(255) NULL,
       newevaluationobjectivetitle VARCHAR(50) NULL,
       newevaluationperioddescriptorid INT NULL,
       newevaluationperioddescriptornamespace VARCHAR(255) NULL,
       newevaluationperioddescriptorcodevalue VARCHAR(50) NULL,
       newevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtypedescriptorid INT NULL,
       newperformanceevaluationtypedescriptornamespace VARCHAR(255) NULL,
       newperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NULL,
       newrubricrating INT NULL,
       newschoolyear SMALLINT NULL,
       newtermdescriptorid INT NULL,
       newtermdescriptornamespace VARCHAR(255) NULL,
       newtermdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT rubricdimension_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'staffeducatorpreparationprogramassociation') THEN
CREATE TABLE tracked_changes_tpdm.staffeducatorpreparationprogramassociation
(
       oldeducationorganizationid INT NOT NULL,
       oldprogramname VARCHAR(255) NOT NULL,
       oldprogramtypedescriptorid INT NOT NULL,
       oldprogramtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldprogramtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldstaffusi INT NOT NULL,
       oldstaffuniqueid VARCHAR(32) NOT NULL,
       neweducationorganizationid INT NULL,
       newprogramname VARCHAR(255) NULL,
       newprogramtypedescriptorid INT NULL,
       newprogramtypedescriptornamespace VARCHAR(255) NULL,
       newprogramtypedescriptorcodevalue VARCHAR(50) NULL,
       newstaffusi INT NULL,
       newstaffuniqueid VARCHAR(32) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT staffeducatorpreparationprogramassociation_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'surveyresponsepersontargetassociation') THEN
CREATE TABLE tracked_changes_tpdm.surveyresponsepersontargetassociation
(
       oldnamespace VARCHAR(255) NOT NULL,
       oldpersonid VARCHAR(32) NOT NULL,
       oldsourcesystemdescriptorid INT NOT NULL,
       oldsourcesystemdescriptornamespace VARCHAR(255) NOT NULL,
       oldsourcesystemdescriptorcodevalue VARCHAR(50) NOT NULL,
       oldsurveyidentifier VARCHAR(60) NOT NULL,
       oldsurveyresponseidentifier VARCHAR(60) NOT NULL,
       newnamespace VARCHAR(255) NULL,
       newpersonid VARCHAR(32) NULL,
       newsourcesystemdescriptorid INT NULL,
       newsourcesystemdescriptornamespace VARCHAR(255) NULL,
       newsourcesystemdescriptorcodevalue VARCHAR(50) NULL,
       newsurveyidentifier VARCHAR(60) NULL,
       newsurveyresponseidentifier VARCHAR(60) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT surveyresponsepersontargetassociation_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'surveysectionaggregateresponse') THEN
CREATE TABLE tracked_changes_tpdm.surveysectionaggregateresponse
(
       oldeducationorganizationid INT NOT NULL,
       oldevaluationdate TIMESTAMP NOT NULL,
       oldevaluationelementtitle VARCHAR(255) NOT NULL,
       oldevaluationobjectivetitle VARCHAR(50) NOT NULL,
       oldevaluationperioddescriptorid INT NOT NULL,
       oldevaluationperioddescriptornamespace VARCHAR(255) NOT NULL,
       oldevaluationperioddescriptorcodevalue VARCHAR(50) NOT NULL,
       oldevaluationtitle VARCHAR(50) NOT NULL,
       oldnamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtitle VARCHAR(50) NOT NULL,
       oldperformanceevaluationtypedescriptorid INT NOT NULL,
       oldperformanceevaluationtypedescriptornamespace VARCHAR(255) NOT NULL,
       oldperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NOT NULL,
       oldpersonid VARCHAR(32) NOT NULL,
       oldschoolyear SMALLINT NOT NULL,
       oldsourcesystemdescriptorid INT NOT NULL,
       oldsourcesystemdescriptornamespace VARCHAR(255) NOT NULL,
       oldsourcesystemdescriptorcodevalue VARCHAR(50) NOT NULL,
       oldsurveyidentifier VARCHAR(60) NOT NULL,
       oldsurveysectiontitle VARCHAR(255) NOT NULL,
       oldtermdescriptorid INT NOT NULL,
       oldtermdescriptornamespace VARCHAR(255) NOT NULL,
       oldtermdescriptorcodevalue VARCHAR(50) NOT NULL,
       neweducationorganizationid INT NULL,
       newevaluationdate TIMESTAMP NULL,
       newevaluationelementtitle VARCHAR(255) NULL,
       newevaluationobjectivetitle VARCHAR(50) NULL,
       newevaluationperioddescriptorid INT NULL,
       newevaluationperioddescriptornamespace VARCHAR(255) NULL,
       newevaluationperioddescriptorcodevalue VARCHAR(50) NULL,
       newevaluationtitle VARCHAR(50) NULL,
       newnamespace VARCHAR(255) NULL,
       newperformanceevaluationtitle VARCHAR(50) NULL,
       newperformanceevaluationtypedescriptorid INT NULL,
       newperformanceevaluationtypedescriptornamespace VARCHAR(255) NULL,
       newperformanceevaluationtypedescriptorcodevalue VARCHAR(50) NULL,
       newpersonid VARCHAR(32) NULL,
       newschoolyear SMALLINT NULL,
       newsourcesystemdescriptorid INT NULL,
       newsourcesystemdescriptornamespace VARCHAR(255) NULL,
       newsourcesystemdescriptorcodevalue VARCHAR(50) NULL,
       newsurveyidentifier VARCHAR(60) NULL,
       newsurveysectiontitle VARCHAR(255) NULL,
       newtermdescriptorid INT NULL,
       newtermdescriptornamespace VARCHAR(255) NULL,
       newtermdescriptorcodevalue VARCHAR(50) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT surveysectionaggregateresponse_pk PRIMARY KEY (ChangeVersion)
);
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_schema = 'tracked_changes_tpdm' AND table_name = 'surveysectionresponsepersontargetassociation') THEN
CREATE TABLE tracked_changes_tpdm.surveysectionresponsepersontargetassociation
(
       oldnamespace VARCHAR(255) NOT NULL,
       oldpersonid VARCHAR(32) NOT NULL,
       oldsourcesystemdescriptorid INT NOT NULL,
       oldsourcesystemdescriptornamespace VARCHAR(255) NOT NULL,
       oldsourcesystemdescriptorcodevalue VARCHAR(50) NOT NULL,
       oldsurveyidentifier VARCHAR(60) NOT NULL,
       oldsurveyresponseidentifier VARCHAR(60) NOT NULL,
       oldsurveysectiontitle VARCHAR(255) NOT NULL,
       newnamespace VARCHAR(255) NULL,
       newpersonid VARCHAR(32) NULL,
       newsourcesystemdescriptorid INT NULL,
       newsourcesystemdescriptornamespace VARCHAR(255) NULL,
       newsourcesystemdescriptorcodevalue VARCHAR(50) NULL,
       newsurveyidentifier VARCHAR(60) NULL,
       newsurveyresponseidentifier VARCHAR(60) NULL,
       newsurveysectiontitle VARCHAR(255) NULL,
       id uuid NOT NULL,
       changeversion bigint NOT NULL,
       discriminator varchar(128) NULL,
       createdate timestamp NOT NULL DEFAULT (now()),
       CONSTRAINT surveysectionresponsepersontargetassociation_pk PRIMARY KEY (ChangeVersion)
);
END IF;

END
$$;
