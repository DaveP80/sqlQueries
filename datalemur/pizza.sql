-- DataLemur 3-Topping Pizzas [McKinsey SQL Interview Question]
SELECT
	distinct concat(t1.topping_name, ',', t2.topping_name, ',', t3.topping_name)
as pizza,
	t1.ingredient_cost + t2.ingredient_cost + t3.ingredient_cost
FROM
	pizza_toppings t1
join pizza_toppings t2 on
	t1.topping_name < t2.topping_name
join pizza_toppings t3 on
	t2.topping_name < t3.topping_name
order by
	2 desc,
	1;
