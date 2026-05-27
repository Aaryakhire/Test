use [ai_student]

select * from [dbo].[ai_student_impact_dataset]

--Finding duplicate data
select student_id,count(*) as Duplicate_count
from [dbo].[ai_student_impact_dataset]
group by Student_ID
having count(*)>1

--Finding null values
select * from [dbo].[ai_student_impact_dataset]
where [Student_ID] is null
or [Major_Category] is null
or [Year_of_Study] is null
or [Pre_Semester_GPA] is null
or [Weekly_GenAI_Hours] is null
or [Primary_Use_Case] is null
or [Prompt_Engineering_Skill] is null
or [Tool_Diversity] is null
or [Traditional_Study_Hours] is null 
or [Paid_Subscription] is null
or [Perceived_AI_Dependency] is null
or [Institutional_Policy] is null
or [Anxiety_Level_During_Exams] is null
or [Post_Semester_GPA] is null
or [Skill_Retention_Score] is null
or [Burnout_Risk_Level] is null

--Which Major has highest number of students
select top 1
major_category,count(*) as Total_Students
from [dbo].[ai_student_impact_dataset]
group by Major_Category
order by Total_Students desc

--Average Skill Retention Score
select avg(skill_Retention_Score) as Average_Skil_Retention
from [dbo].[ai_student_impact_dataset]

--Most Common Burnout Risk
select top 1
Burnout_Risk_Level,count(*) as Total_Students
from [dbo].[ai_student_impact_dataset]
group by Burnout_Risk_Level
order by Total_Students desc

--Most Common used purpose of AI
select top 5
Primary_Use_Case,count(*) as Usage_Count
from [dbo].[ai_student_impact_dataset]
group by Primary_Use_Case
order by Usage_Count desc

--Average Pre-Semester Perfromance
select
avg(Pre_Semester_GPA) as Average_Pre_Semester_Performance
from [dbo].[ai_student_impact_dataset]

--Average Post-Semester Perfromance
select
avg(Post_Semester_GPA) as Average_Post_Semester_Performance
from [dbo].[ai_student_impact_dataset]

--Rank Students by Weekly AI Usage(top 10)
select top 10
student_id,
Weekly_GenAI_Hours,
rank() over(order by Weekly_GenAI_Hours desc) as AI_Usage_Rank
from ai_student_impact_dataset

--Dense Rank Students by Pre-Semester GPA
select 
student_id,
pre_semester_gpa,
dense_rank() over( order by pre_semester_gpa desc)as Pre_Semester_GPA_Dense_Rank
from [dbo].[ai_student_impact_dataset]







