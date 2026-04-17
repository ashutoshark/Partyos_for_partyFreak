# PartyOS - Event Party Services Platform

<div align="center">

[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.3.5-brightgreen?style=flat-square&logo=spring-boot)](https://spring.io/projects/spring-boot)
[![Java](https://img.shields.io/badge/Java-17-orange?style=flat-square&logo=java)](https://www.java.com/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?style=flat-square&logo=mysql)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/License-Open%20Source-green?style=flat-square)](LICENSE)

A comprehensive full-stack web application for managing party services, including event bookings, alcohol reservations, vendor management, and user authentication.

[Getting Started](#getting-started) • [Features](#features) • [Technology Stack](#technology-stack) • [Installation](#installation) • [API Documentation](#api-documentation)

</div>

---

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Installation](#installation)
- [Configuration](#configuration)
- [Project Structure](#project-structure)
- [API Endpoints](#api-endpoints)
- [Database Schema](#database-schema)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [License](#license)

---

## 🎉 Overview

**PartyOS** is an innovative event management platform designed to streamline party planning and service bookings. The application connects users seeking party services with vendors offering alcohol, catering, decorations, and other event services. It provides a seamless booking experience with user authentication, vendor management, and comprehensive order tracking.

### Key Highlights
- 🔐 Secure user and admin authentication
- 🛒 Alcohol reservation and cart management
- 📦 Event booking system
- 👥 Vendor management and service listings
- 📊 Admin dashboard for analytics
- 💳 Secure payment integration ready
- 📱 Responsive UI with Bootstrap 5

---

## ✨ Features

### 👤 User Features
- **User Registration & Authentication**: Secure login with session management
- **User Profile Management**: Update personal information and preferences
- **Alcohol Reservation**: Browse and reserve alcohol beverages with real-time availability
- **Event Booking**: Book party services and events
- **Shopping Cart**: Add/remove items and manage reservations
- **Order History**: Track past and current reservations
- **Feedback & Reviews**: Rate vendors and services

### 🏪 Vendor Features
- **Vendor Registration**: Register as a service provider
- **Service Listing**: Manage alcohol inventory and service details
- **Order Management**: View and process customer orders
- **Analytics Dashboard**: Track sales and performance metrics

### ⚙️ Admin Features
- **User Management**: Manage registered users
- **Vendor Management**: Approve/reject vendor registrations
- **Service Oversight**: Monitor all services and alcohol inventory
- **Admin Dashboard**: View platform analytics and statistics
- **Content Management**: Manage categories and service types

---

## 🛠️ Technology Stack

### Backend
- **Framework**: Spring Boot 3.3.5
- **Language**: Java 17
- **Database**: MySQL 8.0
- **ORM**: Spring Data JPA with Hibernate
- **Security**: Spring Security
- **Build Tool**: Maven
- **Testing**: JUnit 5

### Frontend
- **View Engine**: JSP (Java Server Pages)
- **CSS Framework**: Bootstrap 5.3.3
- **JavaScript**: Vanilla JS
- **Templating**: JSTL (Jakarta Servlet Pages Standard Tag Library)

### Additional Libraries
- **PDF Generation**: iText PDF 5.5.13.3
- **Development Tools**: Spring Boot DevTools
- **Servlet Container**: Apache Tomcat (Embedded)

---

## 💻 Installation

### Prerequisites
- **Java 17** or higher
- **Maven 3.6+**
- **MySQL 8.0+**
- **Git**
- **IDE**: IntelliJ IDEA, Eclipse, or VS Code

### Step 1: Clone the Repository
```bash
git clone https://github.com/yourusername/partyos.git
cd partyos
```

### Step 2: Set Up MySQL Database
```sql
CREATE DATABASE partyos;
USE partyos;
```

### Step 3: Configure Database Connection
Edit `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/partyos
spring.datasource.username=your_mysql_username
spring.datasource.password=your_mysql_password
```

### Step 4: Build the Project
```bash
mvn clean install
```

### Step 5: Run the Application
```bash
mvn spring-boot:run
```

Or compile and run the JAR:
```bash
mvn clean package
java -jar target/partyos-0.0.1-SNAPSHOT.jar
```

### Step 6: Access the Application
- **Application URL**: [http://localhost:8081](http://localhost:8081)
- **Home Page**: http://localhost:8081/
- **Alcohol Reservation**: http://localhost:8081/alcohol/reserve

---

## ⚙️ Configuration

### Database Configuration
```properties
# MySQL Connection
spring.datasource.url=jdbc:mysql://localhost:3306/partyos
spring.datasource.username=root
spring.datasource.password=ashutosh

# Hibernate Settings
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect
```

### Server Configuration
```properties
# Server Port
server.port=8081

# File Upload Settings
spring.servlet.multipart.max-file-size=100MB
spring.servlet.multipart.max-request-size=100MB
```

### JSP Configuration
```properties
# JSP View Resolver
spring.mvc.view.prefix=/WEB-INF/views/
spring.mvc.view.suffix=.jsp
```

---

## 📁 Project Structure

```
partyos/
├── src/
│   ├── main/
│   │   ├── java/com/partyos/
│   │   │   ├── Controller/              # Request handlers
│   │   │   │   ├── AdminAuthController.java
│   │   │   │   ├── AdminController.java
│   │   │   │   ├── AlcoholController.java
│   │   │   │   ├── CartController.java
│   │   │   │   ├── HomeController.java
│   │   │   │   ├── UserAuthController.java
│   │   │   │   ├── UserController.java
│   │   │   │   └── VendorController.java
│   │   │   ├── Entities/                # JPA Entities
│   │   │   │   ├── Admin.java
│   │   │   │   ├── Alcohol.java
│   │   │   │   ├── Booking.java
│   │   │   │   ├── Event.java
│   │   │   │   ├── Feedback.java
│   │   │   │   ├── User.java
│   │   │   │   ├── UserProfile.java
│   │   │   │   └── Vendor_Service.java
│   │   │   ├── Repositories/            # Data Access Layer
│   │   │   ├── Services/                # Business Logic
│   │   │   ├── Enums/                   # Enumerations
│   │   │   ├── Config/                  # Configuration Classes
│   │   │   └── PartyosApplication.java
│   │   ├── resources/
│   │   │   ├── application.properties   # Configuration
│   │   │   ├── static/                  # CSS, JS, Images
│   │   │   └── templates/
│   │   └── webapp/
│   │       ├── WEB-INF/views/          # JSP Templates
│   │       │   ├── alcohol/
│   │       │   ├── user/
│   │       │   ├── vendor/
│   │       │   └── admin/
│   │       └── uploads/                 # User uploads
│   └── test/
│       └── java/com/partyos/
├── target/                              # Build output
├── pom.xml                              # Maven configuration
└── README.md                            # This file
```

---

## 🔌 API Endpoints

### Authentication
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/user/login` | User login |
| POST | `/user/register` | User registration |
| POST | `/admin/login` | Admin login |
| POST | `/vendor/login` | Vendor login |
| GET | `/logout` | Logout |

### Alcohol Management
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/alcohol/reserve` | View alcohol reservations |
| POST | `/alcohol/reserve` | Submit alcohol reservation |
| GET | `/alcohol/reserve?category=ALL` | Filter by category |

### User Services
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/user/profile` | View user profile |
| POST | `/user/profile` | Update profile |
| GET | `/user/orders` | View order history |

### Cart Management
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/cart` | View shopping cart |
| POST | `/cart/add` | Add item to cart |
| POST | `/cart/remove` | Remove item from cart |

### Admin Panel
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/admin/dashboard` | Admin dashboard |
| GET | `/admin/users` | Manage users |
| GET | `/admin/vendors` | Manage vendors |

---

## 🗄️ Database Schema

### Key Entities

**User**
- User ID (PK)
- Username
- Email
- Password (Hashed)
- Phone
- Address
- Created Date
- Status

**Alcohol**
- Alcohol ID (PK)
- Brand Name
- Name
- Category
- Price
- Shop Name
- Contact
- Display Image
- Vendor ID (FK)
- Created Date

**Booking**
- Booking ID (PK)
- User ID (FK)
- Event Date
- Booking Status
- Total Amount
- Created Date

**Vendor_Service**
- Service ID (PK)
- Vendor ID (FK)
- Service Name
- Description
- Price
- Availability
- Status

**Feedback**
- Feedback ID (PK)
- User ID (FK)
- Vendor ID (FK)
- Rating
- Comment
- Created Date

---

## 🐛 Troubleshooting

### Common Issues

#### 1. Database Connection Failed
**Error**: `Cannot connect to database at localhost:3306`

**Solution**:
- Ensure MySQL server is running
- Check credentials in `application.properties`
- Verify database `partyos` exists

```bash
# Start MySQL (Windows)
net start MySQL80

# Or using MySQL command line
mysql -u root -p
CREATE DATABASE partyos;
```

#### 2. Port Already in Use
**Error**: `Port 8081 already in use`

**Solution**: Change port in `application.properties`
```properties
server.port=8082
```

#### 3. JSP View Not Found
**Error**: `Could not resolve view with name 'xyz'`

**Solution**:
- Verify JSP files exist in `/WEB-INF/views/`
- Check `application.properties` view resolver configuration

#### 4. Build Fails with Compilation Error
**Error**: `[ERROR] COMPILATION ERROR`

**Solution**:
```bash
# Clean build
mvn clean install

# Update dependencies
mvn dependency:resolve
```

#### 5. File Upload Issues
**Error**: `File size exceeds limit`

**Solution**: Increase file size limits in `application.properties`
```properties
spring.servlet.multipart.max-file-size=200MB
spring.servlet.multipart.max-request-size=200MB
```

---

## 🤝 Contributing

We welcome contributions to PartyOS! Here's how you can help:

### Development Workflow
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Standards
- Follow Java naming conventions
- Add JavaDoc for public methods
- Write unit tests for new features
- Keep methods focused and single-responsibility

### Reporting Issues
- Use GitHub Issues to report bugs
- Provide detailed description and steps to reproduce
- Include error logs and screenshots

---

## 📝 License

This project is licensed under the Open Source License. See the LICENSE file for details.

---

## 📧 Support & Contact

For support, questions, or suggestions:
- 📧 Email: support@partyos.com
- 💬 Issues: [GitHub Issues](https://github.com/yourusername/partyos/issues)
- 📱 Contact: +91-XXXXX-XXXXX

---

## 🎯 Roadmap

### v1.1 (Q2 2026)
- [ ] Payment gateway integration (Razorpay/Stripe)
- [ ] Real-time notifications
- [ ] Email confirmations
- [ ] SMS alerts

### v1.2 (Q3 2026)
- [ ] Mobile app (React Native)
- [ ] Advanced analytics dashboard
- [ ] Vendor rating system enhancement
- [ ] Invoice PDF generation

### v1.3 (Q4 2026)
- [ ] AI-powered recommendations
- [ ] Multi-language support
- [ ] Dark mode UI
- [ ] API rate limiting

---

## 🙏 Acknowledgments

- Spring Boot Framework
- Bootstrap CSS Framework
- MySQL Community
- Open Source Community

---

<div align="center">

**Made with ❤️ by the PartyOS Team**

[⬆ Back to Top](#partyos---event-party-services-platform)

</div>
