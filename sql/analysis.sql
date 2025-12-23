-- ANALYSIS 1: Executive Summary (Percentage of Friction by Component)
-- Purpose: Identifies the primary 40% bottleneck.

SELECT 
    tech_component, 
    COUNT(*) AS total_issues,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Student_Issues), 2) || '%' AS percentage_of_total
FROM Student_Issues
GROUP BY tech_component
ORDER BY total_issues DESC;


-- ANALYSIS 2: Root Cause Cross-Tabulation
-- Purpose: Breaks down the failure signatures within the components.

SELECT 
    tech_component, 
    failure_type, 
    COUNT(*) as incident_count
FROM Student_Issues
GROUP BY tech_component, failure_type
ORDER BY tech_component, incident_count DESC;


-- ANALYSIS 3: Qualitative Deep Dive (IAM Specific)
-- Purpose: Extracts raw notes for the primary bottleneck to identify specific user struggles.

SELECT 
    jira_id, 
    notes 
FROM Student_Issues 
WHERE tech_component = 'IAM'
AND failure_type = 'Permission';