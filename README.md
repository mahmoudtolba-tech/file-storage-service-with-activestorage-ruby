# File Storage Service
A Ruby on Rails application for storing and serving files.

## Features
* File upload and download
* File listing and searching
* File deletion

## Architecture
       +---------------+
       |  Client     |
       +---------------+
                  |
                  |
                  v
       +---------------+
       |  Rails App  |
       +---------------+
                  |
                  |
                  v
       +---------------+
       |  Database    |
       +---------------+
                  |
                  |
                  v
       +---------------+
       |  Storage     |
       +---------------+
## Prerequisites
* Ruby 3.2
* Rails 7.0
* PostgreSQL
* Redis

## Setup
1. Clone the repository
2. Install dependencies with `bundle install`
3. Setup the database with `rails db:setup`
4. Start the application with `rails s`

## Environment Variables
* `DATABASE_HOST`
* `DATABASE_USER`
* `DATABASE_PASSWORD`
* `DATABASE_NAME`
* `REDIS_HOST`
* `REDIS_PORT`
* `RAILS_ENV`
* `SECRET_KEY_BASE`

## API Endpoints
* `GET /files`: List all files
* `POST /files`: Create a new file
* `GET /files/:id`: Get a file by ID
* `PUT /files/:id`: Update a file by ID
* `DELETE /files/:id`: Delete a file by ID

## Docker Setup
1. Build the Docker image with `docker build -t file-storage-service .`
2. Run the Docker container with `docker run -p 3000:3000 file-storage-service`

## Development Workflow
1. Create a new branch for the feature or bug fix
2. Write tests for the feature or bug fix
3. Implement the feature or bug fix
4. Run tests with `bundle exec rails test`
5. Push the changes to the repository
6. Create a pull request for review

## Testing
* Run tests with `bundle exec rails test`
* Use a test database with `RAILS_ENV=test`

## Troubleshooting
* Check the logs with `rails logs`
* Use the Rails console with `rails c`

## Author
**Mahmoud Tolba**

## License
This project is licensed under the MIT License - see the LICENSE file for details