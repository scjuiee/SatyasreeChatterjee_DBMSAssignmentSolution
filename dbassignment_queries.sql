

##3. How many females and how many male passengers travelled for a minimum distance of
## 600 KM s?
SELECT GENDER , COUNT(1) No_Of_Passenger FROM PASSENGER WHERE DISTANCE >= 600 GROUP BY GENDER;

##4. Find the minimum ticket price for Sleeper Bus. 

SELECT MIN(PRICE) FROM PRICE WHERE Bus_Type = 'Sleeper';

##5.Select passenger names whose names start with character 'S' 
SELECT Passenger_name FROM PASSENGER WHERE Passenger_name like 'S%';

##6. Calculate price charged for each passenger displaying Passenger name, Boarding City,
## Destination City, Bus_Type, Price in the output

SELECT 
    P.Passenger_name,
    P.Boarding_City,
    P.Destination_City,
    P.Bus_Type,
    PR.PRICE
FROM
    PASSENGER P,
    PRICE PR
WHERE
    P.Bus_Type = PR.Bus_Type
        AND P.DISTANCE = PR.DISTANCE;
        
##7. What is the passenger name and his/her ticket price who travelled in Sitting bus for a
## distance of 1000 KM s 
SELECT 
    P.PASSENGER_NAME, PR.PRICE
FROM
    PASSENGER P,
    PRICE PR
WHERE
    P.DISTANCE = 1000
        AND P.BUS_TYPE = 'Sitting'
        AND P.BUS_TYPE = PR.BUS_TYPE;

##8.  What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
SELECT 
    BUS_TYPE, PRICE
FROM
    PRICE
WHERE
    DISTANCE = (SELECT 
            DISTANCE
        FROM
            PASSENGER
        WHERE
            PASSENGER_NAME = 'Pallavi'
                AND BOARDING_CITY = 'Panaji'
                AND DESTINATION_CITY = 'Bengaluru');  
                
                
##9. List the distances from the "Passenger" table which are unique (non-repeated
## distances) in descending order.
SELECT DISTINCT DISTANCE FROM PASSENGER ORDER BY DISTANCE DESC;   

##10.  Display the passenger name and percentage of distance travelled by that passenger
## from the total distance travelled by all passengers without using user variables        
SELECT 
    PASSENGER_NAME,
    (DISTANCE / (SELECT 
            SUM(DISTANCE)
        FROM
            PASSENGER) * 100) AS PERCENTAGE
FROM
    PASSENGER;

##11. Display the distance, price in three categories in table Price
## a) Expensive if the cost is more than 1000
## b) Average Cost if the cost is less than 1000 and greater than 500
## c) Cheap otherwise

DELIMITER &&  
 CREATE PROCEDURE categorize_price()
 BEGIN
 select distance,price,
 CASE
     WHEN price > 1000 THEN 'Expensive'
     WHEN price > 500 AND  price <1000 THEN 'Average Cost'
     ELSE 'Cheap'
 END AS PriceCatyegory from Price;
 END &&  
 DELIMITER ;  
 
 call categorize_price();

