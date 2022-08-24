
-- For performance reasons on existing data sets, all existing records will start with ChangeVersion of 0.
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[ApplicantProfile]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[ApplicantProfile] ADD [ChangeVersion] [BIGINT] CONSTRAINT ApplicantProfile_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[ApplicantProfile] DROP CONSTRAINT ApplicantProfile_DF_ChangeVersion;
ALTER TABLE [tpdm].[ApplicantProfile] ADD CONSTRAINT ApplicantProfile_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[Application]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[Application] ADD [ChangeVersion] [BIGINT] CONSTRAINT Application_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[Application] DROP CONSTRAINT Application_DF_ChangeVersion;
ALTER TABLE [tpdm].[Application] ADD CONSTRAINT Application_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[ApplicationEvent]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[ApplicationEvent] ADD [ChangeVersion] [BIGINT] CONSTRAINT ApplicationEvent_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[ApplicationEvent] DROP CONSTRAINT ApplicationEvent_DF_ChangeVersion;
ALTER TABLE [tpdm].[ApplicationEvent] ADD CONSTRAINT ApplicationEvent_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[Candidate]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[Candidate] ADD [ChangeVersion] [BIGINT] CONSTRAINT Candidate_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[Candidate] DROP CONSTRAINT Candidate_DF_ChangeVersion;
ALTER TABLE [tpdm].[Candidate] ADD CONSTRAINT Candidate_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[CandidateEducatorPreparationProgramAssociation]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociation] ADD [ChangeVersion] [BIGINT] CONSTRAINT CandidateEducatorPreparationProgramAssociation_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociation] DROP CONSTRAINT CandidateEducatorPreparationProgramAssociation_DF_ChangeVersion;
ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociation] ADD CONSTRAINT CandidateEducatorPreparationProgramAssociation_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[CandidateRelationshipToStaffAssociation]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[CandidateRelationshipToStaffAssociation] ADD [ChangeVersion] [BIGINT] CONSTRAINT CandidateRelationshipToStaffAssociation_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[CandidateRelationshipToStaffAssociation] DROP CONSTRAINT CandidateRelationshipToStaffAssociation_DF_ChangeVersion;
ALTER TABLE [tpdm].[CandidateRelationshipToStaffAssociation] ADD CONSTRAINT CandidateRelationshipToStaffAssociation_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[Certification]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[Certification] ADD [ChangeVersion] [BIGINT] CONSTRAINT Certification_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[Certification] DROP CONSTRAINT Certification_DF_ChangeVersion;
ALTER TABLE [tpdm].[Certification] ADD CONSTRAINT Certification_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[CertificationExam]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[CertificationExam] ADD [ChangeVersion] [BIGINT] CONSTRAINT CertificationExam_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[CertificationExam] DROP CONSTRAINT CertificationExam_DF_ChangeVersion;
ALTER TABLE [tpdm].[CertificationExam] ADD CONSTRAINT CertificationExam_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[CertificationExamResult]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[CertificationExamResult] ADD [ChangeVersion] [BIGINT] CONSTRAINT CertificationExamResult_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[CertificationExamResult] DROP CONSTRAINT CertificationExamResult_DF_ChangeVersion;
ALTER TABLE [tpdm].[CertificationExamResult] ADD CONSTRAINT CertificationExamResult_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[CredentialEvent]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[CredentialEvent] ADD [ChangeVersion] [BIGINT] CONSTRAINT CredentialEvent_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[CredentialEvent] DROP CONSTRAINT CredentialEvent_DF_ChangeVersion;
ALTER TABLE [tpdm].[CredentialEvent] ADD CONSTRAINT CredentialEvent_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[EducatorPreparationProgram]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[EducatorPreparationProgram] ADD [ChangeVersion] [BIGINT] CONSTRAINT EducatorPreparationProgram_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[EducatorPreparationProgram] DROP CONSTRAINT EducatorPreparationProgram_DF_ChangeVersion;
ALTER TABLE [tpdm].[EducatorPreparationProgram] ADD CONSTRAINT EducatorPreparationProgram_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[Evaluation]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[Evaluation] ADD [ChangeVersion] [BIGINT] CONSTRAINT Evaluation_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[Evaluation] DROP CONSTRAINT Evaluation_DF_ChangeVersion;
ALTER TABLE [tpdm].[Evaluation] ADD CONSTRAINT Evaluation_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[EvaluationElement]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[EvaluationElement] ADD [ChangeVersion] [BIGINT] CONSTRAINT EvaluationElement_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[EvaluationElement] DROP CONSTRAINT EvaluationElement_DF_ChangeVersion;
ALTER TABLE [tpdm].[EvaluationElement] ADD CONSTRAINT EvaluationElement_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[EvaluationElementRating]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[EvaluationElementRating] ADD [ChangeVersion] [BIGINT] CONSTRAINT EvaluationElementRating_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[EvaluationElementRating] DROP CONSTRAINT EvaluationElementRating_DF_ChangeVersion;
ALTER TABLE [tpdm].[EvaluationElementRating] ADD CONSTRAINT EvaluationElementRating_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[EvaluationObjective]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[EvaluationObjective] ADD [ChangeVersion] [BIGINT] CONSTRAINT EvaluationObjective_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[EvaluationObjective] DROP CONSTRAINT EvaluationObjective_DF_ChangeVersion;
ALTER TABLE [tpdm].[EvaluationObjective] ADD CONSTRAINT EvaluationObjective_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[EvaluationObjectiveRating]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[EvaluationObjectiveRating] ADD [ChangeVersion] [BIGINT] CONSTRAINT EvaluationObjectiveRating_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[EvaluationObjectiveRating] DROP CONSTRAINT EvaluationObjectiveRating_DF_ChangeVersion;
ALTER TABLE [tpdm].[EvaluationObjectiveRating] ADD CONSTRAINT EvaluationObjectiveRating_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[EvaluationRating]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[EvaluationRating] ADD [ChangeVersion] [BIGINT] CONSTRAINT EvaluationRating_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[EvaluationRating] DROP CONSTRAINT EvaluationRating_DF_ChangeVersion;
ALTER TABLE [tpdm].[EvaluationRating] ADD CONSTRAINT EvaluationRating_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[FieldworkExperience]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[FieldworkExperience] ADD [ChangeVersion] [BIGINT] CONSTRAINT FieldworkExperience_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[FieldworkExperience] DROP CONSTRAINT FieldworkExperience_DF_ChangeVersion;
ALTER TABLE [tpdm].[FieldworkExperience] ADD CONSTRAINT FieldworkExperience_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[FieldworkExperienceSectionAssociation]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[FieldworkExperienceSectionAssociation] ADD [ChangeVersion] [BIGINT] CONSTRAINT FieldworkExperienceSectionAssociation_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[FieldworkExperienceSectionAssociation] DROP CONSTRAINT FieldworkExperienceSectionAssociation_DF_ChangeVersion;
ALTER TABLE [tpdm].[FieldworkExperienceSectionAssociation] ADD CONSTRAINT FieldworkExperienceSectionAssociation_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[FinancialAid]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[FinancialAid] ADD [ChangeVersion] [BIGINT] CONSTRAINT FinancialAid_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[FinancialAid] DROP CONSTRAINT FinancialAid_DF_ChangeVersion;
ALTER TABLE [tpdm].[FinancialAid] ADD CONSTRAINT FinancialAid_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[Goal]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[Goal] ADD [ChangeVersion] [BIGINT] CONSTRAINT Goal_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[Goal] DROP CONSTRAINT Goal_DF_ChangeVersion;
ALTER TABLE [tpdm].[Goal] ADD CONSTRAINT Goal_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[OpenStaffPositionEvent]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[OpenStaffPositionEvent] ADD [ChangeVersion] [BIGINT] CONSTRAINT OpenStaffPositionEvent_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[OpenStaffPositionEvent] DROP CONSTRAINT OpenStaffPositionEvent_DF_ChangeVersion;
ALTER TABLE [tpdm].[OpenStaffPositionEvent] ADD CONSTRAINT OpenStaffPositionEvent_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[PerformanceEvaluation]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[PerformanceEvaluation] ADD [ChangeVersion] [BIGINT] CONSTRAINT PerformanceEvaluation_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[PerformanceEvaluation] DROP CONSTRAINT PerformanceEvaluation_DF_ChangeVersion;
ALTER TABLE [tpdm].[PerformanceEvaluation] ADD CONSTRAINT PerformanceEvaluation_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[PerformanceEvaluationRating]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[PerformanceEvaluationRating] ADD [ChangeVersion] [BIGINT] CONSTRAINT PerformanceEvaluationRating_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[PerformanceEvaluationRating] DROP CONSTRAINT PerformanceEvaluationRating_DF_ChangeVersion;
ALTER TABLE [tpdm].[PerformanceEvaluationRating] ADD CONSTRAINT PerformanceEvaluationRating_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[ProfessionalDevelopmentEvent]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[ProfessionalDevelopmentEvent] ADD [ChangeVersion] [BIGINT] CONSTRAINT ProfessionalDevelopmentEvent_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[ProfessionalDevelopmentEvent] DROP CONSTRAINT ProfessionalDevelopmentEvent_DF_ChangeVersion;
ALTER TABLE [tpdm].[ProfessionalDevelopmentEvent] ADD CONSTRAINT ProfessionalDevelopmentEvent_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[ProfessionalDevelopmentEventAttendance]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[ProfessionalDevelopmentEventAttendance] ADD [ChangeVersion] [BIGINT] CONSTRAINT ProfessionalDevelopmentEventAttendance_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[ProfessionalDevelopmentEventAttendance] DROP CONSTRAINT ProfessionalDevelopmentEventAttendance_DF_ChangeVersion;
ALTER TABLE [tpdm].[ProfessionalDevelopmentEventAttendance] ADD CONSTRAINT ProfessionalDevelopmentEventAttendance_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[QuantitativeMeasure]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[QuantitativeMeasure] ADD [ChangeVersion] [BIGINT] CONSTRAINT QuantitativeMeasure_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[QuantitativeMeasure] DROP CONSTRAINT QuantitativeMeasure_DF_ChangeVersion;
ALTER TABLE [tpdm].[QuantitativeMeasure] ADD CONSTRAINT QuantitativeMeasure_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[QuantitativeMeasureScore]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[QuantitativeMeasureScore] ADD [ChangeVersion] [BIGINT] CONSTRAINT QuantitativeMeasureScore_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[QuantitativeMeasureScore] DROP CONSTRAINT QuantitativeMeasureScore_DF_ChangeVersion;
ALTER TABLE [tpdm].[QuantitativeMeasureScore] ADD CONSTRAINT QuantitativeMeasureScore_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[RecruitmentEvent]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[RecruitmentEvent] ADD [ChangeVersion] [BIGINT] CONSTRAINT RecruitmentEvent_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[RecruitmentEvent] DROP CONSTRAINT RecruitmentEvent_DF_ChangeVersion;
ALTER TABLE [tpdm].[RecruitmentEvent] ADD CONSTRAINT RecruitmentEvent_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[RecruitmentEventAttendance]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[RecruitmentEventAttendance] ADD [ChangeVersion] [BIGINT] CONSTRAINT RecruitmentEventAttendance_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[RecruitmentEventAttendance] DROP CONSTRAINT RecruitmentEventAttendance_DF_ChangeVersion;
ALTER TABLE [tpdm].[RecruitmentEventAttendance] ADD CONSTRAINT RecruitmentEventAttendance_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[RubricDimension]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[RubricDimension] ADD [ChangeVersion] [BIGINT] CONSTRAINT RubricDimension_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[RubricDimension] DROP CONSTRAINT RubricDimension_DF_ChangeVersion;
ALTER TABLE [tpdm].[RubricDimension] ADD CONSTRAINT RubricDimension_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[StaffEducatorPreparationProgramAssociation]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[StaffEducatorPreparationProgramAssociation] ADD [ChangeVersion] [BIGINT] CONSTRAINT StaffEducatorPreparationProgramAssociation_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[StaffEducatorPreparationProgramAssociation] DROP CONSTRAINT StaffEducatorPreparationProgramAssociation_DF_ChangeVersion;
ALTER TABLE [tpdm].[StaffEducatorPreparationProgramAssociation] ADD CONSTRAINT StaffEducatorPreparationProgramAssociation_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[SurveyResponsePersonTargetAssociation]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[SurveyResponsePersonTargetAssociation] ADD [ChangeVersion] [BIGINT] CONSTRAINT SurveyResponsePersonTargetAssociation_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[SurveyResponsePersonTargetAssociation] DROP CONSTRAINT SurveyResponsePersonTargetAssociation_DF_ChangeVersion;
ALTER TABLE [tpdm].[SurveyResponsePersonTargetAssociation] ADD CONSTRAINT SurveyResponsePersonTargetAssociation_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[SurveySectionAggregateResponse]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[SurveySectionAggregateResponse] ADD [ChangeVersion] [BIGINT] CONSTRAINT SurveySectionAggregateResponse_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[SurveySectionAggregateResponse] DROP CONSTRAINT SurveySectionAggregateResponse_DF_ChangeVersion;
ALTER TABLE [tpdm].[SurveySectionAggregateResponse] ADD CONSTRAINT SurveySectionAggregateResponse_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID(N'[tpdm].[SurveySectionResponsePersonTargetAssociation]') AND name = 'ChangeVersion')
BEGIN
ALTER TABLE [tpdm].[SurveySectionResponsePersonTargetAssociation] ADD [ChangeVersion] [BIGINT] CONSTRAINT SurveySectionResponsePersonTargetAssociation_DF_ChangeVersion DEFAULT (0) NOT NULL;
ALTER TABLE [tpdm].[SurveySectionResponsePersonTargetAssociation] DROP CONSTRAINT SurveySectionResponsePersonTargetAssociation_DF_ChangeVersion;
ALTER TABLE [tpdm].[SurveySectionResponsePersonTargetAssociation] ADD CONSTRAINT SurveySectionResponsePersonTargetAssociation_DF_ChangeVersion DEFAULT (NEXT VALUE FOR [changes].[ChangeVersionSequence]) For [ChangeVersion];
END


