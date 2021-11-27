-- Description: https://www.codewars.com/kata/581fb63e70ca28d92500000d

with department_with_new_salary as (
select
  department_id,
  department_name,
   1 + pctIncrease(department_id) as salary_ratio 
from departments)

select 
  e.employee_id,
  e.first_name,
  e.last_name,
  d.department_name,
  e.salary AS old_salary,
  d.salary_ratio * e.salary as new_salary
from employees e
inner join department_with_new_salary d
  on e.department_id = d.department_id
order by e.employee_id asc;

