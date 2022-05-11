1. 

select cc.country, citys.city, SUM(pay.amount) 
	from country as cc 
		join city as citys on citys.country_id = cc.country_id 
		join address as adr on adr.city_id = citys.city_id 
		join customer as client on client.address_id = adr.address_id 
		join payment as pay on client.customer_id = pay.customer_id 
	group by cc.country, citys.city
	order by SUM(pay.amount) desc 

2. 

select f.title, f.length, movieCat.name, count(rent.rental_id) as rental_count
	from film as f
		join film_category as filmCat on f.film_id = filmCat.film_id
		join category as movieCat on filmcat.film_id = movieCat.category_id
		join inventory as invent on invent.film_id = f.film_id 
		join rental as rent on rent.inventory_id = invent.inventory_id 
		join customer as client on client.customer_id = rent.customer_id 
		join address as adr on client.address_id = adr.address_id 
		join city as city on city.city_id = adr.city_id 
		join country as country on country.country_id  = city.country_id 
	where f.rating = 'NC-17'
		group by f.title, f.length, movieCat.name, country.country, rent.rental_id, f.rating
		HAVING  rent.rental_id > 5
		order by rent.rental_id desc 

3. 

select client.first_name, client.last_name, client.email, SUM(pay.amount)
	from customer as client
		JOIN payment as pay on pay.customer_id = client.customer_id 
	group by client.first_name, client.last_name, client.email
	having SUM(pay.amount) >= 200



4. 

select first_name, count(first_name) as repeat_times
	from customer
	group by first_name 
	having COUNT(*) > 1;

