CREATE VIEW PassengerBookingsView AS
SELECT 
    p.passenger_name, 
    f.flight_name, 
    b.booking_date, 
    b.travel_date
FROM Passengers p
JOIN Bookings b ON p.passenger_id = b.passenger_id
JOIN Flights f ON b.flight_id = f.flight_id;

-- Retrieve data from the View
SELECT * FROM PassengerBookingsView;

-- Filtered query using the view
SELECT * FROM PassengerBookingsView
WHERE flight_name LIKE '%IndiGo%';

-- Example of updating data through a view (if permitted)
UPDATE Bookings
SET travel_date = '2025-10-15'
WHERE passenger_id = (SELECT passenger_id FROM Passengers WHERE passenger_name = 'Atharva');
