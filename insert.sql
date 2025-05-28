-- an mysql script of inserts to test the basic relationships between our table entities for Air Quality Database design.
-- author Paige Hodgkinson 2024

USE AQ_DB;

INSERT INTO Units (unitsdescript) Values ("parts per million");
INSERT INTO Units (unitsdescript) Values ("parts per billion");
INSERT INTO Units (unitsdescript) Values ("microgram/cubic meter");
SELECT * FROM Units;

INSERT INTO TribalEntityNames (tribalnamedescript) Values ('St. Regis Band of Mohawk Indians');
INSERT INTO TribalEntityNames (tribalnamedescript) Values ('Eastern Band Of Cherokee Indians of North Carolina');
INSERT INTO TribalEntityNames (tribalnamedescript) Values ('Birch Creek Tribe');
SELECT * FROM TribalEntityNames;

INSERT INTO TribalEntityCodes (BIAcode) Values ('S50007');
INSERT INTO TribalEntityCodes (BIAcode) Values ('E03049');
INSERT INTO TribalEntityCodes (BIAcode) Values ('S52001');
SELECT * FROM TribalEntityCodes; 

INSERT INTO RecordingMode (recordingmodedescript) Values ("continous");
INSERT INTO RecordingMode (recordingmodedescript) Values ("intermittent");
SELECT * FROM RecordingMode;


INSERT INTO QAQualifiersList(QAcode, QAdescript, QAType , QATypeCode, stillactive) Values ("1", 
"Deviation from a CFR/Critical Criteria Requirement.", "Quality Assurance Qualifier", "QA", "YES");
INSERT INTO QAQualifiersList(QAcode, QAdescript, QAType , QATypeCode, stillactive) Values ("1C", 
"A 1-Point QC check exceeds acceptance criteria but there is compelling evidence that the analyzer data is valid.", 
"Missing QA/QC Audit", "NULL QC", "YES");
INSERT INTO QAQualifiersList(QAcode, QAdescript, QAType , QATypeCode, stillactive) Values ("A", "High Winds", 
"Informational Only", "Inform", "YES");

SELECT * FROM QAQualifiersList;