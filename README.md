# PartyOS

<div align="center">
  <h3>Plan. Book. Celebrate.</h3>
  <p>PartyOS is a full-stack event services marketplace for booking party experiences, alcohol reservations, and vendor services with smart planning workflows.</p>
  <p>
    <img src="https://img.shields.io/badge/Java-17-orange?style=for-the-badge&logo=openjdk" alt="Java 17" />
    <img src="https://img.shields.io/badge/Spring%20Boot-3.3.5-6DB33F?style=for-the-badge&logo=springboot&logoColor=white" alt="Spring Boot" />
    <img src="https://img.shields.io/badge/MySQL-8-00758F?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL 8" />
    <img src="https://img.shields.io/badge/Maven-Build-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white" alt="Maven" />
  </p>
</div>

## Product Highlights

- Unified flow for party planning, service discovery, and checkout
- Dedicated experiences for customer, vendor, and admin roles
- Smart planning module for fast event estimation and recommendations
- Modular Spring Boot architecture ready for iterative scaling

## Core Features

### Customer Experience
- User signup, login, and profile management
- Marketplace browsing with service filters
- Alcohol reservation workflow
- Cart and checkout journey
- Booking history and feedback

### Vendor Console
- Vendor onboarding and authentication
- Add and manage service listings
- View service performance and customer activity

### Admin Operations
- Admin dashboard with platform overview
- Vendor and service approval controls
- Operational visibility for platform activity

## Tech Stack

- Backend: Java 17, Spring Boot 3.3.5, Spring MVC, Spring Data JPA, Spring Security
- Frontend: JSP, JSTL, Bootstrap 5, Vanilla JavaScript
- Database: MySQL 8
- Build: Maven
- Utility: iTextPDF

## Repository Structure

- `README.md` - Main project documentation
- `assets/screenshots/` - Product UI screenshots used in README
- `partyos/` - Spring Boot application root
- `partyos/src/main/java/com/partyos/` - Controllers, services, repositories, entities
- `partyos/src/main/webapp/WEB-INF/views/` - JSP views
- `partyos/src/main/resources/application.properties` - App configuration

## Quick Start

### Prerequisites

- Java 17+
- Maven 3.9+
- MySQL 8+

### 1) Clone and enter app directory

```bash
git clone https://github.com/ashutoshark/Partyos_for_partyFreak.git
cd Partyos_for_partyFreak/partyos
```

### 2) Create database

```sql
CREATE DATABASE partyos;
```

### 3) Configure environment

Update `src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/partyos
spring.datasource.username=<your_mysql_username>
spring.datasource.password=<your_mysql_password>
```

### 4) Run

```bash
mvn clean spring-boot:run
```

Application URL: `http://localhost:8081`

## Screenshots

<table>
  <tr>
    <td><b>Home Page</b><br/><img src="assets/screenshots/home-page.png" alt="Home Page"/></td>
    <td><b>User Login Page</b><br/><img src="assets/screenshots/user-login-page.png" alt="User Login Page"/></td>
  </tr>
  <tr>
    <td><b>Role Based User Registration Page</b><br/><img src="assets/screenshots/role-based-user-registration-page.png" alt="Role Based User Registration Page"/></td>
    <td><b>Market Place</b><br/><img src="assets/screenshots/market-place.png" alt="Market Place"/></td>
  </tr>
  <tr>
    <td><b>Alcohol Reservation Page</b><br/><img src="assets/screenshots/alcohol-reservation-page.png" alt="Alcohol Reservation Page"/></td>
    <td><b>User Cart</b><br/><img src="assets/screenshots/user-cart.png" alt="User Cart"/></td>
  </tr>
  <tr>
    <td><b>User Profile</b><br/><img src="assets/screenshots/user-profile.png" alt="User Profile"/></td>
    <td><b>Smart Plaing</b><br/><img src="assets/screenshots/smart-plaing.png" alt="Smart Plaing"/></td>
  </tr>
  <tr>
    <td><b>Smar Planning With Data</b><br/><img src="assets/screenshots/smar-planning-with-data.png" alt="Smar Planning With Data"/></td>
    <td><b>Smart Planning Estimated Result</b><br/><img src="assets/screenshots/smart-planning-estimated-result.png" alt="Smart Planning Estimated Result"/></td>
  </tr>
  <tr>
    <td><b>Admin Dashboard</b><br/><img src="assets/screenshots/admin-dashboard.png" alt="Admin Dashboard"/></td>
    <td><b>Vendor Dashboard</b><br/><img src="assets/screenshots/vendor-dashboard.png" alt="Vendor Dashboard"/></td>
  </tr>
  <tr>
    <td><b>Vendor Service Addition</b><br/><img src="assets/screenshots/vendor-service-addition.png" alt="Vendor Service Addition"/></td>
    <td><b>Vendor Services</b><br/><img src="assets/screenshots/vendor-services.png" alt="Vendor Services"/></td>
  </tr>
</table>

## Roadmap

- Payment gateway integration
- Real-time notifications
- Mobile-first client experience
- Advanced analytics and reporting

## Contributing

Contributions are welcome. Open an issue first for major changes, then submit a PR with a clear summary and testing notes.

## License

No license file is currently defined. Add a `LICENSE` file to define usage terms.
