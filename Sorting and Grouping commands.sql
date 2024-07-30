
Questions 

1. find the top 5 samsung phones with bigest screen?  

select model, screen_size from campusx.smartphones  
where brand_name = 'samsung'
order by screen_size desc limit 5

2. Sort all the phones in descending order of number of total cameras? 

select model, 
num_front_cameras + num_rear_cameras as 'total_cameras' 
from campusx.smartphones
order by total_cameras desc

3. Sort data on the basics of ppi in descending order?

select model, price,
ROUND(SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/ screen_size) as 'ppi'
from campusx.smartphones
order by ppi desc limit 5

4. find the phone with 2nd largest battery? 
 
select battery_capacity ,
case 
	when order by battery_capacity desc limit 1,1 
	else battery_capacity = ""
end 
from campusx.smartphones

select model, brand_name from campusx.smartphones 
order by model , brand_name asc limit 1,1

5. Worst rated apple phone ? 

select model, rating as 'worst_phone' 
from campusx.smartphones 
where brand_name = 'apple' 
order by worst_phone asc limit 1 


GROUPING DATA ....

-- 1. Group smartphones by brand and get the count, avg price , max rating , avg screen size , and avg batttery capacity ?

select brand_name , count(*) as 'phone_nums' ,
round(avg(price)) as 'avg_price',
max(rating) as 'max_ratings',
round(avg(screen_size), 2) as 'avg_screen_size',
round(avg(battery_capacity), 2) as 'avg_battery_capacity'
from campusx.smartphones
group by brand_name
order by phone_nums desc limit 16


-- 2 .  Group smartphones by whether they have an nfc and get the avg price and rating ? 

select has_nfc as 'nfc', 
round(avg(price)) as 'avg_price',
round(avg(rating), 1) as 'avg_ratings'
from campusx.smartphones
group by nfc 


-- 3. also for 5g ? 
 
select has_5g as '5g', 
round(avg(price)) as 'avg_price',
round(avg(rating), 1) as 'avg_ratings', 
round(avg(battery_capacity)) as 'battery' 
from campusx.smartphones
group by '5g'


-- 4 . Also for fast_charging ?

select fast_charging_available as fast, 
has_5g as 5g,
round(avg(price)) as 'avg_price',
round(avg(rating), 1) as 'avg_ratings' ,
round(avg(battery_capacity)) as 'battery' 
from campusx.smartphones
group by fast , 5g


-- 5 . extended memoery avaliable avg's ?

select extended_memory_available, 
round(avg(price)) as 'avg_price',
round(avg(rating), 1) as 'avg_ratings' ,
round(avg(battery_capacity)) as 'battery' 
from campusx.smartphones
group by extended_memory_available


-- 6 . Group smartphones by brand and processor brand and get the count of models and avg primary camera resolution(rear) ? 
 
select brand_name as brand,
processor_brand, 
count(*) as models_cnt,
round(avg(primary_camera_rear)) as avg_resolution
from campusx.smartphones
group by brand , processor_brand 
-- order by brand desc limit 10


-- 7 . top 5 mostly phones brands ?

select brand_name , 
round(avg(price)) as price
from campusx.smartphones
group by brand_name 
order by price desc limit 5 

-- 8 . toptest phone with smallest screen size ?

select brand_name , 
round(avg(screen_size)) as screen
from campusx.smartphones
group by brand_name 
order by screen asc limit 1 

-- 9 . 


select brand_name ,
count(*) as cnt 
from campusx.smartphones
where has_nfc = 'True' AND has_ir_blaster = 'True' 
group by brand_name
order by cnt desc limit 1 


-- 10 .  


Having clause ...

-- 1. 

select brand_name ,
count(*) as 'cnt', 
avg(price) as 'price'
from campusx.smartphones
group by brand_name 
having cnt > 20
order by price desc 


-- 2 . 

select brand_name ,
count(*) as 'cnt', 
round(avg(rating)) as 'ratings'
from campusx.smartphones
group by brand_name 
having cnt > 20
order by ratings desc 

-- 3 .  

 
select brand_name,  
-- count(*) as cnt,
avg(ram_capacity) as ram 
from campusx.smartphones
where refresh_rate > 90 AND fast_charging_available = 1
group by brand_name
having count(*) > 10 
order by ram desc limit 3 
 
 
-- 4 . 

  
select brand_name as phone,
round(avg(price)) as price  
from campusx.smartphones
where has_5g = 'True'  
group by phone 
having avg(rating) > 70 and count(*)
 

    
