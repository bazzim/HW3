USE birdstrikes ;


/* 
Exercise1: Do the same with speed. If speed is NULL or speed < 100 create a "LOW SPEED" category, 
otherwise, mark as "HIGH SPEED". Use IF instead of CASE!
*/
SELECT id,
	   airline,
       speed,
       IF(( speed < 100 OR speed IS NULL ),
			'LOW SPEED', 'HIGH SPEED') AS speed_category
FROM birdstrikes
ORDER BY speed_category;


-- Exercise2 - How many distinct 'aircraft' we have in the database?
-- ANSWER: 3
SELECT COUNT(DISTINCT(aircraft)) 
FROM birdstrikes;


-- Exercise3: What was the lowest speed of aircrafts starting with 'H'
-- ANSWER: 9
SELECT MIN(speed)
FROM birdstrikes 
WHERE aircraft REGEXP '^H';


-- Exercise4: Which phase_of_flight has the least of incidents?
-- ANSWER: TAXI (2 incidents)
SELECT phase_of_flight, 
	 count((phase_of_flight)) AS counter 
FROM birdstrikes 
WHERE phase_of_flight != ''
GROUP BY  phase_of_flight 
ORDER BY counter;


-- Exercise5: What is the rounded highest average cost by phase_of_flight?
-- ANSWER: 54673
SELECT phase_of_flight, 
	 ROUND(AVG(cost)) AS avg_cost
FROM birdstrikes 
WHERE phase_of_flight != ''
GROUP BY  phase_of_flight
ORDER BY avg_cost DESC;


-- Exercise6: What the highest AVG speed of the states with names less than 5 characters?
-- ANSWER: 2862.5000
SELECT state, 
	 AVG(speed) AS avg_speed
FROM birdstrikes 
WHERE length(state) < 5
GROUP BY state
ORDER BY avg_speed DESC
LIMIT 1;

