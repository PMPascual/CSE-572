SET LINESIZE 75
SPOOL inserthotel_output_Phillip.txt

SELECT * FROM Hotel;
SELECT * FROM Room;
SELECT * FROM Guest;
SELECT * FROM Booking;

SPOOL OFF
