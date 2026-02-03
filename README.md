# File Storage Service
This project is a file storage service built with Ruby on Rails. It uses Active Storage to handle file uploads and PostgreSQL as the database.

## Architecture
The project follows a clean architecture pattern, with a clear separation of concerns between the models, services, and controllers.

## Getting Started
To get started, clone the repository and run the following commands:
bundle install
rails db:setup
rails db:migrate
rails s
## API Endpoints
The API has the following endpoints:
* `GET /files`: Returns a list of all files
* `POST /files`: Creates a new file
* `GET /files/:id`: Returns a specific file
* `DELETE /files/:id`: Deletes a file

## Docker Setup
To run the application with Docker, use the following commands:
docker build -t file-storage-service .
docker run -p 3000:3000 file-storage-service
## Environment Variables
The application uses the following environment variables:
* `DB_HOST`: The hostname or IP address of the database
* `DB_USERNAME`: The username to use when connecting to the database
* `DB_PASSWORD`: The password to use when connecting to the database
* `RAILS_ENV`: The environment to run the application in (development, test, production)

## Author
Mahmoud Tolba

## License
This project is licensed under the MIT License - see the LICENSE file for details