﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/FX4ATO
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Departments] (
    [dept_no] VARCHAR  NOT NULL ,
    [dept_name] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED (
        [dept_no] ASC
    )
)

CREATE TABLE [Department_Employees] (
    [emp_no] INT  NOT NULL ,
    [dept_no] VARCHAR  NOT NULL 
)

CREATE TABLE [Department_Manager] (
    [dept_no] VARCHAR  NOT NULL ,
    [emp_no] INT  NOT NULL 
)

CREATE TABLE [Employees] (
    [emp_no] INT  NOT NULL ,
    [emp_title_id] VARCHAR  NOT NULL ,
    [birth_date] DATE  NOT NULL ,
    [first_name] VARCHAR  NOT NULL ,
    [last_name] VARCHAR  NOT NULL ,
    [sex] VARCHAR  NOT NULL ,
    [hire_date] DATE  NOT NULL ,
    CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED (
        [emp_no] ASC
    )
)

CREATE TABLE [Salaries] (
    [emp_no] INT  NOT NULL ,
    [salary] INT  NOT NULL 
)

CREATE TABLE [Titles] (
    [title_id] VARCHAR  NOT NULL ,
    [title] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED (
        [title_id] ASC
    )
)

ALTER TABLE [Department_Employees] WITH CHECK ADD CONSTRAINT [FK_Department_Employees_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Department_Employees] CHECK CONSTRAINT [FK_Department_Employees_emp_no]

ALTER TABLE [Department_Employees] WITH CHECK ADD CONSTRAINT [FK_Department_Employees_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Department_Employees] CHECK CONSTRAINT [FK_Department_Employees_dept_no]

ALTER TABLE [Department_Manager] WITH CHECK ADD CONSTRAINT [FK_Department_Manager_dept_no] FOREIGN KEY([dept_no])
REFERENCES [Departments] ([dept_no])

ALTER TABLE [Department_Manager] CHECK CONSTRAINT [FK_Department_Manager_dept_no]

ALTER TABLE [Department_Manager] WITH CHECK ADD CONSTRAINT [FK_Department_Manager_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Department_Manager] CHECK CONSTRAINT [FK_Department_Manager_emp_no]

ALTER TABLE [Employees] WITH CHECK ADD CONSTRAINT [FK_Employees_emp_title_id] FOREIGN KEY([emp_title_id])
REFERENCES [Titles] ([title_id])

ALTER TABLE [Employees] CHECK CONSTRAINT [FK_Employees_emp_title_id]

ALTER TABLE [Salaries] WITH CHECK ADD CONSTRAINT [FK_Salaries_emp_no] FOREIGN KEY([emp_no])
REFERENCES [Employees] ([emp_no])

ALTER TABLE [Salaries] CHECK CONSTRAINT [FK_Salaries_emp_no]

COMMIT TRANSACTION QUICKDBD