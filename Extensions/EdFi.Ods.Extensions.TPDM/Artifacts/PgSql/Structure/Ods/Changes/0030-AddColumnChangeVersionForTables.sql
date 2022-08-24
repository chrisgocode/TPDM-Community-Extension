-- For performance reasons on existing data sets, all existing records will start with ChangeVersion of 0.
DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='applicantprofile' AND column_name='changeversion') THEN
ALTER TABLE tpdm.ApplicantProfile ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.ApplicantProfile ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='application' AND column_name='changeversion') THEN
ALTER TABLE tpdm.Application ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.Application ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='applicationevent' AND column_name='changeversion') THEN
ALTER TABLE tpdm.ApplicationEvent ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.ApplicationEvent ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='candidate' AND column_name='changeversion') THEN
ALTER TABLE tpdm.Candidate ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.Candidate ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='candidateeducatorpreparationprogramassociation' AND column_name='changeversion') THEN
ALTER TABLE tpdm.CandidateEducatorPreparationProgramAssociation ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.CandidateEducatorPreparationProgramAssociation ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='candidaterelationshiptostaffassociation' AND column_name='changeversion') THEN
ALTER TABLE tpdm.CandidateRelationshipToStaffAssociation ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.CandidateRelationshipToStaffAssociation ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='certification' AND column_name='changeversion') THEN
ALTER TABLE tpdm.Certification ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.Certification ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='certificationexam' AND column_name='changeversion') THEN
ALTER TABLE tpdm.CertificationExam ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.CertificationExam ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='certificationexamresult' AND column_name='changeversion') THEN
ALTER TABLE tpdm.CertificationExamResult ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.CertificationExamResult ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='credentialevent' AND column_name='changeversion') THEN
ALTER TABLE tpdm.CredentialEvent ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.CredentialEvent ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='educatorpreparationprogram' AND column_name='changeversion') THEN
ALTER TABLE tpdm.EducatorPreparationProgram ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.EducatorPreparationProgram ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='evaluation' AND column_name='changeversion') THEN
ALTER TABLE tpdm.Evaluation ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.Evaluation ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='evaluationelement' AND column_name='changeversion') THEN
ALTER TABLE tpdm.EvaluationElement ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.EvaluationElement ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='evaluationelementrating' AND column_name='changeversion') THEN
ALTER TABLE tpdm.EvaluationElementRating ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.EvaluationElementRating ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='evaluationobjective' AND column_name='changeversion') THEN
ALTER TABLE tpdm.EvaluationObjective ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.EvaluationObjective ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='evaluationobjectiverating' AND column_name='changeversion') THEN
ALTER TABLE tpdm.EvaluationObjectiveRating ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.EvaluationObjectiveRating ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='evaluationrating' AND column_name='changeversion') THEN
ALTER TABLE tpdm.EvaluationRating ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.EvaluationRating ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='fieldworkexperience' AND column_name='changeversion') THEN
ALTER TABLE tpdm.FieldworkExperience ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.FieldworkExperience ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='fieldworkexperiencesectionassociation' AND column_name='changeversion') THEN
ALTER TABLE tpdm.FieldworkExperienceSectionAssociation ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.FieldworkExperienceSectionAssociation ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='financialaid' AND column_name='changeversion') THEN
ALTER TABLE tpdm.FinancialAid ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.FinancialAid ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='goal' AND column_name='changeversion') THEN
ALTER TABLE tpdm.Goal ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.Goal ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='openstaffpositionevent' AND column_name='changeversion') THEN
ALTER TABLE tpdm.OpenStaffPositionEvent ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.OpenStaffPositionEvent ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='performanceevaluation' AND column_name='changeversion') THEN
ALTER TABLE tpdm.PerformanceEvaluation ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.PerformanceEvaluation ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='performanceevaluationrating' AND column_name='changeversion') THEN
ALTER TABLE tpdm.PerformanceEvaluationRating ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.PerformanceEvaluationRating ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='professionaldevelopmentevent' AND column_name='changeversion') THEN
ALTER TABLE tpdm.ProfessionalDevelopmentEvent ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.ProfessionalDevelopmentEvent ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='professionaldevelopmenteventattendance' AND column_name='changeversion') THEN
ALTER TABLE tpdm.ProfessionalDevelopmentEventAttendance ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.ProfessionalDevelopmentEventAttendance ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='quantitativemeasure' AND column_name='changeversion') THEN
ALTER TABLE tpdm.QuantitativeMeasure ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.QuantitativeMeasure ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='quantitativemeasurescore' AND column_name='changeversion') THEN
ALTER TABLE tpdm.QuantitativeMeasureScore ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.QuantitativeMeasureScore ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='recruitmentevent' AND column_name='changeversion') THEN
ALTER TABLE tpdm.RecruitmentEvent ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.RecruitmentEvent ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='recruitmenteventattendance' AND column_name='changeversion') THEN
ALTER TABLE tpdm.RecruitmentEventAttendance ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.RecruitmentEventAttendance ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='rubricdimension' AND column_name='changeversion') THEN
ALTER TABLE tpdm.RubricDimension ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.RubricDimension ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='staffeducatorpreparationprogramassociation' AND column_name='changeversion') THEN
ALTER TABLE tpdm.StaffEducatorPreparationProgramAssociation ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.StaffEducatorPreparationProgramAssociation ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='surveyresponsepersontargetassociation' AND column_name='changeversion') THEN
ALTER TABLE tpdm.SurveyResponsePersonTargetAssociation ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.SurveyResponsePersonTargetAssociation ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='surveysectionaggregateresponse' AND column_name='changeversion') THEN
ALTER TABLE tpdm.SurveySectionAggregateResponse ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.SurveySectionAggregateResponse ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

IF NOT EXISTS (SELECT 1 FROM information_schema.columns WHERE table_schema='tpdm' AND table_name='surveysectionresponsepersontargetassociation' AND column_name='changeversion') THEN
ALTER TABLE tpdm.SurveySectionResponsePersonTargetAssociation ADD ChangeVersion BIGINT DEFAULT (0) NOT NULL;
ALTER TABLE tpdm.SurveySectionResponsePersonTargetAssociation ALTER ChangeVersion SET DEFAULT nextval('changes.ChangeVersionSequence');
END IF;

END
$$;
