# Answers to World
use world;
show tables;

select * from city;
select * from country;
select * from countrylanguage;
describe country;

# Q1 Number of cities in USA
select count(name) from city where countrycode="USA"; #274

# Q2 Population and life exp in Argentina
select `name`, population, lifeexpectancy from country where code="ARG"; # 37,032,000 and 75.1

# Q3 which country has highest life exp
select `name` from country order by lifeexpectancy desc limit 1; #Andorra

#Q4 capital city of spain
select city.`name` from country join city on country.capital=city.ID where country.`name`="Spain";

#Q5 list of all languages in SE Asia
select `language` from country c join countrylanguage cl on c.`code`=cl.countrycode where c.region="Southeast Asia";

#Q6 25 cities that start with f
select `name` from city where `name` like "f%" limit 25;

#Q7 Number of cities in China Answer = 363
select count(city.`name`) from country join city on country.`code`=city.countrycode where country.`name`="China";

#Q8 country with lowest population
select `name`, population from country where population is not null and population !=0 order by population asc limit 1;

#9 number of countries in DB Answer=239
select count(country.`name`) from country;

#10 top ten largest countries by area
select `name`, surfacearea from country order by surfacearea desc limit 10;

#11 5 largest cities in japan
select `name`, population from city where city.countrycode="JPN" order by population desc limit 5;

#12 list of names and country codes with Elizabeth 2nd as head of state, fix mistake first
# update country set headofstate="Elizabeth II" where headofstate="Elisabeth II";
select `name`, `code` from country where headofstate="Elisabeth II"; 

#13 list of top 10 with smallest population to area ratio, discard ratio of 0
select `name`, population, surfacearea from country where population>=1 order by surfacearea/population asc limit 10;

#14 list of every unique world language
select distinct `language` from countrylanguage;

#15 list of name and GNP of top 10 richest countries
select `name`, GNP from country order by GNP desc limit 10;

#16 list of names and number of languages spoken by top ten most multilingual countries
select c.`name`, count(cl.`language`) from country c join countrylanguage cl on c.`code`=cl.countrycode group by c.`name` order by count(cl.`language`) desc limit 10;

#17 list of countries where over 50% of population can speak German
select c.`name`, cl.`language`, cl.percentage from countrylanguage cl join country c on c.`code`=cl.countrycode where `language`="German" and percentage>=50 order by percentage desc;

#18 country with worst life expectancy
select `name`, lifeexpectancy from country where lifeexpectancy is not null and lifeexpectancy !=0 order by lifeexpectancy asc limit 1;

#19 list top 3 most common government forms
select c.governmentform, count(c.governmentform) from country c group by c.governmentform order by count(c.governmentform) desc limit 3;

#20 how many countries have gained independance since records began
select count(c.indepyear) from country c where indepyear is not null;
