-- Phillip Pascual
-- CSE 572
-- Homework Week 7

--Creates 5 views

SPOOL createview_output.txt

-- 1) Creates view to show rooms in Hotel 1
CREATE VIEW Housekeeping1
    AS SELECT *
        FROM PPAS.room
        WHERE HNo = 'H001';

SELECT * FROM Housekeeping1;

-- 2) Creates view to show bookings in Hotel 1
CREATE VIEW BookingManager1
    AS SELECT b.gno, g.guestname, b.datefrom, b.dateto, b.rno
        FROM PPAS.booking b, PPAS.guest g
        WHERE b.HNo = 'H001'
        AND b.gno = g.guestno;

SELECT * FROM BookingManager1;

-- 3) Creates view to show all Guests
CREATE VIEW CustomerService
    AS SELECT *
        FROM PPAS.guest;

SELECT * FROM CustomerService;

-- 4) Creates view to show detailed booking information
CREATE VIEW DetailBooking
    AS SELECT b.hno, b.gno, g.guestname, b.datefrom, b.dateto, b.rno, r.roomtype
        FROM PPAS.booking b, PPAS.guest g, PPAS.room r
        WHERE b.gno = g.guestno
        AND b.rno = r.roomno;

SELECT * FROM DetailBooking;

-- 5) Creates view to show detailed hotel room information
CREATE VIEW DetailRoom
    AS SELECT r.roomno, r.hno, h.hotelname, h.hotelcity, r.roomtype, r.roomprice
        FROM PPAS.room r, PPAS.hotel h
        WHERE r.hno = h.hotelno;

SELECT * from DetailRoom;

DROP VIEW DetailRoom;
DROP VIEW DetailBooking;
DROP VIEW CustomerService;
DROP VIEW BookingManager1;
DROP VIEW Housekeeping1;

SPOOL OFF
