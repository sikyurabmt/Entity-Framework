
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 06/19/2017 17:15:24
-- Generated from EDMX file: C:\Users\quang\Documents\Visual Studio 2013\Projects\G7_ModelFirst\G7_ModelFirst\Models\ModelFirstEntities.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [master];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Students'
CREATE TABLE [dbo].[Students] (
    [StudentID] int IDENTITY(1,1) NOT NULL,
    [StudentName] nvarchar(max)  NOT NULL,
    [StudentAge] nvarchar(max)  NOT NULL,
    [StudentGrade] nvarchar(max)  NOT NULL,
    [StudentYearOfGraduation] nvarchar(max)  NOT NULL,
    [RegisterSubject_RegSubID] int  NOT NULL
);
GO

-- Creating table 'Subjects'
CREATE TABLE [dbo].[Subjects] (
    [SubjectID] int IDENTITY(1,1) NOT NULL,
    [SubjectName] nvarchar(max)  NOT NULL,
    [SubjectNumOfStudent] nvarchar(max)  NOT NULL,
    [RegisterSubject_RegSubID] int  NOT NULL
);
GO

-- Creating table 'RegisterSubjects'
CREATE TABLE [dbo].[RegisterSubjects] (
    [RegSubID] int IDENTITY(1,1) NOT NULL,
    [StudentID] nvarchar(max)  NOT NULL,
    [SubjectID] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [StudentID] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [PK_Students]
    PRIMARY KEY CLUSTERED ([StudentID] ASC);
GO

-- Creating primary key on [SubjectID] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [PK_Subjects]
    PRIMARY KEY CLUSTERED ([SubjectID] ASC);
GO

-- Creating primary key on [RegSubID] in table 'RegisterSubjects'
ALTER TABLE [dbo].[RegisterSubjects]
ADD CONSTRAINT [PK_RegisterSubjects]
    PRIMARY KEY CLUSTERED ([RegSubID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [RegisterSubject_RegSubID] in table 'Students'
ALTER TABLE [dbo].[Students]
ADD CONSTRAINT [FK_RegisterSubjectStudent]
    FOREIGN KEY ([RegisterSubject_RegSubID])
    REFERENCES [dbo].[RegisterSubjects]
        ([RegSubID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RegisterSubjectStudent'
CREATE INDEX [IX_FK_RegisterSubjectStudent]
ON [dbo].[Students]
    ([RegisterSubject_RegSubID]);
GO

-- Creating foreign key on [RegisterSubject_RegSubID] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [FK_RegisterSubjectSubject]
    FOREIGN KEY ([RegisterSubject_RegSubID])
    REFERENCES [dbo].[RegisterSubjects]
        ([RegSubID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RegisterSubjectSubject'
CREATE INDEX [IX_FK_RegisterSubjectSubject]
ON [dbo].[Subjects]
    ([RegisterSubject_RegSubID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------