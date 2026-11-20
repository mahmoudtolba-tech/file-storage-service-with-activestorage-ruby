# FileStorage Service

A production‑ready Ruby on Rails application that provides a simple file storage API using **ActiveStorage**. The service supports uploading, downloading, listing, and deleting files, with a clean architecture built around repositories and service objects.

## Features

- **RESTful JSON API** (`/api/v1/files`)
- **ActiveStorage** backed by local disk (configurable to S3 or other services)
- Repository pattern for data access
- Service layer for business logic
- RSpec test suite with FactoryBot & Faker
- Docker & docker‑compose for development and CI
- GitHub Actions CI pipeline (lint, test, build)

## Stack

| Component | Version |
|-----------|---------|
| Ruby      | 3.2.2   |
| Rails     | 7.1.x   |
| PostgreSQL| 15.x    |
| Redis     | 7.x     |
| RSpec     | 6.1.x   |

## Getting Started

### Prerequisites

- Docker & Docker Compose
- (Optional) `direnv` or `dotenv` for local env handling

### Setup