DROP TRIGGER IF EXISTS [tpdm].[tpdm_AccreditationStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_AccreditationStatusDescriptor_TR_DeleteTracking] ON [tpdm].[AccreditationStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.AccreditationStatusDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.AccreditationStatusDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AccreditationStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[AccreditationStatusDescriptor] ENABLE TRIGGER [tpdm_AccreditationStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_AidTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_AidTypeDescriptor_TR_DeleteTracking] ON [tpdm].[AidTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.AidTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.AidTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.AidTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[AidTypeDescriptor] ENABLE TRIGGER [tpdm_AidTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_ApplicantProfile_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_ApplicantProfile_TR_DeleteTracking] ON [tpdm].[ApplicantProfile] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[ApplicantProfile](OldApplicantProfileIdentifier, Id, Discriminator, ChangeVersion)
    SELECT d.ApplicantProfileIdentifier, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[ApplicantProfile] ENABLE TRIGGER [tpdm_ApplicantProfile_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_Application_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_Application_TR_DeleteTracking] ON [tpdm].[Application] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[Application](OldApplicantProfileIdentifier, OldApplicationIdentifier, OldEducationOrganizationId, Id, Discriminator, ChangeVersion)
    SELECT d.ApplicantProfileIdentifier, d.ApplicationIdentifier, d.EducationOrganizationId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[Application] ENABLE TRIGGER [tpdm_Application_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_ApplicationEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_ApplicationEvent_TR_DeleteTracking] ON [tpdm].[ApplicationEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[ApplicationEvent](OldApplicantProfileIdentifier, OldApplicationEventTypeDescriptorId, OldApplicationEventTypeDescriptorNamespace, OldApplicationEventTypeDescriptorCodeValue, OldApplicationIdentifier, OldEducationOrganizationId, OldEventDate, OldSequenceNumber, Id, Discriminator, ChangeVersion)
    SELECT d.ApplicantProfileIdentifier, d.ApplicationEventTypeDescriptorId, j0.Namespace, j0.CodeValue, d.ApplicationIdentifier, d.EducationOrganizationId, d.EventDate, d.SequenceNumber, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.ApplicationEventTypeDescriptorId = j0.DescriptorId
END
GO

ALTER TABLE [tpdm].[ApplicationEvent] ENABLE TRIGGER [tpdm_ApplicationEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_ApplicationEventResultDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_ApplicationEventResultDescriptor_TR_DeleteTracking] ON [tpdm].[ApplicationEventResultDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ApplicationEventResultDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.ApplicationEventResultDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ApplicationEventResultDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ApplicationEventResultDescriptor] ENABLE TRIGGER [tpdm_ApplicationEventResultDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_ApplicationEventTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_ApplicationEventTypeDescriptor_TR_DeleteTracking] ON [tpdm].[ApplicationEventTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ApplicationEventTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.ApplicationEventTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ApplicationEventTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ApplicationEventTypeDescriptor] ENABLE TRIGGER [tpdm_ApplicationEventTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_ApplicationSourceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_ApplicationSourceDescriptor_TR_DeleteTracking] ON [tpdm].[ApplicationSourceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ApplicationSourceDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.ApplicationSourceDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ApplicationSourceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ApplicationSourceDescriptor] ENABLE TRIGGER [tpdm_ApplicationSourceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_ApplicationStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_ApplicationStatusDescriptor_TR_DeleteTracking] ON [tpdm].[ApplicationStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ApplicationStatusDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.ApplicationStatusDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ApplicationStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ApplicationStatusDescriptor] ENABLE TRIGGER [tpdm_ApplicationStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_BackgroundCheckStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_BackgroundCheckStatusDescriptor_TR_DeleteTracking] ON [tpdm].[BackgroundCheckStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.BackgroundCheckStatusDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.BackgroundCheckStatusDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.BackgroundCheckStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[BackgroundCheckStatusDescriptor] ENABLE TRIGGER [tpdm_BackgroundCheckStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_BackgroundCheckTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_BackgroundCheckTypeDescriptor_TR_DeleteTracking] ON [tpdm].[BackgroundCheckTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.BackgroundCheckTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.BackgroundCheckTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.BackgroundCheckTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[BackgroundCheckTypeDescriptor] ENABLE TRIGGER [tpdm_BackgroundCheckTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_Candidate_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_Candidate_TR_DeleteTracking] ON [tpdm].[Candidate] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[Candidate](OldCandidateIdentifier, Id, Discriminator, ChangeVersion)
    SELECT d.CandidateIdentifier, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[Candidate] ENABLE TRIGGER [tpdm_Candidate_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CandidateCharacteristicDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CandidateCharacteristicDescriptor_TR_DeleteTracking] ON [tpdm].[CandidateCharacteristicDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.CandidateCharacteristicDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.CandidateCharacteristicDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CandidateCharacteristicDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CandidateCharacteristicDescriptor] ENABLE TRIGGER [tpdm_CandidateCharacteristicDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CandidateEducatorPreparationProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CandidateEducatorPreparationProgramAssociation_TR_DeleteTracking] ON [tpdm].[CandidateEducatorPreparationProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[CandidateEducatorPreparationProgramAssociation](OldBeginDate, OldCandidateIdentifier, OldEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldProgramTypeDescriptorNamespace, OldProgramTypeDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.BeginDate, d.CandidateIdentifier, d.EducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, j0.Namespace, j0.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.ProgramTypeDescriptorId = j0.DescriptorId
END
GO

ALTER TABLE [tpdm].[CandidateEducatorPreparationProgramAssociation] ENABLE TRIGGER [tpdm_CandidateEducatorPreparationProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CandidateRelationshipToStaffAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CandidateRelationshipToStaffAssociation_TR_DeleteTracking] ON [tpdm].[CandidateRelationshipToStaffAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[CandidateRelationshipToStaffAssociation](OldCandidateIdentifier, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT d.CandidateIdentifier, d.StaffUSI, j0.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Staff j0
            ON d.StaffUSI = j0.StaffUSI
END
GO

ALTER TABLE [tpdm].[CandidateRelationshipToStaffAssociation] ENABLE TRIGGER [tpdm_CandidateRelationshipToStaffAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_Certification_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_Certification_TR_DeleteTracking] ON [tpdm].[Certification] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[Certification](OldCertificationIdentifier, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT d.CertificationIdentifier, d.Namespace, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[Certification] ENABLE TRIGGER [tpdm_Certification_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CertificationExam_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CertificationExam_TR_DeleteTracking] ON [tpdm].[CertificationExam] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[CertificationExam](OldCertificationExamIdentifier, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT d.CertificationExamIdentifier, d.Namespace, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[CertificationExam] ENABLE TRIGGER [tpdm_CertificationExam_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CertificationExamResult_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CertificationExamResult_TR_DeleteTracking] ON [tpdm].[CertificationExamResult] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[CertificationExamResult](OldCertificationExamDate, OldCertificationExamIdentifier, OldNamespace, OldPersonId, OldSourceSystemDescriptorId, OldSourceSystemDescriptorNamespace, OldSourceSystemDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.CertificationExamDate, d.CertificationExamIdentifier, d.Namespace, d.PersonId, d.SourceSystemDescriptorId, j0.Namespace, j0.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.SourceSystemDescriptorId = j0.DescriptorId
END
GO

ALTER TABLE [tpdm].[CertificationExamResult] ENABLE TRIGGER [tpdm_CertificationExamResult_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CertificationExamStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CertificationExamStatusDescriptor_TR_DeleteTracking] ON [tpdm].[CertificationExamStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.CertificationExamStatusDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.CertificationExamStatusDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CertificationExamStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CertificationExamStatusDescriptor] ENABLE TRIGGER [tpdm_CertificationExamStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CertificationExamTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CertificationExamTypeDescriptor_TR_DeleteTracking] ON [tpdm].[CertificationExamTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.CertificationExamTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.CertificationExamTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CertificationExamTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CertificationExamTypeDescriptor] ENABLE TRIGGER [tpdm_CertificationExamTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CertificationFieldDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CertificationFieldDescriptor_TR_DeleteTracking] ON [tpdm].[CertificationFieldDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.CertificationFieldDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.CertificationFieldDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CertificationFieldDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CertificationFieldDescriptor] ENABLE TRIGGER [tpdm_CertificationFieldDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CertificationLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CertificationLevelDescriptor_TR_DeleteTracking] ON [tpdm].[CertificationLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.CertificationLevelDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.CertificationLevelDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CertificationLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CertificationLevelDescriptor] ENABLE TRIGGER [tpdm_CertificationLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CertificationRouteDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CertificationRouteDescriptor_TR_DeleteTracking] ON [tpdm].[CertificationRouteDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.CertificationRouteDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.CertificationRouteDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CertificationRouteDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CertificationRouteDescriptor] ENABLE TRIGGER [tpdm_CertificationRouteDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CertificationStandardDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CertificationStandardDescriptor_TR_DeleteTracking] ON [tpdm].[CertificationStandardDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.CertificationStandardDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.CertificationStandardDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CertificationStandardDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CertificationStandardDescriptor] ENABLE TRIGGER [tpdm_CertificationStandardDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CoteachingStyleObservedDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CoteachingStyleObservedDescriptor_TR_DeleteTracking] ON [tpdm].[CoteachingStyleObservedDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.CoteachingStyleObservedDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.CoteachingStyleObservedDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CoteachingStyleObservedDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CoteachingStyleObservedDescriptor] ENABLE TRIGGER [tpdm_CoteachingStyleObservedDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CredentialEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CredentialEvent_TR_DeleteTracking] ON [tpdm].[CredentialEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[CredentialEvent](OldCredentialEventDate, OldCredentialEventTypeDescriptorId, OldCredentialEventTypeDescriptorNamespace, OldCredentialEventTypeDescriptorCodeValue, OldCredentialIdentifier, OldStateOfIssueStateAbbreviationDescriptorId, OldStateOfIssueStateAbbreviationDescriptorNamespace, OldStateOfIssueStateAbbreviationDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.CredentialEventDate, d.CredentialEventTypeDescriptorId, j0.Namespace, j0.CodeValue, d.CredentialIdentifier, d.StateOfIssueStateAbbreviationDescriptorId, j1.Namespace, j1.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.CredentialEventTypeDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.StateOfIssueStateAbbreviationDescriptorId = j1.DescriptorId
END
GO

ALTER TABLE [tpdm].[CredentialEvent] ENABLE TRIGGER [tpdm_CredentialEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CredentialEventTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CredentialEventTypeDescriptor_TR_DeleteTracking] ON [tpdm].[CredentialEventTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.CredentialEventTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.CredentialEventTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CredentialEventTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CredentialEventTypeDescriptor] ENABLE TRIGGER [tpdm_CredentialEventTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_CredentialStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_CredentialStatusDescriptor_TR_DeleteTracking] ON [tpdm].[CredentialStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.CredentialStatusDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.CredentialStatusDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.CredentialStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[CredentialStatusDescriptor] ENABLE TRIGGER [tpdm_CredentialStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_DegreeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_DegreeDescriptor_TR_DeleteTracking] ON [tpdm].[DegreeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.DegreeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.DegreeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.DegreeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[DegreeDescriptor] ENABLE TRIGGER [tpdm_DegreeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EducatorPreparationProgram_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EducatorPreparationProgram_TR_DeleteTracking] ON [tpdm].[EducatorPreparationProgram] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[EducatorPreparationProgram](OldEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldProgramTypeDescriptorNamespace, OldProgramTypeDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, j0.Namespace, j0.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.ProgramTypeDescriptorId = j0.DescriptorId
END
GO

ALTER TABLE [tpdm].[EducatorPreparationProgram] ENABLE TRIGGER [tpdm_EducatorPreparationProgram_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EducatorPreparationProgramTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EducatorPreparationProgramTypeDescriptor_TR_DeleteTracking] ON [tpdm].[EducatorPreparationProgramTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.EducatorPreparationProgramTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.EducatorPreparationProgramTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EducatorPreparationProgramTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EducatorPreparationProgramTypeDescriptor] ENABLE TRIGGER [tpdm_EducatorPreparationProgramTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EducatorRoleDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EducatorRoleDescriptor_TR_DeleteTracking] ON [tpdm].[EducatorRoleDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.EducatorRoleDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.EducatorRoleDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EducatorRoleDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EducatorRoleDescriptor] ENABLE TRIGGER [tpdm_EducatorRoleDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EnglishLanguageExamDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EnglishLanguageExamDescriptor_TR_DeleteTracking] ON [tpdm].[EnglishLanguageExamDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.EnglishLanguageExamDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.EnglishLanguageExamDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EnglishLanguageExamDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EnglishLanguageExamDescriptor] ENABLE TRIGGER [tpdm_EnglishLanguageExamDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EPPDegreeTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EPPDegreeTypeDescriptor_TR_DeleteTracking] ON [tpdm].[EPPDegreeTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.EPPDegreeTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.EPPDegreeTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EPPDegreeTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EPPDegreeTypeDescriptor] ENABLE TRIGGER [tpdm_EPPDegreeTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EPPProgramPathwayDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EPPProgramPathwayDescriptor_TR_DeleteTracking] ON [tpdm].[EPPProgramPathwayDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.EPPProgramPathwayDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.EPPProgramPathwayDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EPPProgramPathwayDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EPPProgramPathwayDescriptor] ENABLE TRIGGER [tpdm_EPPProgramPathwayDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_Evaluation_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_Evaluation_TR_DeleteTracking] ON [tpdm].[Evaluation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[Evaluation](OldEducationOrganizationId, OldEvaluationPeriodDescriptorId, OldEvaluationPeriodDescriptorNamespace, OldEvaluationPeriodDescriptorCodeValue, OldEvaluationTitle, OldPerformanceEvaluationTitle, OldPerformanceEvaluationTypeDescriptorId, OldPerformanceEvaluationTypeDescriptorNamespace, OldPerformanceEvaluationTypeDescriptorCodeValue, OldSchoolYear, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EvaluationPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.EvaluationTitle, d.PerformanceEvaluationTitle, d.PerformanceEvaluationTypeDescriptorId, j1.Namespace, j1.CodeValue, d.SchoolYear, d.TermDescriptorId, j2.Namespace, j2.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.EvaluationPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.PerformanceEvaluationTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.TermDescriptorId = j2.DescriptorId
END
GO

ALTER TABLE [tpdm].[Evaluation] ENABLE TRIGGER [tpdm_Evaluation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationElement_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationElement_TR_DeleteTracking] ON [tpdm].[EvaluationElement] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[EvaluationElement](OldEducationOrganizationId, OldEvaluationElementTitle, OldEvaluationObjectiveTitle, OldEvaluationPeriodDescriptorId, OldEvaluationPeriodDescriptorNamespace, OldEvaluationPeriodDescriptorCodeValue, OldEvaluationTitle, OldPerformanceEvaluationTitle, OldPerformanceEvaluationTypeDescriptorId, OldPerformanceEvaluationTypeDescriptorNamespace, OldPerformanceEvaluationTypeDescriptorCodeValue, OldSchoolYear, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EvaluationElementTitle, d.EvaluationObjectiveTitle, d.EvaluationPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.EvaluationTitle, d.PerformanceEvaluationTitle, d.PerformanceEvaluationTypeDescriptorId, j1.Namespace, j1.CodeValue, d.SchoolYear, d.TermDescriptorId, j2.Namespace, j2.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.EvaluationPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.PerformanceEvaluationTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.TermDescriptorId = j2.DescriptorId
END
GO

ALTER TABLE [tpdm].[EvaluationElement] ENABLE TRIGGER [tpdm_EvaluationElement_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationElementRating_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationElementRating_TR_DeleteTracking] ON [tpdm].[EvaluationElementRating] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[EvaluationElementRating](OldEducationOrganizationId, OldEvaluationDate, OldEvaluationElementTitle, OldEvaluationObjectiveTitle, OldEvaluationPeriodDescriptorId, OldEvaluationPeriodDescriptorNamespace, OldEvaluationPeriodDescriptorCodeValue, OldEvaluationTitle, OldPerformanceEvaluationTitle, OldPerformanceEvaluationTypeDescriptorId, OldPerformanceEvaluationTypeDescriptorNamespace, OldPerformanceEvaluationTypeDescriptorCodeValue, OldPersonId, OldSchoolYear, OldSourceSystemDescriptorId, OldSourceSystemDescriptorNamespace, OldSourceSystemDescriptorCodeValue, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EvaluationDate, d.EvaluationElementTitle, d.EvaluationObjectiveTitle, d.EvaluationPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.EvaluationTitle, d.PerformanceEvaluationTitle, d.PerformanceEvaluationTypeDescriptorId, j1.Namespace, j1.CodeValue, d.PersonId, d.SchoolYear, d.SourceSystemDescriptorId, j2.Namespace, j2.CodeValue, d.TermDescriptorId, j3.Namespace, j3.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.EvaluationPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.PerformanceEvaluationTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.SourceSystemDescriptorId = j2.DescriptorId
        INNER JOIN edfi.Descriptor j3
            ON d.TermDescriptorId = j3.DescriptorId
END
GO

ALTER TABLE [tpdm].[EvaluationElementRating] ENABLE TRIGGER [tpdm_EvaluationElementRating_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationElementRatingLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationElementRatingLevelDescriptor_TR_DeleteTracking] ON [tpdm].[EvaluationElementRatingLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.EvaluationElementRatingLevelDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.EvaluationElementRatingLevelDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EvaluationElementRatingLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EvaluationElementRatingLevelDescriptor] ENABLE TRIGGER [tpdm_EvaluationElementRatingLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationObjective_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationObjective_TR_DeleteTracking] ON [tpdm].[EvaluationObjective] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[EvaluationObjective](OldEducationOrganizationId, OldEvaluationObjectiveTitle, OldEvaluationPeriodDescriptorId, OldEvaluationPeriodDescriptorNamespace, OldEvaluationPeriodDescriptorCodeValue, OldEvaluationTitle, OldPerformanceEvaluationTitle, OldPerformanceEvaluationTypeDescriptorId, OldPerformanceEvaluationTypeDescriptorNamespace, OldPerformanceEvaluationTypeDescriptorCodeValue, OldSchoolYear, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EvaluationObjectiveTitle, d.EvaluationPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.EvaluationTitle, d.PerformanceEvaluationTitle, d.PerformanceEvaluationTypeDescriptorId, j1.Namespace, j1.CodeValue, d.SchoolYear, d.TermDescriptorId, j2.Namespace, j2.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.EvaluationPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.PerformanceEvaluationTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.TermDescriptorId = j2.DescriptorId
END
GO

ALTER TABLE [tpdm].[EvaluationObjective] ENABLE TRIGGER [tpdm_EvaluationObjective_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationObjectiveRating_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationObjectiveRating_TR_DeleteTracking] ON [tpdm].[EvaluationObjectiveRating] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[EvaluationObjectiveRating](OldEducationOrganizationId, OldEvaluationDate, OldEvaluationObjectiveTitle, OldEvaluationPeriodDescriptorId, OldEvaluationPeriodDescriptorNamespace, OldEvaluationPeriodDescriptorCodeValue, OldEvaluationTitle, OldPerformanceEvaluationTitle, OldPerformanceEvaluationTypeDescriptorId, OldPerformanceEvaluationTypeDescriptorNamespace, OldPerformanceEvaluationTypeDescriptorCodeValue, OldPersonId, OldSchoolYear, OldSourceSystemDescriptorId, OldSourceSystemDescriptorNamespace, OldSourceSystemDescriptorCodeValue, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EvaluationDate, d.EvaluationObjectiveTitle, d.EvaluationPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.EvaluationTitle, d.PerformanceEvaluationTitle, d.PerformanceEvaluationTypeDescriptorId, j1.Namespace, j1.CodeValue, d.PersonId, d.SchoolYear, d.SourceSystemDescriptorId, j2.Namespace, j2.CodeValue, d.TermDescriptorId, j3.Namespace, j3.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.EvaluationPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.PerformanceEvaluationTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.SourceSystemDescriptorId = j2.DescriptorId
        INNER JOIN edfi.Descriptor j3
            ON d.TermDescriptorId = j3.DescriptorId
END
GO

ALTER TABLE [tpdm].[EvaluationObjectiveRating] ENABLE TRIGGER [tpdm_EvaluationObjectiveRating_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationPeriodDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationPeriodDescriptor_TR_DeleteTracking] ON [tpdm].[EvaluationPeriodDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.EvaluationPeriodDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.EvaluationPeriodDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EvaluationPeriodDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EvaluationPeriodDescriptor] ENABLE TRIGGER [tpdm_EvaluationPeriodDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationRating_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationRating_TR_DeleteTracking] ON [tpdm].[EvaluationRating] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[EvaluationRating](OldEducationOrganizationId, OldEvaluationDate, OldEvaluationPeriodDescriptorId, OldEvaluationPeriodDescriptorNamespace, OldEvaluationPeriodDescriptorCodeValue, OldEvaluationTitle, OldPerformanceEvaluationTitle, OldPerformanceEvaluationTypeDescriptorId, OldPerformanceEvaluationTypeDescriptorNamespace, OldPerformanceEvaluationTypeDescriptorCodeValue, OldPersonId, OldSchoolYear, OldSourceSystemDescriptorId, OldSourceSystemDescriptorNamespace, OldSourceSystemDescriptorCodeValue, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EvaluationDate, d.EvaluationPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.EvaluationTitle, d.PerformanceEvaluationTitle, d.PerformanceEvaluationTypeDescriptorId, j1.Namespace, j1.CodeValue, d.PersonId, d.SchoolYear, d.SourceSystemDescriptorId, j2.Namespace, j2.CodeValue, d.TermDescriptorId, j3.Namespace, j3.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.EvaluationPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.PerformanceEvaluationTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.SourceSystemDescriptorId = j2.DescriptorId
        INNER JOIN edfi.Descriptor j3
            ON d.TermDescriptorId = j3.DescriptorId
END
GO

ALTER TABLE [tpdm].[EvaluationRating] ENABLE TRIGGER [tpdm_EvaluationRating_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationRatingLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationRatingLevelDescriptor_TR_DeleteTracking] ON [tpdm].[EvaluationRatingLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.EvaluationRatingLevelDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.EvaluationRatingLevelDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EvaluationRatingLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EvaluationRatingLevelDescriptor] ENABLE TRIGGER [tpdm_EvaluationRatingLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationRatingStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationRatingStatusDescriptor_TR_DeleteTracking] ON [tpdm].[EvaluationRatingStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.EvaluationRatingStatusDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.EvaluationRatingStatusDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EvaluationRatingStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EvaluationRatingStatusDescriptor] ENABLE TRIGGER [tpdm_EvaluationRatingStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_EvaluationTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_EvaluationTypeDescriptor_TR_DeleteTracking] ON [tpdm].[EvaluationTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.EvaluationTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.EvaluationTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.EvaluationTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[EvaluationTypeDescriptor] ENABLE TRIGGER [tpdm_EvaluationTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_FederalLocaleCodeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_FederalLocaleCodeDescriptor_TR_DeleteTracking] ON [tpdm].[FederalLocaleCodeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.FederalLocaleCodeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.FederalLocaleCodeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FederalLocaleCodeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[FederalLocaleCodeDescriptor] ENABLE TRIGGER [tpdm_FederalLocaleCodeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_FieldworkExperience_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_FieldworkExperience_TR_DeleteTracking] ON [tpdm].[FieldworkExperience] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[FieldworkExperience](OldBeginDate, OldFieldworkIdentifier, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT d.BeginDate, d.FieldworkIdentifier, d.StudentUSI, j0.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j0
            ON d.StudentUSI = j0.StudentUSI
END
GO

ALTER TABLE [tpdm].[FieldworkExperience] ENABLE TRIGGER [tpdm_FieldworkExperience_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_FieldworkExperienceSectionAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_FieldworkExperienceSectionAssociation_TR_DeleteTracking] ON [tpdm].[FieldworkExperienceSectionAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[FieldworkExperienceSectionAssociation](OldBeginDate, OldFieldworkIdentifier, OldLocalCourseCode, OldSchoolId, OldSchoolYear, OldSectionIdentifier, OldSessionName, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT d.BeginDate, d.FieldworkIdentifier, d.LocalCourseCode, d.SchoolId, d.SchoolYear, d.SectionIdentifier, d.SessionName, d.StudentUSI, j0.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Student j0
            ON d.StudentUSI = j0.StudentUSI
END
GO

ALTER TABLE [tpdm].[FieldworkExperienceSectionAssociation] ENABLE TRIGGER [tpdm_FieldworkExperienceSectionAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_FieldworkTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_FieldworkTypeDescriptor_TR_DeleteTracking] ON [tpdm].[FieldworkTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.FieldworkTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.FieldworkTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FieldworkTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[FieldworkTypeDescriptor] ENABLE TRIGGER [tpdm_FieldworkTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_FinancialAid_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_FinancialAid_TR_DeleteTracking] ON [tpdm].[FinancialAid] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[FinancialAid](OldAidTypeDescriptorId, OldAidTypeDescriptorNamespace, OldAidTypeDescriptorCodeValue, OldBeginDate, OldStudentUSI, OldStudentUniqueId, Id, Discriminator, ChangeVersion)
    SELECT d.AidTypeDescriptorId, j0.Namespace, j0.CodeValue, d.BeginDate, d.StudentUSI, j1.StudentUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.AidTypeDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Student j1
            ON d.StudentUSI = j1.StudentUSI
END
GO

ALTER TABLE [tpdm].[FinancialAid] ENABLE TRIGGER [tpdm_FinancialAid_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_FundingSourceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_FundingSourceDescriptor_TR_DeleteTracking] ON [tpdm].[FundingSourceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.FundingSourceDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.FundingSourceDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.FundingSourceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[FundingSourceDescriptor] ENABLE TRIGGER [tpdm_FundingSourceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_GenderDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_GenderDescriptor_TR_DeleteTracking] ON [tpdm].[GenderDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.GenderDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.GenderDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GenderDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[GenderDescriptor] ENABLE TRIGGER [tpdm_GenderDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_Goal_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_Goal_TR_DeleteTracking] ON [tpdm].[Goal] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[Goal](OldAssignmentDate, OldGoalTitle, OldPersonId, OldSourceSystemDescriptorId, OldSourceSystemDescriptorNamespace, OldSourceSystemDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.AssignmentDate, d.GoalTitle, d.PersonId, d.SourceSystemDescriptorId, j0.Namespace, j0.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.SourceSystemDescriptorId = j0.DescriptorId
END
GO

ALTER TABLE [tpdm].[Goal] ENABLE TRIGGER [tpdm_Goal_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_GoalTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_GoalTypeDescriptor_TR_DeleteTracking] ON [tpdm].[GoalTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.GoalTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.GoalTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.GoalTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[GoalTypeDescriptor] ENABLE TRIGGER [tpdm_GoalTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_HireStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_HireStatusDescriptor_TR_DeleteTracking] ON [tpdm].[HireStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.HireStatusDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.HireStatusDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.HireStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[HireStatusDescriptor] ENABLE TRIGGER [tpdm_HireStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_HiringSourceDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_HiringSourceDescriptor_TR_DeleteTracking] ON [tpdm].[HiringSourceDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.HiringSourceDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.HiringSourceDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.HiringSourceDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[HiringSourceDescriptor] ENABLE TRIGGER [tpdm_HiringSourceDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_InstructionalSettingDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_InstructionalSettingDescriptor_TR_DeleteTracking] ON [tpdm].[InstructionalSettingDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.InstructionalSettingDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.InstructionalSettingDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.InstructionalSettingDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[InstructionalSettingDescriptor] ENABLE TRIGGER [tpdm_InstructionalSettingDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_LengthOfContractDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_LengthOfContractDescriptor_TR_DeleteTracking] ON [tpdm].[LengthOfContractDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.LengthOfContractDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.LengthOfContractDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.LengthOfContractDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[LengthOfContractDescriptor] ENABLE TRIGGER [tpdm_LengthOfContractDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_ObjectiveRatingLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_ObjectiveRatingLevelDescriptor_TR_DeleteTracking] ON [tpdm].[ObjectiveRatingLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ObjectiveRatingLevelDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.ObjectiveRatingLevelDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ObjectiveRatingLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ObjectiveRatingLevelDescriptor] ENABLE TRIGGER [tpdm_ObjectiveRatingLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_OpenStaffPositionEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_OpenStaffPositionEvent_TR_DeleteTracking] ON [tpdm].[OpenStaffPositionEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[OpenStaffPositionEvent](OldEducationOrganizationId, OldEventDate, OldOpenStaffPositionEventTypeDescriptorId, OldOpenStaffPositionEventTypeDescriptorNamespace, OldOpenStaffPositionEventTypeDescriptorCodeValue, OldRequisitionNumber, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EventDate, d.OpenStaffPositionEventTypeDescriptorId, j0.Namespace, j0.CodeValue, d.RequisitionNumber, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.OpenStaffPositionEventTypeDescriptorId = j0.DescriptorId
END
GO

ALTER TABLE [tpdm].[OpenStaffPositionEvent] ENABLE TRIGGER [tpdm_OpenStaffPositionEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_OpenStaffPositionEventStatusDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_OpenStaffPositionEventStatusDescriptor_TR_DeleteTracking] ON [tpdm].[OpenStaffPositionEventStatusDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.OpenStaffPositionEventStatusDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.OpenStaffPositionEventStatusDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OpenStaffPositionEventStatusDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[OpenStaffPositionEventStatusDescriptor] ENABLE TRIGGER [tpdm_OpenStaffPositionEventStatusDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_OpenStaffPositionEventTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_OpenStaffPositionEventTypeDescriptor_TR_DeleteTracking] ON [tpdm].[OpenStaffPositionEventTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.OpenStaffPositionEventTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.OpenStaffPositionEventTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OpenStaffPositionEventTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[OpenStaffPositionEventTypeDescriptor] ENABLE TRIGGER [tpdm_OpenStaffPositionEventTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_OpenStaffPositionReasonDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_OpenStaffPositionReasonDescriptor_TR_DeleteTracking] ON [tpdm].[OpenStaffPositionReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.OpenStaffPositionReasonDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.OpenStaffPositionReasonDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.OpenStaffPositionReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[OpenStaffPositionReasonDescriptor] ENABLE TRIGGER [tpdm_OpenStaffPositionReasonDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_PerformanceEvaluation_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_PerformanceEvaluation_TR_DeleteTracking] ON [tpdm].[PerformanceEvaluation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[PerformanceEvaluation](OldEducationOrganizationId, OldEvaluationPeriodDescriptorId, OldEvaluationPeriodDescriptorNamespace, OldEvaluationPeriodDescriptorCodeValue, OldPerformanceEvaluationTitle, OldPerformanceEvaluationTypeDescriptorId, OldPerformanceEvaluationTypeDescriptorNamespace, OldPerformanceEvaluationTypeDescriptorCodeValue, OldSchoolYear, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EvaluationPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.PerformanceEvaluationTitle, d.PerformanceEvaluationTypeDescriptorId, j1.Namespace, j1.CodeValue, d.SchoolYear, d.TermDescriptorId, j2.Namespace, j2.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.EvaluationPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.PerformanceEvaluationTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.TermDescriptorId = j2.DescriptorId
END
GO

ALTER TABLE [tpdm].[PerformanceEvaluation] ENABLE TRIGGER [tpdm_PerformanceEvaluation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_PerformanceEvaluationRating_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_PerformanceEvaluationRating_TR_DeleteTracking] ON [tpdm].[PerformanceEvaluationRating] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[PerformanceEvaluationRating](OldEducationOrganizationId, OldEvaluationPeriodDescriptorId, OldEvaluationPeriodDescriptorNamespace, OldEvaluationPeriodDescriptorCodeValue, OldPerformanceEvaluationTitle, OldPerformanceEvaluationTypeDescriptorId, OldPerformanceEvaluationTypeDescriptorNamespace, OldPerformanceEvaluationTypeDescriptorCodeValue, OldPersonId, OldSchoolYear, OldSourceSystemDescriptorId, OldSourceSystemDescriptorNamespace, OldSourceSystemDescriptorCodeValue, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EvaluationPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.PerformanceEvaluationTitle, d.PerformanceEvaluationTypeDescriptorId, j1.Namespace, j1.CodeValue, d.PersonId, d.SchoolYear, d.SourceSystemDescriptorId, j2.Namespace, j2.CodeValue, d.TermDescriptorId, j3.Namespace, j3.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.EvaluationPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.PerformanceEvaluationTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.SourceSystemDescriptorId = j2.DescriptorId
        INNER JOIN edfi.Descriptor j3
            ON d.TermDescriptorId = j3.DescriptorId
END
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRating] ENABLE TRIGGER [tpdm_PerformanceEvaluationRating_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_PerformanceEvaluationRatingLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_PerformanceEvaluationRatingLevelDescriptor_TR_DeleteTracking] ON [tpdm].[PerformanceEvaluationRatingLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.PerformanceEvaluationRatingLevelDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.PerformanceEvaluationRatingLevelDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PerformanceEvaluationRatingLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[PerformanceEvaluationRatingLevelDescriptor] ENABLE TRIGGER [tpdm_PerformanceEvaluationRatingLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_PerformanceEvaluationTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_PerformanceEvaluationTypeDescriptor_TR_DeleteTracking] ON [tpdm].[PerformanceEvaluationTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.PerformanceEvaluationTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.PerformanceEvaluationTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PerformanceEvaluationTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[PerformanceEvaluationTypeDescriptor] ENABLE TRIGGER [tpdm_PerformanceEvaluationTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_PreviousCareerDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_PreviousCareerDescriptor_TR_DeleteTracking] ON [tpdm].[PreviousCareerDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.PreviousCareerDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.PreviousCareerDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.PreviousCareerDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[PreviousCareerDescriptor] ENABLE TRIGGER [tpdm_PreviousCareerDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_ProfessionalDevelopmentEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_ProfessionalDevelopmentEvent_TR_DeleteTracking] ON [tpdm].[ProfessionalDevelopmentEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[ProfessionalDevelopmentEvent](OldNamespace, OldProfessionalDevelopmentTitle, Id, Discriminator, ChangeVersion)
    SELECT d.Namespace, d.ProfessionalDevelopmentTitle, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[ProfessionalDevelopmentEvent] ENABLE TRIGGER [tpdm_ProfessionalDevelopmentEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_ProfessionalDevelopmentEventAttendance_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_ProfessionalDevelopmentEventAttendance_TR_DeleteTracking] ON [tpdm].[ProfessionalDevelopmentEventAttendance] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[ProfessionalDevelopmentEventAttendance](OldAttendanceDate, OldNamespace, OldPersonId, OldProfessionalDevelopmentTitle, OldSourceSystemDescriptorId, OldSourceSystemDescriptorNamespace, OldSourceSystemDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.AttendanceDate, d.Namespace, d.PersonId, d.ProfessionalDevelopmentTitle, d.SourceSystemDescriptorId, j0.Namespace, j0.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.SourceSystemDescriptorId = j0.DescriptorId
END
GO

ALTER TABLE [tpdm].[ProfessionalDevelopmentEventAttendance] ENABLE TRIGGER [tpdm_ProfessionalDevelopmentEventAttendance_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_ProfessionalDevelopmentOfferedByDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_ProfessionalDevelopmentOfferedByDescriptor_TR_DeleteTracking] ON [tpdm].[ProfessionalDevelopmentOfferedByDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ProfessionalDevelopmentOfferedByDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.ProfessionalDevelopmentOfferedByDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProfessionalDevelopmentOfferedByDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ProfessionalDevelopmentOfferedByDescriptor] ENABLE TRIGGER [tpdm_ProfessionalDevelopmentOfferedByDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_ProgramGatewayDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_ProgramGatewayDescriptor_TR_DeleteTracking] ON [tpdm].[ProgramGatewayDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.ProgramGatewayDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.ProgramGatewayDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.ProgramGatewayDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[ProgramGatewayDescriptor] ENABLE TRIGGER [tpdm_ProgramGatewayDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_QuantitativeMeasure_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_QuantitativeMeasure_TR_DeleteTracking] ON [tpdm].[QuantitativeMeasure] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[QuantitativeMeasure](OldEducationOrganizationId, OldEvaluationElementTitle, OldEvaluationObjectiveTitle, OldEvaluationPeriodDescriptorId, OldEvaluationPeriodDescriptorNamespace, OldEvaluationPeriodDescriptorCodeValue, OldEvaluationTitle, OldPerformanceEvaluationTitle, OldPerformanceEvaluationTypeDescriptorId, OldPerformanceEvaluationTypeDescriptorNamespace, OldPerformanceEvaluationTypeDescriptorCodeValue, OldQuantitativeMeasureIdentifier, OldSchoolYear, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EvaluationElementTitle, d.EvaluationObjectiveTitle, d.EvaluationPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.EvaluationTitle, d.PerformanceEvaluationTitle, d.PerformanceEvaluationTypeDescriptorId, j1.Namespace, j1.CodeValue, d.QuantitativeMeasureIdentifier, d.SchoolYear, d.TermDescriptorId, j2.Namespace, j2.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.EvaluationPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.PerformanceEvaluationTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.TermDescriptorId = j2.DescriptorId
END
GO

ALTER TABLE [tpdm].[QuantitativeMeasure] ENABLE TRIGGER [tpdm_QuantitativeMeasure_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_QuantitativeMeasureDatatypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_QuantitativeMeasureDatatypeDescriptor_TR_DeleteTracking] ON [tpdm].[QuantitativeMeasureDatatypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.QuantitativeMeasureDatatypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.QuantitativeMeasureDatatypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.QuantitativeMeasureDatatypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[QuantitativeMeasureDatatypeDescriptor] ENABLE TRIGGER [tpdm_QuantitativeMeasureDatatypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_QuantitativeMeasureScore_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_QuantitativeMeasureScore_TR_DeleteTracking] ON [tpdm].[QuantitativeMeasureScore] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[QuantitativeMeasureScore](OldEducationOrganizationId, OldEvaluationDate, OldEvaluationElementTitle, OldEvaluationObjectiveTitle, OldEvaluationPeriodDescriptorId, OldEvaluationPeriodDescriptorNamespace, OldEvaluationPeriodDescriptorCodeValue, OldEvaluationTitle, OldPerformanceEvaluationTitle, OldPerformanceEvaluationTypeDescriptorId, OldPerformanceEvaluationTypeDescriptorNamespace, OldPerformanceEvaluationTypeDescriptorCodeValue, OldPersonId, OldQuantitativeMeasureIdentifier, OldSchoolYear, OldSourceSystemDescriptorId, OldSourceSystemDescriptorNamespace, OldSourceSystemDescriptorCodeValue, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EvaluationDate, d.EvaluationElementTitle, d.EvaluationObjectiveTitle, d.EvaluationPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.EvaluationTitle, d.PerformanceEvaluationTitle, d.PerformanceEvaluationTypeDescriptorId, j1.Namespace, j1.CodeValue, d.PersonId, d.QuantitativeMeasureIdentifier, d.SchoolYear, d.SourceSystemDescriptorId, j2.Namespace, j2.CodeValue, d.TermDescriptorId, j3.Namespace, j3.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.EvaluationPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.PerformanceEvaluationTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.SourceSystemDescriptorId = j2.DescriptorId
        INNER JOIN edfi.Descriptor j3
            ON d.TermDescriptorId = j3.DescriptorId
END
GO

ALTER TABLE [tpdm].[QuantitativeMeasureScore] ENABLE TRIGGER [tpdm_QuantitativeMeasureScore_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_QuantitativeMeasureTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_QuantitativeMeasureTypeDescriptor_TR_DeleteTracking] ON [tpdm].[QuantitativeMeasureTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.QuantitativeMeasureTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.QuantitativeMeasureTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.QuantitativeMeasureTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[QuantitativeMeasureTypeDescriptor] ENABLE TRIGGER [tpdm_QuantitativeMeasureTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_RecruitmentEvent_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_RecruitmentEvent_TR_DeleteTracking] ON [tpdm].[RecruitmentEvent] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[RecruitmentEvent](OldEducationOrganizationId, OldEventDate, OldEventTitle, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EventDate, d.EventTitle, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[RecruitmentEvent] ENABLE TRIGGER [tpdm_RecruitmentEvent_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_RecruitmentEventAttendance_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_RecruitmentEventAttendance_TR_DeleteTracking] ON [tpdm].[RecruitmentEventAttendance] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[RecruitmentEventAttendance](OldEducationOrganizationId, OldEventDate, OldEventTitle, OldRecruitmentEventAttendeeIdentifier, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EventDate, d.EventTitle, d.RecruitmentEventAttendeeIdentifier, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
END
GO

ALTER TABLE [tpdm].[RecruitmentEventAttendance] ENABLE TRIGGER [tpdm_RecruitmentEventAttendance_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_RecruitmentEventAttendeeTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_RecruitmentEventAttendeeTypeDescriptor_TR_DeleteTracking] ON [tpdm].[RecruitmentEventAttendeeTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.RecruitmentEventAttendeeTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.RecruitmentEventAttendeeTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RecruitmentEventAttendeeTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[RecruitmentEventAttendeeTypeDescriptor] ENABLE TRIGGER [tpdm_RecruitmentEventAttendeeTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_RecruitmentEventTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_RecruitmentEventTypeDescriptor_TR_DeleteTracking] ON [tpdm].[RecruitmentEventTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.RecruitmentEventTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.RecruitmentEventTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RecruitmentEventTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[RecruitmentEventTypeDescriptor] ENABLE TRIGGER [tpdm_RecruitmentEventTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_RubricDimension_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_RubricDimension_TR_DeleteTracking] ON [tpdm].[RubricDimension] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[RubricDimension](OldEducationOrganizationId, OldEvaluationElementTitle, OldEvaluationObjectiveTitle, OldEvaluationPeriodDescriptorId, OldEvaluationPeriodDescriptorNamespace, OldEvaluationPeriodDescriptorCodeValue, OldEvaluationTitle, OldPerformanceEvaluationTitle, OldPerformanceEvaluationTypeDescriptorId, OldPerformanceEvaluationTypeDescriptorNamespace, OldPerformanceEvaluationTypeDescriptorCodeValue, OldRubricRating, OldSchoolYear, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EvaluationElementTitle, d.EvaluationObjectiveTitle, d.EvaluationPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.EvaluationTitle, d.PerformanceEvaluationTitle, d.PerformanceEvaluationTypeDescriptorId, j1.Namespace, j1.CodeValue, d.RubricRating, d.SchoolYear, d.TermDescriptorId, j2.Namespace, j2.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.EvaluationPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.PerformanceEvaluationTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.TermDescriptorId = j2.DescriptorId
END
GO

ALTER TABLE [tpdm].[RubricDimension] ENABLE TRIGGER [tpdm_RubricDimension_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_RubricRatingLevelDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_RubricRatingLevelDescriptor_TR_DeleteTracking] ON [tpdm].[RubricRatingLevelDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.RubricRatingLevelDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.RubricRatingLevelDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.RubricRatingLevelDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[RubricRatingLevelDescriptor] ENABLE TRIGGER [tpdm_RubricRatingLevelDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_SalaryTypeDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_SalaryTypeDescriptor_TR_DeleteTracking] ON [tpdm].[SalaryTypeDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.SalaryTypeDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.SalaryTypeDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.SalaryTypeDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[SalaryTypeDescriptor] ENABLE TRIGGER [tpdm_SalaryTypeDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_StaffEducatorPreparationProgramAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_StaffEducatorPreparationProgramAssociation_TR_DeleteTracking] ON [tpdm].[StaffEducatorPreparationProgramAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[StaffEducatorPreparationProgramAssociation](OldEducationOrganizationId, OldProgramName, OldProgramTypeDescriptorId, OldProgramTypeDescriptorNamespace, OldProgramTypeDescriptorCodeValue, OldStaffUSI, OldStaffUniqueId, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.ProgramName, d.ProgramTypeDescriptorId, j0.Namespace, j0.CodeValue, d.StaffUSI, j1.StaffUniqueId, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.ProgramTypeDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Staff j1
            ON d.StaffUSI = j1.StaffUSI
END
GO

ALTER TABLE [tpdm].[StaffEducatorPreparationProgramAssociation] ENABLE TRIGGER [tpdm_StaffEducatorPreparationProgramAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_StaffToCandidateRelationshipDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_StaffToCandidateRelationshipDescriptor_TR_DeleteTracking] ON [tpdm].[StaffToCandidateRelationshipDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.StaffToCandidateRelationshipDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.StaffToCandidateRelationshipDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.StaffToCandidateRelationshipDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[StaffToCandidateRelationshipDescriptor] ENABLE TRIGGER [tpdm_StaffToCandidateRelationshipDescriptor_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_SurveyResponsePersonTargetAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_SurveyResponsePersonTargetAssociation_TR_DeleteTracking] ON [tpdm].[SurveyResponsePersonTargetAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[SurveyResponsePersonTargetAssociation](OldNamespace, OldPersonId, OldSourceSystemDescriptorId, OldSourceSystemDescriptorNamespace, OldSourceSystemDescriptorCodeValue, OldSurveyIdentifier, OldSurveyResponseIdentifier, Id, Discriminator, ChangeVersion)
    SELECT d.Namespace, d.PersonId, d.SourceSystemDescriptorId, j0.Namespace, j0.CodeValue, d.SurveyIdentifier, d.SurveyResponseIdentifier, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.SourceSystemDescriptorId = j0.DescriptorId
END
GO

ALTER TABLE [tpdm].[SurveyResponsePersonTargetAssociation] ENABLE TRIGGER [tpdm_SurveyResponsePersonTargetAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_SurveySectionAggregateResponse_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_SurveySectionAggregateResponse_TR_DeleteTracking] ON [tpdm].[SurveySectionAggregateResponse] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[SurveySectionAggregateResponse](OldEducationOrganizationId, OldEvaluationDate, OldEvaluationElementTitle, OldEvaluationObjectiveTitle, OldEvaluationPeriodDescriptorId, OldEvaluationPeriodDescriptorNamespace, OldEvaluationPeriodDescriptorCodeValue, OldEvaluationTitle, OldNamespace, OldPerformanceEvaluationTitle, OldPerformanceEvaluationTypeDescriptorId, OldPerformanceEvaluationTypeDescriptorNamespace, OldPerformanceEvaluationTypeDescriptorCodeValue, OldPersonId, OldSchoolYear, OldSourceSystemDescriptorId, OldSourceSystemDescriptorNamespace, OldSourceSystemDescriptorCodeValue, OldSurveyIdentifier, OldSurveySectionTitle, OldTermDescriptorId, OldTermDescriptorNamespace, OldTermDescriptorCodeValue, Id, Discriminator, ChangeVersion)
    SELECT d.EducationOrganizationId, d.EvaluationDate, d.EvaluationElementTitle, d.EvaluationObjectiveTitle, d.EvaluationPeriodDescriptorId, j0.Namespace, j0.CodeValue, d.EvaluationTitle, d.Namespace, d.PerformanceEvaluationTitle, d.PerformanceEvaluationTypeDescriptorId, j1.Namespace, j1.CodeValue, d.PersonId, d.SchoolYear, d.SourceSystemDescriptorId, j2.Namespace, j2.CodeValue, d.SurveyIdentifier, d.SurveySectionTitle, d.TermDescriptorId, j3.Namespace, j3.CodeValue, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.EvaluationPeriodDescriptorId = j0.DescriptorId
        INNER JOIN edfi.Descriptor j1
            ON d.PerformanceEvaluationTypeDescriptorId = j1.DescriptorId
        INNER JOIN edfi.Descriptor j2
            ON d.SourceSystemDescriptorId = j2.DescriptorId
        INNER JOIN edfi.Descriptor j3
            ON d.TermDescriptorId = j3.DescriptorId
END
GO

ALTER TABLE [tpdm].[SurveySectionAggregateResponse] ENABLE TRIGGER [tpdm_SurveySectionAggregateResponse_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_SurveySectionResponsePersonTargetAssociation_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_SurveySectionResponsePersonTargetAssociation_TR_DeleteTracking] ON [tpdm].[SurveySectionResponsePersonTargetAssociation] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_tpdm].[SurveySectionResponsePersonTargetAssociation](OldNamespace, OldPersonId, OldSourceSystemDescriptorId, OldSourceSystemDescriptorNamespace, OldSourceSystemDescriptorCodeValue, OldSurveyIdentifier, OldSurveyResponseIdentifier, OldSurveySectionTitle, Id, Discriminator, ChangeVersion)
    SELECT d.Namespace, d.PersonId, d.SourceSystemDescriptorId, j0.Namespace, j0.CodeValue, d.SurveyIdentifier, d.SurveyResponseIdentifier, d.SurveySectionTitle, d.Id, d.Discriminator, (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
        INNER JOIN edfi.Descriptor j0
            ON d.SourceSystemDescriptorId = j0.DescriptorId
END
GO

ALTER TABLE [tpdm].[SurveySectionResponsePersonTargetAssociation] ENABLE TRIGGER [tpdm_SurveySectionResponsePersonTargetAssociation_TR_DeleteTracking]
GO


DROP TRIGGER IF EXISTS [tpdm].[tpdm_WithdrawReasonDescriptor_TR_DeleteTracking]
GO

CREATE TRIGGER [tpdm].[tpdm_WithdrawReasonDescriptor_TR_DeleteTracking] ON [tpdm].[WithdrawReasonDescriptor] AFTER DELETE AS
BEGIN
    IF @@rowcount = 0 
        RETURN

    SET NOCOUNT ON

    INSERT INTO [tracked_changes_edfi].[Descriptor](OldDescriptorId, OldCodeValue, OldNamespace, Id, Discriminator, ChangeVersion)
    SELECT  d.WithdrawReasonDescriptorId, b.CodeValue, b.Namespace, b.Id, 'tpdm.WithdrawReasonDescriptor', (NEXT VALUE FOR [changes].[ChangeVersionSequence])
    FROM    deleted d
            INNER JOIN edfi.Descriptor b ON d.WithdrawReasonDescriptorId = b.DescriptorId
END
GO

ALTER TABLE [tpdm].[WithdrawReasonDescriptor] ENABLE TRIGGER [tpdm_WithdrawReasonDescriptor_TR_DeleteTracking]
GO


