DO $$
BEGIN
IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'applicantprofile') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.applicantprofile
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'application') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.application
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'applicationevent') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.applicationevent
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'candidate') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.candidate
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'candidateeducatorpreparationprogramassociation') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.candidateeducatorpreparationprogramassociation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'candidaterelationshiptostaffassociation') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.candidaterelationshiptostaffassociation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'certification') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.certification
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'certificationexam') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.certificationexam
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'certificationexamresult') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.certificationexamresult
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'credentialevent') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.credentialevent
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'educatorpreparationprogram') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.educatorpreparationprogram
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluation') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.evaluation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationelement') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.evaluationelement
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationelementrating') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.evaluationelementrating
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationobjective') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.evaluationobjective
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationobjectiverating') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.evaluationobjectiverating
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'evaluationrating') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.evaluationrating
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'fieldworkexperience') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.fieldworkexperience
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'fieldworkexperiencesectionassociation') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.fieldworkexperiencesectionassociation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

CREATE OR REPLACE FUNCTION tracked_changes_tpdm.fieldworkexperiencesectionassociation_keychg()
    RETURNS trigger AS
$BODY$
DECLARE
    dj0 edfi.student%ROWTYPE;
    ij0 edfi.student%ROWTYPE;
BEGIN
    SELECT INTO dj0 * FROM edfi.student j0 WHERE studentusi = old.studentusi;
    SELECT INTO ij0 * FROM edfi.student j0 WHERE studentusi = new.studentusi;

    -- Handle key changes
    INSERT INTO tracked_changes_tpdm.fieldworkexperiencesectionassociation(
        oldbegindate, oldfieldworkidentifier, oldlocalcoursecode, oldschoolid, oldschoolyear, oldsectionidentifier, oldsessionname, oldstudentusi, oldstudentuniqueid, 
        newbegindate, newfieldworkidentifier, newlocalcoursecode, newschoolid, newschoolyear, newsectionidentifier, newsessionname, newstudentusi, newstudentuniqueid, 
        id, changeversion)
    VALUES (
        old.begindate, old.fieldworkidentifier, old.localcoursecode, old.schoolid, old.schoolyear, old.sectionidentifier, old.sessionname, old.studentusi, dj0.studentuniqueid, 
        new.begindate, new.fieldworkidentifier, new.localcoursecode, new.schoolid, new.schoolyear, new.sectionidentifier, new.sessionname, new.studentusi, ij0.studentuniqueid, 
        old.id, (nextval('changes.changeversionsequence')));

    RETURN null;
END;
$BODY$ LANGUAGE plpgsql;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'handlekeychanges' AND event_object_schema = 'tpdm' AND event_object_table = 'fieldworkexperiencesectionassociation') THEN
    CREATE TRIGGER HandleKeyChanges AFTER UPDATE OF begindate, fieldworkidentifier, localcoursecode, schoolid, schoolyear, sectionidentifier, sessionname, studentusi ON tpdm.fieldworkexperiencesectionassociation
        FOR EACH ROW EXECUTE PROCEDURE tracked_changes_tpdm.fieldworkexperiencesectionassociation_keychg();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'financialaid') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.financialaid
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'goal') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.goal
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'openstaffpositionevent') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.openstaffpositionevent
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'performanceevaluation') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.performanceevaluation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'performanceevaluationrating') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.performanceevaluationrating
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'professionaldevelopmentevent') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.professionaldevelopmentevent
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'professionaldevelopmenteventattendance') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.professionaldevelopmenteventattendance
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'quantitativemeasure') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.quantitativemeasure
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'quantitativemeasurescore') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.quantitativemeasurescore
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'recruitmentevent') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.recruitmentevent
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'recruitmenteventattendance') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.recruitmenteventattendance
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'rubricdimension') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.rubricdimension
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'staffeducatorpreparationprogramassociation') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.staffeducatorpreparationprogramassociation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'surveyresponsepersontargetassociation') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.surveyresponsepersontargetassociation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'surveysectionaggregateresponse') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.surveysectionaggregateresponse
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

IF NOT EXISTS(SELECT 1 FROM information_schema.triggers WHERE trigger_name = 'updatechangeversion' AND event_object_schema = 'tpdm' AND event_object_table = 'surveysectionresponsepersontargetassociation') THEN
CREATE TRIGGER UpdateChangeVersion BEFORE UPDATE ON tpdm.surveysectionresponsepersontargetassociation
    FOR EACH ROW EXECUTE PROCEDURE changes.UpdateChangeVersion();
END IF;

END
$$;
