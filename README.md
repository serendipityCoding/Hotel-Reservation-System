# Hotel-Reservation-System
### TODO
- [ ] Login for managers
- [ ] Forget password for users
- [ ] Logout for managers, users (killing session)
- [ ] Image resources for hotel rooms
- [ ] Personal Information filling when checking out
- [ ] Users: modify existing reservations
- [ ] Discount Policy for users
- [ ] Managers: manage room availability

# Framework: Spring MVC + Spring Boot 
# Project Management: Maven
1. model: database, Java beans
  * user: id, username, password, createDate, email, lastLogin, credit, vipLevel
  * manager: id, username, password, createDate, email, employeeID, lastLogin, isActive
  * chiefManager: id, username, password, createDate, email, employeeID, lastLogin
  * log: id, type (WARN, INFO, ERROR), errorMsg, ip, date, extraInfo
  * roomType: id, type, size, bedNo, guestNo
  * rooms: id, roomID, roomType, floorNo, location, roomInfo, imageURL, price, plus, minus
  * bookings: id, roomID, fromDate, toDate, userID, createDate
  * vipInfo: id, vipLevel, discount, minCredit
  * bill: id, bookingID, originalPrice, discount, isPaid, paidDate, userID, paymentMethod, expiredDate, createDate
2. controller
  * LoginCustomer: username/email, password (FORM, SESSION)
    * forget password (send Email with token for reset)
  * SignUpCustomer: username, email, password (FORM)
  * LogoutCustomer: delete SESSION, return to the front page
  * LoginManager: select role, username/email, password(FORM, SESSIOn)
  * LogoutManager: delete SESSIOn, return to the front page
  * HomePage (Room Search): fromDate, toDate, location, guestNo(optional) --> POST/GET
  * DetaiPage: roomInfo, image, display
    * make booking through this page
    * can change date (GET) check availability
  * PersonalInfoPage: detail Info, can change
  * CheckoutPage: calculate the sum and corresponding credit and discount, choose payment method
  * BookingHistoryPage: 
    * Paid/Expired
    * Outstanding: can be modified + check availability
  * ChiefManagerControlPage: get allmanager info, set active
  * ManagerControlPage:
    * offere search option
    * get all the room info, change price, availability
    * get the booking history of the selected room
3. view:


### Functionality
* Customer: 
  1. search based on different criteria
    * room type:
    * date:
    * room no:
    * resident no:
    * destination
    * show the recommended room first if possible
  2. make a booking:
    * make multiplebook at one time
    * need to show the discounted price
    * personal data form + payment method
  3. modify or cancel booking:
    * check the availability of the modified room
    * cancel booking may depend on the time of cancellation
  4 login system
    * keep past booking history
    * personal data filling in
* Manager:
  1. login system
  2. manage room info:
    * same shared information between customer and manager
    * view the changing history 
  3. recommend room:
    * based on past preference
    * actual criteria
* Chief manager:
  1. login system:
  2. manage managers
  
Each Customer can request for one or more Room.
Each Room must be belongs to one Room Type.
Each Room Type can contain one or many Room.
Each Booking must be belongs to one Date.
Each Date can contain one or more Booking.
Each Room Type can contain one or many Rent.
Each Rent must belongs to one Room Type.
Each Booking must include one or many Room.
Each Room can be included in one Booking.
Each Customer can hold one or many Booking.
Each Booking must belongs to one Customer.
Each Rent can be included in one or many Bill.
Each Bill must include one Rent.
Each Bill Payment must include one Payment Type.
Each Payment Type can contain one or many Bill Payment.
Each Date can contain one or many Bill Payment.
Each Bill Payment must belongs to one Date.
Each Room can be rated one or many Room Rating.
Each Room Rating must belongs to one Room.
Each Rating can contain one or many Room Rating.
Each Room Rating must belongs to one Rating.
