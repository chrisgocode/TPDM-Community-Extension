DO $$
BEGIN
CREATE OR REPLACE FUNCTION tracked_changes_tpdm.accreditationstatusdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.AccreditationStatusDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.AccreditationStatusDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.AccreditationStatusDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'accreditationstatusdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.accreditationstatusdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.accreditationstatusdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.aidtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.AidTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.AidTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.AidTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'aidtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.aidtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.aidtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.applicantprofile_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_tpdm.applicantprofile(
        oldapplicantprofileidentifier,
        id, discriminator, changeversion)
    VALUES (
        OLD.applicantprofileidentifier, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'applicantprofile') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.applicantprofile 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.applicantprofile_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.application_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_tpdm.application(
        oldapplicantprofileidentifier, oldapplicationidentifier, oldeducationorganizationid,
        id, discriminator, changeversion)
    VALUES (
        OLD.applicantprofileidentifier, OLD.applicationidentifier, OLD.educationorganizationid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'application') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.application 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.application_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.applicationevent_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.applicationeventtypedescriptorid;

    INSERT INTO tracked_changes_tpdm.applicationevent(
        oldapplicantprofileidentifier, oldapplicationeventtypedescriptorid, oldapplicationeventtypedescriptornamespace, oldapplicationeventtypedescriptorcodevalue, oldapplicationidentifier, oldeducationorganizationid, oldeventdate, oldsequencenumber,
        id, discriminator, changeversion)
    VALUES (
        OLD.applicantprofileidentifier, OLD.applicationeventtypedescriptorid, dj0.namespace, dj0.codevalue, OLD.applicationidentifier, OLD.educationorganizationid, OLD.eventdate, OLD.sequencenumber, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'applicationevent') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.applicationevent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.applicationevent_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.applicationeventresultdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ApplicationEventResultDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.ApplicationEventResultDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ApplicationEventResultDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'applicationeventresultdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.applicationeventresultdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.applicationeventresultdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.applicationeventtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ApplicationEventTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.ApplicationEventTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ApplicationEventTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'applicationeventtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.applicationeventtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.applicationeventtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.applicationsourcedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ApplicationSourceDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.ApplicationSourceDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ApplicationSourceDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'applicationsourcedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.applicationsourcedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.applicationsourcedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.applicationstatusdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ApplicationStatusDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.ApplicationStatusDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ApplicationStatusDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'applicationstatusdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.applicationstatusdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.applicationstatusdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.backgroundcheckstatusdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.BackgroundCheckStatusDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.BackgroundCheckStatusDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.BackgroundCheckStatusDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'backgroundcheckstatusdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.backgroundcheckstatusdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.backgroundcheckstatusdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.backgroundchecktypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.BackgroundCheckTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.BackgroundCheckTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.BackgroundCheckTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'backgroundchecktypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.backgroundchecktypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.backgroundchecktypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.candidate_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_tpdm.candidate(
        oldcandidateidentifier,
        id, discriminator, changeversion)
    VALUES (
        OLD.candidateidentifier, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'candidate') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.candidate 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.candidate_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.candidatecharacteristicdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.CandidateCharacteristicDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.CandidateCharacteristicDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.CandidateCharacteristicDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'candidatecharacteristicdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.candidatecharacteristicdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.candidatecharacteristicdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.candidateeducatorpreparationprogramassociation_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.programtypedescriptorid;

    INSERT INTO tracked_changes_tpdm.candidateeducatorpreparationprogramassociation(
        oldbegindate, oldcandidateidentifier, oldeducationorganizationid, oldprogramname, oldprogramtypedescriptorid, oldprogramtypedescriptornamespace, oldprogramtypedescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.begindate, OLD.candidateidentifier, OLD.educationorganizationid, OLD.programname, OLD.programtypedescriptorid, dj0.namespace, dj0.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'candidateeducatorpreparationprogramassociation') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.candidateeducatorpreparationprogramassociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.candidateeducatorpreparationprogramassociation_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.candidaterelationshiptostaffassociation_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.staff%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.staff j0 WHERE staffusi = old.staffusi;

    INSERT INTO tracked_changes_tpdm.candidaterelationshiptostaffassociation(
        oldcandidateidentifier, oldstaffusi, oldstaffuniqueid,
        id, discriminator, changeversion)
    VALUES (
        OLD.candidateidentifier, OLD.staffusi, dj0.staffuniqueid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'candidaterelationshiptostaffassociation') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.candidaterelationshiptostaffassociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.candidaterelationshiptostaffassociation_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.certification_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_tpdm.certification(
        oldcertificationidentifier, oldnamespace,
        id, discriminator, changeversion)
    VALUES (
        OLD.certificationidentifier, OLD.namespace, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'certification') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.certification 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.certification_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.certificationexam_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_tpdm.certificationexam(
        oldcertificationexamidentifier, oldnamespace,
        id, discriminator, changeversion)
    VALUES (
        OLD.certificationexamidentifier, OLD.namespace, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'certificationexam') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.certificationexam 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.certificationexam_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.certificationexamresult_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.sourcesystemdescriptorid;

    INSERT INTO tracked_changes_tpdm.certificationexamresult(
        oldcertificationexamdate, oldcertificationexamidentifier, oldnamespace, oldpersonid, oldsourcesystemdescriptorid, oldsourcesystemdescriptornamespace, oldsourcesystemdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.certificationexamdate, OLD.certificationexamidentifier, OLD.namespace, OLD.personid, OLD.sourcesystemdescriptorid, dj0.namespace, dj0.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'certificationexamresult') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.certificationexamresult 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.certificationexamresult_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.certificationexamstatusdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.CertificationExamStatusDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.CertificationExamStatusDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.CertificationExamStatusDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'certificationexamstatusdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.certificationexamstatusdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.certificationexamstatusdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.certificationexamtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.CertificationExamTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.CertificationExamTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.CertificationExamTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'certificationexamtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.certificationexamtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.certificationexamtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.certificationfielddescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.CertificationFieldDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.CertificationFieldDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.CertificationFieldDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'certificationfielddescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.certificationfielddescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.certificationfielddescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.certificationleveldescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.CertificationLevelDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.CertificationLevelDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.CertificationLevelDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'certificationleveldescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.certificationleveldescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.certificationleveldescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.certificationroutedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.CertificationRouteDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.CertificationRouteDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.CertificationRouteDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'certificationroutedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.certificationroutedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.certificationroutedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.certificationstandarddescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.CertificationStandardDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.CertificationStandardDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.CertificationStandardDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'certificationstandarddescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.certificationstandarddescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.certificationstandarddescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.coteachingstyleobserveddescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.CoteachingStyleObservedDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.CoteachingStyleObservedDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.CoteachingStyleObservedDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'coteachingstyleobserveddescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.coteachingstyleobserveddescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.coteachingstyleobserveddescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.credentialevent_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.credentialeventtypedescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.stateofissuestateabbreviationdescriptorid;

    INSERT INTO tracked_changes_tpdm.credentialevent(
        oldcredentialeventdate, oldcredentialeventtypedescriptorid, oldcredentialeventtypedescriptornamespace, oldcredentialeventtypedescriptorcodevalue, oldcredentialidentifier, oldstateofissuestateabbreviationdescriptorid, oldstateofissuestateabbreviationdescriptornamespace, oldstateofissuestateabbreviationdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.credentialeventdate, OLD.credentialeventtypedescriptorid, dj0.namespace, dj0.codevalue, OLD.credentialidentifier, OLD.stateofissuestateabbreviationdescriptorid, dj1.namespace, dj1.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'credentialevent') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.credentialevent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.credentialevent_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.credentialeventtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.CredentialEventTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.CredentialEventTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.CredentialEventTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'credentialeventtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.credentialeventtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.credentialeventtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.credentialstatusdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.CredentialStatusDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.CredentialStatusDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.CredentialStatusDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'credentialstatusdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.credentialstatusdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.credentialstatusdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.degreedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.DegreeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.DegreeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.DegreeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'degreedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.degreedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.degreedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.educatorpreparationprogram_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.programtypedescriptorid;

    INSERT INTO tracked_changes_tpdm.educatorpreparationprogram(
        oldeducationorganizationid, oldprogramname, oldprogramtypedescriptorid, oldprogramtypedescriptornamespace, oldprogramtypedescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.programname, OLD.programtypedescriptorid, dj0.namespace, dj0.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'educatorpreparationprogram') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.educatorpreparationprogram 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.educatorpreparationprogram_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.educatorpreparationprogramtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.EducatorPreparationProgramTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.EducatorPreparationProgramTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.EducatorPreparationProgramTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'educatorpreparationprogramtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.educatorpreparationprogramtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.educatorpreparationprogramtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.educatorroledescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.EducatorRoleDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.EducatorRoleDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.EducatorRoleDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'educatorroledescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.educatorroledescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.educatorroledescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.englishlanguageexamdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.EnglishLanguageExamDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.EnglishLanguageExamDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.EnglishLanguageExamDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'englishlanguageexamdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.englishlanguageexamdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.englishlanguageexamdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.eppdegreetypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.EPPDegreeTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.EPPDegreeTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.EPPDegreeTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'eppdegreetypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.eppdegreetypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.eppdegreetypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.eppprogrampathwaydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.EPPProgramPathwayDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.EPPProgramPathwayDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.EPPProgramPathwayDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'eppprogrampathwaydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.eppprogrampathwaydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.eppprogrampathwaydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.evaluation_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.evaluationperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.performanceevaluationtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.termdescriptorid;

    INSERT INTO tracked_changes_tpdm.evaluation(
        oldeducationorganizationid, oldevaluationperioddescriptorid, oldevaluationperioddescriptornamespace, oldevaluationperioddescriptorcodevalue, oldevaluationtitle, oldperformanceevaluationtitle, oldperformanceevaluationtypedescriptorid, oldperformanceevaluationtypedescriptornamespace, oldperformanceevaluationtypedescriptorcodevalue, oldschoolyear, oldtermdescriptorid, oldtermdescriptornamespace, oldtermdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.evaluationperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.evaluationtitle, OLD.performanceevaluationtitle, OLD.performanceevaluationtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.schoolyear, OLD.termdescriptorid, dj2.namespace, dj2.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluation') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.evaluation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.evaluation_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.evaluationelement_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.evaluationperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.performanceevaluationtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.termdescriptorid;

    INSERT INTO tracked_changes_tpdm.evaluationelement(
        oldeducationorganizationid, oldevaluationelementtitle, oldevaluationobjectivetitle, oldevaluationperioddescriptorid, oldevaluationperioddescriptornamespace, oldevaluationperioddescriptorcodevalue, oldevaluationtitle, oldperformanceevaluationtitle, oldperformanceevaluationtypedescriptorid, oldperformanceevaluationtypedescriptornamespace, oldperformanceevaluationtypedescriptorcodevalue, oldschoolyear, oldtermdescriptorid, oldtermdescriptornamespace, oldtermdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.evaluationelementtitle, OLD.evaluationobjectivetitle, OLD.evaluationperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.evaluationtitle, OLD.performanceevaluationtitle, OLD.performanceevaluationtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.schoolyear, OLD.termdescriptorid, dj2.namespace, dj2.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationelement') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.evaluationelement 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.evaluationelement_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.evaluationelementrating_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
    dj3 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.evaluationperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.performanceevaluationtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.sourcesystemdescriptorid;

    SELECT INTO dj3 * FROM edfi.descriptor j3 WHERE descriptorid = old.termdescriptorid;

    INSERT INTO tracked_changes_tpdm.evaluationelementrating(
        oldeducationorganizationid, oldevaluationdate, oldevaluationelementtitle, oldevaluationobjectivetitle, oldevaluationperioddescriptorid, oldevaluationperioddescriptornamespace, oldevaluationperioddescriptorcodevalue, oldevaluationtitle, oldperformanceevaluationtitle, oldperformanceevaluationtypedescriptorid, oldperformanceevaluationtypedescriptornamespace, oldperformanceevaluationtypedescriptorcodevalue, oldpersonid, oldschoolyear, oldsourcesystemdescriptorid, oldsourcesystemdescriptornamespace, oldsourcesystemdescriptorcodevalue, oldtermdescriptorid, oldtermdescriptornamespace, oldtermdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.evaluationdate, OLD.evaluationelementtitle, OLD.evaluationobjectivetitle, OLD.evaluationperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.evaluationtitle, OLD.performanceevaluationtitle, OLD.performanceevaluationtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.personid, OLD.schoolyear, OLD.sourcesystemdescriptorid, dj2.namespace, dj2.codevalue, OLD.termdescriptorid, dj3.namespace, dj3.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationelementrating') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.evaluationelementrating 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.evaluationelementrating_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.evaluationelementratingleveldescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.EvaluationElementRatingLevelDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.EvaluationElementRatingLevelDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.EvaluationElementRatingLevelDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationelementratingleveldescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.evaluationelementratingleveldescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.evaluationelementratingleveldescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.evaluationobjective_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.evaluationperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.performanceevaluationtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.termdescriptorid;

    INSERT INTO tracked_changes_tpdm.evaluationobjective(
        oldeducationorganizationid, oldevaluationobjectivetitle, oldevaluationperioddescriptorid, oldevaluationperioddescriptornamespace, oldevaluationperioddescriptorcodevalue, oldevaluationtitle, oldperformanceevaluationtitle, oldperformanceevaluationtypedescriptorid, oldperformanceevaluationtypedescriptornamespace, oldperformanceevaluationtypedescriptorcodevalue, oldschoolyear, oldtermdescriptorid, oldtermdescriptornamespace, oldtermdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.evaluationobjectivetitle, OLD.evaluationperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.evaluationtitle, OLD.performanceevaluationtitle, OLD.performanceevaluationtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.schoolyear, OLD.termdescriptorid, dj2.namespace, dj2.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationobjective') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.evaluationobjective 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.evaluationobjective_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.evaluationobjectiverating_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
    dj3 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.evaluationperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.performanceevaluationtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.sourcesystemdescriptorid;

    SELECT INTO dj3 * FROM edfi.descriptor j3 WHERE descriptorid = old.termdescriptorid;

    INSERT INTO tracked_changes_tpdm.evaluationobjectiverating(
        oldeducationorganizationid, oldevaluationdate, oldevaluationobjectivetitle, oldevaluationperioddescriptorid, oldevaluationperioddescriptornamespace, oldevaluationperioddescriptorcodevalue, oldevaluationtitle, oldperformanceevaluationtitle, oldperformanceevaluationtypedescriptorid, oldperformanceevaluationtypedescriptornamespace, oldperformanceevaluationtypedescriptorcodevalue, oldpersonid, oldschoolyear, oldsourcesystemdescriptorid, oldsourcesystemdescriptornamespace, oldsourcesystemdescriptorcodevalue, oldtermdescriptorid, oldtermdescriptornamespace, oldtermdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.evaluationdate, OLD.evaluationobjectivetitle, OLD.evaluationperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.evaluationtitle, OLD.performanceevaluationtitle, OLD.performanceevaluationtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.personid, OLD.schoolyear, OLD.sourcesystemdescriptorid, dj2.namespace, dj2.codevalue, OLD.termdescriptorid, dj3.namespace, dj3.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationobjectiverating') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.evaluationobjectiverating 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.evaluationobjectiverating_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.evaluationperioddescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.EvaluationPeriodDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.EvaluationPeriodDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.EvaluationPeriodDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationperioddescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.evaluationperioddescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.evaluationperioddescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.evaluationrating_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
    dj3 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.evaluationperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.performanceevaluationtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.sourcesystemdescriptorid;

    SELECT INTO dj3 * FROM edfi.descriptor j3 WHERE descriptorid = old.termdescriptorid;

    INSERT INTO tracked_changes_tpdm.evaluationrating(
        oldeducationorganizationid, oldevaluationdate, oldevaluationperioddescriptorid, oldevaluationperioddescriptornamespace, oldevaluationperioddescriptorcodevalue, oldevaluationtitle, oldperformanceevaluationtitle, oldperformanceevaluationtypedescriptorid, oldperformanceevaluationtypedescriptornamespace, oldperformanceevaluationtypedescriptorcodevalue, oldpersonid, oldschoolyear, oldsourcesystemdescriptorid, oldsourcesystemdescriptornamespace, oldsourcesystemdescriptorcodevalue, oldtermdescriptorid, oldtermdescriptornamespace, oldtermdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.evaluationdate, OLD.evaluationperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.evaluationtitle, OLD.performanceevaluationtitle, OLD.performanceevaluationtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.personid, OLD.schoolyear, OLD.sourcesystemdescriptorid, dj2.namespace, dj2.codevalue, OLD.termdescriptorid, dj3.namespace, dj3.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationrating') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.evaluationrating 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.evaluationrating_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.evaluationratingleveldescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.EvaluationRatingLevelDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.EvaluationRatingLevelDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.EvaluationRatingLevelDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationratingleveldescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.evaluationratingleveldescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.evaluationratingleveldescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.evaluationratingstatusdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.EvaluationRatingStatusDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.EvaluationRatingStatusDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.EvaluationRatingStatusDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationratingstatusdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.evaluationratingstatusdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.evaluationratingstatusdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.evaluationtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.EvaluationTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.EvaluationTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.EvaluationTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.evaluationtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.evaluationtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.federallocalecodedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.FederalLocaleCodeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.FederalLocaleCodeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.FederalLocaleCodeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'federallocalecodedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.federallocalecodedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.federallocalecodedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.fieldworkexperience_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.student%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.student j0 WHERE studentusi = old.studentusi;

    INSERT INTO tracked_changes_tpdm.fieldworkexperience(
        oldbegindate, oldfieldworkidentifier, oldstudentusi, oldstudentuniqueid,
        id, discriminator, changeversion)
    VALUES (
        OLD.begindate, OLD.fieldworkidentifier, OLD.studentusi, dj0.studentuniqueid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'fieldworkexperience') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.fieldworkexperience 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.fieldworkexperience_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.fieldworkexperiencesectionassociation_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.student%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.student j0 WHERE studentusi = old.studentusi;

    INSERT INTO tracked_changes_tpdm.fieldworkexperiencesectionassociation(
        oldbegindate, oldfieldworkidentifier, oldlocalcoursecode, oldschoolid, oldschoolyear, oldsectionidentifier, oldsessionname, oldstudentusi, oldstudentuniqueid,
        id, discriminator, changeversion)
    VALUES (
        OLD.begindate, OLD.fieldworkidentifier, OLD.localcoursecode, OLD.schoolid, OLD.schoolyear, OLD.sectionidentifier, OLD.sessionname, OLD.studentusi, dj0.studentuniqueid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'fieldworkexperiencesectionassociation') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.fieldworkexperiencesectionassociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.fieldworkexperiencesectionassociation_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.fieldworktypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.FieldworkTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.FieldworkTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.FieldworkTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'fieldworktypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.fieldworktypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.fieldworktypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.financialaid_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.student%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.aidtypedescriptorid;

    SELECT INTO dj1 * FROM edfi.student j1 WHERE studentusi = old.studentusi;

    INSERT INTO tracked_changes_tpdm.financialaid(
        oldaidtypedescriptorid, oldaidtypedescriptornamespace, oldaidtypedescriptorcodevalue, oldbegindate, oldstudentusi, oldstudentuniqueid,
        id, discriminator, changeversion)
    VALUES (
        OLD.aidtypedescriptorid, dj0.namespace, dj0.codevalue, OLD.begindate, OLD.studentusi, dj1.studentuniqueid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'financialaid') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.financialaid 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.financialaid_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.fundingsourcedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.FundingSourceDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.FundingSourceDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.FundingSourceDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'fundingsourcedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.fundingsourcedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.fundingsourcedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.genderdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.GenderDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.GenderDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.GenderDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'genderdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.genderdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.genderdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.goal_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.sourcesystemdescriptorid;

    INSERT INTO tracked_changes_tpdm.goal(
        oldassignmentdate, oldgoaltitle, oldpersonid, oldsourcesystemdescriptorid, oldsourcesystemdescriptornamespace, oldsourcesystemdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.assignmentdate, OLD.goaltitle, OLD.personid, OLD.sourcesystemdescriptorid, dj0.namespace, dj0.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'goal') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.goal 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.goal_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.goaltypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.GoalTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.GoalTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.GoalTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'goaltypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.goaltypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.goaltypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.hirestatusdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.HireStatusDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.HireStatusDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.HireStatusDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'hirestatusdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.hirestatusdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.hirestatusdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.hiringsourcedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.HiringSourceDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.HiringSourceDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.HiringSourceDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'hiringsourcedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.hiringsourcedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.hiringsourcedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.instructionalsettingdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.InstructionalSettingDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.InstructionalSettingDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.InstructionalSettingDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'instructionalsettingdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.instructionalsettingdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.instructionalsettingdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.lengthofcontractdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.LengthOfContractDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.LengthOfContractDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.LengthOfContractDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'lengthofcontractdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.lengthofcontractdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.lengthofcontractdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.objectiveratingleveldescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ObjectiveRatingLevelDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.ObjectiveRatingLevelDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ObjectiveRatingLevelDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'objectiveratingleveldescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.objectiveratingleveldescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.objectiveratingleveldescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.openstaffpositionevent_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.openstaffpositioneventtypedescriptorid;

    INSERT INTO tracked_changes_tpdm.openstaffpositionevent(
        oldeducationorganizationid, oldeventdate, oldopenstaffpositioneventtypedescriptorid, oldopenstaffpositioneventtypedescriptornamespace, oldopenstaffpositioneventtypedescriptorcodevalue, oldrequisitionnumber,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.eventdate, OLD.openstaffpositioneventtypedescriptorid, dj0.namespace, dj0.codevalue, OLD.requisitionnumber, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'openstaffpositionevent') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.openstaffpositionevent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.openstaffpositionevent_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.openstaffpositioneventstatusdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.OpenStaffPositionEventStatusDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.OpenStaffPositionEventStatusDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.OpenStaffPositionEventStatusDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'openstaffpositioneventstatusdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.openstaffpositioneventstatusdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.openstaffpositioneventstatusdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.openstaffpositioneventtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.OpenStaffPositionEventTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.OpenStaffPositionEventTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.OpenStaffPositionEventTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'openstaffpositioneventtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.openstaffpositioneventtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.openstaffpositioneventtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.openstaffpositionreasondescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.OpenStaffPositionReasonDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.OpenStaffPositionReasonDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.OpenStaffPositionReasonDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'openstaffpositionreasondescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.openstaffpositionreasondescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.openstaffpositionreasondescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.performanceevaluation_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.evaluationperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.performanceevaluationtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.termdescriptorid;

    INSERT INTO tracked_changes_tpdm.performanceevaluation(
        oldeducationorganizationid, oldevaluationperioddescriptorid, oldevaluationperioddescriptornamespace, oldevaluationperioddescriptorcodevalue, oldperformanceevaluationtitle, oldperformanceevaluationtypedescriptorid, oldperformanceevaluationtypedescriptornamespace, oldperformanceevaluationtypedescriptorcodevalue, oldschoolyear, oldtermdescriptorid, oldtermdescriptornamespace, oldtermdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.evaluationperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.performanceevaluationtitle, OLD.performanceevaluationtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.schoolyear, OLD.termdescriptorid, dj2.namespace, dj2.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'performanceevaluation') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.performanceevaluation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.performanceevaluation_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.performanceevaluationrating_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
    dj3 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.evaluationperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.performanceevaluationtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.sourcesystemdescriptorid;

    SELECT INTO dj3 * FROM edfi.descriptor j3 WHERE descriptorid = old.termdescriptorid;

    INSERT INTO tracked_changes_tpdm.performanceevaluationrating(
        oldeducationorganizationid, oldevaluationperioddescriptorid, oldevaluationperioddescriptornamespace, oldevaluationperioddescriptorcodevalue, oldperformanceevaluationtitle, oldperformanceevaluationtypedescriptorid, oldperformanceevaluationtypedescriptornamespace, oldperformanceevaluationtypedescriptorcodevalue, oldpersonid, oldschoolyear, oldsourcesystemdescriptorid, oldsourcesystemdescriptornamespace, oldsourcesystemdescriptorcodevalue, oldtermdescriptorid, oldtermdescriptornamespace, oldtermdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.evaluationperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.performanceevaluationtitle, OLD.performanceevaluationtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.personid, OLD.schoolyear, OLD.sourcesystemdescriptorid, dj2.namespace, dj2.codevalue, OLD.termdescriptorid, dj3.namespace, dj3.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'performanceevaluationrating') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.performanceevaluationrating 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.performanceevaluationrating_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.performanceevaluationratingleveldescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.PerformanceEvaluationRatingLevelDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.PerformanceEvaluationRatingLevelDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.PerformanceEvaluationRatingLevelDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'performanceevaluationratingleveldescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.performanceevaluationratingleveldescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.performanceevaluationratingleveldescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.performanceevaluationtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.PerformanceEvaluationTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.PerformanceEvaluationTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.PerformanceEvaluationTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'performanceevaluationtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.performanceevaluationtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.performanceevaluationtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.previouscareerdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.PreviousCareerDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.PreviousCareerDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.PreviousCareerDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'previouscareerdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.previouscareerdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.previouscareerdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.professionaldevelopmentevent_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_tpdm.professionaldevelopmentevent(
        oldnamespace, oldprofessionaldevelopmenttitle,
        id, discriminator, changeversion)
    VALUES (
        OLD.namespace, OLD.professionaldevelopmenttitle, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'professionaldevelopmentevent') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.professionaldevelopmentevent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.professionaldevelopmentevent_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.professionaldevelopmenteventattendance_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.sourcesystemdescriptorid;

    INSERT INTO tracked_changes_tpdm.professionaldevelopmenteventattendance(
        oldattendancedate, oldnamespace, oldpersonid, oldprofessionaldevelopmenttitle, oldsourcesystemdescriptorid, oldsourcesystemdescriptornamespace, oldsourcesystemdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.attendancedate, OLD.namespace, OLD.personid, OLD.professionaldevelopmenttitle, OLD.sourcesystemdescriptorid, dj0.namespace, dj0.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'professionaldevelopmenteventattendance') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.professionaldevelopmenteventattendance 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.professionaldevelopmenteventattendance_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.professionaldevelopmentofferedbydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ProfessionalDevelopmentOfferedByDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.ProfessionalDevelopmentOfferedByDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ProfessionalDevelopmentOfferedByDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'professionaldevelopmentofferedbydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.professionaldevelopmentofferedbydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.professionaldevelopmentofferedbydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.programgatewaydescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.ProgramGatewayDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.ProgramGatewayDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.ProgramGatewayDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'programgatewaydescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.programgatewaydescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.programgatewaydescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.quantitativemeasure_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.evaluationperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.performanceevaluationtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.termdescriptorid;

    INSERT INTO tracked_changes_tpdm.quantitativemeasure(
        oldeducationorganizationid, oldevaluationelementtitle, oldevaluationobjectivetitle, oldevaluationperioddescriptorid, oldevaluationperioddescriptornamespace, oldevaluationperioddescriptorcodevalue, oldevaluationtitle, oldperformanceevaluationtitle, oldperformanceevaluationtypedescriptorid, oldperformanceevaluationtypedescriptornamespace, oldperformanceevaluationtypedescriptorcodevalue, oldquantitativemeasureidentifier, oldschoolyear, oldtermdescriptorid, oldtermdescriptornamespace, oldtermdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.evaluationelementtitle, OLD.evaluationobjectivetitle, OLD.evaluationperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.evaluationtitle, OLD.performanceevaluationtitle, OLD.performanceevaluationtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.quantitativemeasureidentifier, OLD.schoolyear, OLD.termdescriptorid, dj2.namespace, dj2.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'quantitativemeasure') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.quantitativemeasure 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.quantitativemeasure_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.quantitativemeasuredatatypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.QuantitativeMeasureDatatypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.QuantitativeMeasureDatatypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.QuantitativeMeasureDatatypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'quantitativemeasuredatatypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.quantitativemeasuredatatypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.quantitativemeasuredatatypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.quantitativemeasurescore_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
    dj3 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.evaluationperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.performanceevaluationtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.sourcesystemdescriptorid;

    SELECT INTO dj3 * FROM edfi.descriptor j3 WHERE descriptorid = old.termdescriptorid;

    INSERT INTO tracked_changes_tpdm.quantitativemeasurescore(
        oldeducationorganizationid, oldevaluationdate, oldevaluationelementtitle, oldevaluationobjectivetitle, oldevaluationperioddescriptorid, oldevaluationperioddescriptornamespace, oldevaluationperioddescriptorcodevalue, oldevaluationtitle, oldperformanceevaluationtitle, oldperformanceevaluationtypedescriptorid, oldperformanceevaluationtypedescriptornamespace, oldperformanceevaluationtypedescriptorcodevalue, oldpersonid, oldquantitativemeasureidentifier, oldschoolyear, oldsourcesystemdescriptorid, oldsourcesystemdescriptornamespace, oldsourcesystemdescriptorcodevalue, oldtermdescriptorid, oldtermdescriptornamespace, oldtermdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.evaluationdate, OLD.evaluationelementtitle, OLD.evaluationobjectivetitle, OLD.evaluationperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.evaluationtitle, OLD.performanceevaluationtitle, OLD.performanceevaluationtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.personid, OLD.quantitativemeasureidentifier, OLD.schoolyear, OLD.sourcesystemdescriptorid, dj2.namespace, dj2.codevalue, OLD.termdescriptorid, dj3.namespace, dj3.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'quantitativemeasurescore') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.quantitativemeasurescore 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.quantitativemeasurescore_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.quantitativemeasuretypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.QuantitativeMeasureTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.QuantitativeMeasureTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.QuantitativeMeasureTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'quantitativemeasuretypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.quantitativemeasuretypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.quantitativemeasuretypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.recruitmentevent_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_tpdm.recruitmentevent(
        oldeducationorganizationid, oldeventdate, oldeventtitle,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.eventdate, OLD.eventtitle, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'recruitmentevent') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.recruitmentevent 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.recruitmentevent_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.recruitmenteventattendance_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_tpdm.recruitmenteventattendance(
        oldeducationorganizationid, oldeventdate, oldeventtitle, oldrecruitmenteventattendeeidentifier,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.eventdate, OLD.eventtitle, OLD.recruitmenteventattendeeidentifier, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'recruitmenteventattendance') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.recruitmenteventattendance 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.recruitmenteventattendance_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.recruitmenteventattendeetypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.RecruitmentEventAttendeeTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.RecruitmentEventAttendeeTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.RecruitmentEventAttendeeTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'recruitmenteventattendeetypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.recruitmenteventattendeetypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.recruitmenteventattendeetypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.recruitmenteventtypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.RecruitmentEventTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.RecruitmentEventTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.RecruitmentEventTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'recruitmenteventtypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.recruitmenteventtypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.recruitmenteventtypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.rubricdimension_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.evaluationperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.performanceevaluationtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.termdescriptorid;

    INSERT INTO tracked_changes_tpdm.rubricdimension(
        oldeducationorganizationid, oldevaluationelementtitle, oldevaluationobjectivetitle, oldevaluationperioddescriptorid, oldevaluationperioddescriptornamespace, oldevaluationperioddescriptorcodevalue, oldevaluationtitle, oldperformanceevaluationtitle, oldperformanceevaluationtypedescriptorid, oldperformanceevaluationtypedescriptornamespace, oldperformanceevaluationtypedescriptorcodevalue, oldrubricrating, oldschoolyear, oldtermdescriptorid, oldtermdescriptornamespace, oldtermdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.evaluationelementtitle, OLD.evaluationobjectivetitle, OLD.evaluationperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.evaluationtitle, OLD.performanceevaluationtitle, OLD.performanceevaluationtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.rubricrating, OLD.schoolyear, OLD.termdescriptorid, dj2.namespace, dj2.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'rubricdimension') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.rubricdimension 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.rubricdimension_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.rubricratingleveldescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.RubricRatingLevelDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.RubricRatingLevelDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.RubricRatingLevelDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'rubricratingleveldescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.rubricratingleveldescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.rubricratingleveldescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.salarytypedescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.SalaryTypeDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.SalaryTypeDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.SalaryTypeDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'salarytypedescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.salarytypedescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.salarytypedescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.staffeducatorpreparationprogramassociation_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.staff%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.programtypedescriptorid;

    SELECT INTO dj1 * FROM edfi.staff j1 WHERE staffusi = old.staffusi;

    INSERT INTO tracked_changes_tpdm.staffeducatorpreparationprogramassociation(
        oldeducationorganizationid, oldprogramname, oldprogramtypedescriptorid, oldprogramtypedescriptornamespace, oldprogramtypedescriptorcodevalue, oldstaffusi, oldstaffuniqueid,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.programname, OLD.programtypedescriptorid, dj0.namespace, dj0.codevalue, OLD.staffusi, dj1.staffuniqueid, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'staffeducatorpreparationprogramassociation') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.staffeducatorpreparationprogramassociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.staffeducatorpreparationprogramassociation_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.stafftocandidaterelationshipdescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.StaffToCandidateRelationshipDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.StaffToCandidateRelationshipDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.StaffToCandidateRelationshipDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'stafftocandidaterelationshipdescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.stafftocandidaterelationshipdescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.stafftocandidaterelationshipdescriptor_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.surveyresponsepersontargetassociation_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.sourcesystemdescriptorid;

    INSERT INTO tracked_changes_tpdm.surveyresponsepersontargetassociation(
        oldnamespace, oldpersonid, oldsourcesystemdescriptorid, oldsourcesystemdescriptornamespace, oldsourcesystemdescriptorcodevalue, oldsurveyidentifier, oldsurveyresponseidentifier,
        id, discriminator, changeversion)
    VALUES (
        OLD.namespace, OLD.personid, OLD.sourcesystemdescriptorid, dj0.namespace, dj0.codevalue, OLD.surveyidentifier, OLD.surveyresponseidentifier, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'surveyresponsepersontargetassociation') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.surveyresponsepersontargetassociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.surveyresponsepersontargetassociation_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.surveysectionaggregateresponse_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
    dj1 edfi.descriptor%ROWTYPE;
    dj2 edfi.descriptor%ROWTYPE;
    dj3 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.evaluationperioddescriptorid;

    SELECT INTO dj1 * FROM edfi.descriptor j1 WHERE descriptorid = old.performanceevaluationtypedescriptorid;

    SELECT INTO dj2 * FROM edfi.descriptor j2 WHERE descriptorid = old.sourcesystemdescriptorid;

    SELECT INTO dj3 * FROM edfi.descriptor j3 WHERE descriptorid = old.termdescriptorid;

    INSERT INTO tracked_changes_tpdm.surveysectionaggregateresponse(
        oldeducationorganizationid, oldevaluationdate, oldevaluationelementtitle, oldevaluationobjectivetitle, oldevaluationperioddescriptorid, oldevaluationperioddescriptornamespace, oldevaluationperioddescriptorcodevalue, oldevaluationtitle, oldnamespace, oldperformanceevaluationtitle, oldperformanceevaluationtypedescriptorid, oldperformanceevaluationtypedescriptornamespace, oldperformanceevaluationtypedescriptorcodevalue, oldpersonid, oldschoolyear, oldsourcesystemdescriptorid, oldsourcesystemdescriptornamespace, oldsourcesystemdescriptorcodevalue, oldsurveyidentifier, oldsurveysectiontitle, oldtermdescriptorid, oldtermdescriptornamespace, oldtermdescriptorcodevalue,
        id, discriminator, changeversion)
    VALUES (
        OLD.educationorganizationid, OLD.evaluationdate, OLD.evaluationelementtitle, OLD.evaluationobjectivetitle, OLD.evaluationperioddescriptorid, dj0.namespace, dj0.codevalue, OLD.evaluationtitle, OLD.namespace, OLD.performanceevaluationtitle, OLD.performanceevaluationtypedescriptorid, dj1.namespace, dj1.codevalue, OLD.personid, OLD.schoolyear, OLD.sourcesystemdescriptorid, dj2.namespace, dj2.codevalue, OLD.surveyidentifier, OLD.surveysectiontitle, OLD.termdescriptorid, dj3.namespace, dj3.codevalue, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'surveysectionaggregateresponse') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.surveysectionaggregateresponse 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.surveysectionaggregateresponse_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.surveysectionresponsepersontargetassociation_deleted()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.descriptor%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.descriptor j0 WHERE descriptorid = old.sourcesystemdescriptorid;

    INSERT INTO tracked_changes_tpdm.surveysectionresponsepersontargetassociation(
        oldnamespace, oldpersonid, oldsourcesystemdescriptorid, oldsourcesystemdescriptornamespace, oldsourcesystemdescriptorcodevalue, oldsurveyidentifier, oldsurveyresponseidentifier, oldsurveysectiontitle,
        id, discriminator, changeversion)
    VALUES (
        OLD.namespace, OLD.personid, OLD.sourcesystemdescriptorid, dj0.namespace, dj0.codevalue, OLD.surveyidentifier, OLD.surveyresponseidentifier, OLD.surveysectiontitle, 
        OLD.id, OLD.discriminator, nextval('changes.changeversionsequence'));

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'surveysectionresponsepersontargetassociation') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.surveysectionresponsepersontargetassociation 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.surveysectionresponsepersontargetassociation_deleted();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.withdrawreasondescriptor_deleted()
    RETURNS trigger AS
$BODY$
BEGIN
    INSERT INTO tracked_changes_edfi.descriptor(olddescriptorid, oldcodevalue, oldnamespace, id, discriminator, changeversion)
    SELECT OLD.WithdrawReasonDescriptorId, b.codevalue, b.namespace, b.id, 'tpdm.WithdrawReasonDescriptor', nextval('changes.ChangeVersionSequence')
    FROM edfi.descriptor b WHERE old.WithdrawReasonDescriptorId = b.descriptorid ;

    RETURN NULL;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'trackdeletes' AND event_object_schema = 'tpdm' AND event_object_table = 'withdrawreasondescriptor') THEN
CREATE TRIGGER TrackDeletes AFTER DELETE ON tpdm.withdrawreasondescriptor 
    FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.withdrawreasondescriptor_deleted();
END IF;

END
$$;
