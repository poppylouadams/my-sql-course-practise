--SELECT * FROM airports

SELECT 
    ps.PatientId
    , ps.AdmittedDate
    , ps.DischargeDate
    , DATEDIFF(DAY, ps.admitteddate, ps.dischargedate) AS lengthofstay
    , DATEADD (DAY, -14, ps.admitteddate) AS reminderdate
    , ps.Hospital
    , ps.Tariff
    , Ps.Ethnicity
 FROM PatientStay ps
 WHERE ps.Hospital IN ('PRUH', 'Oxleas')
 AND ps.Ward LIKE '%Surgery'
-- AND ps.AdmittedDate BETWEEN '2024-02-27' AND '2024-03-01'
ORDER BY ps.AdmittedDate desc, ps.PatientId DESC

SELECT
     ps.Hospital
    , ps.Ward 
    , COUNT(*) AS Numberofpatients 
    , SUM(ps.Tariff) AS Totaltariff
    , AVG(ps.Tariff) AS AverageTariff
    , MAX(ps.Tariff) AS MaxTariff
    , MIN(ps.Tariff) AS MinTariff
 FROM PatientStay ps
 GROUP BY ps.Hospital, ps.Ward
 ORDER BY Numberofpatients DESC

 SELECT  ps.PatientId
    , ps.AdmittedDate
    , ps.Hospital
    , dh.hospitaltype
    , dh.hospitalsize
    FROM PatientStay ps LEFT JOIN DimHospitalBad dh ON ps.Hospital = dh.Hospital WHERE DH.Hospital IS NULL

