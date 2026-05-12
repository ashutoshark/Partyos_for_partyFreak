# PartyOS

PartyOS is a full-stack event services marketplace that helps users discover, book, and manage party experiences in one place.

The platform connects customers with vendors for alcohol reservations and event services, while giving admins operational visibility across users, listings, and orders.

## Why PartyOS

- Unified booking flow for party planning and service reservations
- Vendor onboarding and service management in one platform
- Admin controls for approvals, oversight, and operations
- Built for iterative growth with a modular Spring Boot architecture

## Core Features

### Customer Experience
- User signup, login, and profile management
- Browse marketplace listings and service details
- Alcohol reservation workflow
- Cart and checkout flow
- Booking history and feedback submission

### Vendor Console
- Vendor authentication and onboarding
- Add and manage service listings
- Manage inventory-related information for offerings
- Track bookings relevant to vendor services

### Admin Operations
- Admin authentication and dashboard access
- Review and approve service-related entries
- Monitor platform activity across users and vendors

## Tech Stack

- Backend: Java 17, Spring Boot 3.3.5, Spring MVC, Spring Data JPA, Spring Security
- Frontend: JSP, JSTL, Bootstrap 5, Vanilla JavaScript
- Database: MySQL 8
- Build Tool: Maven
- Supporting Library: iTextPDF (PDF generation)

## Repository Structure

This repository has a nested app directory:

- `partyos/` - Main Spring Boot application
- `README.md` - Top-level project overview

Within the app:

- `partyos/src/main/java/com/partyos/Controller` - MVC controllers
- `partyos/src/main/java/com/partyos/Services` - Business logic
- `partyos/src/main/java/com/partyos/Repositories` - Data access layer
- `partyos/src/main/java/com/partyos/Entities` - Domain entities
- `partyos/src/main/webapp/WEB-INF/views` - JSP views
- `partyos/src/main/resources/application.properties` - Runtime configuration

## Quick Start

### Prerequisites

- Java 17+
- Maven 3.9+
- MySQL 8+

### 1) Clone and Enter the App

```bash
git clone https://github.com/ashutoshark/Partyos_for_partyFreak.git
cd Partyos_for_partyFreak/partyos
```

### 2) Create Database

```sql
CREATE DATABASE partyos;
```

### 3) Configure Application

Update `src/main/resources/application.properties` with your local MySQL credentials:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/partyos
spring.datasource.username=<your_mysql_username>
spring.datasource.password=<your_mysql_password>
```

### 4) Run the Application

```bash
mvn clean spring-boot:run
```

The app runs on:

- `http://localhost:8081`

## Selected Endpoints

- `GET /` - Home page
- `GET /login` - Login view
- `GET /register` - Registration view
- `GET /alcohol/reserve` - Alcohol reservation page
- `GET /cart` - User cart page
- `GET /admin/admin-dashboard` - Admin dashboard (auth required)

## Configuration Notes

- Default port: `8081`
- JPA mode: `spring.jpa.hibernate.ddl-auto=update`
- File upload limits:
  - `spring.servlet.multipart.max-file-size=100MB`
  - `spring.servlet.multipart.max-request-size=100MB`

## Roadmap

- Payment gateway integration
- Real-time notifications
- Mobile-first client experience
- Analytics and reporting enhancements

## Contributing

Contributions are welcome. Please open an issue first for major changes, then submit a pull request with a clear description and test notes.

## License

No license file is currently defined in this repository. Add a `LICENSE` file to make usage terms explicit.
