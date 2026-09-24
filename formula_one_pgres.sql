-- SELECT * FROM formula_one_data;

-- Q1. FIND THE LONGEST CIRCUIT WITH RESPECT TO LENGTH?

-- SELECT DISTINCT circuit AS Longest_Circuit , circuit_length_km
-- FROM formula_one_data
-- ORDER BY circuit_length_km DESC LIMIT 5;

-- Q2. FINT THE TOP 10 DRIVERS WITH THE MOST POINTS?

-- SELECT DISTINCT driver , nationality , points AS total_points
-- FROM formula_one_data
-- ORDER BY points DESC LIMIT 10;

-- Q3. FIND THE TOP 5 DRIVERs WITH THE FASTEST LAP TIME EVER?

-- SELECT DISTINCT driver , nationality ,circuit , season ,  fastest_lap_time_sec AS fastest_driver
-- FROM formula_one_data 
-- WHERE fastest_lap_time_sec IS NOT NULL 
-- AND fastest_lap_time_sec > 0
-- ORDER BY fastest_lap_time_sec ASC LIMIT 5;

-- Q4. FIND THE MOST CONSISTENT DRIVER ON THE GRID EVERY SEASON? (BY USING WINDOWS FUNCTION)

-- WITH ranked_drivers AS (
--     SELECT 
--         season,
--         driver,
--         nationality,
--         ROUND(AVG(consistency_score::numeric), 2) AS avg_consistency_score,
--         COUNT(round) AS races_entered,
--         ROW_NUMBER() OVER(
--             PARTITION BY season 
--             ORDER BY AVG(consistency_score) DESC
--         ) AS rnk
--     FROM formula_one_data
--     GROUP BY season, driver, nationality
--     HAVING COUNT(round) >= 5
-- )
-- SELECT 
--     season,
--     driver,
--     nationality,
--     avg_consistency_score,
--     races_entered
-- FROM ranked_drivers
-- WHERE rnk = 1
-- ORDER BY season DESC;

-- Q6. FIND THE OVERTAKE MASTER?

-- SELECT driver, constructor , COUNT(*) AS total_races_finished,
-- SUM(grid_gain) AS total_positions_gained,
-- ROUND(AVG(grid_gain)::numeric,2) AS avg_positions_gained_per_race
-- FROM formula_one_data
-- WHERE dnf = 0
-- GROUP BY driver , constructor 
-- HAVING COUNT(*) >15
-- ORDER BY avg_positions_gained_per_race DESC
-- LIMIT 10;

-- Q7.Qualifying Advantage by Circuit (Pole-to-Win Conversion Rate)

-- SELECT 
--     circuit,
--     COUNT(*) AS total_races,
--     SUM(CASE WHEN grid_position = 1 AND finish_position = 1 THEN 1 ELSE 0 END) AS pole_and_won,
--     ROUND(
--         (SUM(CASE WHEN grid_position = 1 AND finish_position = 1 THEN 1 ELSE 0 END)::numeric 
--          / COUNT(*)::numeric) * 100, 
--         2
--     ) AS pole_to_win_conversion_pct
-- FROM formula_one_data
-- WHERE grid_position = 1 AND dnf = 0
-- GROUP BY circuit
-- HAVING COUNT(*) >= 5
-- ORDER BY pole_to_win_conversion_pct DESC;

-- Q8.Pit Crew Efficiency & Reliability by Constructor

-- SELECT 
--     constructor,
--     COUNT(*) AS pit_stops_logged,
--     ROUND(AVG(average_pit_duration)::numeric, 2) AS avg_pit_duration_sec,
--     ROUND(MIN(average_pit_duration)::numeric, 2) AS fastest_avg_pit_sec,
--     ROUND(STDDEV(average_pit_duration)::numeric, 2) AS pit_variance_stddev
-- FROM formula_one_data
-- WHERE average_pit_duration > 0 AND average_pit_duration < 40
-- GROUP BY constructor
-- HAVING COUNT(*) >= 20
-- ORDER BY avg_pit_duration_sec ASC;