# Car Advertisements Web 🚗

## Intro
A robust Ruby on Rails web application for browsing and searching car advertisements. This project bridges a custom console-based search engine logic with a modern, responsive web interface built for speed and precision.

## Technologies
- **Backend:** Ruby on Rails 7, Ruby
- **Architecture Patterns:** Service Objects / Actors
- **Frontend:** Tailwind CSS, Pagy (pagination)
- **Database/Persistence:** YAML (legacy compatibility), ActiveModel
- **API & Documentation:** Swagger / OpenAPI, Postman
- **Testing & DevOps:** RSpec, RuboCop, Docker, Docker Compose

## Features
- **Custom Search Engine:** Leverages proprietary `CarSearchEngine` logic for precise filtering and data preparation.
- **Advanced Filtering:** Filter cars by make, model, year range, and price range.
- **Smart Sorting:** Optimized sorting by price, production year, and "Date Added".
- **Search Analytics:** Integrated `SearchTracker` that logs search queries and result counts.
- **API Endpoints:** RESTful JSON API endpoints documented with Swagger.

## Keyboard Shortcuts
| Shortcut | Action |
| :--- | :--- |
| `Ctrl + K` / `Cmd + K` | Focus search bar |
| `Esc` | Clear search / Close modals |
| `/` | Jump to filter options |

## The Process
1. **Refactoring:** Migrating legacy console-based search algorithms into modular, testable Rails service objects and actors.
2. **UI Integration:** Pairing a lightweight YAML backend data store with modern Tailwind CSS styling and Pagy pagination.
3. **API & Containerization:** Adding RESTful endpoints, wrapping the app in Docker, and documenting the system via Swagger/OpenAPI.

## What I Learned
- Structuring Rails applications that rely on non-relational or file-based data stores (YAML) alongside ActiveModel wrappers.
- Implementing the Actor pattern to keep business logic isolated, clean, and easily testable with RSpec.
- Containerizing Ruby on Rails applications with Docker and multi-stage configurations for development and production.

## How It Can Be Improved?
- Migrate the YAML persistence layer to PostgreSQL for better concurrency and relational querying.
- Introduce Redis caching for frequent search queries and analytics tracking.
- Add advanced asynchronous background jobs using Sidekiq for search telemetry and logging.

## Running the Project

### Prerequisites
- Ruby (check `.ruby-version`)
- Rails 7+
- Bundler
- Docker & Docker Compose (optional, for containerized setup)

### Local Setup
1. **Clone the repository:**
   ```bash
   git clone [https://github.com/your-username/car_advertisments_web.git](https://github.com/your-username/car_advertisments_web.git)
   cd car_advertisments_web ```

2. **Install dependencies:**
```bash
bundle install
```


3. **Database Setup:**
Ensure your `db/cars.yml` and `db/searches.yml` files are present.

5. **Start the server:**
```bash
bin/dev
# or
rails server

```


Open http://localhost:3000 in your browser.
