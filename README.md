# File Storage Service

A production-ready Ruby project for a file storage service with ActiveStorage.

## Overview

This project demonstrates best practices for building a file storage service using Ruby on Rails. It uses ActiveStorage for handling file uploads and storing files.

## Architecture

The project follows clean architecture principles and uses the following components:

*   Models: Represent the data structures used by the application.
*   Services: Encapsulate business logic and provide a layer of abstraction between the models and controllers.
*   Controllers: Handle HTTP requests and respond with HTTP responses.
*   Repositories: Provide a layer of abstraction for data access and manipulate the models.

## Prerequisites

*   Ruby 3.1.2 or higher
*   PostgreSQL 13 or higher
*   Docker 20.10 or higher

## Setup

1.  Clone the repository: `git clone https://github.com/mahmoudtolba/file_storage_service.git`
2.  Install dependencies: `bundle install`
3.  Create a PostgreSQL database: `createdb file_storage_service_development`
4.  Configure environment variables: `cp .env.example .env`
5.  Run database migrations: `bundle exec rails db:migrate`
6.  Start the application: `bundle exec rails server`

## API Endpoints

*   `GET /files`: Retrieves a list of all files.
*   `GET /files/:id`: Retrieves a specific file.
*   `POST /files`: Creates a new file.
*   `PUT /files/:id`: Updates an existing file.
*   `DELETE /files/:id`: Deletes a file.

## Docker Setup

1.  Build the Docker image: `docker build -t file_storage_service .`
2.  Run the Docker container: `docker run -p 3000:3000 file_storage_service`

## Development Workflow

1.  Create a new branch: `git checkout -b feature/new-feature`
2.  Make changes to the codebase: `git add .`
3.  Commit changes: `git commit -m "New feature"`
4.  Push changes to the remote repository: `git push origin feature/new-feature`

## Testing

1.  Run tests: `bundle exec rails test`

## Troubleshooting

*   Check the logs: `tail -f log/development.log`
*   Run the application in debug mode: `bundle exec rails server --debug`

## Author

*   **Mahmoud Tolba**

## License

This project is licensed under the MIT License - see the LICENSE file for details