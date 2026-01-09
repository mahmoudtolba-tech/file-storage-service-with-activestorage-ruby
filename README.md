# File Storage Service
A Ruby-based file storage service using Active Storage.

## Overview
This project provides a simple file storage service with API endpoints for creating, reading, updating, and deleting files.

## Architecture
The service follows a clean architecture design, with separate layers for models, services, repositories, and controllers.
+---------------+
|  API        |
+---------------+
        |
        |
        v
+---------------+
|  Controller  |
+---------------+
        |
        |
        v
+---------------+
|  Service     |
+---------------+
        |
        |
        v
+---------------+
|  Repository  |
+---------------+
        |
        |
        v
+---------------+
|  Model       |
+---------------+

## Prerequisites
* Ruby 3.1
* PostgreSQL
* Docker (optional)

## Setup
1. Clone the repository: `git clone https://github.com/mahmoudtolba/file-storage-service.git`
2. Install dependencies: `bundle install`
3. Configure environment variables: `cp .env.example .env`
4. Start the service: `docker-compose up` (or `bundle exec puma -C config/puma.rb`)

## API Endpoints
* `GET /files`: List all files
* `GET /files/:id`: Get a file by ID
* `POST /files`: Create a new file
* `PUT /files/:id`: Update a file
* `DELETE /files/:id`: Delete a file

## Environment Variables
* `DB_PASSWORD`: PostgreSQL password
* `ENVIRONMENT`: Development environment (default: development)
* `PORT`: Service port (default: 3000)

## Development Workflow
1. Create a new branch: `git checkout -b feature/new-feature`
2. Make changes and commit: `git add . && git commit -m "New feature"`
3. Push changes: `git push origin feature/new-feature`
4. Create a pull request

## Testing
1. Run tests: `bundle exec rspec`
2. Run linters: `rubocop` and `rubycritic`

## Troubleshooting
* Check the logs: `docker-compose logs -f`
* Check the database connection: `psql -U postgres -d file_storage_service_development`

## Author
**Mahmoud Tolba**

## License
This project is licensed under the MIT License - see the LICENSE file for details