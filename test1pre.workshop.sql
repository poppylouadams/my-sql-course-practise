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
 AND ps.AdmittedDate BETWEEN '2024-02-27' AND '2024-03-01'