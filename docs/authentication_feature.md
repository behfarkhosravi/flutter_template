# Authentication Feature

This document provides an overview of the authentication feature in the Flutter Template application.

## Overview

The authentication feature provides a complete solution for user authentication, including registration, login, password reset, and session management. It is built following Clean Architecture principles to ensure a clear separation of concerns and maintainability.

## Feature Breakdown

### 1. Registration

- **UI**: `lib/src/presentation/features/authentication/registration/view/registration_page.dart`
- **Flow**:
  1. The user enters their first name, last name, email, and password.
  2. The user clicks the "Continue" button.
  3. The application should perform validation on the input fields (this is not yet implemented).
  4. The application should make a network request to the registration endpoint (this is not yet implemented).
  5. Upon successful registration, the user is navigated to the home screen.

### 2. Login

- **UI**: `lib/src/presentation/features/authentication/login/view/login_page.dart`
- **Flow**:
  1. The user enters their email and password.
  2. The user can choose to be remembered by the application.
  3. The user clicks the "Sign In" button.
  4. The application performs validation on the input fields.
  5. The application makes a network request to the login endpoint.
  6. Upon successful login, the user is navigated to the home screen.

### 3. Password Reset

- **UI**:
  - `lib/src/presentation/features/authentication/forgot_password/view/reset_password_page.dart`
  - `lib/src/presentation/features/authentication/forgot_password/view/email_verification_page.dart`
  - `lib/src/presentation/features/authentication/forgot_password/view/create_new_password_page.dart`
  - `lib/src/presentation/features/authentication/forgot_password/view/reset_password_success_page.dart`
- **Flow**:
  1. The user enters their email address to receive a password reset link.
  2. The user receives an email with a verification code.
  3. The user enters the verification code in the application.
  4. The user creates a new password.
  5. The user is notified of the successful password reset.

## Core Components

- **Use Cases**: `lib/src/domain/use_cases/authentication_use_case.dart`
  - Contains the business logic for authentication-related operations.
- **Repository**: `lib/src/domain/repositories/authentication_repository.dart`
  - Defines the contract for the authentication data layer.
- **Repository Implementation**: `lib/src/data/repositories/authentication_repository_impl.dart`
  - Implements the `AuthenticationRepository` interface and communicates with the network service.
- **Routes**: `lib/src/presentation/core/router/parts/authentication_routes.dart`
  - Defines the routes for the authentication feature.
