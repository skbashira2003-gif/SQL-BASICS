#now()
select now() as date_time;

#current_date()- It returns the todays date
select curdate() as todays_date;

#current_time()- It returns the todays time
select curtime() as todays_time;

#sysdate()
select sysdate() as sys_timestamp;

#date extraction functions are used to extract specific form of date
#year()-extracts year from date
select year(now());
select year(curdate());

#month()- extracts months from date
select month(now());
select month(current_date());
select monthname('1995-05-25');
select monthname(curdate());

#day()-returns a day of month
select day(now());
select dayofmonth(now());
select dayname(now());
select dayname('1995-05-25');

#dayofweek()-returns the day of week
select curdate() as today,
dayofweek(now()) as day_number,
dayname(now()) as day_name,
case dayofweek(curdate())
when 1 then 'sunday'
when 2 then 'monday'
when 3 then 'tuesday'
when 4 then 'wednesday'
when 5 then 'thursday'
when 6 then 'friday'
when 7 then 'saturday'
end as weekday_name;


#data formatting functions
# %y-year, %m-month, %d-day %, %w-weekday, %H-hours, %i-minutes, %s-seconds, %p-pm/am
select date_format(now(),'%w,%M,%D,%Y') as form_1;
select date_format(now(),'%y-%m-%d %H:%i:%s %p') as form_2;

select str_to_date('03-10-2026','%d-%m-%y') ;

#date arithimatic functios
#date_add()
select date_add(curdate(),interval 10 day);
#date_sub()
select date_sub(curdate(),interval 3 day);
