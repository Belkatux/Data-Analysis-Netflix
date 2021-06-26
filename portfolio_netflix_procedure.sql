CREATE DEFINER=`root`@`localhost` PROCEDURE `tvmovies`(IN type_of VARCHAR(10))
BEGIN
	DECLARE tvmovies INT;
    DROP TEMPORARY TABLE IF EXISTS tv_movies_table;
    CREATE TEMPORARY TABLE IF NOT EXISTS tv_movies_table(year INT, quantity INT);
    
    SET @counter = 8;
    WHILE @counter <=20 DO
		IF @counter <= 9 THEN
			SET tvmovies = (
			SELECT count(type) FROM movie_desc
			WHERE date_added LIKE CONCAT('%200', CONVERT(@counter, CHAR), '%') and type = type_of);
		ELSE
			SET tvmovies = (
			SELECT count(type) FROM movie_desc
			WHERE date_added LIKE CONCAT('%20', CONVERT(@counter, CHAR), '%') and type = type_of);
		END IF;
        INSERT INTO tv_movies_table(year, quantity) values (@counter, tvmovies);
        SET @counter = @counter + 1;
	END WHILE;
    SELECT * FROM tv_movies_table;       
		
END