create database swiggy;
use swiggy;

-- selecting all tables
select *from items;
select *from orders;

-- distinct items ordered
select count(distinct name) from items;

-- distribution of veg and nonveg items
select veg,count(name) as vegitems from items 
group by veg

-- distinct items orders placed
select count(distinct order_id) from items;

-- speciality chicken
select *from items where name like '%chicken%';

-- item names with paratha as per desc order
select *from items where name like '%paratha%' order by order_id desc;
select *from items where name like '%paratha%' order by id desc;

-- average items per order
select count(name)/count(distinct order_id) as avgitemsperorder from items;

-- items ordered maximum no of times
select name,count(*)from items group by name
order by count(*) desc;

-- orders during rainy days
select distinct rain_mode from orders;

-- restaurants names
select restaurant_name,count(*) from orders
group by restaurant_name 
order by count(*)desc;

-- max of order time
select max(order_time)from orders;

-- average order value
select sum(order_total)/count(distinct order_id) as aov from orders;

-- revenue of each restaurant
select restaurant_name, sum(order_total) as revenue from orders 
group by restaurant_name;

-- joining items and order table
select a.name,veg,b.restaurant_name,b.order_id,b.order_time from items a
join orders b
on a.order_id=b.order_id;

-- product combinations ordered together
select a.name,b.restaurant_name as combination,concat(a.name,b.restaurant_name)from items a
join orders b
on a.order_id=b.order_id;

-- product combinations ordered together
select a.name,b.name as combination,concat(a.name,b.name)from items a
join items b
on a.order_id=b.order_id;

select a.name,b.name as combination,concat(a.name,b.name)from items a
join items b
on a.order_id=b.order_id
where a.name!=b.name and a.name<=b.name;
